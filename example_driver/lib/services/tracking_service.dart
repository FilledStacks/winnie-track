import 'package:firebase_core/firebase_core.dart';

/// A service that creates a tracking session for this device to track its live location
class TrackingService {
  Future initialise() async {
    await Firebase.initializeApp();
  }
}
