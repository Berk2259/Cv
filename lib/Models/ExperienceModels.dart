import 'package:flutter/material.dart';

class Experience {
  //deneyim sınıfı özellikleri
  final String title;
  final String company;
  final String period;
  final IconData icon;
  final Color color;

  Experience({
    //Constructor
    required this.title,
    required this.company,
    required this.period,
    required this.icon,
    required this.color,
  });
}
