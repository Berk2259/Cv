import 'package:flutter/material.dart';
import 'package:portfolyo/Screen/HakkimdaScreen.dart';
import 'package:portfolyo/Screen/ProjectScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<Navigation> {
  int _page = 1;

  final List<Widget> _pages = [
    ProjectScreen(),
    HakkimdaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(FontAwesomeIcons.code, color: Colors.white),
      Icon(FontAwesomeIcons.user, color: Colors.white),
    ];

    // Web için farklı tasarım
    if (kIsWeb) {
      return Scaffold(
        backgroundColor: Colors.grey[50],
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
          actions: [
            // Web için navigation butonları
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  _buildWebNavButton(
                    0,
                    'Projeler',
                    FontAwesomeIcons.code,
                  ),
                  const SizedBox(width: 20),
                  _buildWebNavButton(
                    1,
                    'Hakkımda',
                    FontAwesomeIcons.user,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: _pages[_page],
      );
    }

    // Mobil için curved navigation
    return Scaffold(
      extendBody: false,
      body: _pages[_page],
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
        items: items,
        index: _page,
        height: 65.0,
        color: Colors.blue[600]!,
        backgroundColor: Colors.grey[100]!,
        buttonBackgroundColor: Colors.blue[700]!,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }

  Widget _buildWebNavButton(
    int index,
    String title,
    IconData icon,
  ) {
    final isSelected = _page == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _page = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Colors.blue[600]
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color:
                isSelected
                    ? Colors.blue[600]!
                    : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color:
                  isSelected
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
                    isSelected
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
