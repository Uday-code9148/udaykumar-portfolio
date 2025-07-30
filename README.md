# Udaykumar Reddy RS - Flutter Developer Portfolio

A beautiful, responsive portfolio website built with Flutter Web showcasing my skills, projects, and experience as a Flutter developer.

## 🚀 Features

- **Responsive Design**: Works perfectly on desktop, tablet, and mobile devices
- **Modern UI**: Clean, professional design with smooth animations
- **Multiple Sections**: Home, About, Projects, and Contact pages
- **Interactive Elements**: Clickable project cards with external links
- **Social Integration**: Direct links to LinkedIn, GitHub, and email
- **Professional Theme**: Dark navy background with cyan accents

## 🛠️ Tech Stack

- **Framework**: Flutter Web
- **Language**: Dart
- **UI Components**: Material Design 3
- **Fonts**: Google Fonts (Poppins)
- **URL Handling**: url_launcher
- **Icons**: Flutter Icons & Custom SVGs

## 📱 Sections

### Home
- Hero section with introduction
- Skills showcase
- Quick stats and achievements

### About
- Detailed personal information
- Work experience timeline
- Education background
- Key highlights

### Projects
- Interactive project cards
- Technology tags
- Direct links to GitHub and live demos
- Responsive grid layout

### Contact
- Contact information
- Social media links
- Contact form
- Availability status

## 🎨 Design

- **Primary Color**: #0A192F (Dark Navy)
- **Accent Color**: #64FFDA (Cyan)
- **Font Family**: Poppins
- **Theme**: Dark mode with professional styling

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Web browser for testing

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd portfolio_website
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the development server**
   ```bash
   flutter run -d chrome
   ```

4. **Build for production**
   ```bash
   flutter build web
   ```

## 📦 Build and Deploy

### Local Development
```bash
# Run in development mode
flutter run -d chrome

# Run with web-renderer html (for better compatibility)
flutter run -d chrome --web-renderer html
```

### Production Build
```bash
# Build for production
flutter build web

# Build with specific renderer
flutter build web --web-renderer html
flutter build web --web-renderer canvaskit
```

### Deploy to GitHub Pages

1. **Create a new repository** on GitHub

2. **Push your code**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/yourusername/your-repo-name.git
   git push -u origin main
   ```

3. **Enable GitHub Pages**
   - Go to your repository settings
   - Navigate to "Pages" section
   - Select "Deploy from a branch"
   - Choose "main" branch and "/docs" folder
   - Click "Save"

4. **Build and deploy**
   ```bash
   # Build the project
   flutter build web
   
   # Copy build files to docs folder
   mkdir docs
   cp -r build/web/* docs/
   
   # Commit and push
   git add docs/
   git commit -m "Deploy to GitHub Pages"
   git push
   ```

5. **Your site will be available at**: `https://yourusername.github.io/your-repo-name/`

### Alternative: Deploy to Netlify

1. **Build the project**
   ```bash
   flutter build web
   ```

2. **Drag and drop** the `build/web` folder to Netlify

3. **Or use Netlify CLI**
   ```bash
   npm install -g netlify-cli
   netlify deploy --dir=build/web --prod
   ```

## 📁 Project Structure

```
lib/
├── config/
│   └── data.dart              # Portfolio data and configuration
├── screens/
│   ├── home_screen.dart       # Home page
│   ├── about_screen.dart      # About page
│   ├── projects_screen.dart   # Projects page
│   └── contact_screen.dart    # Contact page
├── widgets/
│   ├── nav_bar.dart          # Navigation bar
│   └── project_card.dart     # Project card component
└── main.dart                 # App entry point

assets/
├── images/                   # Image assets
└── icons/                    # Icon assets
```

## 🔧 Customization

### Update Personal Information
Edit `lib/config/data.dart` to update:
- Personal details
- Skills list
- Project information
- Social media links
- Theme colors

### Modify Theme
Update colors in `lib/config/data.dart`:
```dart
static const int primaryColorValue = 0xFF0A192F;  // Dark Navy
static const int accentColorValue = 0xFF64FFDA;   // Cyan
```

### Add New Projects
Add new projects to the `projects` list in `lib/config/data.dart`:
```dart
Project(
  title: "Your Project",
  description: "Project description",
  link: "https://your-project.com",
  githubLink: "https://github.com/your-repo",
  technologies: ["Flutter", "Firebase", "REST API"],
),
```

## 🌐 Browser Support

- Chrome (recommended)
- Firefox
- Safari
- Edge

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Contact

- **Email**: udaykumar.sareddy@gmail.com
- **LinkedIn**: [Udaykumar Reddy RS](https://www.linkedin.com/in/uday-kumar-reddy-rs-865311313)
- **GitHub**: [Uday-code9148](https://github.com/Uday-code9148)

---

Built with ❤️ using Flutter Web 