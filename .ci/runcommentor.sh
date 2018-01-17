echo "CI_PULL_REQUEST = $CI_PULL_REQUEST"
echo "CI_PULL_REQUEST = $CIRCLE_PULL_REQUESTS"
echo "CIRCLE_PR_NUMBER = $CIRCLE_PR_NUMBER"
echo "CIRCLE_BRANCH = $CIRCLE_BRANCH"

if [ "$CI_PULL_REQUEST" = "" ]
then
   echo "No pull request. Therefore skipping Github Commentor"
else
   java -jar .ci/githubcommentor.jar -file .ci/comments.xml -owner sockeqwe -repository GithubCommentorTest -pullrequest $CI_PULL_REQUEST -sha $CIRCLE_SHA1 -accesstoken $ACCESS_TOKEN
fi

