import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/models/experience_model_data.dart';
import 'package:personal_portfolio/utils/hover_effect.dart';
import 'package:personal_portfolio/utils/my_colors.dart';
import 'package:personal_portfolio/utils/my_txt.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
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
                  // List of experience cards
                  ListView.builder(
                    itemCount: workExperienceList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final work = workExperienceList[index];
                      return HoverScaleWidget2(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 25),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.surface,
                          ),
                          child: isMobile
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                        work.logoPath,
                                      ),
                                      radius: 40,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "${work.companyName} - ${work.role}",
                                      style: AppTextStyles.heading1.copyWith(
                                        color: AppColors.amber,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      work.description,
                                      style: AppTextStyles.body.copyWith(
                                        fontSize: 16,
                                        color: AppColors.textSecondary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      work.duration,
                                      style: AppTextStyles.body.copyWith(
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    borderButton("More Details", () {
                                      launchUrl(Uri.parse(work.link));
                                    }),
                                  ],
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${work.companyName} - ${work.role}",
                                            style: AppTextStyles.heading1
                                                .copyWith(
                                                  color: AppColors.amber,
                                                  fontSize: 18,
                                                ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            work.description,
                                            style: AppTextStyles.body.copyWith(
                                              fontSize: 18,
                                              color: AppColors.textSecondary,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            work.duration,
                                            style: AppTextStyles.body.copyWith(
                                              color: AppColors.textPrimary,
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          borderButton("More Details", () {
                                            launchUrl(Uri.parse(work.link));
                                          }),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                        work.logoPath,
                                      ),
                                      radius: 40,
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

Widget borderButton(String name, VoidCallback ontap) {
  return HoverScaleWidget(
    child: InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textPrimary, width: 1),
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
        ),
        child: Text(
          name,
          style: AppTextStyles.heading2.copyWith(
            color: AppColors.lightBlue,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
