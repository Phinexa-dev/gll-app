import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/event.dart';

final eventProvider = Provider<List<Event>>((ref) {
  return [
    Event(
      title: "Leadership Academy (Beta Test)",
      venue: "Civil Resource Center, Shtip, Macedonia",
      image: "assets/events/event_1.png",
      subTitle: 'Empowering Tomorrow’s Leaders Today!',
      ledBy: '',
      isTTT: false,
      subEvents: [
        SubEvent(
          startDate: DateTime(2025, 8, 10, 8, 30),
          endDate: DateTime(2025, 8, 13, 17, 00),
          description:
              "Participate in the Leadership Academy to develop essential leadership skills, engage in hands-on learning, and design and carry out your own Sustainable Impact Project (SIP).",
        ),
      ],
    ),
    Event(
      title: "Train the Trainer (Beta Test)",
      image: "assets/events/event_2.png",
      venue: "Civil Resource Center, Skopje, Macedonia",
      subTitle: 'Prepare to lead. Empower to impact. Join us!',
      ledBy: 'Led by Master Trainers Macedonia',
      isTTT: true,
      subEvents: [
        SubEvent(
          startDate: DateTime(2025, 8, 10),
          endDate: DateTime(2025, 8, 13),
          description:
              "Advance with Train the Trainer certification! Learn to facilitate the  Academy and inspire others through the Global Learning Lab.",
        ),
      ],
    ),
    Event(
      title: "Leadership Academy – CCIU",
      image: "assets/events/event_3.png",
      venue: "Hartford, Connecticut",
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
      venue: "Hartford, Connecticut",
      subTitle: 'Empowering Tomorrow’s Leaders Today!',
      ledBy:
          'Led by Global Master Trainers from Nepal, India, Macedonia, and the U.S, this immersive experience takes place at the world-class HMTX Headquarters.',
      isTTT: true,
      subEvents: [
        SubEvent(
          startDate: DateTime(2025, 8, 21),
          endDate: DateTime(2025, 8, 25),
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
