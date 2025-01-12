import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widget/map_view_widget.dart';

final eventListProvider = Provider<List<CampEvent>>((ref) {
  return [
    CampEvent(
      id: "1",
      title: "Teenage Awareness Campaign",
      description:
          "Empowering the youth. Focused on mental health and productivity in youth.Organized sessions for 30 teachers on modern teaching techniques and integrating technology into classrooms.Supplied 500+ students with school supplies, textbooks, and digital learning devices.",
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1664474834472-6c7d1e3198e2?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      keyObjectives: [
        KeyObjective(
          title: "Raise Awareness",
          description:
              "Increase awareness on mental health and its importance.",
        ),
        KeyObjective(
          title: "Build Community Support",
          description:
              "Encourage community involvement in addressing youth issues.",
        ),
        KeyObjective(
          title: "Provide Resources",
          description:
              "Distribute educational resources for better productivity.",
        ),
        KeyObjective(
          title: "Collaborate with Schools",
          description: "Partner with schools to conduct workshops.",
        ),
      ],
      subEvents: [
        SubEvent(
          title: "TV Campaign",
          description: "Broadcast campaigns promoting mental health.",
          imageUrl:
              "https://images.unsplash.com/photo-1531058020387-3be344556be6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          targetAudience: "All age groups",
          profileImage:
              'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          date: DateTime(2025, 1, 15),
        ),
        SubEvent(
          title: "School Workshops",
          description: "Interactive workshops on mental health.",
          profileImage:
              'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          imageUrl:
              "https://plus.unsplash.com/premium_photo-1663089174939-5870e2e8d62e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          targetAudience: "Students aged 10-16",
          date: DateTime(2025, 1, 20),
        ),
        SubEvent(
          title: "Resource Distribution",
          profileImage:
              'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: "Providing guides and other learning materials.",
          imageUrl:
              "https://images.unsplash.com/photo-1527529482837-4698179dc6ce?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          targetAudience: "Youth and schools",
          date: DateTime(2025, 1, 25),
        ),
      ],
      testimonials: [
        Testimonial(
          name: "Parent",
          role: "Parent of a teenager",
          feedback:
              "This campaign has been a great help for my child's mental health.",
          imageUrl:
              'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        Testimonial(
          name: "Educator",
          role: "School Educator",
          feedback: "These sessions are a valuable resource for our students.",
          imageUrl:
              'https://images.unsplash.com/photo-1508341591423-4347099e1f19?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
      ],
      location: "GooglePlex, Mountain View",
      latLng: LatLng(37.4220, -122.0841),
      startDate: DateTime(2025, 1, 10),
      endDate: DateTime(2025, 2, 10),
    ),
    // Additional Event
    CampEvent(
      id: "2",
      title: "Youth Skill Development Campaign",
      description:
          "A campaign focused on empowering youth with skill-building workshops.",
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1664474834472-6c7d1e3198e2?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      keyObjectives: [
        KeyObjective(
          title: "Skill Training",
          description: "Provide training in key skills for future careers.",
        ),
        KeyObjective(
          title: "Community Engagement",
          description:
              "Encourage youth to actively participate in communities.",
        ),
      ],
      subEvents: [
        SubEvent(
          title: "Coding Workshop",
          profileImage:
              'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          description: "Providing guides and other learning materials.",
          imageUrl:
              "https://images.unsplash.com/photo-1531058020387-3be344556be6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          targetAudience: "Students aged 12-18",
          date: DateTime(2025, 3, 5),
        ),
      ],
      testimonials: [
        Testimonial(
          name: "Student",
          role: "Participant",
          feedback:
              "The coding workshop helped me understand programming basics!",
          imageUrl:
              'https://images.unsplash.com/photo-1508341591423-4347099e1f19?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        Testimonial(
          name: "Student",
          role: "Participant",
          feedback:
              "The coding workshop helped me understand programming basics!",
          imageUrl:
              'https://images.unsplash.com/photo-1557862921-37829c790f19?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
      ],
      location: "Tech Park, San Francisco",
      latLng: LatLng(37.4270, -122.0841),
      startDate: DateTime(2025, 3, 1),
      endDate: DateTime(2025, 3, 10),
    ),
  ];
});
