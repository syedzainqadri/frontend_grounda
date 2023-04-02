import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class OpenStreetMap extends StatelessWidget {
  OpenStreetMap({Key? key, required this.onPicked, required this.center})
      : super(key: key);

  // final LocationService locationService = Get.find<LocationService>();
  dynamic onPicked;
  LatLong center;

  @override
  Widget build(BuildContext context) {
    return OpenStreetMapSearchAndPick(
      center: center,
      buttonColor: Colors.red,
      buttonText: 'Set Current Location',
      onPicked: onPicked,
      // (pickedData) {
      //   print(pickedData.latLong.latitude);
      //   print(pickedData.latLong.longitude);
      //   print(pickedData.address);
      // },
      // onGetCurrentLocationPressed: locationService.getPosition,
    );
  }
}
