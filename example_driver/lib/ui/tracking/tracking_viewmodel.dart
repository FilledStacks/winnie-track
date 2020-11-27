import 'package:example_driver/services/location_service.dart';
import 'package:example_driver/services/locator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:stacked/stacked.dart';

class TrackingViewModel extends BaseViewModel {
  final databaseReference = FirebaseDatabase.instance.reference();
  final _locationService = locator<LocationService>();

  void initialise() {
    _locationService.locationStream.listen((trackingLocation) async {
      await databaseReference.child('trackable/1').set({
        'lattitude': trackingLocation.latitude,
        'longitude': trackingLocation.longitude,
        'bearing': trackingLocation.bearing,
      });
    });
  }

  /// Start tracking this device
  Future startTracking() async {
    _locationService.startLocationTracking();
  }
}
