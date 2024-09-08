// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hezma/Data/models/my_account_screan_models/addresses/data.dart';
import 'package:hezma/UI/presentation/Views/my_account_screans/addresses_screan/widgets/districted_place_widget.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/routes.dart';

class AddressesScrean extends StatefulWidget {
  const AddressesScrean({super.key});

  @override
  AddressesScreanState createState() => AddressesScreanState();
}

class AddressesScreanState extends State<AddressesScrean> {
  GoogleMapController? _mapController;
  LatLng? _selectedLatLng;
  AddressData? place2;
  void _onAddressSelected(AddressData place1) async {
    setState(() {
      // Assign LatLng object with latitude and longitude from place1
      _selectedLatLng =
          LatLng(double.parse(place1.lat!), double.parse(place1.lng!));
      place2 = place1;
    });

    _mapController?.animateCamera(
      CameraUpdate.newLatLng(_selectedLatLng!),
    );

    // Fetch and print detailed address using Geocoding
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _selectedLatLng!.latitude,
        _selectedLatLng!.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Full Address: ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}')));
        print(
            'Full Address: ${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}');
        print('Postal Code: ${place.postalCode}');
      } else {
        print('No placemarks found.');
      }
    } catch (e) {
      print('Error retrieving address details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.cas);
              },
              icon: const Icon(
                Icons.add,
                color: Color(backgroundcustomgreen),
              ))
        ],
        title: const Text('العناوين'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          DistrictedPlacesWidget(
            onAddressSelected: _onAddressSelected,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
              ),
              child: Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: false,
                    compassEnabled: false,
                    onMapCreated: (controller) {
                      _mapController = controller;
                    },
                    initialCameraPosition: CameraPosition(
                      target: _selectedLatLng ?? const LatLng(0, 0),
                      zoom: 4.0,
                    ),
                    markers: _selectedLatLng != null
                        ? {
                            Marker(
                              infoWindow: InfoWindow(
                                title: place2?.name,
                              ),
                              markerId: const MarkerId('selected-address'),
                              position: _selectedLatLng!,
                            ),
                          }
                        : {},
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(place2?.address ?? 'unknown place'),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              if (place2?.id == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text('حدد العنوان اولا'),
                                    ],
                                  )),
                                );
                              } else {
                                GoRouter.of(context)
                                    .push(AppRoutes.eas, extra: place2);
                              }
                            },
                            icon: const Icon(Icons.edit,
                                color: Color(backgroundcustomgreen2)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
