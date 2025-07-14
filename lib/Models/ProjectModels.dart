import 'package:flutter/material.dart';

class Project {
  //projeler sınıfı özellikleri
  final String name;
  final String description;
  final IconData icon;
  final List<Color> gradientColors;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;

  Project({
    //Constructor
    required this.name,
    required this.description,
    required this.icon,
    required this.gradientColors,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
  });
}
