import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart'; // Add this import
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/create_address_cubit/create_address_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/edit_address_cubit/edit_address_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/get_addresses_cubit/get_addresses_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class CreateAddressScrean extends StatefulWidget {
  const CreateAddressScrean({super.key});

  @override
  State<CreateAddressScrean> createState() => _EditAddressScreanState();
}

class _EditAddressScreanState extends State<CreateAddressScrean> {
  GoogleMapController? _mapController1;
  LatLng? _selectedLatLng;
  String? _address;

  @override
  void initState() {
    _selectedLatLng = const LatLng(0, 0);
    super.initState();
  }

  void _ontap(LatLng latlng) async {
    setState(() {
      _selectedLatLng = latlng;
    });

    List<Placemark> placemarks = await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      String formattedAddress = "${place.street}, ${place.locality}, ${place.country}";
      setState(() {
        _address = formattedAddress;
      });
    }

    _mapController1?.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: latlng, zoom: 10.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'تعديل العنوان',
          style: arabicstyle1,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(17)),
                child: TextField(
                  textAlign: TextAlign.end,
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "قم بتسميه العنوان مثال (المنزل. العمل)",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                ),
                child: GoogleMap(
                    zoomControlsEnabled: false,
                    compassEnabled: false,
                    onMapCreated: (controller) {
                      _mapController1 = controller;
                    },
                    onTap: _ontap,
                    initialCameraPosition: CameraPosition(
                      target: _selectedLatLng!,
                      zoom: 4.0,
                    ),
                    markers: _selectedLatLng != null
                        ? {
                            Marker(
                              position: _selectedLatLng!,
                              infoWindow: InfoWindow(
                                title: _address ?? 'unknown',
                              ),
                              markerId: const MarkerId('selected-address'),
                            ),
                          }
                        : {}),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: BlocListener<EditAddressCubit, EditAddressState>(
                listener: (context, state) {
                  if (state is EditAddressSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.msg)
                      ));
                    GoRouter.of(context).pop();
                  } else if (state is EditAddressFailure) {
                    print(state.errMsg);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errMsg)),
                    );
                  }
                },
                child: GestureDetector(
                  onTap: ()  {
                    if (_address != null) {
                       context.read<CreateAddressCubit>().createAddress(
                            name: nameController.text,
                            latitude: _selectedLatLng!.latitude.toString(),
                            longitude: _selectedLatLng!.longitude.toString(),
                            address: _address!, // Use the reverse-geocoded address
                          );
                         ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('تم الاضافه بنجاح'),
                        ],
                      )),
                    );
                      context.read<GetAddressesCubit>().fetchAddresses();

                      GoRouter.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select a location on the map")),
                      );
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(backgroundcustomgreen),
                          borderRadius: BorderRadius.circular(17)),
                      child: const Center(
                        child: Text(
                          'اضافه',
                          style: arabicstyle2,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
