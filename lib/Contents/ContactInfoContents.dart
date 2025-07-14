import 'package:flutter/material.dart';
import 'package:portfolyo/Models/ContactInfo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Contact section
final List<ContactInfo> contactInfo = [
  //Bu liste ContactInfo adlı model sınıfından 3 tane iletişim bilgisi nesnesi içeriyor.
  ContactInfo(
    text: 'github',
    icon: FontAwesomeIcons.github,
    color: Colors.black,
    url: 'https://github.com/Berk2259',
  ),
  ContactInfo(
    text: 'linkedin',
    icon: FontAwesomeIcons.linkedin,
    color: Colors.blue,
    url: 'https://www.linkedin.com/in/berk-altay-46052a374/',
  ),
  ContactInfo(
    text: 'Mail',
    icon: FontAwesomeIcons.envelope,
    color: Colors.red,
    url: 'mailto:berkaltay3435@gmail.com',
  ),
];
