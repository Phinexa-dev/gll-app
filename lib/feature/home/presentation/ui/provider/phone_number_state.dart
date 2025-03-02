class PhoneNumberState {
  final String countryCode;
  final String phoneNumber;

  PhoneNumberState({
    required this.countryCode,
    required this.phoneNumber,
  });

  String get fullPhoneNumber => '$countryCode$phoneNumber';

  PhoneNumberState copyWith({
    String? countryCode,
    String? phoneNumber,
  }) {
    return PhoneNumberState(
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
