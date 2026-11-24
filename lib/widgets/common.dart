import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/theme.dart';

Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.externalApplication, webOnlyWindowName: '_blank');
}

/// Centers content and limits its width.
class ContentWidth extends StatelessWidget {
  final Widget child;
  const ContentWidth({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final mobile = Breakpoints.isMobile(context);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Breakpoints.maxContent),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 32),
          child: child,
        ),
      ),
    );
  }
}

/// A page section with a small numbered label and a big title.
class Section extends StatelessWidget {
  final String label;
  final String title;
  final Widget child;
  const Section({super.key, required this.label, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final mobile = Breakpoints.isMobile(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mobile ? 48 : 72),
      child: ContentWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                color: AppColors.accent,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: mobile ? 28 : 36,
                fontWeight: FontWeight.w800,
                height: 1.15,
              ),
            ),
            SizedBox(height: mobile ? 24 : 36),
            child,
          ],
        ),
      ),
    );
  }
}

/// Rounded card with a subtle border that lifts on hover.
class HoverCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  const HoverCard({super.key, required this.child, this.padding = const EdgeInsets.all(24)});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.translationValues(0, _hover ? -4 : 0, 0),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: _hover ? AppColors.surfaceHigh : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hover ? AppColors.accent.withOpacity(0.5) : AppColors.border,
          ),
          boxShadow: _hover
              ? [BoxShadow(color: AppColors.accent.withOpacity(0.08), blurRadius: 24, offset: const Offset(0, 8))]
              : const [],
        ),
        child: widget.child,
      ),
    );
  }
}

/// Small rounded tag.
class Tag extends StatelessWidget {
  final String text;
  final bool muted;
  const Tag(this.text, {super.key, this.muted = false});

  @override
  Widget build(BuildContext context) {
    final color = muted ? AppColors.muted : AppColors.accent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withOpacity(0.28)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          fontStyle: muted ? FontStyle.italic : FontStyle.normal,
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  const PrimaryButton({super.key, required this.label, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.bg,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class GhostButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  const GhostButton({super.key, required this.label, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.text,
        side: const BorderSide(color: AppColors.border, width: 1.4),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
