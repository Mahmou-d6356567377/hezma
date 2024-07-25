import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:permission_handler/permission_handler.dart';
import 'package:go_router/go_router.dart';

class MapScrean extends StatefulWidget {
  const MapScrean({super.key});

  @override
  State<MapScrean> createState() => _MapScreanState();
}

class _MapScreanState extends State<MapScrean> {
  GoogleMapController? mapController;

final gmaps.LatLng _center = const gmaps.LatLng(30.0444, 31.2357);
final latlng.LatLng anotherLocation = const  latlng.LatLng(30.0444, 31.2357);

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  void _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isPermanentlyDenied) {
  // The user has previously denied the permission and chosen "Don't ask again".
  openAppSettings(); // Redirect the user to the app settings page
} else if (status.isDenied) {
  // Handle the denial case
  customshowdialog();
}
  }

  Future<dynamic> customshowdialog() {
    return showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text("Location Permission"),
    content: const  Text("Please grant location permission to use this feature."),
    actions: [
      TextButton(
        child: const  Text("Open Settings"),
        onPressed: () {
          openAppSettings(); // Open settings
        },
      ),
    ],
  ),
);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addMarker(_center);
  }

  void _addMarker(LatLng position) {
    final MarkerId markerId = MarkerId('marker_1');
    final Marker marker = Marker(
      markerId: markerId,
      position: position,
      infoWindow: const InfoWindow(
        title: 'Marker 1',
        snippet: 'An interesting place',
      ),
      draggable: true,
      onDragEnd: (newPosition) {
        _updateMarkerPosition(markerId, newPosition);
      },
    );

    setState(() {
      _markers.add(marker);
    });
  }

  void _updateMarkerPosition(MarkerId markerId, LatLng newPosition) {
    final updatedMarkers = _markers.map((marker) {
      if (marker.markerId == markerId) {
        return marker.copyWith(positionParam: newPosition);
      }
      return marker;
    }).toSet();

    setState(() {
      _markers = updatedMarkers;
    });
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Google Map'),
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11,
        ),
        markers: _markers,
        myLocationEnabled: true, // Enable my location button
        myLocationButtonEnabled: true,
      ),
    );
  }
}
