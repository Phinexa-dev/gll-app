class SipDetail {
  final String imageUrl;
  final int numberOfSips;
  final int numberOfPeopleImpacted;
  final List<KeyTakeAways> keyTakeAways;
  final List<Sip> sips;
  final String country;
  final DateTime startDate;
  final DateTime endDate;

  SipDetail({
    required this.imageUrl,
    required this.keyTakeAways,
    required this.sips,
    required this.country,
    required this.startDate,
    required this.endDate,
    required this.numberOfSips,
    required this.numberOfPeopleImpacted,
  });
}

class KeyTakeAways {
  final int amount;
  final String description;
  final String? icon;

  KeyTakeAways({required this.amount, required this.description, this.icon});
}

class Sip {
  final String title;
  final String description;
  final String quote;

  Sip({required this.title, required this.description, required this.quote});
}
