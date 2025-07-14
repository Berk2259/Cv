import 'package:flutter/material.dart';
import 'package:portfolyo/Screen/ProjectDetailScreen.dart';
import 'package:portfolyo/Models/ProjectModels.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ProjectCardScreen extends StatelessWidget {
  final Project project; //Gösterilecek proje verisi

  const ProjectCardScreen({super.key, required this.project}); //Constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Karta tıklanınca detay ekranına yönlendirir.
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProjectDetailScreen(project: project)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, //kartın arka plan rengi beyaz
          borderRadius: BorderRadius.circular(20), //Köşeleri yuvarlarak 20 px
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1), //Hafif gri gölge,oopaklık %10
              spreadRadius: 1, //Gölgenin yayılışı
              blurRadius: 10, //Gölgenin yumuşaklığı
              offset: const Offset(0, 5), //Gölgenin konumu
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            20,
          ), //İçeriğin de kart köşelerine uyucak şekilde kırpılması
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, //sütundaki elemanlar sola hizalanır
            children: [
              // Kartın üst kısmı renkli gradient ve ikon
              Expanded(
                flex: 4, // Bu alan, alt bilgi alanında daha büyük yer kaplar
                child: Container(
                  width: double.infinity, //genişlik mümkün olduğunda geniş
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft, //üst soldna başlayarak
                      end: Alignment.bottomRight, //alt sağa doğru
                      colors: project.gradientColors, //projeye alt renk geçişleri
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(project.icon, size: 40, color: Colors.white),
                      ), //ortalanmış, beyaz renkte ve büyük ikon
                      // Hover effect for web
                      if (kIsWeb)
                        Positioned(
                          top: 10, // Üstten 10 px boşluk
                          right: 10, //sağdan 10 px boşluk
                          child: Container(
                            padding: const EdgeInsets.all(8), //iç boşluk
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                0.2,
                              ), //yarı saydam beyaz arka plan
                              borderRadius: BorderRadius.circular(20), // yuvarlak köşeler
                            ),
                            child: Icon(
                              Icons.arrow_forward, //ileri ok ikonu
                              color: Colors.white, //beyaz renk
                              size: 16, //küçük boyut
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // Kartın alt kısmı: proje adı, açıklaması ve teknolojiler
              Expanded(
                flex: 3, // bilgi alanı biraz daha küçük
                child: Padding(
                  padding: const EdgeInsets.all(15.0), //çevresinde 15 px boşluk
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, //sola hizalama
                    children: [
                      Text(
                        project.name, //proje adı
                        style: GoogleFonts.poppins(
                          fontSize: 16, //yazı büyüklüğü
                          fontWeight: FontWeight.w700, //kalın yazı
                          color: Colors.grey[800], //koyu gri renk
                        ),
                        maxLines: 1, //en fazla 1 satır göster,
                        overflow: TextOverflow.ellipsis, //taşarsa ... koy
                      ),
                      const SizedBox(
                        height: 4,
                      ), // başlık ile açıklama arasına 4 px boşluk

                      Text(
                        project.description, //proje açıklaması
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ), //küçük ve gri yazı
                        maxLines: 2, //en fazla 2 satır göster
                        overflow: TextOverflow.ellipsis, //taşarsa ... koy
                      ),
                      const Spacer(), // kalan boşluğu kapla, alt elemanları alta iter
                      Row(
                        children: [
                          ...project
                              .technologies //Projenin teknolojilerinden ilk 2 sini göster
                              .take(2)
                              .map(
                                (tech) => Container(
                                  margin: const EdgeInsets.only(
                                    right: 6,
                                  ), //sağa 6 px boşluk
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ), // yatay ve dikey iç boşluk
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100], // açık mavi arka plan
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ), // yuvarlak köşeler
                                  ),
                                  child: Text(
                                    tech, //teknoloji ismi
                                    style: GoogleFonts.poppins(
                                      fontSize: 10, // çok küçük yazı
                                      fontWeight: FontWeight.w600, //orta kalınlıkta
                                      color: Colors.blue[700], // koyu mavi yazı
                                    ),
                                  ),
                                ),
                              ),
                          if (project.technologies.length >
                              2) // eğer teknolojiler 2 den fazla ise, kalan sayıyı +x şeklinde göster
                            Text(
                              '+${project.technologies.length - 2}', //örneğin +3
                              style: GoogleFonts.poppins(
                                fontSize: 10, // küçük yazı
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[500], //orta gri renk
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
