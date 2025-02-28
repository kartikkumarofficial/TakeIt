import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class GoogleSignInProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(); // Removed scopes

  /// Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      print("Attempting Google sign-in...");

      // Ensure user can select an account (prevents auto-login issues)
      await _googleSignIn.signOut();

      // Start the sign-in process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("Google sign-in canceled by user.");
        return null;
      }

      // Get Google authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with Google credentials
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      print("Google sign-in successful: ${userCredential.user?.email}");

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.message}");
      return null;
    } catch (e, stackTrace) {
      print("Error during Google sign-in: $e");
      print("StackTrace: $stackTrace");
      return null;
    }
  }

  /// Sign out function
  Future<void> signOut() async {
    try {
      print("Signing out from Firebase...");
      await _auth.signOut();
      print("Firebase sign-out successful!");

      print("Disconnecting Google account...");
      await _googleSignIn.disconnect(); // Revokes account permissions
      await _googleSignIn.signOut();
      print("Google sign-out successful!");
    } catch (e, stackTrace) {
      print("Error signing out: $e");
      print("StackTrace: $stackTrace");
    }
  }
}
