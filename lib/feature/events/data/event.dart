class SubEvent {
  final DateTime startDate;
  final DateTime endDate;
  final String description;

  SubEvent({
    required this.startDate,
    required this.endDate,
    required this.description,
  });
}

class Event {
  final String title;
  final String image;
  final String venue;
  final String subTitle;
  final List<SubEvent> subEvents;
  final String ledBy;
  final bool isTTT;

  Event(
      {required this.title,
      required this.image,
      required this.venue,
      required this.subTitle,
      required this.subEvents,
      required this.ledBy,
      required this.isTTT});

  DateTime get startDate => subEvents.first.startDate;

  DateTime get endDate => subEvents.last.endDate;
}
