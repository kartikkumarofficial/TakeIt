import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GoogleSignInProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      print("Attempting Google sign-in...");
      await _googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("Google sign-in canceled by user.");
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
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
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
      print("Google sign-out successful!");
    } catch (e, stackTrace) {
      print("Error signing out: $e");
      print("StackTrace: $stackTrace");
    }
  }
}

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInProvider googleSignInProvider = GoogleSignInProvider();
    final UserCredential? userCredential = await googleSignInProvider.signInWithGoogle();
    if (userCredential == null) return;
    User? user = userCredential.user;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/signup');
      }
    }
  } catch (error) {
    print("Google Sign-In Error: $error");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to sign in with Google. Please try again.")),
    );
  }
}

Future<void> signUpWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInProvider googleSignInProvider = GoogleSignInProvider();
    final UserCredential? userCredential = await googleSignInProvider.signInWithGoogle();
    if (userCredential == null) return;
    User? user = userCredential.user;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': user.displayName,
        'email': user.email,
        'profilePic': user.photoURL,
        'createdAt': Timestamp.now(),
      });
      Navigator.pushReplacementNamed(context, '/home');
    }
  } catch (error) {
    print("Google Sign-Up Error: $error");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to sign up with Google. Please try again.")),
    );
  }
}