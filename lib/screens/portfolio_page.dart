import 'package:flutter/material.dart';
import 'package:portfolio_website/config/data.dart';
import 'package:portfolio_website/theme.dart';
import 'package:portfolio_website/widgets/common.dart';

/// Single scrolling page: hero, about, skills, experience, projects, contact.
class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _keys = {
    'About': GlobalKey(),
    'Skills': GlobalKey(),
    'Experience': GlobalKey(),
    'Projects': GlobalKey(),
    'Contact': GlobalKey(),
  };

  void _scrollTo(String section) {
    final ctx = _keys[section]?.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 600), curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final mobile = Breakpoints.isMobile(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: _NavBar(sections: _keys.keys.toList(), onTap: _scrollTo),
      ),
      endDrawer: mobile ? _MobileMenu(sections: _keys.keys.toList(), onTap: _scrollTo) : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Hero(onContact: () => _scrollTo('Contact'), onProjects: () => _scrollTo('Projects')),
            Container(key: _keys['About'], child: const _About()),
            Container(key: _keys['Skills'], color: AppColors.surface.withOpacity(0.35), child: const _Skills()),
            Container(key: _keys['Experience'], child: const _Experience()),
            Container(key: _keys['Projects'], color: AppColors.surface.withOpacity(0.35), child: const _Projects()),
            Container(key: _keys['Contact'], child: const _Contact()),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------- Nav

class _NavBar extends StatelessWidget {
  final List<String> sections;
  final void Function(String) onTap;
  const _NavBar({required this.sections, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final mobile = Breakpoints.isMobile(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bg.withOpacity(0.92),
        border: const Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        child: ContentWidth(
          child: SizedBox(
            height: 68,
            child: Row(
              children: [
                const _Logo(),
                const Spacer(),
                if (!mobile) ...[
                  for (final s in sections)
                    TextButton(
                      onPressed: () => onTap(s),
                      style: TextButton.styleFrom(foregroundColor: AppColors.muted),
                      child: Text(s, style: const TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () => openUrl(PortfolioData.resumeUrl),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.accent,
                      side: const BorderSide(color: AppColors.accent),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Resume', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ] else
                  Builder(
                    builder: (ctx) => IconButton(
                      icon: const Icon(Icons.menu_rounded),
                      tooltip: 'Menu',
                      onPressed: () => Scaffold.of(ctx).openEndDrawer(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            gradient: const LinearGradient(colors: [AppColors.accent, AppColors.accent2]),
          ),
          child: const Text('U', style: TextStyle(color: AppColors.bg, fontWeight: FontWeight.w900, fontSize: 18)),
        ),
        const SizedBox(width: 10),
        const Text(PortfolioData.name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
      ],
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final List<String> sections;
  final void Function(String) onTap;
  const _MobileMenu({required this.sections, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _Logo(),
              const SizedBox(height: 24),
              for (final s in sections)
                ListTile(
                  title: Text(s, style: const TextStyle(fontWeight: FontWeight.w600)),
                  onTap: () {
                    Navigator.of(context).pop();
                    Future.delayed(const Duration(milliseconds: 250), () => onTap(s));
                  },
                ),
              const SizedBox(height: 16),
              PrimaryButton(
                label: 'Download resume',
                icon: Icons.download_rounded,
                onPressed: () => openUrl(PortfolioData.resumeUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------- Hero

class _Hero extends StatelessWidget {
  final VoidCallback onContact;
  final VoidCallback onProjects;
  const _Hero({required this.onContact, required this.onProjects});

  @override
  Widget build(BuildContext context) {
    final mobile = Breakpoints.isMobile(context);

    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF22C55E).withOpacity(0.12),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: const Color(0xFF22C55E).withOpacity(0.35)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, size: 8, color: Color(0xFF22C55E)),
              SizedBox(width: 8),
              Text('Open to Flutter roles', style: TextStyle(color: Color(0xFF86EFAC), fontWeight: FontWeight.w600, fontSize: 13)),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Text('Hi, I\'m', style: TextStyle(fontSize: mobile ? 18 : 22, color: AppColors.muted, fontWeight: FontWeight.w500)),
        const SizedBox(height: 6),
        Text(
          PortfolioData.name,
          style: TextStyle(fontSize: mobile ? 38 : 60, fontWeight: FontWeight.w900, height: 1.05, letterSpacing: -1),
        ),
        const SizedBox(height: 10),
        ShaderMask(
          shaderCallback: (r) => const LinearGradient(colors: [AppColors.accent, AppColors.accent2]).createShader(r),
          child: Text(
            '${PortfolioData.role} · ${PortfolioData.experience}',
            style: TextStyle(fontSize: mobile ? 22 : 30, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            PortfolioData.tagline,
            style: TextStyle(fontSize: mobile ? 16 : 18, color: AppColors.muted, height: 1.6),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            PrimaryButton(label: 'Download resume', icon: Icons.download_rounded, onPressed: () => openUrl(PortfolioData.resumeUrl)),
            GhostButton(label: 'View projects', icon: Icons.apps_rounded, onPressed: onProjects),
            GhostButton(label: 'Contact me', icon: Icons.mail_outline_rounded, onPressed: onContact),
          ],
        ),
        const SizedBox(height: 18),
        const Row(
          children: [
            Icon(Icons.location_on_outlined, size: 16, color: AppColors.muted),
            SizedBox(width: 6),
            Text(PortfolioData.location, style: TextStyle(color: AppColors.muted)),
          ],
        ),
      ],
    );

    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.8, -0.6),
          radius: 1.2,
          colors: [Color(0x2638BDF8), Color(0x00000000)],
        ),
      ),
      padding: EdgeInsets.only(top: mobile ? 48 : 96, bottom: mobile ? 40 : 72),
      child: ContentWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (mobile) ...[
              const _Avatar(size: 96),
              const SizedBox(height: 28),
              intro,
            ] else
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 3, child: intro),
                  const SizedBox(width: 48),
                  const Expanded(flex: 2, child: Center(child: _Avatar(size: 260))),
                ],
              ),
            SizedBox(height: mobile ? 40 : 64),
            _StatsRow(mobile: mobile),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final double size;
  const _Avatar({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.025),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppColors.accent, AppColors.accent2]),
      ),
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.surface),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          'assets/images/profile.jpg',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('UR', style: TextStyle(fontSize: size * 0.3, fontWeight: FontWeight.w900, color: AppColors.text)),
                if (size > 150) ...[
                  const SizedBox(height: 6),
                  const Icon(Icons.flutter_dash, color: AppColors.accent, size: 36),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final bool mobile;
  const _StatsRow({required this.mobile});

  @override
  Widget build(BuildContext context) {
    final items = PortfolioData.stats
        .map((s) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.value, style: TextStyle(fontSize: mobile ? 24 : 30, fontWeight: FontWeight.w800, color: AppColors.accent)),
                const SizedBox(height: 4),
                Text(s.label, style: const TextStyle(color: AppColors.muted, fontSize: 14)),
              ],
            ))
        .toList();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(mobile ? 20 : 28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [for (final w in items) Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: w)],
            )
          : Row(children: [for (final w in items) Expanded(child: w)]),
    );
  }
}

// ---------------------------------------------------------------- About

class _About extends StatelessWidget {
  const _About();

