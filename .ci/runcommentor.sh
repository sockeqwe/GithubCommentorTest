#!/bin/bash
sha=`git rev-parse HEAD`
SLUG="sockeqwe/GithubCommentorTest"
JDK="oraclejdk8"
BRANCH="master"

echo "sha = $sha"

echo "CI_PULL_REQUEST = $CI_PULL_REQUEST"
echo "CI_PULL_REQUEST = $CIRCLE_PULL_REQUESTS"
echo "CIRCLE_PR_NUMBER = $CIRCLE_PR_NUMBER"
echo "CIRCLE_BRANCH = $CIRCLE_BRANCH"

echo "TRAVIS_PULL_REQUEST = $TRAVIS_PULL_REQUEST"
echo "TRAVIS_PULL_REQUEST_BRANCH = $TRAVIS_PULL_REQUEST_BRANCH"
echo "TRAVIS_PULL_REQUEST_SHA = $TRAVIS_PULL_REQUEST_SHA"
echo "TRAVIS_PULL_REQUEST_SLUG = $TRAVIS_PULL_REQUEST_SLUG"
echo "TRAVIS_REPO_SLUG = $TRAVIS_REPO_SLUG" 

if [ "$TRAVIS_REPO_SLUG" = "$SLUG" ] && ["$TRAVIS_BRANCH" = "$BRANCH"]; then
   echo "No pull request. Therefore skipping Github Commentor"
else
   java -jar .ci/githubcommentor.jar -file .ci/comments.xml -owner sockeqwe -repository GithubCommentorTest -pullrequest $TRAVIS_PULL_REQUEST -sha $sha -accesstoken $ACCESS_TOKEN
fi

