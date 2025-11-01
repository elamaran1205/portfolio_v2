class WorkExperienceModel {
  final String companyName;
  final String role;
  final String description;
  final String duration;
  final String logoPath;
  final String link;

  WorkExperienceModel({
    required this.companyName,
    required this.role,
    required this.description,
    required this.duration,
    required this.logoPath,
    required this.link,
  });
}

List<WorkExperienceModel> workExperienceList = [
  WorkExperienceModel(
    companyName: "Neusaat Private Limited",
    role: "Flutter Trainee",
    description:
        "Completed a one-month internship learning core Flutter fundamentals, API integration, and clean project structuring with GetX.",
    duration: "20 March 2025 - 20 April 2025",
    logoPath: "assets/img2/neu.png",
    link: "https://www.neusaat.com",
  ),
  WorkExperienceModel(
    companyName: " Paritripti Jewels Private Limited",
    role: "Flutter Developer",
    description:
        "A Paid internship through Internshala, where I developing a complete multi-role food delivery application featuring client, seller, and admin modules. Implemented core functionalities such as real-time order management, product listings, and authentication. Used GetX for efficient state management and integrated REST APIs for smooth client-server communication",
    duration: "20 August 2025 - 20 November 2025",
    logoPath: "assets/img2/par.png",
    link: "https://internshala.com/company/paritripti-1653892583/",
  ),
];
