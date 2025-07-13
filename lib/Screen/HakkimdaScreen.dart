import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:portfolyo/Models/SkillModels.dart';
import 'package:portfolyo/Models/ExperienceModels.dart';
import 'package:portfolyo/Models/ContactInfo.dart';
import 'package:portfolyo/Contents/SkillContets.dart';
import 'package:portfolyo/Contents/ExperienceContents.dart';
import 'package:portfolyo/Contents/ContactInfoContents.dart';

class HakkimdaScreen extends StatelessWidget {
  const HakkimdaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        //Tüm içerikler kaydırılabilir olsun diye
        padding: EdgeInsets.all(
          kIsWeb ? 40.0 : 20.0,
        ), //Web için 40,mobil için 20 padding verildi.
        child: Center(
          //Sayfanın ortalanması için
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth:
                  1200, //Maximum genişlik sınırı 1200 px, büyük ekranlarda içeriğin fazla genişlemesini engeller.
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start, //sola hizalanır.
              children: [
                AnimationConfiguration.staggeredList(
                  //Her bölüm staggered animasyonuyla sırayla gelmesi için animasyon konfigürasyonuna alınıyor.
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
                            //isim yazısı daktilo efekti ile geliyor.
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
                        // Beyaz zeminli kart görünümünde profil bölümü.
                        padding: EdgeInsets.all(
                          //Web için daha geniş padding
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
                            // Profile Resmi
                            Container(
                              //Daire şeklinde arka planlı kullanıcı simgesi(ikon olarak)
                              width: kIsWeb ? 150 : 120,
                              height: kIsWeb ? 150 : 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  //Gradient renkli daire içinde kullanıcı ikonu
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
                                //Kullanıcı ikonu
                                FontAwesomeIcons.user,
                                size: kIsWeb ? 70 : 50,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // İsim
                            Text(
                              'Berk Altay',
                              style: GoogleFonts.poppins(
                                fontSize: kIsWeb ? 28 : 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Başlık
                            Text(
                              'Flutter Geliştirici',
                              style: GoogleFonts.poppins(
                                fontSize: kIsWeb ? 18 : 16,
                                color: Colors.blue[600],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 15),

                            // Açıklama
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
                            //Çok satıra yayılabilen,kenar boşluklu kapsayıcı
                            spacing: 12,
                            runSpacing: 12,
                            children:
                                skills
                                    .map(
                                      (skill) => Container(
                                        //SkillContents.dart dosyasından gelen liste
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
                                  //Experience listesi üzerinden kartlar oluşturuluyor.
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
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        // Fallback: Try to launch with system default
        await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
        );
      }
    } catch (e) {
      print('Error launching URL: $e');
      // Simple error handling without ScaffoldMessenger
    }
  }
}
