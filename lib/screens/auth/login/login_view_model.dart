import 'dart:async';

import 'package:client/logic/general_provider.dart';
import 'package:client/logic/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginViewModelProvider = ChangeNotifierProvider<LoginViewModel>(
  (ref) => LoginViewModel(auth: ref.watch(authRepositoryProvider)),
);

class LoginViewModel with ChangeNotifier {
  LoginViewModel({required this.auth});
  final AuthRepository auth;
  bool isLoading = false;
  dynamic error;

  Future<void> _signIn(Future<dynamic> signInMethod) async {
    try {
      isLoading = true;
      notifyListeners();
      await signInMethod;
      error = null;
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await _signIn(auth.signIn(email, password));
  }

  Future<void> signInWithApple() async {
    await _signIn(auth.signInWithApple());
  }

  Future<void> signInWithGoogle() async {
    await _signIn(auth.signInWithApple());
  }
}
