import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../Models/ProjectModels.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Proje Detayı',
          style: GoogleFonts.poppins(
            fontSize: kIsWeb ? 24 : 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(kIsWeb ? 40 : 20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 800,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project Header
                AnimationConfiguration.staggeredList(
                  position: 0,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Container(
                        padding: EdgeInsets.all(
                          kIsWeb ? 40 : 25,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: project.gradientColors,
                          ),
                          borderRadius:
                              BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              project.icon,
                              size: kIsWeb ? 80 : 60,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Text(
                                    project.name,
                                    style:
                                        GoogleFonts.poppins(
                                          fontSize:
                                              kIsWeb
                                                  ? 32
                                                  : 28,
                                          fontWeight:
                                              FontWeight
                                                  .w800,
                                          color:
                                              Colors.white,
                                        ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    project.description,
                                    style:
                                        GoogleFonts.poppins(
                                          fontSize:
                                              kIsWeb
                                                  ? 18
                                                  : 16,
                                          color: Colors
                                              .white
                                              .withOpacity(
                                                0.9,
                                              ),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Technologies Section
                AnimationConfiguration.staggeredList(
                  position: 1,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kullanılan Teknolojiler',
                            style: GoogleFonts.poppins(
                              fontSize: kIsWeb ? 24 : 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children:
                                project.technologies
                                    .map(
                                      (tech) => Container(
                                        padding:
                                            EdgeInsets.symmetric(
                                              horizontal:
                                                  kIsWeb
                                                      ? 20
                                                      : 16,
                                              vertical:
                                                  kIsWeb
                                                      ? 12
                                                      : 10,
                                            ),
                                        decoration: BoxDecoration(
                                          color:
                                              Colors
                                                  .blue[100],
                                          borderRadius:
                                              BorderRadius.circular(
                                                25,
                                              ),
                                          border: Border.all(
                                            color:
                                                Colors
                                                    .blue[300]!,
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          tech,
                                          style: GoogleFonts.poppins(
                                            fontSize:
                                                kIsWeb
                                                    ? 16
                                                    : 14,
                                            fontWeight:
                                                FontWeight
                                                    .w600,
                                            color:
                                                Colors
                                                    .blue[700],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Project Details
                AnimationConfiguration.staggeredList(
                  position: 2,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Proje Detayları',
                            style: GoogleFonts.poppins(
                              fontSize: kIsWeb ? 24 : 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(
                              kIsWeb ? 30 : 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: const Offset(
                                    0,
                                    8,
                                  ),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                _buildDetailItem(
                                  Icons.description,
                                  'Açıklama',
                                  'Bu proje, modern teknolojiler kullanılarak geliştirilmiş bir uygulamadır. Kullanıcı deneyimini ön planda tutarak, performanslı ve kullanıcı dostu bir arayüz sunmaktadır.',
                                ),
                                const SizedBox(height: 20),
                                _buildDetailItem(
                                  Icons.code,
                                  'Geliştirme Süreci',
                                  'Proje, Flutter framework\'ü kullanılarak geliştirilmiştir. Responsive tasarım prensipleri gözetilerek hem mobil hem de web platformları için optimize edilmiştir.',
                                ),
                                const SizedBox(height: 20),
                                _buildDetailItem(
                                  Icons.architecture,
                                  'Mimari',
                                  'Clean Architecture prensipleri kullanılarak geliştirilmiştir. Kod organizasyonu ve maintainability ön planda tutulmuştur.',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Links Section
                AnimationConfiguration.staggeredList(
                  position: 3,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bağlantılar',
                            style: GoogleFonts.poppins(
                              fontSize: kIsWeb ? 24 : 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              if (project.githubUrl != null)
                                Expanded(
                                  child: _buildLinkButton(
                                    'GitHub',
                                    FontAwesomeIcons.github,
                                    Colors.black,
                                    project.githubUrl!,
                                  ),
                                ),
                              if (project.githubUrl !=
                                      null &&
                                  project.liveUrl != null)
                                const SizedBox(width: 15),
                              if (project.liveUrl != null)
                                Expanded(
                                  child: _buildLinkButton(
                                    'Canlı Demo',
                                    FontAwesomeIcons
                                        .externalLinkAlt,
                                    Colors.green,
                                    project.liveUrl!,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(
    IconData icon,
    String title,
    String description,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.blue[700],
            size: kIsWeb ? 24 : 20,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: kIsWeb ? 18 : 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: kIsWeb ? 16 : 14,
                  color: Colors.grey[600],
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLinkButton(
    String text,
    IconData icon,
    Color color,
    String url,
  ) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Container(
        padding: EdgeInsets.all(kIsWeb ? 20 : 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: kIsWeb ? 20 : 18,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: kIsWeb ? 16 : 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        // Fallback: Try to launch with system default
        await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
        );
      }
    } catch (e) {
      print('Error launching URL: $e');
      // Simple error handling without ScaffoldMessenger
    }
  }
}
