# AWS CodeCommit Sync

Keep any Git repo in sync with your AWS CodeCommit repo.

Deploy this AWS SAM app alongside your CodeCommit repo & provide the destination repo's details. Whenever any change is pushed to the CodeCommit repo, it will be automatically synchronized with the destination repo immediately.

Note: Unfortunately, the AWS Serverless App Repo (SAR) doesn't yet support publishing SAM apps that include container-based Lambda functions. So this app can't be published there. :(

If you're interested in the making of this app, check out https://www.qloudx.com/a-serverless-solution-to-keeping-git-repositories-synchronized/.

To Do:
* Don't take source repo creds as params. Use Lambda execution role to clone the repo.
* Store creds securely in Secrets Manager or Param Store. They shouldn't be visible in env vars in Lambda console.
* Clone the source repo only once (outside the Lambda handler) & `git pull` it everytime inside the handler.
