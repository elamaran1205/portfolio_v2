class ProjectModel {
  final String title;
  final String description;
  final List<String> imagePaths;
  final List<String> techStack;
  final String githubUrl;

  ProjectModel({
    required this.title,
    required this.description,
    required this.imagePaths,
    required this.techStack,
    required this.githubUrl,
  });
}

final List<ProjectModel> projects = [
  ProjectModel(
    title: "Weather Forecasting Application (Internship Project)",
    description:
        "A Flutter-based weather app built with a clean dark-light theme system. "
        "It allows users to search cities, view real-time weather details, and refresh data instantly. "
        "The app is powered by the OpenWeather API and uses the GetX state management "
        "for reactive UI updates and smooth performance.",
    imagePaths: [
      "assets/img/project1img1.jpeg",
      "assets/img/project1img2.jpeg",
      "assets/img/project1img3.jpeg",
    ],
    techStack: ["Flutter", "Rest API", "GetX"],
    githubUrl: "https://github.com/elamaran1205/weather_application",
  ),
  ProjectModel(
    title: "Personal Portfolio Website",
    description:
        "A responsive personal portfolio built with Flutter Web, designed to showcase my skills, "
        "projects, and background. It features a dark modern UI with smooth hover animations, "
        "a custom tab navigation bar, and reusable components for scalability. "
        "Integrated Google Fonts, custom theming, and hover effects bring a professional touch to the design.",
    imagePaths: [
      "assets/img/project2img1.png",
      "assets/img/project2img2.png",
      "assets/img/project2img3.png",
    ],
    techStack: ["Flutter Web", "Responsive UI", "Animations"],
    githubUrl: "https://github.com/YourUsername/portfolio",
  ),
];
