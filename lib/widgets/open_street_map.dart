import 'package:flutter/material.dart';
import 'package:frontend_grounda/services/location_service.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class OpenStreetMap extends StatelessWidget {
  OpenStreetMap({Key? key, required this.onPicked}) : super(key: key);

  final LocationService locationService = LocationService();
  dynamic onPicked;

  @override
  Widget build(BuildContext context) {
    return OpenStreetMapSearchAndPick(
      center: LatLong(23, 89),
      buttonColor: Colors.red,
      buttonText: 'Set Current Location',
      onPicked: onPicked,
      // (pickedData) {
      //   print(pickedData.latLong.latitude);
      //   print(pickedData.latLong.longitude);
      //   print(pickedData.address);
      // },
      onGetCurrentLocationPressed: locationService.getPosition,
    );
  }
}
