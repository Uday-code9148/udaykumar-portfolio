class PortfolioData {
  // Personal Information
  static const String name = "Udaykumar Reddy RS";
  static const String shortBio = "Flutter Developer | 1.6+ Years of Experience | Clean UI Enthusiast";
  static const String aboutMe = """
I'm Udaykumar Reddy RS, a Flutter developer with 1.6 years of experience.
I completed my B.Tech in Mechanical Engineering from RGM College, Nandyala.

I started my career at Dhinwa Solutions (February 2024 – May 2025) where I worked on their product LeadRat:
https://play.google.com/store/apps/details?id=com.leadrat.black.mobile.droid.leadrat&hl=en_IN

Currently, I'm working at Instavc, building scalable, high-quality Flutter apps.
""";

  // Skills
  static const List<String> skills = [
    "Flutter",
    "Dart",
    "BLoC",
    "Provider",
    "Firebase",
    "REST API",
    "CustomPainter",
    "SQLite",
    "Git & GitHub",
    "Flutter Web"
  ];

  // Projects
  static const List<Project> projects = [
    Project(
      title: "LeadRat App",
      description: "Sales productivity tool built with Flutter. Real-time reporting, lead management, and attendance.",
      link: "https://play.google.com/store/apps/details?id=com.leadrat.black.mobile.droid.leadrat&hl=en_IN",
      githubLink: null,
      technologies: ["Flutter", "Firebase", "REST API"],
    ),
    Project(
      title: "Smart Whiteboard",
      description: "Whiteboard is both a standalone Flutter app and a feature integrated into the InMeet video conferencing app. It includes real-time collaborative drawing, handwriting recognition, and shape correction.",
      link: null,
      githubLink: "https://github.com/Uday-code9148/smart-whiteboard",
      technologies: ["Flutter", "AI", "CustomPainter"],
    ),
  ];

  // Social Links
  static const String linkedinUrl = "https://www.linkedin.com/in/uday-kumar-reddy-rs-865311313";
  static const String githubUrl = "https://github.com/Uday-code9148";
  static const String email = "udaykumar.sareddy@gmail.com";

  // Theme Colors
  static const int primaryColorValue = 0xFF0A192F;
  static const int accentColorValue = 0xFF64FFDA;
}

class Project {
  final String title;
  final String description;
  final String? link;
  final String? githubLink;
  final List<String> technologies;

  const Project({
    required this.title,
    required this.description,
    this.link,
    this.githubLink,
    required this.technologies,
  });
} 