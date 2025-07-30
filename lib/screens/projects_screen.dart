import 'package:flutter/material.dart';
import 'package:portfolio_website/config/data.dart';
import 'package:portfolio_website/widgets/project_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width > 768 ? 24 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          // Header
          Text(
            'My Projects',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Here are some of the projects I\'ve worked on',
            style: TextStyle(
              fontSize: 18,
              color: const Color(PortfolioData.accentColorValue),
            ),
          ),
          const SizedBox(height: 40),
          // Projects Grid
          _buildProjectsGrid(context),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          // 3 columns for large screens
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.8,
            ),
            itemCount: PortfolioData.projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: PortfolioData.projects[index]);
            },
          );
        } else if (constraints.maxWidth > 768) {
          // 2 columns for medium screens
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.8,
            ),
            itemCount: PortfolioData.projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: PortfolioData.projects[index]);
            },
          );
        } else {
          // 1 column for mobile
          return Column(
            children: PortfolioData.projects.map((project) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: ProjectCard(project: project),
              );
            }).toList(),
          );
        }
      },
    );
  }
} 