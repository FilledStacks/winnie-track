import 'dart:async';

import 'package:example_driver/models/tracking_location.dart';
import 'package:location/location.dart';

class LocationService {
  TrackingLocation _currentLocation;

  StreamController<TrackingLocation> _locationController =
      StreamController<TrackingLocation>();

  Stream<TrackingLocation> get locationStream => _locationController.stream;

  final _location = Location();

  Future<TrackingLocation> getLocation() async {
    try {
      var userLocation = await _location.getLocation();
      _currentLocation = TrackingLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
        bearing: userLocation.heading,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }

  void startLocationTracking() {
    _location.changeSettings(
        accuracy: LocationAccuracy.navigation, interval: 0, distanceFilter: 0);
        
    // Request permission to use location
    _location.requestPermission().then((granted) {
      print('startLocationTracking granted:$granted');
      if (granted == PermissionStatus.granted) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        _location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _locationController.add(TrackingLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
          }
        });
      }
    });
  }
}
