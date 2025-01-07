import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'phone_number_notifier.dart';
import 'phone_number_state.dart';

// Provider for accessing and managing phone number state
final phoneNumberProvider = StateNotifierProvider<PhoneNumberNotifier, PhoneNumberState>((ref) {
  return PhoneNumberNotifier();
});