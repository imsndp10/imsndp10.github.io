#!/bin/bash
# project_scan.sh — Scan Quarto project structure (macOS compatible)

echo "🔍 Scanning current Quarto project..."
echo "========================================"

# 1. Show folder tree (excluding .git and large binary dirs)
echo "📂 Project structure:"
find . \
  -path "./.git" -prune -o \
  -path "./.quarto" -prune -o \
  -type d -o -type f \
  | sed 's|^\./||' | sort

echo
echo "========================================"

# 2. Show main Quarto files (.qmd, .md, _quarto.yml)
echo "📝 Quarto-related files:"
find . \
  -path "./.git" -prune -o \
  -name "*.qmd" -o -name "*.md" -o -name "_quarto.yml" \
  | sed 's|^\./||' | sort

echo
echo "========================================"

# 3. Show recent modified files (last 7 days)
echo "🕒 Recently modified (last 7 days):"
find . \
  -path "./.git" -prune -o \
  -type f -mtime -7 \
  | sed 's|^\./||' | sort

echo
echo "✅ Scan complete."
