import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_portfolio/models/project_model_data.dart';
import 'package:personal_portfolio/utils/hover_effect.dart';
import 'package:personal_portfolio/utils/my_txt.dart';
import 'package:personal_portfolio/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 700;
          bool isTablet =
              constraints.maxWidth < 1000 && constraints.maxWidth >= 700;

          double horizontalPadding = isMobile
              ? 20
              : isTablet
              ? 60
              : 120;

          return FadeInUp(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 60,
              ),
              child: Column(
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    itemCount: projects.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.surface.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: isMobile
                                ? CrossAxisAlignment.center
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                project.title,
                                style: AppTextStyles.heading1.copyWith(
                                  color: AppColors.amber,
                                  fontSize: isMobile ? 18 : 20,
                                ),
                                textAlign: isMobile
                                    ? TextAlign.center
                                    : TextAlign.start,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                project.description,
                                style: AppTextStyles.body.copyWith(
                                  fontSize: isMobile ? 16 : 18,
                                  color: AppColors.textSecondary,
                                  height: 1.5,
                                ),
                                textAlign: isMobile
                                    ? TextAlign.center
                                    : TextAlign.start,
                              ),
                              const SizedBox(height: 25),

                              // 📱 Images
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  spacing: 25,
                                  mainAxisAlignment: isMobile
                                      ? MainAxisAlignment.center
                                      : MainAxisAlignment.start,
                                  children: project.imagePaths
                                      .map((img) => projectImgBox(img))
                                      .toList(),
                                ),
                              ),
                              const SizedBox(height: 25),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Wrap(
                                      alignment: isMobile
                                          ? WrapAlignment.center
                                          : WrapAlignment.start,
                                      spacing: 12,
                                      runSpacing: 10,
                                      children: project.techStack
                                          .map((stack) => skillStackbox(stack))
                                          .toList(),
                                    ),
                                  ),
                                  if (!isMobile) const Spacer(),
                                  borderedbox(
                                    "GitHub",
                                    FontAwesomeIcons.github,
                                    () {
                                      launchUrl(Uri.parse(project.githubUrl));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget projectImgBox(String imgPath) {
  return Container(
    // width: 250,
    height: 460,
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    clipBehavior: Clip.antiAlias,
    child: Image.asset(imgPath, fit: BoxFit.fill),
  );
}

Widget skillStackbox(String txt) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      txt,
      style: AppTextStyles.body.copyWith(
        fontSize: 15,
        color: AppColors.textPrimary,
      ),
    ),
  );
}

Widget borderedbox(String name, IconData icon, VoidCallback ontap) {
  return HoverScaleWidget(
    child: InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.lightBlue,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.textPrimary, size: 20),
            const SizedBox(width: 10),
            Text(
              name,
              style: AppTextStyles.accent.copyWith(
                color: AppColors.textPrimary,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