  @override
  Widget build(BuildContext context) {
    final mobile = Breakpoints.isMobile(context);
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final p in PortfolioData.about)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(p, style: const TextStyle(fontSize: 17, height: 1.7, color: AppColors.muted)),
          ),
      ],
    );
    final facts = HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _Fact(icon: Icons.work_outline_rounded, label: 'Current', value: 'Production Engineer, LeadRat'),
          _Fact(icon: Icons.phone_android_rounded, label: 'Focus', value: 'Flutter · Android & iOS'),
          _Fact(icon: Icons.location_on_outlined, label: 'Location', value: PortfolioData.location),
          _Fact(icon: Icons.school_outlined, label: 'Education', value: 'B.Tech, Mechanical Engineering (2020)'),
        ],
      ),
    );

    return Section(
      label: '01 · About',
      title: 'A bit about me',
      child: mobile
          ? Column(children: [text, const SizedBox(height: 8), facts])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: text),
                const SizedBox(width: 40),
                Expanded(flex: 2, child: facts),
              ],
            ),
    );
  }
}

class _Fact extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _Fact({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.accent.withOpacity(0.12), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, size: 18, color: AppColors.accent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: AppColors.muted, fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------- Skills

class _Skills extends StatelessWidget {
  const _Skills();

  @override
  Widget build(BuildContext context) {
    return Section(
      label: '02 · Skills',
      title: 'What I work with',
      child: LayoutBuilder(builder: (context, c) {
        final cols = c.maxWidth > 900 ? 3 : (c.maxWidth > 560 ? 2 : 1);
        const gap = 18.0;
        final w = (c.maxWidth - gap * (cols - 1)) / cols;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final g in PortfolioData.skillGroups)
              SizedBox(
                width: w,
                child: HoverCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(g.title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                      const SizedBox(height: 14),
                      Wrap(spacing: 8, runSpacing: 8, children: [for (final s in g.skills) Tag(s, muted: g.basic)]),
                    ],
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}

// ---------------------------------------------------------------- Experience

class _Experience extends StatelessWidget {
  const _Experience();

  @override
  Widget build(BuildContext context) {
    final mobile = Breakpoints.isMobile(context);
    final jobs = PortfolioData.jobs;
    return Section(
      label: '03 · Experience',
      title: 'Where I\'ve worked',
      child: Column(
        children: [
          for (var i = 0; i < jobs.length; i++)
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // timeline rail
                  SizedBox(
                    width: 28,
                    child: Column(
                      children: [
                        const SizedBox(height: 26),
                        Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: i == 0 ? AppColors.accent : AppColors.surface,
                            border: Border.all(color: AppColors.accent, width: 3),
                          ),
                        ),
                        if (i < jobs.length - 1)
                          Expanded(child: Container(width: 2, color: AppColors.border)),
                      ],
                    ),
                  ),
                  SizedBox(width: mobile ? 10 : 18),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: HoverCard(child: _JobCard(job: jobs[i], mobile: mobile)),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  final Job job;
  final bool mobile;
  const _JobCard({required this.job, required this.mobile});

  @override
  Widget build(BuildContext context) {
    final header = [
      Expanded(
        flex: mobile ? 0 : 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
            const SizedBox(height: 4),
            Text(job.company, style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    ];
    final period = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: AppColors.bg, borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.border)),
      child: Text(job.period, style: const TextStyle(color: AppColors.muted, fontSize: 13, fontWeight: FontWeight.w600)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (mobile) ...[
          Text(job.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
          const SizedBox(height: 4),
          Text(job.company, style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          period,
        ] else
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [...header, const SizedBox(width: 12), period]),
        const SizedBox(height: 16),
        for (final p in job.points)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8, right: 12),
                  child: Icon(Icons.circle, size: 6, color: AppColors.accent),
                ),
                Expanded(child: Text(p, style: const TextStyle(color: AppColors.muted, height: 1.55, fontSize: 15))),
              ],
            ),
          ),
      ],
    );
  }
}

// ---------------------------------------------------------------- Projects

class _Projects extends StatelessWidget {
  const _Projects();

  @override
  Widget build(BuildContext context) {
    return Section(
      label: '04 · Projects',
      title: 'Things I\'ve built',
      child: LayoutBuilder(builder: (context, c) {
        final cols = c.maxWidth > 900 ? 3 : (c.maxWidth > 560 ? 2 : 1);
        const gap = 18.0;
        final w = (c.maxWidth - gap * (cols - 1)) / cols;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [for (final p in PortfolioData.projects) SizedBox(width: w, child: _ProjectCard(project: p))],
        );
      }),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [AppColors.accent.withOpacity(0.25), AppColors.accent2.withOpacity(0.25)]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.phone_iphone_rounded, color: AppColors.accent, size: 22),
              ),
              const Spacer(),
              if (project.githubLink != null)
                IconButton(
                  tooltip: 'GitHub',
                  icon: const Icon(Icons.code_rounded, color: AppColors.muted),
                  onPressed: () => openUrl(project.githubLink!),
                ),
              if (project.link != null)
                IconButton(
                  tooltip: project.linkLabel ?? 'Open',
                  icon: const Icon(Icons.open_in_new_rounded, color: AppColors.muted),
                  onPressed: () => openUrl(project.link!),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(project.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
          const SizedBox(height: 10),
          Text(project.description, style: const TextStyle(color: AppColors.muted, height: 1.6, fontSize: 15)),
          const SizedBox(height: 18),
          Wrap(spacing: 8, runSpacing: 8, children: [for (final t in project.technologies) Tag(t)]),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------- Contact

class _Contact extends StatelessWidget {
  const _Contact();

  @override
  Widget build(BuildContext context) {
    final mobile = Breakpoints.isMobile(context);
    return Section(
      label: '05 · Contact',
      title: 'Let\'s work together',
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(mobile ? 24 : 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.accent.withOpacity(0.14), AppColors.accent2.withOpacity(0.14)],
          ),
          border: Border.all(color: AppColors.accent.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'I\'m open to Flutter developer roles. The fastest way to reach me is email.',
              style: TextStyle(fontSize: mobile ? 17 : 20, height: 1.5, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                PrimaryButton(
                  label: PortfolioData.email,
                  icon: Icons.mail_outline_rounded,
                  onPressed: () => openUrl('mailto:${PortfolioData.email}'),
                ),
                GhostButton(label: 'LinkedIn', icon: Icons.business_center_outlined, onPressed: () => openUrl(PortfolioData.linkedinUrl)),
                GhostButton(label: 'GitHub', icon: Icons.code_rounded, onPressed: () => openUrl(PortfolioData.githubUrl)),
                GhostButton(label: 'Resume (PDF)', icon: Icons.download_rounded, onPressed: () => openUrl(PortfolioData.resumeUrl)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppColors.border))),
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: ContentWidth(
        child: Text(
          '© ${DateTime.now().year} ${PortfolioData.fullName} · Built with Flutter',
          style: const TextStyle(color: AppColors.muted, fontSize: 13),
        ),
      ),
    );
  }
}
