#!/bin/bash
git add pom.xml
git commit --message "Next development version (build: ${TRAVIS_BUILD_NUMBER})"
git remote add origin git@github.com:ruffkat/urlmock.git >/dev/null 2>&1
git push --set-upstream origin master --quiet
