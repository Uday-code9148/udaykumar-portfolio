import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_website/config/data.dart';

void main() {
  test('portfolio data is filled in', () {
    expect(PortfolioData.jobs, isNotEmpty);
    expect(PortfolioData.projects, isNotEmpty);
    expect(PortfolioData.skillGroups.expand((g) => g.skills), contains('Flutter'));
  });
}
