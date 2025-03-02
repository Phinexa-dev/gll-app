import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/event.dart';

final eventProvider = Provider<List<Event>>((ref) {
  return [
    Event(
      title: "Leadership Academy",
      venue: "Civil Resource Center, Shtip, Macedonia",
      image: "assets/events/event_1.png",
      subTitle: 'Led by Empowering Tomorrow’s Leaders Today!',
      ledBy: '',
      subEvents: [
        SubEvent(
          startDate: DateTime(2025, 3, 6, 8, 30),
          endDate: DateTime(2025, 3, 7, 17, 00),
          description:
              "Participate in the Leadership Academy to develop essential leadership skills, engage in hands-on learning, and design and carry out your own Sustainable Impact Project (SIP).",
        )
      ],
    ),
    Event(
      title: "Train the Trainer ",
      image: "assets/events/event_2.png",
      venue: "Civil Resource Center, Skopje, Macedonia",
      subTitle: 'Prepare to lead. Empower to impact. Join us!',
      ledBy: 'Led by Master Trainers Macedonia',
      subEvents: [
        SubEvent(
            startDate: DateTime(2025, 3, 13, 8, 30),
            endDate: DateTime(2025, 3, 14, 17, 00),
            description:
                "Advance with Train the Trainer certification! Learn to facilitate the  Academy and inspire others through the Global Learning Lab."),
      ],
    ),
    Event(
      title: "Leadership Academy - Train the Trainer",
      image: "assets/events/event_3.png",
      venue: "Sarajevo, Bosnia",
      subTitle: 'Empowering Tomorrow’s Leaders Today!',
      ledBy:
          'Led by Global Master Trainers from Macedonia and the U.S, this immersive experience takes place in Sarajevo, Bosia',
      subEvents: [
        SubEvent(
            startDate: DateTime(2025, 4, 2, 8, 30),
            endDate: DateTime(2025, 4, 3, 17, 00),
            description:
                "Participate in the Leadership Academy to develop essential leadership skills, engage in hands-on learning, and design and carry out your own Sustainable Impact Project (SIP)."),
        SubEvent(
            startDate: DateTime(2025, 4, 4, 8, 30),
            endDate: DateTime(2025, 4, 5, 17, 00),
            description:
                "Advance with Train the Trainer certification! Learn to facilitate the  Academy and inspire others through the Global Learning Lab."),
      ],
    ),
    Event(
      title: "Leadership Academy - Train the Trainer",
      image: "assets/events/event_4.png",
      venue: "HMTX Headquarters, Norwalk, CT",
      subTitle: 'Empowering Tomorrow’s Leaders Today!',
      ledBy:
          'Led by Global Master Trainers from Nepal, India, Macedonia, and the U.S, this immersive experience takes place at the world-class HMTX Headquarters.',
      subEvents: [
        SubEvent(
            startDate: DateTime(2025, 5, 1, 8, 30),
            endDate: DateTime(2025, 5, 2, 17, 00),
            description:
                "Participate in the Leadership Academy to develop essential leadership skills, engage in hands-on learning, and design and carry out your own Sustainable Impact Project (SIP)."),
        SubEvent(
            startDate: DateTime(2025, 5, 3, 8, 30),
            endDate: DateTime(2025, 5, 4, 17, 00),
            description:
                "Advance with Train the Trainer certification! Learn to facilitate the  Academy and inspire others through the Global Learning Lab."),
      ],
    ),
  ];
});
