import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapApp extends StatelessWidget {
  const MapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LocationScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google maps'), backgroundColor: Colors.white),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(23.795776156622455, 90.39888197291026),
          zoom: 16,
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        onCameraMove: (CameraPosition cameraPosition) {
          print(cameraPosition);
        },
        onCameraIdle: () {
          print('Fatching data');
        },
        onTap: (LatLng latLng) {
          print(latLng);
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        mapToolbarEnabled: true,
        markers: <Marker>{
          Marker(
            markerId: MarkerId('My-office'),
            position: LatLng(23.794230436340644, 90.40639923444982),
            draggable: true,
            flat: false,
            onTap: () {
              print('Tappde on my office marker');
            },
            onDrag: (LatLng latLng) {
              // print(latLng);
            },
            onDragEnd: (LatLng latLng) {
              print(latLng);
            },
            onDragStart: (LatLng latLng) {
              print(latLng);
            },
            infoWindow: InfoWindow(
              title: 'My-office',
              onTap: () {
                print('Tapped on info window');
              },
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue,
            ),
          ),
          Marker(
            markerId: MarkerId('My-home'),
            position: LatLng(23.788668085940515, 90.40721834387875),
          ),
          Marker(
            markerId: MarkerId('My-house'),
            position: LatLng(23.79423031385737, 90.40627419948578),
          ),
        },
        circles: <Circle>{
          Circle(
            circleId: CircleId('redZone'),
            center: LatLng(23.79815394212454, 90.41525859385729),
            radius: 300,
            onTap: () {
              print('Tapped on my circle');
            },
            fillColor: Colors.red.shade100,
            strokeColor: Colors.red,
            strokeWidth: 3,
            consumeTapEvents: true,
            visible: true,
          ),
          Circle(
            circleId: CircleId('redZone2'),
            center: LatLng(23.790728705365378, 90.410389713943),
            radius: 100,
            onTap: () {
              print('Tapped on my circle');
            },
            fillColor: Colors.red.shade100,
            strokeColor: Colors.red,
            strokeWidth: 3,
            consumeTapEvents: true,
            visible: true,
          ),
        },
        polylines: <Polyline>{
          Polyline(
            polylineId: PolylineId('myRoad'),
            points: [
              LatLng(23.796023110699863, 90.40109887719154),
              LatLng(23.799050316568234, 90.40184821933508),
              LatLng(23.79795086122357, 90.40401712059975),
            ],
            width: 8,
            jointType: JointType.round,
            endCap: Cap.roundCap,
          ),
        },
        polygons: <Polygon>{
          Polygon(
            polygonId: PolygonId('sample-polygon'),
            points: [
              LatLng(23.79240528016672, 90.40222071111202),
              LatLng(23.79359037388104, 90.40400739759207),
              LatLng(23.792962088422286, 90.40509972721338),
              LatLng(23.79122723169664, 90.40400739759207),
              LatLng(23.79107015776045, 90.40160413831472),
              LatLng(23.790113291146117, 90.40275111794472),
            ],
            fillColor: Colors.blue.shade50,
            strokeColor: Colors.purple,
            strokeWidth: 4,
            onTap: () {
              print('Tapped on my polygon');
            },
            consumeTapEvents: true,
          ),
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              // _mapController.moveCamera(
              //   CameraUpdate.newCameraPosition(
              //     CameraPosition(
              //       target: LatLng(23.795776156622455, 90.39888197291026),
              //       zoom: 17,
              //     ),
              //   ),
              // );

              _mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(23.795776156622455, 90.39888197291026),
                    zoom: 16,
                  ),
                ),
              );
            },
            child: Icon(Icons.my_location),
          ),
        ],
      ),
    );
  }
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Position? _currentLocation;
  Position? _liveLocation;

  // TODO check location permission
  Future<bool> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    } else {
      return false;
    }
  }

  // TODO Request location permission
  Future<bool> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    } else {
      return false;
    }
  }

  // GPS status
  // TODO Gps off thakle on korar code
  Future<bool> _checkIfGPSEnabled() async{
   return await Geolocator.isLocationServiceEnabled();
  }

  Future<void> _getCurrentLocation() async {
    if (await _checkLocationPermission()) {
      if(await _checkIfGPSEnabled()) {
        Position position = await Geolocator.getCurrentPosition();
        _currentLocation = position;
        print(position);
        setState(() {});
      }else{
        Geolocator.openLocationSettings();
      }
    } else {
      print('Permission is not available');
      if (await _requestLocationPermission()) {
        _getCurrentLocation();
      } else {
        // print('Permission is denied');
        Geolocator.openAppSettings();
      }
    }
  }

  Future<void> _listenCurrentLocation() async {
    if (await _checkLocationPermission()) {
      if(await _checkIfGPSEnabled()) {
       Geolocator.getPositionStream().listen((location){
         _liveLocation = location;
         setState(() {});
       });
      }else{
        Geolocator.openLocationSettings();
      }
    } else {
      print('Permission is not available');
      if (await _requestLocationPermission()) {
        _getCurrentLocation();
      } else {
        // print('Permission is denied');
        Geolocator.openAppSettings();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location')),
      body: Center(
        child: Column(
          children: [
            Text(
              'Lat:${_currentLocation?.latitude} Long:${_currentLocation?.longitude}',
            ),
            Text(_currentLocation?.isMocked.toString() ?? ''),
            Text('Live Location: $_liveLocation'),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              _getCurrentLocation();
            },
            child: Icon(Icons.my_location_outlined),
          ),
          FloatingActionButton(
            onPressed: () {
             _listenCurrentLocation();
            },
            child: Icon(Icons.location_history),
          ),
        ],
      ),
    );
  }
}
