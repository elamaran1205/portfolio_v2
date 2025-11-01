import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/hover_effect.dart';
import 'package:personal_portfolio/utils/my_colors.dart';
import 'package:personal_portfolio/utils/my_txt.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: FadeInUp(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get in Touch",
                  style: AppTextStyles.heading1.copyWith(
                    color: AppColors.amber,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "I'm open to collaborations, internships, or freelance opportunities.\nLet’s build something awesome together!",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 18,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),

                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 25,
                  runSpacing: 20,
                  children: [
                    contactItem(
                      Icons.email_rounded,
                      "elamaran1122@email.com",
                      "mailto:elamaran1122@gmail.com",
                    ),
                    contactItem(
                      Icons.link,
                      "LinkedIn",
                      "https://www.linkedin.com/in/elamaran-profile/",
                    ),
                    contactItem(
                      Icons.code_rounded,
                      "GitHub",
                      "https://github.com/elamaran1205",
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                Text(
                  "Designed and developed by Elamaran ❤️",
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget contactItem(IconData icon, String label, String url) {
  return HoverScaleWidget(
    child: InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (!await launchUrl(uri)) {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.textPrimary, width: 1),
          borderRadius: BorderRadius.circular(12),
          color: AppColors.surface,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.lightBlue, size: 22),
            const SizedBox(width: 10),
            Text(
              label,
              style: AppTextStyles.body.copyWith(
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
