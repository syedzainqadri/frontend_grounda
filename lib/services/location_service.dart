// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:latlong2/latlong.dart';

// class LocationService extends GetxController {
//   var lat = 0.0.obs;
//   var long = 0.0.obs;
//   @override
//   onInit() {
//     super.onInit();
//     getPosition();
//   }

//   Future<LatLng> getPosition() async {
//     print("Function Started");
//     if (await Permission.location.serviceStatus.isEnabled) {
//       var status = await Permission.location.status;
//       if (status.isGranted) {
//       } else if (status.isDenied) {
//         Map<Permission, PermissionStatus> status = await [
//           Permission.location,
//         ].request();
//       }
//     } else {
//       // permission is disabled
//     }
//     if (await Permission.location.isPermanentlyDenied) {
//       openAppSettings();
//     }

//     Position position = await Geolocator.getCurrentPosition();
//     lat.value = position.latitude;
//     long.value = position.longitude;
//     return LatLng(position.latitude, position.longitude);
//   }
// }
