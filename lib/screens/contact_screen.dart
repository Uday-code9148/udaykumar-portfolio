import 'package:flutter/material.dart';
import 'package:portfolio_website/config/data.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
            'Get In Touch',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Let\'s work together on your next project',
            style: TextStyle(
              fontSize: 18,
              color: const Color(PortfolioData.accentColorValue),
            ),
          ),
          const SizedBox(height: 40),
          // Contact Content
          _buildContactContent(context),
        ],
      ),
    );
  }

  Widget _buildContactContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: _buildContactInfo(),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: _buildContactForm(),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              _buildContactInfo(),
              const SizedBox(height: 40),
              _buildContactForm(),
            ],
          );
        }
      },
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        _buildContactItem(
          Icons.email,
          'Email',
          PortfolioData.email,
          'mailto:${PortfolioData.email}',
        ),
        _buildContactItem(
          Icons.link,
          'LinkedIn',
          'Connect on LinkedIn',
          PortfolioData.linkedinUrl,
        ),
        _buildContactItem(
          Icons.code,
          'GitHub',
          'View my projects',
          PortfolioData.githubUrl,
        ),
        _buildContactItem(
          Icons.description,
          'Resume',
          'Download my resume',
          'https://uday-code9148.github.io/udaykumar-portfolio/assets/images/resume.html',
        ),
        const SizedBox(height: 32),
        _buildAvailabilityCard(),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String title, String subtitle, String url) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _launchUrl(url),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(PortfolioData.accentColorValue).withOpacity(0.2),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(PortfolioData.accentColorValue).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(PortfolioData.accentColorValue),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white70,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvailabilityCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(PortfolioData.accentColorValue).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(PortfolioData.accentColorValue).withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(PortfolioData.accentColorValue),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Available for opportunities',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(PortfolioData.accentColorValue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'I\'m currently open to new opportunities and collaborations. Feel free to reach out if you\'d like to work together!',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send a Message',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          _buildFormField('Name', Icons.person),
          const SizedBox(height: 16),
          _buildFormField('Email', Icons.email),
          const SizedBox(height: 16),
          _buildFormField('Subject', Icons.subject),
          const SizedBox(height: 16),
          _buildFormField('Message', Icons.message, maxLines: 4),
          const SizedBox(height: 24),
          Builder(
            builder: (context) => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // Launch email client
                  final emailUri = Uri.parse('mailto:${PortfolioData.email}?subject=Portfolio Contact&body=Hello Udaykumar,');
                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri, mode: LaunchMode.externalApplication);
                  } else {
                    // Show snackbar as fallback
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Message sent!'),
                        backgroundColor: Color(PortfolioData.accentColorValue),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(PortfolioData.accentColorValue),
                  foregroundColor: const Color(PortfolioData.primaryColorValue),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Send Message',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(String label, IconData icon, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.white70),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: const Color(PortfolioData.accentColorValue).withOpacity(0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: const Color(PortfolioData.accentColorValue).withOpacity(0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(PortfolioData.accentColorValue),
              ),
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
} 