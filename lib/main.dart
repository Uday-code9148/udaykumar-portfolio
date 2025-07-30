import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/config/data.dart';
import 'package:portfolio_website/screens/home_screen.dart';
import 'package:portfolio_website/screens/about_screen.dart';
import 'package:portfolio_website/screens/projects_screen.dart';
import 'package:portfolio_website/screens/contact_screen.dart';
import 'package:portfolio_website/widgets/nav_bar.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udaykumar Reddy RS - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(PortfolioData.primaryColorValue),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(PortfolioData.primaryColorValue),
          primary: const Color(PortfolioData.primaryColorValue),
          secondary: const Color(PortfolioData.accentColorValue),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  int _currentIndex = 0;

  void navigateToSection(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(onNavigateToSection: navigateToSection),
      const AboutScreen(),
      const ProjectsScreen(),
      const ContactScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(PortfolioData.primaryColorValue),
      body: Row(
        children: [
          // Navigation Bar (Desktop)
          if (MediaQuery.of(context).size.width > 768)
            NavBar(
              currentIndex: _currentIndex,
              onIndexChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          // Main Content
          Expanded(
            child: Column(
              children: [
                // Mobile Navigation Bar
                if (MediaQuery.of(context).size.width <= 768)
                  NavBar(
                    currentIndex: _currentIndex,
                    onIndexChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                // Screen Content
                Expanded(
                  child: _buildScreens()[_currentIndex],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 