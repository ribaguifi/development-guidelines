# GitHub - usage

1. Generally, one branch per issue (read [branch-naming-convention](git-branch-naming-convention.md)).

    Lifecycle of the branch: create branch --> create PR --> review --> (apply changes) --> merge --> delete branch
    - PR title: describe in a few words what this pull request fixes/implements
    - PR description:
        - Include description and list of changes made
        - Expected behaviour
        - Screenshots (if changes affects **frontend**)
2. One change/idea per commit (make history more readable and help reverting commits if there are wrong or innecesary changes).

3. Keep up to date issues status. If they are solved, then close them. You can take avantage of the autoclose feature (e.g. adding an [keyword on the commit](https://github.blog/2013-01-22-closing-issues-via-commit-messages/) or in the [PR description](https://github.blog/2013-05-14-closing-issues-via-pull-requests/)).

## Pull requests review

When someone requests you a review of a PR:
1. First of all, read and understand the specs and expected behaviour included on the PR description.
2. Review and understand the changes of the code (do not forget the code related to tests). If you are in a trouble and it's hard to understand it, request the author to refactor it (e.g. too complex methods, non descriptive variables names...).
3. Test that code works as expected (it has the behaviour described by the specs). Besides normal use cases remeber to test [edge cases](https://en.wikipedia.org/wiki/Edge_case).
4. If you found a bug:
    - Include the steps to reproduce it.
    - If it is a frontend issue include:
        - Screenshots of the things to fix (better if they have a circle or arrow pointing the problem).
        - Include the browser version used during the test.
        - Sometimes a video is the best way to describe the issue.


## Create release

1. Update CHANGELOG.md
2. Set version X.X (final) on `module/__init__.py`
3. Create release commit:
    ```
    git commit  -m "Release version 1.4"
    ```
4. Add git tag X.X after merging to master branch
    ```
    git tag -l -n9  # show current tags
    git tag -a v1.4 -m "Released version 1.4"
    ```
5. Push tags to origin
    `git push origin --tags`
6. Bump to next version after release
    ```
    # update module/__init__.py
    VERSION = (1, 4, 1, 'alpha', 0)
    ```
