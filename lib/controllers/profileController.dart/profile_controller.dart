import 'dart:convert';
import 'package:frontend_grounda/models/userModel/profile_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import '../../utils/global_variable.dart';

class ProfileController extends GetxController {
  var profile = ProfileModel().obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var id = ''.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    id.value = tokenHiveBox.get('uid');
    print(token.value);
    print(id.value);
    if (id.value == '') {
    } else {
      var uid = int.parse(id.value);
      getProfile(uid);
    }
  }

  Future<void> createUserProfile(
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
    int user,
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
    var response = await http.post(Uri.parse(baseUrl + createProfile),
        body: jsonEncode(bodyPrepare),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      profile.value = profileModelFromJson(response.body);
      print(response.body);
    } else {
      print(response.body);
    }
  }

  Future<void> getProfile(int id) async {
    var bodyPrepare = {
      "id": id,
    };
    var response = await http.post(Uri.parse(baseUrl + profileById),
        body: jsonEncode(bodyPrepare),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    print(response);
    profile.value = profileModelFromJson(response.body);
  }

  Future<void> delete(int id) async {
    var bodyPrepare = {
      "id": id,
    };
    var response = await http.post(Uri.parse(baseUrl + deleteProfile),
        body: jsonEncode(bodyPrepare),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    print(response);
    profile.value = profileModelFromJson(response.body);
  }
}
