import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'phone_number_state.dart';

class PhoneNumberNotifier extends StateNotifier<PhoneNumberState> {
  PhoneNumberNotifier() : super(PhoneNumberState(countryCode: "+1", phoneNumber: ""));

  void updateCountryCode(String newCountryCode) {
    state = state.copyWith(countryCode: newCountryCode);
  }

  void updatePhoneNumber(String newPhoneNumber) {
    state = state.copyWith(phoneNumber: newPhoneNumber);
  }
}
