#! /bin/bash

original=$1
revised=$2

# Prepare the original tex file
git worktree add worktree-original -b original
(
  cd ./worktree-original
  git reset --hard
  git checkout $original
  make assemble
)

# Prepare the revised tex file
git worktree add worktree-revised -b revised
(
  cd ./worktree-revised
  git reset --hard
  git checkout $revised
  make assemble
)

# Get Diff
git worktree add worktree-diff -b diff
(
  cd ./worktree-diff
  git reset --hard
  git checkout $revised
  # TODO: remove magic numbers
  latexdiff \
    ../worktree-original/generated/main-assemble.tex \
    ../worktree-revised/generated/main-assemble.tex \
    2> error.log > src/main.tex
  latexdiff \
    ../worktree-original/generated/main-assemble.tex \
    ../worktree-revised/generated/main-assemble.tex \
    > tmp.tex
  make document
  cp generated/main.pdf ../diff.pdf
)

# Remove worktrees
rm worktree-original worktree-revised worktree-diffj -rf
git worktree prune
git branch -d original revised diff
