import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signinwithgoogle {
  final auth = FirebaseAuth.instance;
  Future googlesignin() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
              clientId:
                  "612099708143-1sdqg3i6jctcjc3pd9lerkelo1ahb3d6.apps.googleusercontent.com")
          .signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
  }
}
