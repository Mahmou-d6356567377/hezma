import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:hezma/utils/constants.dart';

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
  final Set<Marker> _markers = {}; // Set to hold map markers

  @override
  void initState() {
    _initializeMapRenderer();
    initialCameraPosition = const CameraPosition(
      target: LatLng(24.7326759868516, 46.657733877636275),
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
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: InfoWindow(
            title: 'Tapped Location',
          ),
        ),
      );
    });
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                decoration: InputDecoration(
                  hintText: 'Search for a place',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.location_pin, color: Colors.black38),
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
    );
  }
}
