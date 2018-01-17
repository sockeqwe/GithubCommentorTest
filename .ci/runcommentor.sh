if [ "$CI_PULL_REQUEST" = "" ]
then
   echo "No pull request. Therefore skipping Github Commentor"
else
   echo $CI_PULL_REQUEST"
   java -jar .ci/githubcommentor.jar -file .ci/comments.xml -owner sockeqwe -repository GithubCommentorTest -pullrequest $CI_PULL_REQUEST -sha $CIRCLE_SHA1 -accessToken $token
fi

