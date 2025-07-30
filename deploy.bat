@echo off
echo 🚀 Starting deployment process...

REM Build the Flutter web project
echo 📦 Building Flutter web project...
flutter build web

REM Create docs directory if it doesn't exist
if not exist "docs" (
    echo 📁 Creating docs directory...
    mkdir docs
)

REM Copy build files to docs directory
echo 📋 Copying build files to docs directory...
xcopy "build\web\*" "docs\" /E /Y

REM Add all changes to git
echo 📝 Adding changes to git...
git add .

REM Commit changes
echo 💾 Committing changes...
git commit -m "Deploy to GitHub Pages - %date% %time%"

REM Push to GitHub
echo 🚀 Pushing to GitHub...
git push origin main

echo ✅ Deployment completed successfully!
echo 🌐 Your site should be available at: https://yourusername.github.io/your-repo-name/
echo ⏰ It may take a few minutes for changes to appear.
pause 