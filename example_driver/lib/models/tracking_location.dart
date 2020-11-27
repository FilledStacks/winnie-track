import 'package:flutter/material.dart';

class TrackingLocation {
  final double latitude;
  final double longitude;
  final double bearing;

  TrackingLocation({
    @required this.latitude,
    @required this.longitude,
    this.bearing,
  });
}
