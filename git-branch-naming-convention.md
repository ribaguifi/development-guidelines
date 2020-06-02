# Git branch naming convention

Branch naming convention: `<work type>/<issue-number>-<short-description>`
1. Start clasifying by **work type**. Examples: `bugfix`, `feature`, `refactor`.
2. Use **dashes** `-` to separate words.
3. Include related issue **number** (if any).
4. Describe the topic using **two or three words**.



Examples
- `refactor/121-i18n-translation-ready`
- `bugfix/96-cannot-delete-survey`
- `feature/45-manage-survey-observations`

**TIPS**: avoid using non ascii chars (e.g. '#') because mades less readable GitHub/GitLab URLs. e.g. for branch named `i18n_#121` the URL will be `https://github.com/ribaguifi/sample/tree/i18n_%23121`

## References
- https://namingconvention.org/git/branch-naming.html
- https://allenan.com/git-branch-naming-conventions/
- https://docs.microsoft.com/en-us/azure/devops/repos/git/git-branching-guidance?view=azure-devops#name-your-feature-branches-by-convention
- https://community.atlassian.com/t5/Git-questions/What-branch-name-conventions-do-you-use/qaq-p/510537
