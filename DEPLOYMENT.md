# 🚀 Deployment Guide

This guide will help you deploy your Flutter portfolio to GitHub Pages.

## Quick Start (Recommended)

### 1. Push to GitHub
```bash
git push origin main
```

### 2. Enable GitHub Pages
1. Go to your repository on GitHub
2. Navigate to **Settings** → **Pages**
3. Under **Source**, select **"Deploy from a branch"**
4. Choose **"gh-pages"** branch and **"/ (root)"** folder
5. Click **Save**

### 3. Wait for Deployment
- GitHub Actions will automatically build and deploy your site
- Your site will be available at: `https://yourusername.github.io/your-repo-name/`
- It may take 2-5 minutes for the first deployment

## Manual Deployment

If you prefer manual deployment, use the provided scripts:

### Windows
```bash
deploy.bat
```

### Linux/Mac
```bash
chmod +x deploy.sh
./deploy.sh
```

## Troubleshooting

### Common Issues

1. **Site not loading**
   - Check if GitHub Actions completed successfully
   - Verify GitHub Pages is enabled in repository settings
   - Wait 5-10 minutes for changes to propagate

2. **Build errors**
   - Check the Actions tab in your repository
   - Ensure all dependencies are properly declared in `pubspec.yaml`

3. **Images not loading**
   - Verify image paths in `assets/images/`
   - Check that images are included in `pubspec.yaml`

### GitHub Pages Settings

- **Source**: Deploy from a branch
- **Branch**: gh-pages
- **Folder**: / (root)
- **Custom domain**: Optional (add your domain here)

## Custom Domain Setup

1. **Add CNAME file**
   ```bash
   echo "yourdomain.com" > docs/CNAME
   ```

2. **Configure DNS**
   - Add CNAME record: `yourdomain.com` → `yourusername.github.io`
   - Add A record: `@` → `185.199.108.153`

3. **Enable HTTPS**
   - GitHub Pages will automatically provision SSL certificate

## Performance Tips

1. **Optimize images**
   - Use WebP format when possible
   - Compress images before adding to assets

2. **Enable caching**
   - GitHub Pages automatically handles caching
   - Consider using CDN for better performance

## Support

If you encounter issues:
1. Check the GitHub Actions logs
2. Verify your repository settings
3. Ensure all files are properly committed 