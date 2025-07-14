import 'package:flutter/material.dart';

class ContactInfo {
  //iletişim sınıfı özellikleri
  final String text;
  final IconData icon;
  final Color color;
  final String url;

  ContactInfo({
    //Constructor
    required this.text,
    required this.icon,
    required this.color,
    required this.url,
  });
}
