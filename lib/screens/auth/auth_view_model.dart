import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers are declared globally and specify how to create a state
final authViewModelProvider = StateNotifierProvider<_AuthViewModel, bool>((ref) => _AuthViewModel(ref));

class _AuthViewModel extends StateNotifier<bool> {
  _AuthViewModel(this.ref): super(true);

  final Ref ref;

  void toggle() {
    var oldValue = state;
    state = !oldValue;
  }
}
