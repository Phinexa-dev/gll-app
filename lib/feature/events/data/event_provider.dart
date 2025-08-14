import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/event.dart';

final eventProvider = Provider<List<Event>>((ref) {
  return [
    Event(
      title: "Leadership Academy – CCIU",
      image: "assets/events/event_3.png",
      venue: "Manchester, CT",
      subTitle: 'Empowering Tomorrow’s Leaders Today!',
      ledBy:
          'Led by Global Master Trainers from Macedonia and the U.S, this immersive experience takes place in Sarajevo, Bosia',
      isTTT: false,
      subEvents: [
        SubEvent(
          startDate: DateTime(2025, 8, 18),
          endDate: DateTime(2025, 8, 19),
          description:
              "Participate in the Leadership Academy to develop essential leadership skills, engage in hands-on learning, and design and carry out your own Sustainable Impact Project (SIP).",
        ),
      ],
    ),
    Event(
      title: "Train the Trainer – CCIU",
      image: "assets/events/event_4.png",
      venue: "Manchester, CT",
      subTitle: 'Empowering Tomorrow’s Leaders Today!',
      ledBy:
          'Led by Global Master Trainers from Nepal, India, Macedonia, and the U.S, this immersive experience takes place at the world-class HMTX Headquarters.',
      isTTT: true,
      subEvents: [
        SubEvent(
          startDate: DateTime(2025, 8, 21),
          endDate: DateTime(2025, 8, 22),
          description:
              "Participate in the Leadership Academy to develop essential leadership skills, engage in hands-on learning, and design and carry out your own Sustainable Impact Project (SIP).",
        ),
      ],
    ),
    Event(
      title: "Leadership Academy – NEPAL",
      image: "assets/events/event_8.png",
      venue: "Kathmandu",
      subTitle: 'Empowering Tomorrow’s Leaders Today!',
      ledBy:
          'Led by Global Master Trainers from Nepal, India, Macedonia, and the U.S, this immersive experience takes place at the world-class HMTX Headquarters.',
      isTTT: false,
      subEvents: [
        SubEvent(
          startDate: DateTime(2025, 9),
          endDate: DateTime(2025, 9),
          description:
              "Participate in the Leadership Academy to develop essential leadership skills, engage in hands-on learning, and design and carry out your own Sustainable Impact Project (SIP).",
        ),
      ],
    ),
    Event(
      title: "Leadership Academy – MACEDONIA",
      image: "assets/events/event_5.png",
      venue: "Skopje ",
      subTitle: 'Empowering Tomorrow’s Leaders Today!',
      ledBy:
          'Led by Global Master Trainers from Nepal, India, Macedonia, and the U.S, this immersive experience takes place at the world-class HMTX Headquarters.',
      isTTT: false,
      subEvents: [
        SubEvent(
          startDate: DateTime(2025, 9),
          endDate: DateTime(2025, 9),
          description:
              "Participate in the Leadership Academy to develop essential leadership skills, engage in hands-on learning, and design and carry out your own Sustainable Impact Project (SIP).",
        ),
      ],
    ),
    Event(
      title: "Leadership Academy – KOSOVO",
      image: "assets/events/event_7.png",
      venue: "Pristina",
      subTitle: 'Empowering Tomorrow’s Leaders Today!',
      ledBy:
          'Led by Global Master Trainers from Nepal, India, Macedonia, and the U.S, this immersive experience takes place at the world-class HMTX Headquarters.',
      isTTT: false,
      subEvents: [
        SubEvent(
          startDate: DateTime(2025, 11, 20),
          endDate: DateTime(2025, 11, 21),
          description:
              "Participate in the Leadership Academy to develop essential leadership skills, engage in hands-on learning, and design and carry out your own Sustainable Impact Project (SIP).",
        ),
      ],
    ),
    Event(
      title: "Leadership Academy - BRANDIX ",
      image: "assets/events/event_6.png",
      venue: "Colombo ",
      subTitle: 'Empowering Tomorrow’s Leaders Today!',
      ledBy:
          'Led by Global Master Trainers from Nepal, India, Macedonia, and the U.S, this immersive experience takes place at the world-class HMTX Headquarters.',
      isTTT: false,
      subEvents: [
        SubEvent(
          startDate: DateTime(2025, 11),
          endDate: DateTime(2025, 11),
          description:
              "Participate in the Leadership Academy to develop essential leadership skills, engage in hands-on learning, and design and carry out your own Sustainable Impact Project (SIP).",
        ),
      ],
    ),
  ];
});
