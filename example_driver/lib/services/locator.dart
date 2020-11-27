import 'package:example_driver/services/tracking_service.dart';
import 'package:get_it/get_it.dart';

import 'location_service.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => LocationService());

  final trackingService = TrackingService();
  await trackingService.initialise();

  locator.registerSingleton(trackingService);
}
