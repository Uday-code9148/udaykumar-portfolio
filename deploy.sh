#!/bin/bash

# Flutter Web Portfolio Deployment Script
echo "🚀 Starting deployment process..."

# Build the Flutter web project
echo "📦 Building Flutter web project..."
flutter build web

# Create docs directory if it doesn't exist
if [ ! -d "docs" ]; then
    echo "📁 Creating docs directory..."
    mkdir docs
fi

# Copy build files to docs directory
echo "📋 Copying build files to docs directory..."
cp -r build/web/* docs/

# Add all changes to git
echo "📝 Adding changes to git..."
git add .

# Commit changes
echo "💾 Committing changes..."
git commit -m "Deploy to GitHub Pages - $(date)"

# Push to GitHub
echo "🚀 Pushing to GitHub..."
git push origin main

echo "✅ Deployment completed successfully!"
echo "🌐 Your site should be available at: https://yourusername.github.io/your-repo-name/"
echo "⏰ It may take a few minutes for changes to appear." 