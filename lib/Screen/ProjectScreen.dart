import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../Models/ProjectModels.dart';
import '../Contents/ProjectContents.dart';
import 'ProjectDetailScreen.dart';
import 'package:portfolyo/Screen/ProjectCardScreen.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], //açık gri arka plan
      body: Padding(
        padding: const EdgeInsets.all(20.0), //rüm kenarlarda 20 px boşluk
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //sola hizalar
          children: [
            // Başlık
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 600),
              child: SlideAnimation(
                verticalOffset: 50.0, //Y ekseninde 50 px kayarak başlar
                child: FadeInAnimation(
                  child: Text(
                    'Projelerim', //Ana başlık
                    style: GoogleFonts.poppins(
                      fontSize: kIsWeb ? 40 : 32, //Web'de daha büyük
                      fontWeight: FontWeight.w800,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8), //Altta boşluk
            //Alt Başlık - Animasyonlu Metin
            AnimationConfiguration.staggeredList(
              position: 1,
              duration: const Duration(milliseconds: 600),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Text(
                    'Geliştirdiğim projeler ve teknolojiler', //Açıklayıcı alt başlık
                    style: GoogleFonts.poppins(
                      fontSize: kIsWeb ? 18 : 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30), //Altta boşluk
            // Projects Grid
            Expanded(
              child: AnimationLimiter(
                //İçindeki widgetları animasyonlarını ardışık tetikler(performans için)
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _getCrossAxisCount(
                      //sütun sayısı cihaz genişliğine göre
                      context,
                    ),
                    crossAxisSpacing: 15, //sütunlar arası yatay boşluk
                    mainAxisSpacing: 15, //sütunlar arası dikey boşluk
                    childAspectRatio:
                        kIsWeb ? 0.8 : 0.6, //Kartların en-boy oranı(webde daha uzun)
                  ),
                  itemCount: projects.length, //toplam proje sayısı
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index, //her kartın animasyon sırası
                      duration: const Duration(milliseconds: 600),
                      columnCount: _getCrossAxisCount(
                        //grid sütun sayısı
                        context,
                      ),
                      child: ScaleAnimation(
                        //Ölçek animasyonu(kart büyüme efekti)
                        child: FadeInAnimation(
                          //yumuşak görünme animasyonu
                          child: ProjectCardScreen(
                            project: projects[index], //ilgili projeyi gönderir
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    if (kIsWeb) {
      //eğer platform web ise
      final width = MediaQuery.of(context).size.width; //Ekran genişliğini al
      if (width > 1200) return 4; //Çok geniş ekranlarda 4 sütun
      if (width > 800) return 3; //orta genişikte 3 sütun
      if (width > 600) return 2; //küçük tablet vb. için 2 sütun
      return 1; //mobil gibi dar ekranlarda 1 sütun
    }
    return 2; // Mobil için sabit 2 sütun
  }
}
