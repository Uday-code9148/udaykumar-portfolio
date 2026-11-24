import 'package:flutter/material.dart';
import 'package:portfolio_website/config/data.dart';
import 'package:portfolio_website/screens/portfolio_page.dart';
import 'package:portfolio_website/theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${PortfolioData.name} – ${PortfolioData.role}',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const PortfolioPage(),
    );
  }
}
