import 'package:flutter/material.dart';
import 'package:portfolio_website/config/data.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onIndexChanged;

  const NavBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;
    
    if (isDesktop) {
      return Container(
        width: 250,
        color: const Color(PortfolioData.primaryColorValue),
        constraints: const BoxConstraints(maxHeight: 600),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Section
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color(PortfolioData.accentColorValue),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.jpg',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Try PNG if JPG fails
                            return Image.asset(
                              'assets/images/profile.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Text(
                                  PortfolioData.name.split(' ').map((e) => e[0]).join(''),
                                  style: const TextStyle(
                                    fontSize: 20,
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
                    const SizedBox(height: 12),
                    Text(
                      PortfolioData.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      PortfolioData.shortBio,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(PortfolioData.accentColorValue),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white24),
              const SizedBox(height: 16),
              // Navigation Items
              ..._buildNavItems(context),
              const SizedBox(height: 20),
              // Social Links
              _buildSocialLinks(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    } else {
      return Container(
        color: const Color(PortfolioData.primaryColorValue),
        child: Column(
          children: [
            // Mobile Header
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(PortfolioData.accentColorValue),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Try PNG if JPG fails
                          return Image.asset(
                            'assets/images/profile.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Text(
                                PortfolioData.name.split(' ').map((e) => e[0]).join(''),
                                style: const TextStyle(
                                  fontSize: 12,
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
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          PortfolioData.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          PortfolioData.shortBio,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(PortfolioData.accentColorValue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Mobile Navigation
            Container(
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _navItems.asMap().entries.map((entry) {
                    return _buildMobileNavItem(context, entry.key);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  List<Widget> _buildNavItems(BuildContext context) {
    return _navItems.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final isSelected = currentIndex == index;
      
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onIndexChanged(index),
            borderRadius: BorderRadius.circular(8),
                          child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(PortfolioData.accentColorValue).withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: isSelected ? Border.all(color: const Color(PortfolioData.accentColorValue)) : null,
                ),
              child: Row(
                children: [
                  Icon(
                    item['icon'],
                    color: isSelected ? const Color(PortfolioData.accentColorValue) : Colors.white70,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    item['title'],
                    style: TextStyle(
                      color: isSelected ? const Color(PortfolioData.accentColorValue) : Colors.white70,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildMobileNavItem(BuildContext context, int index) {
    final item = _navItems[index];
    final isSelected = currentIndex == index;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onIndexChanged(index),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? const Color(PortfolioData.accentColorValue).withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: isSelected ? Border.all(color: const Color(PortfolioData.accentColorValue)) : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item['icon'],
                  color: isSelected ? const Color(PortfolioData.accentColorValue) : Colors.white70,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  item['title'],
                  style: TextStyle(
                    color: isSelected ? const Color(PortfolioData.accentColorValue) : Colors.white70,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Column(
      children: [
        const Divider(color: Colors.white24),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialIcon(Icons.email, PortfolioData.email, 'mailto:${PortfolioData.email}'),
            _buildSocialIcon(Icons.link, 'LinkedIn', PortfolioData.linkedinUrl),
            _buildSocialIcon(Icons.code, 'GitHub', PortfolioData.githubUrl),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String tooltip, String url) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: Icon(icon, color: Colors.white70, size: 20),
        iconSize: 20,
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        onPressed: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
      ),
    );
  }

  static const List<Map<String, dynamic>> _navItems = [
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'About', 'icon': Icons.person},
    {'title': 'Projects', 'icon': Icons.work},
    {'title': 'Contact', 'icon': Icons.contact_mail},
  ];
} 