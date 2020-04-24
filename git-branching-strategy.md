# Git branching strategy (proposal)

We want to keep our branch strategy simple, following these three concepts:
- Use feature branches for all new features and bug fixes.
- Merge feature branches into the *master* branch using pull requests.
- Keep a high quality, up-to-date *master* branch.

## Git branches usage and description
These are the main branches used on the repositories, other existing branches should be considered as *private* (i.e. feature branch).

- **master** branch: it is the **main branch** of the development workflow. It's where all the new features are merged to. When the code is stable enough it's merged into *master*. This branch is (usually) used to deploy code to the testing server.
- **stable** branch: contains the stable code. It's production ready code, so this branch is (usually) used to deploy code on the production server.


### Use feature branches for your work
Develop your features and fix bugs in feature branches based off your *master* branch. These branches are also known as topic branches. Feature branches isolate work in progress from the completed work in the master branch. Git branches are inexpensive to create and maintain. Even small fixes and changes should have their own feature branch.

![image](https://media-protected.taiga.io/attachments/0/0/e/1/711d2e63f86f41ae7da6c6147a23c2d2054475a2a8c28c6b45d3754dc68e/feature-branching.png?token=XqBDqQ%3AC0ydhk0nt2PEf93XpZgpH5fmLGwXLof_nZP0n7Sd1ueajuS7WCTNB12Z7p5Nw0D5OlGP8tI8uT5BlemFg-FjVg)

Creating feature branches for all your changes makes reviewing history simple. Look at the commits made in the branch and look at the pull request that merged the branch.

### Name your feature branches by convention
Use a consistent naming convention for your feature branches to identify the work done in the branch.
- `bugfix/description`
- `feature/feature-name`
- `hotfix/description`

### Review and merge code with pull requests
The review that takes place in a pull request is critical for improving code quality. Only merge branches through pull requests that pass your review process. Avoid merging branches to the *master* branch without a pull request.

Some suggestions for successful pull requests:
- Two reviewers is an optimal number.
- Share acrross the team reviewer responsibilities.
- Provide enough detail in the description to quickly bring reviewers up to speed with your changes.
- [FUTURE] Include a build or linked version of your changes running in a staged environment with your pull request. Others can easily test the changes. **TODO(@slamora): how to provide that staged environment automatically?**

### Keep a high quality, up-to-date master branch
The code in master branch should pass tests, build cleanly, and always be current. master branch needs these qualities so that feature branches created by your team start from a known good version of code.
1. Pull request should be created to merge code of a topic branch.
2. Build should be suscess to complete a pull request.
3. Topic branch used on a pull request should be up to date with *master* branch. If topic branch is behind *master* branch uses a fast-forward merge approach:
    ```
    git checkout master
    git pull
    git checkout feature/my-new-feature
    git merge master

    # (optional) resolve conflicts if any
    ...
    git commit

    # publish your branch and create pull request
    git push -u origin feature/my-new-feature
    ```

## Releases
This project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

Steps to launch a new release:
1. Check that build is successful.
2. Update CHANGELOG (format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)) including release version and release publication date.
3. Update version number on the code.
4. Commit these changes with a descriptive message:
    ```
    git add CHANGELOG.md file_with_version_number
    git commit -m "Release version 0.4"
    ```
5. Add git tag and share tags
    ```
    git tag -a v0.4 -m "Released version 0.4"
    git push origin --tags
    ```
6. Hooray! You have released a new version!

#### References
- [Choose the right Git branching strategy | Creative Bloq ](https://www.creativebloq.com/web-design/choose-right-git-branching-strategy-121518344). Retrieved 2020-04-15.
- [Adopt a Git branching strategy](https://docs.microsoft.com/en-us/azure/devops/repos/git/git-branching-guidance?view=azure-devops). Retrieved 2020-04-16.
- [A successful Git branching model - nvie.com](https://nvie.com/posts/a-successful-git-branching-model/). Retrieved 2020-04-14.
