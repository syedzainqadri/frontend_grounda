import 'dart:convert';
import 'package:frontend_grounda/models/userModel/profile_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/global_variable.dart';

class ProfileController extends GetxController {
  var profile = ProfileModel().obs;

  void createUserProfile(
    String firstName,
    String lastName,
    String addressLine1,
    String addressLine2,
    String city,
    String state,
    String country,
    String phone,
    String postCode,
    String longitude,
    String latitude,
    String images,
    String user,
  ) async {
    var bodyPrepare = {
      "firstName": firstName,
      "lastName": lastName,
      "addressLine1": addressLine1,
      "addressLine2": addressLine2,
      "city": city,
      "state": state,
      "country": country,
      "phone": phone,
      "postCode": postCode,
      "longitude": longitude,
      "latitude": latitude,
      "images": images,
      "user": user
    };
    var response = await http.post(Uri.parse(baseUrl + userLogin),
        body: jsonEncode(bodyPrepare));
    print(response.body);
    profile.value = profileModelFromJson(response.body);
  }
}
