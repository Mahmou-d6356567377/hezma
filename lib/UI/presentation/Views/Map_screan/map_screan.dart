import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:hezma/utils/constants.dart';
import 'package:hezma/utils/fonts.dart';

class MapScrean extends StatefulWidget {
  const MapScrean({super.key});

  @override
  State<MapScrean> createState() => _PageMapState();
}

class _PageMapState extends State<MapScrean> {
  late CameraPosition initialCameraPosition;
  final TextEditingController _searchController = TextEditingController();
  late GoogleMapController mapController;
  bool searchMode = true;
  Marker? CustomMarker ;
  final Set<Marker> _markers = {}; // Set to hold map markers
  static const LatLng centerOfRiyadh = LatLng(24.7136, 46.6753);
  @override
  void initState() {
    _initializeMapRenderer();
    initialCameraPosition = const CameraPosition(
      target: centerOfRiyadh,
      zoom: 8,
    );
    super.initState();
  }

  void _initializeMapRenderer() {
    final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      mapsImplementation.useAndroidViewSurface = true;
    }
  }

 void _onMapTapped(LatLng position) {
    setState(() {
      _markers.clear(); // Clears previous markers if you want only one marker at a time
      _markers.add(
        CustomMarker = Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: const InfoWindow(
            title: 'Tapped Location',
          ),
        ),
      );
    });
  }
  bool isInRiyadh(LatLng position) {
    const double radius = 50.0; 
    double distance = calculateDistance(position, centerOfRiyadh);
    return distance <= radius;
  }

  double calculateDistance(LatLng pos1, LatLng pos2) {
    const double R = 6371; 
    double dLat = _deg2rad(pos2.latitude - pos1.latitude);
    double dLon = _deg2rad(pos2.longitude - pos1.longitude);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_deg2rad(pos1.latitude)) *
            cos(_deg2rad(pos2.latitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c; 
  }

  double _deg2rad(double deg) {
    return deg * (pi / 180);
  }
  Future<void> searchAndNavigate(String searchQuery) async {
    try {
      List<Location> locations = await locationFromAddress(searchQuery);
      if (locations.isNotEmpty) {
        final location = locations.first;
        final newCameraPosition = CameraPosition(
          target: LatLng(location.latitude, location.longitude),
          zoom: 8,
        );
        mapController.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
        setState(() {
          searchMode = false;
          _markers.clear();
          _markers.add(
            Marker( 
              
              markerId: const  MarkerId('search-location'),
              position: LatLng(location.latitude, location.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
              infoWindow: InfoWindow(
                title: 'Search Location',
                snippet: searchQuery,
              ),
            ),
          );
        });
      }
    } catch (e) {
      print("Error occurred while searching: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            onTap: _onMapTapped,
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              
            },
            markers: _markers,
          ),
          Positioned(
            top: 40.0,
            left: 15.0,
            right: 15.0,
            child: SizedBox(
              height: 75,
              child: Row(
                children: [
                 Expanded(flex: 1, child:  GestureDetector(
                  onTap: (){
                    CameraPosition newcameraposition = const CameraPosition(target: LatLng(24.656973, 46.574154),
                    zoom: 15,
                    );

                     mapController.animateCamera(CameraUpdate.newCameraPosition(newcameraposition));
                  },
                  child: Image.asset(kscopeIcon,))),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(backgroundcustomgreen),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          
                         hintStyle: const TextStyle(fontFamily: karabicFont1, color: Color(backgroundcolor1)),
                         hintTextDirection: TextDirection.ltr,
                          hintText: 'البحث عن موقع',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search, color:Color(backgroundcolor1)),
                            onPressed: () {
                              searchAndNavigate(_searchController.text);
                            },
                          ),
                        ),
                        onSubmitted: (value) {
                          searchAndNavigate(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
            Positioned(
            bottom: 30.0,
            left: 20.0,
            right: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                      color: const Color(backgroundcustomgreen),
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child:TextButton(onPressed: (){
                   if (!isInRiyadh(CustomMarker!.position)) {
                     showDialog(context: context,
                            builder: (_) => AlertDialog(
                              actions: <Widget>[
                                SizedBox(
                                  height: 120,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                                      child: Text('عفوا', style: arabicstyle4.copyWith(fontSize: 40),),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('هذه المنطقه خارج خدمتنا', style: arabicstyle2,),
                                    ],
                                  ),
                                ),
                              ],
                              surfaceTintColor: const Color(backgroundcolor1),
                              shadowColor: Colors.black26,
                            ),
                          );
                   }
                  }, child:const  Text('تاكيد الموقع', style: arabicstyle5,)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}










