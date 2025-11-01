import 'package:flutter/material.dart';
import 'package:personal_portfolio/pages/Complete_home.dart';
import 'package:personal_portfolio/pages/contact_page.dart';
import 'package:personal_portfolio/pages/projects_section.dart';
import 'package:personal_portfolio/pages/work_experience.dart';
import 'package:personal_portfolio/utils/hover_effect.dart';

import 'package:personal_portfolio/utils/my_colors.dart';
import 'package:personal_portfolio/utils/my_txt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexvalue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: AppColors.background,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 20),
                  tabitem(
                    Icons.home,
                    "Home",
                    () {
                      setState(() {
                        indexvalue = 1;
                      });
                    },
                    indexvalue == 1 ? AppColors.amber : Colors.transparent,
                  ),
                  const SizedBox(width: 40),
                  tabitem(
                    Icons.work,
                    "Projects",
                    () {
                      setState(() {
                        indexvalue = 2;
                      });
                    },
                    indexvalue == 2 ? AppColors.amber : Colors.transparent,
                  ),
                  const SizedBox(width: 40),
                  tabitem(
                    Icons.person,
                    "Experience",
                    () {
                      setState(() {
                        indexvalue = 3;
                      });
                    },
                    indexvalue == 3 ? AppColors.amber : Colors.transparent,
                  ),
                  const SizedBox(width: 40),
                  tabitem(
                    Icons.mail,
                    "Contact",
                    () {
                      setState(() {
                        indexvalue = 4;
                      });
                    },
                    indexvalue == 4 ? AppColors.amber : Colors.transparent,
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
          Divider(color: AppColors.divider, height: 5),
          Expanded(child: getcurrentsection(indexvalue)),
        ],
      ),
    );
  }
}

Widget getcurrentsection(int indexvalue) {
  switch (indexvalue) {
    case 1:
      return CompleteHome();
    case 2:
      return ProjectsSection();
    case 3:
      return WorkExperience();
    case 4:
      return ContactPage();
    default:
      return Text("Default");
  }
}

Widget tabitem(
  IconData icon,
  String label,
  VoidCallback ontap,
  Color colorsofbar,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: HoverScaleWidget(
      child: InkWell(
        onTap: ontap,
        child: Column(
          children: [
            // Icon(icon, color: AppColors.lightBlue, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: AppTextStyles.heading2.copyWith(
                color: AppColors.textPrimary,
                fontSize: 14,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 10),
            Container(height: 5, width: 60, color: colorsofbar),
          ],
        ),
      ),
    ),
  );
}
