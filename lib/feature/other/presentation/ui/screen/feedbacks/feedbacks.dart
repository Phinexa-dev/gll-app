import 'dart:math';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gll/common/theme/colors.dart';
import 'package:gll/common/widget/custom_text_field.dart';
import 'package:gll/common/widget/start_button.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../common/theme/fonts.dart';
import '../../../../../system_feedback/model/feedback.dart';
import '../../../../../system_feedback/provider/feedback_provider.dart';

class Feedbacks extends ConsumerStatefulWidget {
  const Feedbacks({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedbacksState();
}

class _FeedbacksState extends ConsumerState<Feedbacks> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController yourLocation = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final _firstNameError = ValueNotifier<String?>(null);
  final _lastNameError = ValueNotifier<String?>(null);
  final _emailError = ValueNotifier<String?>(null);
  final _locationError = ValueNotifier<String?>(null);
  final _messageError = ValueNotifier<String?>(null);

  // Only used in _buildLocationSection
  final List<String> _locationBgSvgs = [
    'assets/more/camp_detail_bg_1.svg',
    'assets/more/camp_detail_bg_2.svg',
    'assets/more/camp_bg_4.svg',
  ];
  final Random _rand = Random();

  bool _sending = false;

  Future<void> _sendFeedback() async {
    bool isValid = true;
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

    if (firstNameController.text.isEmpty) {
      _firstNameError.value = 'Please enter your first name';
      isValid = false;
    } else {
      _firstNameError.value = null;
    }

    if (lastNameController.text.isEmpty) {
      _lastNameError.value = 'Please enter your last name';
      isValid = false;
    } else {
      _lastNameError.value = null;
    }

    if (emailController.text.isEmpty) {
      _emailError.value = 'Please enter your email address';
      isValid = false;
    } else if (!emailRegex.hasMatch(emailController.text)) {
      _emailError.value = 'Please enter a valid email address';
      isValid = false;
    } else {
      _emailError.value = null;
    }

    if (yourLocation.text.isEmpty) {
      _locationError.value = 'Please enter your location';
      isValid = false;
    } else {
      _locationError.value = null;
    }

    if (messageController.text.isEmpty) {
      _messageError.value = 'Please enter a message';
      isValid = false;
    } else {
      _messageError.value = null;
    }

    if (!isValid) {
      return;
    }

    setState(() => _sending = true);

    final templateParams = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'region': yourLocation.text,
      'message': messageController.text,
    };

    try {
      await emailjs.send(
        dotenv.env['SERVICE_KEY']!,
        dotenv.env['TEMPLATE_ID_FEEDBACK']!,
        templateParams,
        emailjs.Options(
          publicKey: dotenv.env['PUBLIC_KEY']!,
          privateKey: dotenv.env['PUBLIC_KEY']!,
        ),
      );
      _showCompletionDialog();
    } catch (error) {
      String msg = 'Send failed';
      if (error is emailjs.EmailJSResponseStatus) {
        msg = 'Error ${error.status}: ${error.text}';
      }
      ref
          .read(feedbackServiceProvider)
          .showToast(msg, type: FeedbackType.error);
    } finally {
      setState(() => _sending = false);
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Feedback Submitted"),
          content: Text(
            "Thank you for your feedback. We have received your submission and will take it into consideration.",
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    yourLocation.dispose();
    messageController.dispose();
    _firstNameError.dispose();
    _lastNameError.dispose();
    _emailError.dispose();
    _locationError.dispose();
    _messageError.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Feedbacks")],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            AbsorbPointer(
              absorbing: _sending,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SvgPicture.asset(
                      'assets/more/feedbacks_bg.svg',
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              'Do you have a suggestion for how to make GL2i even better?\n'
                              'Have you had a captivating experience during one of your GL2i activities and want to share it with us?\n\n'
                              'We are all ears! Every message is read and valued by us.\n'
                              'Thank you for helping us build the GL2i movement.',
                              style: PhinexaFont.labelRegular.copyWith(
                                fontSize: 13,
                                height: 1.5,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Your Feedback',
                              style: PhinexaFont.headingExLarge,
                            ),
                            const SizedBox(height: 20),
                            ValueListenableBuilder<String?>(
                              valueListenable: _firstNameError,
                              builder: (context, error, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextField(
                                      labelText: 'First Name*',
                                      controller: firstNameController,
                                    ),
                                    if (error != null)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 4,
                                          left: 8,
                                        ),
                                        child: Text(
                                          error,
                                          style: TextStyle(
                                            color: PhinexaColor.red,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            ValueListenableBuilder<String?>(
                              valueListenable: _lastNameError,
                              builder: (context, error, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextField(
                                      labelText: 'Last Name*',
                                      controller: lastNameController,
                                    ),
                                    if (error != null)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 4,
                                          left: 8,
                                        ),
                                        child: Text(
                                          error,
                                          style: TextStyle(
                                            color: PhinexaColor.red,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            ValueListenableBuilder<String?>(
                              valueListenable: _emailError,
                              builder: (context, error, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextField(
                                      labelText: 'Email*',
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    if (error != null)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 4,
                                          left: 8,
                                        ),
                                        child: Text(
                                          error,
                                          style: TextStyle(
                                            color: PhinexaColor.red,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            ValueListenableBuilder<String?>(
                              valueListenable: _locationError,
                              builder: (context, error, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextField(
                                      labelText: 'Your Location*',
                                      controller: yourLocation,
                                    ),
                                    if (error != null)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 4,
                                          left: 8,
                                        ),
                                        child: Text(
                                          error,
                                          style: TextStyle(
                                            color: PhinexaColor.red,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            ValueListenableBuilder<String?>(
                              valueListenable: _messageError,
                              builder: (context, error, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextField(
                                      labelText: 'Message*',
                                      controller: messageController,
                                      minLines: 4,
                                      maxLines: null,
                                      keyboardType: TextInputType.multiline,
                                    ),
                                    if (error != null)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 4,
                                          left: 8,
                                        ),
                                        child: Text(
                                          error,
                                          style: TextStyle(
                                            color: PhinexaColor.red,
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 24),
                            Container(
                              width: double.maxFinite,
                              child: StartButton(
                                label: _sending ? 'Sending…' : 'Submit',
                                isLoading: _sending,
                                onPressed: () {
                                  if (!_sending) {
                                    _sendFeedback();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Testimonials',
                          style: PhinexaFont.headingMedium,
                        ),
                      ),
                    ),
                    _buildLocationSection('Nepal', {
                      'Nepal participant': [
                        '"We thought it would be just another speech where we’d sit, listen, and yawn—but this training was nothing like that. It was eye-opening, life-changing, and genuinely fun."',
                        '"We’ve never experienced such engaging, experiential learning that empowered us to lead ourselves, uplift others, and drive positive change in our community."',
                      ],
                      'Mr. Mahendra Kumar Giri\nChief Executive of SAHARA Nepal': [
                        '"I’m glad we’ve launched this Leadership Academy at a time when youth brain drain is high, and many are facing challenges with addiction. When we empower young leaders from the ground up, we cultivate responsible citizens, entrepreneurs, and changemakers. Experiential learning gives them the tools to lead and contribute meaningfully to their communities and the nation."',
                      ],
                      'Prasun\nLeadership Academy trainer (Nepal)': [
                        '"The Leadership Academy has challenged the way I perceive leadership. Before I viewed leadership as one person guiding the team and having a task done. After the leadership training, I realised it is much more than completing a task, it is about having a common goal, building commitment and knowing how our skills and responsibility fit with one another."',
                        '"I have been consciously using communication skills, leadership skills (DAC) and growth mindset in my professional journey especially for upward management and also building a project team."',
                        '"What advice would you give to a future trainer? As a trainer it is important to have self awareness of one’s own value and belief. Most importantly it is essential to have a growth mindset and concentrate your effort to sharpen the skill. Have the courage to unlearn and learn."',
                        '"Leadership Academy is not only about learning about the skills, but also about looking inward into your own values and how they project into your actions. Leadership Academy enables you to lead yourself, lead with others and change the community together, bringing all the right skills and knowledge towards a common goal."',
                      ],
                      'Sarwagya\nFormer country trainer (Nepal)': [
                        '"My experience with Global Learning Lab was, in one simple word, transformational. I was fortunate enough to witness the change within me, alongside other individuals who participated in the training with me. The manuals and training schedule, and their regular reach-out throughout my tenure as a trainer helped me cultivate habits that instilled perseverance, compassion, and empathy, which I have since incorporated in my private and professional life."',
                      ],
                    }),
                    _buildLocationSection('Albania', {
                      'Anida\nLeadership Academy alumna (Albania)': [
                        '"The experience was transformative, helping me build confidence in my leadership abilities. I learned not just about my strengths but also about areas where I could grow. One key takeaway was understanding the importance of the process behind problem-solving, not just the end result. I had always approached problems with a solution-focused mindset, but I had never fully appreciated the journey that leads to that solution until now."',
                        '"The training also helped me recognize qualities within myself that I hadn’t realized were leadership strengths, or that I hadn’t known how to nurture before. It was like I had unlocked new facets of myself that I hadn’t fully understood or developed."',
                        '"Since completing the training, I’ve been able to apply key leadership concepts such as communication, decision-making, motivation, team building, and problem-solving in my work. These techniques have not only improved my professional performance but have also made a noticeable impact on my colleagues, leading to better teamwork and an appreciation for diverse perspectives."',
                      ],
                    }),
                    _buildLocationSection('Macedonia', {
                      'Aleksandar, 19 y.o.\nLeadership Academy alumni & facilitator (Macedonia)': [
                        '"I improved my social skills— I have more confidence to speak with people, my knowledge is better than in the past. This academy can make you find something new in yourself that you didn’t know you had before."',
                        '"In the past I saw leadership differently. I didn’t think of myself as a leader. Now I see everyone can be a leader— if you study, work hard, have something in your mind you want to achieve. If you want to do something, you can achieve it."',
                        '"Don’t be scared and do the Leadership Academy. It will change your life. You will have so many opportunities to work with what you learned every day. It can allow you to have a beautiful start of your career, you will improve yourself, know yourself better, be a great leader in your community, change yourself and your community."',
                      ],
                    }),
                    _buildLocationSection('Cambodia', {
                      'Sourn\nFormer country trainer (Cambodia)': [
                        '"One of the greatest skills that I gained as a trainer with Global Learning Lab is management experience. I learned to manage the Leadership Academies, I oversaw the sustainable community projects as well, engaged with the staff of the provincial department of education in order to mobilize young people in high schools, I informed the local authorities about the purpose of the training, connected with other NGOs…"',
                        '"Empowering young people to lead by themselves is the key to unlocking their potential and transforming communities. They learn to be leaders through changemaking."',
                        '"As a trainer in Cambodia, I had to work with very diverse groups of students and adapt to them. Some are college students, some are high schoolers, and some are dropouts from secondary or even primary school. We once worked in a vocational training school in one of the provinces. We had to adapt the questions we were asking to be understandable and balance the event to ensure that everyone has their own voice, that everyone can give feedback. Sometimes the students’ behavior was difficult, and for some people it would be challenging to manage the class. But as a trainer, you have to be ready to work with people from different backgrounds and overcome these challenges."',
                        '"The opportunities you can get as a result of the Leadership Academy are many. Two of our alumni got a scholarship thanks to participating in the Academy, and now they are both teachers."',
                      ],
                    }),
                  ],
                ),
              ),
            ),
            if (_sending)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationSection(
    String location,
    Map<String, List<String>> testimonialsByPerson,
  ) {
    // pick a random svg only for this section
    final bgAsset = _locationBgSvgs[_rand.nextInt(_locationBgSvgs.length)];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          Positioned.fill(child: SvgPicture.asset(bgAsset, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: PhinexaFont.headingSmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                for (var entry in testimonialsByPerson.entries) ...[
                  Text(
                    entry.key,
                    style: PhinexaFont.labelRegular.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  for (var quote in entry.value) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ', style: TextStyle(fontSize: 13)),
                        Expanded(
                          child: Text(
                            quote,
                            style: PhinexaFont.labelRegular.copyWith(
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                  const SizedBox(height: 16),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
