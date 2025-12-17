import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/my_colors.dart';
import 'package:personal_portfolio/utils/my_txt.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                skillContainer(
                  context,
                  isMobile,
                  "Application Development",
                  "Tech: Flutter, Dart",
                  "▸ Integrated REST APIs using http and Dio\n"
                      "▸ Managed application state with GetX (Controllers & Services)",
                ),
                skillContainer(
                  context,
                  isMobile,
                  "Programming & OOPs",
                  "Tech: Java, Python",
                  "▸ Strong understanding of OOP principles "
                      "(Encapsulation, Inheritance, Polymorphism, Abstraction)\n"
                      "▸ Applied problem-solving logic using loops and conditional statements",
                ),
                skillContainer(
                  context,
                  isMobile,
                  "Version Control & GitHub",
                  "Tech / Tools: Git, GitHub",
                  "▸ Used Git for version control in personal and academic projects\n"
                      "▸ Managed source code using GitHub repositories\n"
                      "▸ Performed common Git operations",
                ),
                skillContainer(
                  context,
                  isMobile,
                  "Problem Solving & DSA Basics",
                  "",
                  "▸ Practicing DSA basics by solving array and string problems\n"
                      "▸ Writing solutions using Java and Python\n"
                      "▸ Has a basic understanding of time and space complexity",
                ),
                skillContainer(
                  context,
                  isMobile,
                  "Generative AI Fundamentals (Theory)",
                  "",
                  "▸ Has theoretical knowledge of AI, Machine Learning, and Deep Learning\n"
                      "▸ Neural Networks and LLMs\n"
                      "▸ Knows theory concepts of Embeddings, Vectors, Vector Databases, and RAG",
                ),
                skillContainer(
                  context,
                  isMobile,
                  "Basic Backend & API Knowledge",
                  "",
                  "▸ Understands REST API concepts such as GET, POST, and HTTP status codes\n"
                      "▸ Handles JSON data parsing and basic error states\n"
                      "▸ Familiar with client–server communication fundamentals",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget skillContainer(
    BuildContext context,
    bool isMobile,
    String dName,
    String tName,
    String description,
  ) {
    return Container(
      width: isMobile ? MediaQuery.of(context).size.width * 0.9 : 380,
      height: isMobile ? null : 250,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dName,
            style: AppTextStyles.heading2.copyWith(
              fontSize: 17,
              color: AppColors.amber,
            ),
          ),

          if (tName.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(tName, style: AppTextStyles.heading1.copyWith(fontSize: 14)),
          ],

          const SizedBox(height: 12),

          isMobile
              ? Text(
                  description,
                  style: AppTextStyles.body.copyWith(height: 1.6),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Text(
                      description,
                      style: AppTextStyles.body.copyWith(height: 1.6),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
