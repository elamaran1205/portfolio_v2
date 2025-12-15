import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/hover_effect.dart';
import 'package:personal_portfolio/utils/my_colors.dart';
import 'package:personal_portfolio/utils/my_txt.dart';
import 'package:url_launcher/url_launcher.dart';

class CompleteHome extends StatefulWidget {
  const CompleteHome({super.key});

  @override
  State<CompleteHome> createState() => _CompleteHomeState();
}

class _CompleteHomeState extends State<CompleteHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 700;

          return FadeInUp(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 1000,
                    minHeight: isMobile ? 0 : constraints.maxHeight * 0.8,
                  ),
                  child: isMobile
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 105,
                              backgroundColor: AppColors.amber,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: AssetImage("assets/img.jpeg"),
                              ),
                            ),
                            const SizedBox(height: 30),
                            textSection(isMobile),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: textSection(isMobile)),
                            const SizedBox(width: 30),
                            CircleAvatar(
                              radius: 105,
                              backgroundColor: AppColors.amber,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: AssetImage("assets/img.jpeg"),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget textSection(bool isMobile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, I'm Elamaran",
          style: AppTextStyles.heading1.copyWith(
            fontSize: isMobile ? 32 : 42,
            color: AppColors.amber,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        Text(
          "Final-year Computer Applications student with solid understanding of core programming concepts in Java and Python.Hands-on experience in real software environments through Flutter development internship and project work.",
          style: AppTextStyles.body.copyWith(
            fontSize: isMobile ? 16 : 18,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 30),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 20,
          runSpacing: 10,
          children: [
            detailBox("Tamil Nadu", Icons.location_on_rounded),
            detailBox("Open to work", Icons.work_history),
          ],
        ),
        const SizedBox(height: 30),
        HoverScaleWidget(
          child: InkWell(
            onTap: () {
              const url =
                  "https://drive.google.com/file/d/1tcTj3eC3DiXEvWDSB__7CduxfsxvlKpw/view?usp=sharing";
              launchUrl(Uri.parse(url));
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textPrimary, width: 1),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.download, color: AppColors.amber, size: 20),
                  const SizedBox(width: 10),
                  Text(
                    "Download Resume",
                    style: AppTextStyles.heading2.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget detailBox(String txt, IconData icon) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.lightBlue, size: 22),
        const SizedBox(width: 8),
        Text(
          txt,
          style: AppTextStyles.body.copyWith(
            fontSize: 15,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    ),
  );
}
