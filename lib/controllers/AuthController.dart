import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend_grounda/utils/snackbar.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  RxString token = ''.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  User? get userGetter => firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(auth.authStateChanges());
  }

  /*
   * Reset Password
   */
  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      errorSnackbar(
        'Password Reset',
        'Recovery email has been sent!',
      );
    } catch (e) {
      errorSnackbar(
        'Resetting failed',
        e.toString(),
      );
    }
  }

  Future<bool> validatePassword(String password) async {
    var user = auth.currentUser;
    try {
      var authCredentials =
          EmailAuthProvider.credential(email: user!.email!, password: password);
      var authResult = await user.reauthenticateWithCredential(authCredentials);
      return true;
    } catch (e) {
      errorSnackbar(
        "Password Reset Error",
        e.toString(),
      );

      return false;
    }
  }

  Future<void> changePassword(String newPassword) async {
    var user = auth.currentUser!;
    try {
      await user.updatePassword(newPassword);
      successSnackbar(
        'Successful',
        'Password Changed Successfully.',
      );
    } catch (e) {
      errorSnackbar(
        'Failed',
        e.toString(),
      );
    }
  }

  // setting profile scope
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  Future<void> googleSignin() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken!, accessToken: googleAuth.accessToken!);
      UserCredential authResult =
          await auth.signInWithCredential(authCredential);

      if (authResult.additionalUserInfo!.isNewUser) {
        auth.currentUser!.getIdToken().then((value) => {token.value = value});
        // UserModel userModel =
        // UserModel(fcmtoken: authResult.user!.getIdToken());
      }
    } catch (e) {
      errorSnackbar(
        'Login Failed ',
        'Google login failed, try again.',
      );
    }
  }

  // Future<UserModel> createUser() async {}
}
