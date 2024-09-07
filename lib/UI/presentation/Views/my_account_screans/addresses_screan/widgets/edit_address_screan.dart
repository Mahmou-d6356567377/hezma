import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/edit_address_cubit/edit_address_cubit.dart';
import 'package:hezma/blocs/my_account_cubits/addresses_cubit/get_addresses_cubit/get_addresses_cubit.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class EditAddressScrean extends StatefulWidget {
  const EditAddressScrean({super.key, required this.place});
  final AddressData place;

  @override
  State<EditAddressScrean> createState() => _EditAddressScreanState();
}

class _EditAddressScreanState extends State<EditAddressScrean> {
  GoogleMapController? _mapController1;
  LatLng? _selectedLatLng;

  @override
  void initState() {
    _selectedLatLng = LatLng(
        double.parse(widget.place.lat!), double.parse(widget.place.lng!));
    super.initState();
  }

  void _ontap(LatLng latlng) {
    setState(() {
      _selectedLatLng = latlng;
    });
    _mapController1?.animateCamera(
        CameraUpdate.newCameraPosition(latlng as CameraPosition));
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
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
                              infoWindow: const InfoWindow(
                                title: 'unknown',
                              ),
                              markerId: const MarkerId('selected-address'),
                            ),
                          }
                        : {}),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:  BlocListener<EditAddressCubit, EditAddressState>(
                        listener: (context, state) {
                          if (state is EditAddressSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(content: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   Text(state.msg),
                                 ],
                               )),
                            );
                          } else if (state is EditAddressFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.errMsg)),
                            );
                          }
                        },
                
                child: GestureDetector(
                  onTap: () {
                    context.read<EditAddressCubit>().editAddress(
                          id: widget.place.id.toString(),
                          name: nameController.text,
                          latitude: _selectedLatLng!.latitude.toString(),
                          longitude: _selectedLatLng!.longitude.toString(),
                          address: widget.place.address!,
                        );
                         
                        context.read<GetAddressesCubit>().fetchAddresses();
                        GoRouter.of(context).pop();
                  },
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(backgroundcustomgreen),
                          borderRadius: BorderRadius.circular(17)),
                      child: const Center(
                        child: Text(
                          'حفظ',
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
