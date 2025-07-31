import 'package:flutter/material.dart';
import 'package:portfolio_website/config/data.dart';

class HomeScreen extends StatelessWidget {
  final Function(int)? onNavigateToSection;
  
  const HomeScreen({super.key, this.onNavigateToSection});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width > 768 ? 24 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          // Hero Section
          _buildHeroSection(context),
          const SizedBox(height: 60),
          // Skills Section
          _buildSkillsSection(context),
          const SizedBox(height: 60),
          // Quick Stats
          _buildStatsSection(context),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, I\'m',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(PortfolioData.accentColorValue),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                                         Text(
                       PortfolioData.name,
                       style: TextStyle(
                         fontSize: constraints.maxWidth > 600 ? 48 : 32,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         height: 1.1,
                       ),
                     ),
                    const SizedBox(height: 16),
                                         Text(
                       PortfolioData.shortBio,
                       style: TextStyle(
                         fontSize: constraints.maxWidth > 600 ? 24 : 18,
                         color: Colors.white70,
                         height: 1.4,
                       ),
                     ),
                    const SizedBox(height: 32),
                    _buildCTAButtons(),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: _buildProfileCard(),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileCard(),
              const SizedBox(height: 32),
              Text(
                'Hi, I\'m',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color(PortfolioData.accentColorValue),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
                             Text(
                 PortfolioData.name,
                 style: const TextStyle(
                   fontSize: 28,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                   height: 1.1,
                 ),
               ),
              const SizedBox(height: 16),
                             Text(
                 PortfolioData.shortBio,
                 style: const TextStyle(
                   fontSize: 16,
                   color: Colors.white70,
                   height: 1.4,
                 ),
               ),
              const SizedBox(height: 32),
              _buildCTAButtons(),
            ],
          );
        }
      },
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(PortfolioData.accentColorValue).withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: const Color(PortfolioData.accentColorValue),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Try PNG if JPG fails
                  return Image.asset(
                    'assets/images/profile.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Text(
                        PortfolioData.name.split(' ').map((e) => e[0]).join(''),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(PortfolioData.primaryColorValue),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Flutter Developer',
            style: TextStyle(
              fontSize: 18,
              color: const Color(PortfolioData.accentColorValue),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '1.6+ Years Experience',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCTAButtons() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    onNavigateToSection?.call(2); // Projects section
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(PortfolioData.accentColorValue),
                    foregroundColor: const Color(PortfolioData.primaryColorValue),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'View Projects',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    onNavigateToSection?.call(3); // Contact section
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(PortfolioData.accentColorValue),
                    side: const BorderSide(color: Color(PortfolioData.accentColorValue)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Contact Me',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    onNavigateToSection?.call(2); // Projects section
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(PortfolioData.accentColorValue),
                    foregroundColor: const Color(PortfolioData.primaryColorValue),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'View Projects',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    onNavigateToSection?.call(3); // Contact section
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(PortfolioData.accentColorValue),
                    side: const BorderSide(color: Color(PortfolioData.accentColorValue)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Contact Me',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildSkillsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills & Technologies',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: PortfolioData.skills.map((skill) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(PortfolioData.accentColorValue).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(PortfolioData.accentColorValue).withOpacity(0.3),
                ),
              ),
              child: Text(
                skill,
                style: const TextStyle(
                  color: Color(PortfolioData.accentColorValue),
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(PortfolioData.accentColorValue).withOpacity(0.2),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('1.6+', 'Years Experience'),
                _buildStatItem('2+', 'Projects'),
                _buildStatItem('10+', 'Skills'),
              ],
            );
          } else {
            return Column(
              children: [
                _buildStatItem('1.6+', 'Years Experience'),
                const SizedBox(height: 16),
                _buildStatItem('2+', 'Projects'),
                const SizedBox(height: 16),
                _buildStatItem('10+', 'Skills'),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color(PortfolioData.accentColorValue),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
} 