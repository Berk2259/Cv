import 'package:flutter/material.dart';
import 'package:portfolyo/Screen/HakkimdaScreen.dart';
import 'package:portfolyo/Screen/ProjectScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb; //platformun web olup olmadığını kontrol etmek için

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<Navigation> {
  int _page = 1; //başlangıçta aktif sayfa 1, yani index1

  final List<Widget> _pages = [
    //geçiş yapılacak sayfaların listesi
    ProjectScreen(),
    HakkimdaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = [
      //mobil için curved navigation bar üzerindeki ikonlar
      Icon(FontAwesomeIcons.code, color: Colors.white),
      Icon(FontAwesomeIcons.user, color: Colors.white),
    ];

    // Web için farklı tasarım
    if (kIsWeb) {
      return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          centerTitle: true, //başlık ortalanır
          backgroundColor: Colors.blue,
          elevation: 0, //gölge yok
          title: Text(
            'Portfolyo',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.grey[800],
            ),
          ),
          actions: [
            // Web için navigation butonları app barda
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _buildWebNavButton(
                    0, //index değeri
                    'Projeler',
                    FontAwesomeIcons.code,
                  ),
                  const SizedBox(width: 20),
                  _buildWebNavButton(
                    1, //index değeri
                    'Hakkımda',
                    FontAwesomeIcons.user,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: _pages[_page], //seçili sayfa gösterilir.
      );
    }

    // Mobil için curved navigation
    return Scaffold(
      extendBody: false,
      body: _pages[_page], //seçili sayfa gösterilir.
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text(
          'Portfolyo',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.grey[800],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items, //ikonlar
        index: _page, //başlangıçta seçili sayfa
        height: 65.0, //navigation bar yüksekliği 75 e eşit veya küçük olmalı
        color: Colors.blue[600]!, //arka plan rengi
        backgroundColor: Colors.grey[100]!, //scaffold arka plan rengi ile uyumlu
        buttonBackgroundColor: Colors.blue[700]!, //seçili buton rengi
        animationDuration: Duration(milliseconds: 400), //geçiş animasyonu süresi
        onTap: (index) {
          setState(() {
            _page = index; //seçili sayfa indexini günceller.
          });
        },
      ),
    );
  }

  //web için özel Navigation Butonları oluşturuyoruz
  Widget _buildWebNavButton(
    int index, //Hangi sayfa
    String title, //buton yazısı
    IconData icon, //buton ikonu
  ) {
    final isSelected = _page == index; //şu anki seçili sayfa mı kontrolü
    return GestureDetector(
      onTap: () {
        setState(() {
          _page = index; //butona tıklayınca sayfa değişir
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color:
              isSelected //seçili ise mavi sınır, değilse şeffaf
                  ? Colors.blue[600]
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(25), //yuvarlar köşeler
          border: Border.all(
            color:
                isSelected //seçili ise mavi sınır,değilse gri sınır
                    ? Colors.blue[600]!
                    : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, //Row sadece içeriği kadar geniş
          children: [
            Icon(
              icon,
              size: 16,
              color:
                  isSelected //seçili ise beyaz ikon, değilse gri ikon
                      ? Colors.white
                      : Colors.grey[600],
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color:
                    isSelected //seçili ise beyaz yazı,değilse gri yazı
                        ? Colors.white
                        : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
