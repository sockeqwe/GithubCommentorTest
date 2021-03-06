#!/bin/bash
sha=`git rev-parse HEAD`

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

if [ "$TRAVIS_PULL_REQUEST_SHA" = "" ]; then
   echo "No pull request.  Skipping Github Commentor ..."
else
   java -jar .ci/githubcommentor.jar -file .ci/comments.xml -owner sockeqwe -repository GithubCommentorTest -pullrequest $TRAVIS_PULL_REQUEST -sha $TRAVIS_PULL_REQUEST_SHA -accesstoken $ACCESS_TOKEN
fi

