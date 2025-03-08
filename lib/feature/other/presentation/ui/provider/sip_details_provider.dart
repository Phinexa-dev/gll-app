import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/model/sip/sip_detail.dart';

final sipDetailsProvider = Provider<List<SipDetail>>((ref) {
  return [
    SipDetail(
      imageUrl: 'assets/events/sip_image.png',
      numberOfPeopleImpacted: 5000,
      numberOfSips: 15,
      keyTakeAways: [
        KeyTakeAways(
          icon: 'assets/home/Alert.svg',
          amount: 175,
          description: 'High School Students trained',
        ),
        KeyTakeAways(
          amount: 4,
          description: 'High School Aged Master Trainers certified',
        ),
        KeyTakeAways(
          amount: 15,
          description: 'SIP’s completed impacting over 5,000 people',
        ),
      ],
      sips: [
        Sip(
          title: 'IRIZ',
          description:
              'Clothes donation for orphans and advocacy for changing policies. Para- legal assistance for illiterate people in Shuto Orizari.',
          quote: 'Warm Home for All',
        ),
        Sip(
          title: 'Romano Chachipe',
          description:
              'Volunteers conducted a field survey to identify families in need and provided formula and diapers to 30 families in an informal settlement.',
          quote: 'Improving lives of the underprivileged',
        ),
        Sip(
          title: 'MCIS',
          description:
              'New year party and a puppet show for children from the daily care center for children in social risk from Shuto Orizari.',
          quote: 'Spread the New Year Joy',
        ),
        Sip(
          title: 'Apple Tree',
          description:
              'The initiative aimed to provide a safe environment for the victims to express their suppressed feelings and heal the wounds by art and music.',
          quote: 'I\'m enough',
        ),
        Sip(
          title: 'SOS Children Village Skopje',
          description:
              'Providing Macedonian and Math lessons for children from underprivileged families, providing school supplies.',
          quote: 'Teaching the Vulnerable',
        ),
        Sip(
          title: 'The Light of Live',
          description:
              'High school students teach younger students basic IT skills for writing CVs and motivational letters. They also offer free art classes for talented children in grades 1–4.',
          quote: 'Peers for Peers',
        ),
        Sip(
          title: 'Habitat for Humanity Macedonia',
          description:
              'Establishment of school eco club in Shaip Jusuf high school, purchase of equipment and plants, and working on upgrading vocational skills for construction technicians.',
          quote: 'School Eco Club',
        ),
        Sip(
          title: 'REDI',
          description:
              'The volunteers were trained in previously created program for Young Roma Entrepreneurs, and held two trainings for Roma youth age 18-25 teaching them the basic skills of entrepreneurship.',
          quote: 'Young Roma Entrepreneurs Training for Skills development',
        ),
        Sip(
          title: 'GO GREEN',
          description:
              'Advocacy, campaign in the schools and final event where young rock bands were invited to perform in order to be promoted. The final event included family day with games, competitions in environmental games and promotion of the initiative.',
          quote: 'Fairer Action for Climate Change',
        ),
        Sip(
          title: 'SOS Children Village',
          description:
              '5-day educational event, where people from disadvantage families were educated on how to save money and how to spend smart.',
          quote:
              'Financial education for the families in social risk and disadvantage families from the informal settlements',
        ),
        Sip(
          title: 'GO GREEN',
          description:
              'This initiative aimed gathering in one place youth from different cultures. Three bands were invited to play music from their culture, and art corner was placed so the youth can express their cultural diversity.',
          quote: 'The Sounds of the Cultures',
        ),
        Sip(
          title: 'Stella Network',
          description:
              'Volunteers joined the “Share Your Miracle” movement, where women and girls shared achievements and learned from mentors. They later organized panel discussions in schools and cafés to inspire others. School clubs were formed, and peer-to-peer mentoring sessions now take place.',
          quote: 'Share Your Miracle',
        ),
        Sip(
          title: 'GO GREEN',
          description:
              'Volunteers mediated partnership between GG, REDI, and their high school to open a recycling center that serves students, teachers, and nearby residents. Funds from recycled materials will support school renovations.',
          quote: 'Recycling Center Partnership',
        ),
        Sip(
          title: 'KRIK',
          description:
              'Their artwork is sold to help maintain the center, which is in poor condition. Volunteers and beneficiaries started processing the recycled plastic and paper to create decorative art, using a machine to process materials for sale.',
          quote: 'Art and music therapy for people with disabilities',
        ),
        Sip(
          title: 'SOS Children Village Skopje',
          description:
              'Volunteers organized a 5-day event for underprivileged Roma families from informal settlements. They taught basic hygiene practices, considering the frequent lack of water and electricity.',
          quote: 'Hygiene? - Yes, please!',
        ),
      ],
      country: 'North Macedonia',
      startDate: DateTime(2023, 11, 1),
      endDate: DateTime(2024, 11, 1),
    ),
    SipDetail(
      imageUrl: 'assets/events/sip_image.png',
      keyTakeAways: [
        KeyTakeAways(
          icon: 'assets/home/Alert.svg',
          amount: 7000,
          description: 'Steady returns over 10 years',
        ),
        KeyTakeAways(
          icon: 'assets/home/family.svg',
          amount: 15000,
          description: 'High-yield investment plan',
        ),
        KeyTakeAways(
          amount: 15000,
          description: 'High-yield investment plan',
        ),
      ],
      sips: [
        Sip(
          title: 'Growth Strategy',
          description: 'Maximizing returns with balanced risk.',
          quote: 'The earlier you invest, the better the rewards.',
        ),
        Sip(
          title: 'Dividend Investing',
          description: 'Generating passive income through dividends.',
          quote: 'Consistent earnings lead to financial freedom.',
        ),
      ],
      country: 'Sri Lanka',
      numberOfPeopleImpacted: 5000,
      numberOfSips: 15,
      startDate: DateTime(2015, 1, 1),
      endDate: DateTime(2025, 1, 1),
    ),
  ];
});

// Provider to get a specific SipDetail by country
final sipDetailByCountryProvider =
    Provider.family<SipDetail?, String>((ref, country) {
  final sipDetails = ref.watch(sipDetailsProvider);
  return sipDetails.firstWhere(
    (sipDetail) => sipDetail.country.toLowerCase() == country.toLowerCase(),
    orElse: () => throw Exception('No SIP found for this country'),
  );
});
