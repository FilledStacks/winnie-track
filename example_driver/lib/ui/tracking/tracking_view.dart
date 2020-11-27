import 'package:example_driver/ui/tracking/tracking_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TrackingView extends StatelessWidget {
  const TrackingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TrackingViewModel>.reactive(
      viewModelBuilder: () => TrackingViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: FlatButton(
            child: Text('Start Tracking'),
            onPressed: () => model.startTracking(),
          ),
        ),
      ),
    );
  }
}
