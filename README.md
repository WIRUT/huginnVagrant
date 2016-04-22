Repo Setup

One group member will need to integrate some template code. Start as instructed in GitLab:

mkdir our-awesome-project
cd our-awesome-project
git init
touch README.md
git add README.md
git commit -m "first commit"
git remote add origin git@csil-git1.cs.surrey.sfu.ca:group_or_userid/our-awesome-project.git
git push -u origin master
Then get the project code as well:

git remote add template git@csil-git1.cs.surrey.sfu.ca:ggbaker/470-project-template.git
git fetch template
git merge template/master
git push
These commands will merge in the template code I have provided, but you can then can modify in your repository as necessary.
