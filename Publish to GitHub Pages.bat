@echo off
title Publish the presentation to GitHub Pages
cd /d "%~dp0"
where git >nul 2>nul || (echo Git is not installed. Install it from https://git-scm.com and run this again. & pause & exit /b 1)
set REPO=https://github.com/goryckilukasz-skyscraper/l2-sim-racing-platform.git
if not exist ".git" (
  git init -b main
  git remote add origin %REPO%
)
git add -A
git -c user.name="Lukasz Gorycki" -c user.email="gorycki.lukasz@gmail.com" commit -m "Update presentation" 
git push -u origin main
if errorlevel 1 (echo. & echo The push did not go through. Check that the empty repository l2-sim-racing-platform exists on GitHub, then run this again.) else (echo. & echo Done. Turn on Pages once: repository Settings, Pages, Branch main, folder root. The address is https://goryckilukasz-skyscraper.github.io/l2-sim-racing-platform/)
pause
