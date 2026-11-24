/// All portfolio content lives here. Edit this file to update the site.
class PortfolioData {
  // Personal information
  static const String name = 'Udaykumar Reddy RS';
  static const String fullName = 'Udaykumar Reddy Ramadurgam Sareddy';
  static const String role = 'Flutter Developer';
  static const String experience = '3.8+ years';
  static const String location = 'Bengaluru, India';
  static const String tagline =
      'I build cross-platform Android & iOS apps with Flutter — mainly real estate CRM products used by sales teams every day.';

  static const List<String> about = [
    'I\'m a Flutter developer with 3.8 years of experience building cross-platform Android and iOS apps. Most of my work has been on Leadrat, a real estate CRM product of Dhinwa Solutions, used by builders and their sales teams.',
    'I build app screens and features in Flutter and Dart, manage state with BLoC and Provider, connect apps to REST APIs, use Firebase Cloud Messaging for push notifications and Hive for offline storage. I also worked on the Channel Partner and Buyer modules of Builder CRM, and built a real-time whiteboard module with CustomPainter and WebSockets.',
    'I have basic knowledge of Java and Spring Boot and I\'m strengthening my backend skills.',
  ];

  static const String education =
      'B.Tech, Mechanical Engineering — RGM College of Engineering & Technology, Kurnool (2016 – 2020)';

  // Quick stats shown in the hero
  static const List<Stat> stats = [
    Stat('3.8+', 'Years experience'),
    Stat('2', 'CRM products'),
    Stat('Android + iOS', 'One Flutter codebase'),
  ];

  // Skills, grouped
  static const List<SkillGroup> skillGroups = [
    SkillGroup('Mobile', ['Flutter', 'Dart', 'Android', 'iOS', 'Flutter Web']),
    SkillGroup('State management', ['BLoC', 'Provider']),
    SkillGroup('Integration', ['REST APIs', 'Firebase Cloud Messaging', 'WebSockets']),
    SkillGroup('Local storage', ['Hive', 'SQLite']),
    SkillGroup('UI', ['Responsive layouts', 'CustomPainter', 'GestureDetector']),
    SkillGroup('Tools & process', ['Git', 'GitHub', 'Android Studio', 'VS Code', 'Agile Scrum']),
    SkillGroup('Basic knowledge', ['Java', 'Spring Boot'], basic: true),
  ];

  // Work experience, newest first
  static const List<Job> jobs = [
    Job(
      title: 'Production Engineer',
      company: 'LeadRat (Dhinwa Solutions)',
      period: 'Sep 2025 – Present',
      points: [
        'Work on the Leadrat CRM mobile app in Flutter and Dart: new features, bug fixes and UI improvements.',
        'Worked on the Channel Partner (CP) and Buyer modules of Builder CRM.',
        'Connect app screens to REST APIs for leads, follow-ups and notifications; integrate Firebase push notifications.',
        'Work with the backend team; basic exposure to Java and Spring Boot APIs.',
        'Use BLoC for state management and Git for version control; take part in Agile sprints and code reviews.',
      ],
    ),
    Job(
      title: 'Flutter Developer (Contract)',
      company: 'Insta VC',
      period: 'May 2025 – Aug 2025',
      points: [
        'Built an interactive whiteboard module for a cross-platform video app in 3 months.',
        'Built the drawing canvas with CustomPainter (freehand, shapes, text) and multi-touch via GestureDetector.',
        'Synced drawings live across users with WebSockets.',
        'Added options to place, move and resize images and documents on the board.',
      ],
    ),
    Job(
      title: 'Flutter Developer',
      company: 'Dhinwa Solutions Pvt. Ltd. (Leadrat CRM)',
      period: 'Feb 2023 – May 2025',
      points: [
        'Developed and maintained screens and features of the Leadrat CRM app (Android and iOS) in Flutter and Dart.',
        'Integrated Firebase Cloud Messaging (FCM) for push notifications.',
        'Used Hive for local storage so key screens work offline.',
        'Connected the app to REST APIs for lead tracking and customer details.',
        'Converted UI/UX designs into responsive screens; worked in Agile Scrum with Git/GitHub.',
      ],
    ),
  ];

  // Projects
  static const List<Project> projects = [
    Project(
      title: 'Leadrat CRM Mobile App',
      description:
          'Real estate CRM app for builders\' sales teams: leads, follow-ups, site visits, attendance and field staff tracking. I built Flutter screens and features as a team member.',
      link: 'https://play.google.com/store/apps/details?id=com.leadrat.black.mobile.droid.leadrat&hl=en_IN',
      linkLabel: 'Play Store',
      technologies: ['Flutter', 'Dart', 'BLoC', 'REST APIs', 'FCM', 'Hive'],
    ),
    Project(
      title: 'Builder CRM — CP & Buyer Modules',
      description:
          'CRM product for real estate builders to manage sales, channel partners and buyers. I worked on Channel Partner and Buyer module features and their API integration.',
      technologies: ['Flutter', 'REST APIs'],
    ),
    Project(
      title: 'Smart Whiteboard',
      description:
          'Real-time collaborative whiteboard, built as a standalone Flutter app and as a module inside a video conferencing app. Freehand drawing, shapes, text and live sync between users.',
      githubLink: 'https://github.com/Uday-code9148/smart-whiteboard',
      technologies: ['Flutter', 'CustomPainter', 'WebSockets'],
    ),
  ];

  // Links
  static const String linkedinUrl = 'https://www.linkedin.com/in/uday-kumar-reddy-rs-865311313';
  static const String githubUrl = 'https://github.com/Uday-code9148';
  static const String email = 'udaykumar.sareddy@gmail.com';

  /// Served from web/resume.pdf (relative to the site's base href).
  static const String resumeUrl = 'resume.pdf';
}

class Stat {
  final String value;
  final String label;
  const Stat(this.value, this.label);
}

class SkillGroup {
  final String title;
  final List<String> skills;
  final bool basic;
  const SkillGroup(this.title, this.skills, {this.basic = false});
}

class Job {
  final String title;
  final String company;
  final String period;
  final List<String> points;
  const Job({required this.title, required this.company, required this.period, required this.points});
}

class Project {
  final String title;
  final String description;
  final String? link;
  final String? linkLabel;
  final String? githubLink;
  final List<String> technologies;

  const Project({
    required this.title,
    required this.description,
    this.link,
    this.linkLabel,
    this.githubLink,
    required this.technologies,
  });
}
