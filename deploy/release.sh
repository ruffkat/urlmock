#!/bin/bash
# Set the version to build
mvnw versions:set -e -B -DnewVersion=${TRAVIS_TAG} -DgenerateBackupPoms=false
# Build, install, test then publish the artifacts
mvnw clean deploy -e -B -settings .mvn/settings.xml -P ossrh
# Set the next development snapshot version
mvnw release:update-versions -e -B -P ossrh
# Commit the changes
git checkout -b release/${TRAVIS_TAG}
git add pom.xml
git commit --message "Next development version (build: ${TRAVIS_BUILD_NUMBER})"
git remote add origin git@github.com:ruffkat/urlmock.git >/dev/null 2>&1
git push --set-upstream origin release/${TRAVIS_TAG} --quiet
