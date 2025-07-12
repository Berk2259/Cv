import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HakkimdaScreen extends StatelessWidget {
  const HakkimdaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(kIsWeb ? 40.0 : 20.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with animated text
                AnimationConfiguration.staggeredList(
                  position: 0,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Merhaba, ben',
                            style: GoogleFonts.poppins(
                              fontSize: kIsWeb ? 28 : 24,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Berk Altay',
                                textStyle:
                                    GoogleFonts.poppins(
                                      fontSize:
                                          kIsWeb ? 40 : 32,
                                      fontWeight:
                                          FontWeight.w800,
                                      color:
                                          Colors.blue[700],
                                    ),
                                speed: const Duration(
                                  milliseconds: 100,
                                ),
                              ),
                            ],
                            totalRepeatCount: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Profile Card
                AnimationConfiguration.staggeredList(
                  position: 1,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Container(
                        padding: EdgeInsets.all(
                          kIsWeb ? 40 : 25,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Profile Image
                            Container(
                              width: kIsWeb ? 150 : 120,
                              height: kIsWeb ? 150 : 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end:
                                      Alignment.bottomRight,
                                  colors: [
                                    Colors.blue[400]!,
                                    Colors.purple[400]!,
                                  ],
                                ),
                              ),
                              child: Icon(
                                FontAwesomeIcons.user,
                                size: kIsWeb ? 70 : 50,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Name
                            Text(
                              'Berk Altay',
                              style: GoogleFonts.poppins(
                                fontSize: kIsWeb ? 28 : 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Title
                            Text(
                              'Flutter Geliştirici',
                              style: GoogleFonts.poppins(
                                fontSize: kIsWeb ? 18 : 16,
                                color: Colors.blue[600],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 15),

                            // Description
                            Text(
                              'Yaratıcı ve yenilikçi mobil uygulama geliştiricisiyim. Kullanıcı deneyimini ön planda tutarak modern ve etkileyici uygulamalar geliştiriyorum.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: kIsWeb ? 16 : 14,
                                color: Colors.grey[600],
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Skills Section
                AnimationConfiguration.staggeredList(
                  position: 2,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yeteneklerim',
                            style: GoogleFonts.poppins(
                              fontSize: kIsWeb ? 26 : 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children:
                                skills
                                    .map(
                                      (skill) => Container(
                                        padding:
                                            EdgeInsets.symmetric(
                                              horizontal:
                                                  kIsWeb
                                                      ? 20
                                                      : 16,
                                              vertical:
                                                  kIsWeb
                                                      ? 12
                                                      : 10,
                                            ),
                                        decoration: BoxDecoration(
                                          color: skill.color
                                              .withOpacity(
                                                0.1,
                                              ),
                                          borderRadius:
                                              BorderRadius.circular(
                                                25,
                                              ),
                                          border: Border.all(
                                            color: skill
                                                .color
                                                .withOpacity(
                                                  0.3,
                                                ),
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize:
                                              MainAxisSize
                                                  .min,
                                          children: [
                                            Icon(
                                              skill.icon,
                                              size:
                                                  kIsWeb
                                                      ? 18
                                                      : 16,
                                              color:
                                                  skill
                                                      .color,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              skill.name,
                                              style: GoogleFonts.poppins(
                                                fontSize:
                                                    kIsWeb
                                                        ? 16
                                                        : 14,
                                                fontWeight:
                                                    FontWeight
                                                        .w600,
                                                color:
                                                    skill
                                                        .color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Experience Section
                AnimationConfiguration.staggeredList(
                  position: 3,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deneyim',
                            style: GoogleFonts.poppins(
                              fontSize: kIsWeb ? 26 : 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 20),
                          ...experiences
                              .map(
                                (exp) => Container(
                                  margin:
                                      const EdgeInsets.only(
                                        bottom: 15,
                                      ),
                                  padding: EdgeInsets.all(
                                    kIsWeb ? 25 : 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(
                                          15,
                                        ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(
                                              0.05,
                                            ),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset:
                                            const Offset(
                                              0,
                                              3,
                                            ),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width:
                                            kIsWeb
                                                ? 60
                                                : 50,
                                        height:
                                            kIsWeb
                                                ? 60
                                                : 50,
                                        decoration: BoxDecoration(
                                          color: exp.color
                                              .withOpacity(
                                                0.1,
                                              ),
                                          borderRadius:
                                              BorderRadius.circular(
                                                12,
                                              ),
                                        ),
                                        child: Icon(
                                          exp.icon,
                                          color: exp.color,
                                          size:
                                              kIsWeb
                                                  ? 28
                                                  : 24,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                          children: [
                                            Text(
                                              exp.title,
                                              style: GoogleFonts.poppins(
                                                fontSize:
                                                    kIsWeb
                                                        ? 18
                                                        : 16,
                                                fontWeight:
                                                    FontWeight
                                                        .w700,
                                                color:
                                                    Colors
                                                        .grey[800],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              exp.company,
                                              style: GoogleFonts.poppins(
                                                fontSize:
                                                    kIsWeb
                                                        ? 16
                                                        : 14,
                                                color:
                                                    Colors
                                                        .grey[600],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              exp.period,
                                              style: GoogleFonts.poppins(
                                                fontSize:
                                                    kIsWeb
                                                        ? 14
                                                        : 12,
                                                color:
                                                    Colors
                                                        .grey[500],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Contact Section
                AnimationConfiguration.staggeredList(
                  position: 4,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'İletişim',
                            style: GoogleFonts.poppins(
                              fontSize: kIsWeb ? 26 : 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 20),
                          ...contactInfo
                              .map(
                                (
                                  contact,
                                ) => GestureDetector(
                                  onTap:
                                      () => _launchUrl(
                                        contact.url,
                                      ),
                                  child: Container(
                                    margin:
                                        const EdgeInsets.only(
                                          bottom: 12,
                                        ),
                                    padding: EdgeInsets.all(
                                      kIsWeb ? 20 : 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(
                                            12,
                                          ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey
                                              .withOpacity(
                                                0.05,
                                              ),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset:
                                              const Offset(
                                                0,
                                                2,
                                              ),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          contact.icon,
                                          color:
                                              contact.color,
                                          size:
                                              kIsWeb
                                                  ? 24
                                                  : 20,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: Text(
                                            contact.text,
                                            style: GoogleFonts.poppins(
                                              fontSize:
                                                  kIsWeb
                                                      ? 16
                                                      : 14,
                                              color:
                                                  Colors
                                                      .grey[700],
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons
                                              .arrow_forward_ios,
                                          size:
                                              kIsWeb
                                                  ? 18
                                                  : 16,
                                          color:
                                              Colors
                                                  .grey[400],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kIsWeb ? 50 : 100,
                ), // Extra bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}

class Skill {
  final String name;
  final IconData icon;
  final Color color;

  Skill({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class Experience {
  final String title;
  final String company;
  final String period;
  final IconData icon;
  final Color color;

  Experience({
    required this.title,
    required this.company,
    required this.period,
    required this.icon,
    required this.color,
  });
}

class ContactInfo {
  final String text;
  final IconData icon;
  final Color color;
  final String url;

  ContactInfo({
    required this.text,
    required this.icon,
    required this.color,
    required this.url,
  });
}

final List<Skill> skills = [
  Skill(
    name: 'Flutter',
    icon: FontAwesomeIcons.mobile,
    color: Colors.blue,
  ),
  Skill(
    name: 'Dart',
    icon: FontAwesomeIcons.code,
    color: Colors.cyan,
  ),
  Skill(
    name: 'Firebase',
    icon: FontAwesomeIcons.fire,
    color: Colors.orange,
  ),
  Skill(
    name: 'Git',
    icon: FontAwesomeIcons.github,
    color: Colors.black,
  ),
  Skill(
    name: 'UI/UX',
    icon: FontAwesomeIcons.palette,
    color: Colors.purple,
  ),
  Skill(
    name: 'API',
    icon: FontAwesomeIcons.server,
    color: Colors.green,
  ),
];

final List<Experience> experiences = [
  Experience(
    title: 'Flutter Geliştirici',
    company: 'Tech Company',
    period: '2023 - Günümüz',
    icon: FontAwesomeIcons.mobile,
    color: Colors.blue,
  ),
  Experience(
    title: 'Mobil Uygulama Geliştirici',
    company: 'Startup',
    period: '2022 - 2023',
    icon: FontAwesomeIcons.code,
    color: Colors.green,
  ),
];

final List<ContactInfo> contactInfo = [
  ContactInfo(
    text: 'github.com/username',
    icon: FontAwesomeIcons.github,
    color: Colors.black,
    url: 'https://github.com/username',
  ),
  ContactInfo(
    text: 'linkedin.com/in/username',
    icon: FontAwesomeIcons.linkedin,
    color: Colors.blue,
    url: 'https://linkedin.com/in/username',
  ),
  ContactInfo(
    text: 'email@example.com',
    icon: FontAwesomeIcons.envelope,
    color: Colors.red,
    url: 'mailto:email@example.com',
  ),
];
