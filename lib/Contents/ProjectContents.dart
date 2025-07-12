import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolyo/Models/ProjectModels.dart';

final List<Project> projects = [
  Project(
    name: 'E-Ticaret Uygulaması',
    description: 'Modern e-ticaret platformu',
    icon: FontAwesomeIcons.shoppingCart,
    gradientColors: [Colors.purple, Colors.pink],
    technologies: ['Flutter', 'Firebase', 'Dart'],
    githubUrl: 'https://github.com',
    liveUrl: 'https://example.com',
  ),
  Project(
    name: 'Sosyal Medya App',
    description: 'Kullanıcı etkileşimli sosyal platform',
    icon: FontAwesomeIcons.users,
    gradientColors: [Colors.blue, Colors.cyan],
    technologies: ['Flutter', 'Node.js', 'MongoDB'],
    githubUrl: 'https://github.com',
  ),
  Project(
    name: 'Fitness Takip',
    description: 'Kişisel fitness takip uygulaması',
    icon: FontAwesomeIcons.dumbbell,
    gradientColors: [Colors.green, Colors.teal],
    technologies: ['Flutter', 'SQLite', 'Provider'],
    githubUrl: 'https://github.com',
  ),
  Project(
    name: 'Hava Durumu',
    description: 'Gerçek zamanlı hava durumu',
    icon: FontAwesomeIcons.cloudSun,
    gradientColors: [Colors.orange, Colors.yellow],
    technologies: ['Flutter', 'API', 'HTTP'],
    githubUrl: 'https://github.com',
  ),
  Project(
    name: 'Not Defteri',
    description: 'Kişisel not alma uygulaması',
    icon: FontAwesomeIcons.noteSticky,
    gradientColors: [Colors.indigo, Colors.purple],
    technologies: ['Flutter', 'Hive', 'Provider'],
    githubUrl: 'https://github.com',
  ),
  Project(
    name: 'Quiz Uygulaması',
    description: 'Eğitici quiz platformu',
    icon: FontAwesomeIcons.question,
    gradientColors: [Colors.red, Colors.orange],
    technologies: ['Flutter', 'Firebase', 'Bloc'],
    githubUrl: 'https://github.com',
  ),
];
