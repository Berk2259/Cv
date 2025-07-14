import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolyo/Models/ProjectModels.dart';

//Project Section
final List<Project> projects = [
  //yapılan projeleri tutan bir liste
  Project(
    name: 'Todo List Uygulaması',
    description: 'Kişisel planlama',
    icon: FontAwesomeIcons.clipboardList,
    gradientColors: [Colors.purple, Colors.pink],
    technologies: ['Flutter', 'Dart'],
    githubUrl: 'https://github.com/Berk2259/Todo-List',
    liveUrl: 'https://flutter.dev',
  ),
  Project(
    name: 'Cv Uygulaması ve Sitesi',
    description: 'Kişisel Portfolyom',
    icon: FontAwesomeIcons.addressCard,
    gradientColors: [Colors.blue, Colors.cyan],
    technologies: ['Flutter', 'dart'],
    githubUrl: 'https://github.com/Berk2259/Cv',
    liveUrl: 'https://dart.dev',
  ),
  /*Project(
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
  */
];
