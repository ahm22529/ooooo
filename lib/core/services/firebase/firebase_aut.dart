import 'dart:developer';

import 'package:arb_tasks/core/error/execption.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAutServices {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomExpection('الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExpection('لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.');
      } else if (e.code == 'network-request-failed') {
        throw CustomExpection('تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomExpection('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");

      throw CustomExpection('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomExpection('الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomExpection('الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'invalid-credential') {
        throw CustomExpection('الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomExpection('تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomExpection('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");

      throw CustomExpection('لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }

  // Future<User> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  // }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
}
