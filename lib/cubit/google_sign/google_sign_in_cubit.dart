import 'package:auth/auth.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<SignState> {
  GoogleSignInCubit() : super(SignInitial());

  void signInWithGoogle() {}
}

final googleSignIn = GoogleSignIn();
GoogleSignInAccount? _user;

GoogleSignInAccount get user => _user!;

Future signInWithGoogle() async {
  final googleUser = await googleSignIn.signIn();
  if (googleUser == null) return;

  _user = googleUser;

  final googleAuthentication = await googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
      idToken: googleAuthentication.idToken,
      accessToken: googleAuthentication.accessToken);
  await FirebaseAuth.instance.signInWithCredential(credential);
}
