import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../Models/ProjectModels.dart';
import '../Contents/ProjectContents.dart';
import 'ProjectDetailScreen.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 600),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Text(
                    'Projelerim',
                    style: GoogleFonts.poppins(
                      fontSize: kIsWeb ? 40 : 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            AnimationConfiguration.staggeredList(
              position: 1,
              duration: const Duration(milliseconds: 600),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Text(
                    'Geliştirdiğim projeler ve teknolojiler',
                    style: GoogleFonts.poppins(
                      fontSize: kIsWeb ? 18 : 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Projects Grid
            Expanded(
              child: AnimationLimiter(
                child: GridView.builder(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _getCrossAxisCount(
                          context,
                        ),
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio:
                            kIsWeb ? 0.8 : 0.6,
                      ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(
                        milliseconds: 600,
                      ),
                      columnCount: _getCrossAxisCount(
                        context,
                      ),
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: ProjectCard(
                            project: projects[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    if (kIsWeb) {
      final width = MediaQuery.of(context).size.width;
      if (width > 1200) return 4;
      if (width > 800) return 3;
      if (width > 600) return 2;
      return 1;
    }
    return 2; // Mobil için sabit 2 sütun
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    ProjectDetailScreen(project: project),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Image
              Expanded(
                flex: 4, // Daha büyük gradient alanı
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: project.gradientColors,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(
                          project.icon,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      // Hover effect for web
                      if (kIsWeb)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white
                                  .withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // Project Info
              Expanded(
                flex: 3, // Daha büyük bilgi alanı
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.name,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[800],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        project.description,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          ...project.technologies
                              .take(2)
                              .map(
                                (tech) => Container(
                                  margin:
                                      const EdgeInsets.only(
                                        right: 6,
                                      ),
                                  padding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius:
                                        BorderRadius.circular(
                                          12,
                                        ),
                                  ),
                                  child: Text(
                                    tech,
                                    style:
                                        GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight:
                                              FontWeight
                                                  .w600,
                                          color:
                                              Colors
                                                  .blue[700],
                                        ),
                                  ),
                                ),
                              ),
                          if (project.technologies.length >
                              2)
                            Text(
                              '+${project.technologies.length - 2}',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[500],
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
