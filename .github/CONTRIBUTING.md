# Contributing to CloudflarePS

We welcome and appreciate contributions from the community.

There are many ways to become involved with CloudflarePS including:

- Filing issues
- Writing and improving documentation
- Contributing to the code

Please read the rest of this document to ensure a smooth contribution process.

## Intro to Git and GitHub

* Make sure you have a [GitHub account](https://github.com/signup/free).
* GitHub Help: [Good Resources for Learning Git and GitHub][good-git-resources]
* [GitHub Flow Guide](https://guides.github.com/introduction/flow/): step-by-step instructions of GitHub Flow

## Contributing to Issues

* Check if the issue you are going to file already exists in our [GitHub issues][open-issue].
* If you can't find your issue already, [open a new issue][new-issue], making sure to follow the directions as best you can.
* If the issue is marked as [`Up-for-Grabs`][up-for-grabs], I am looking for help with the issue.

## Contributing to Documentation

Please see the [`docs` folder][docs-folder] which contains the markdown help of the module and functions.

## Contributing to Code

### Code Editor

You should use [VSCode][vscode] as we have defined rules regarding formatting which [VSCode][vscode] will force.

If you do choose to use a different code editor please make sure you adhere to the [Style Guide][style-guide]

### Testing

Tests should be performed locally and pass all tests before committing and submitting a pull request. Tests can be run locally using the following command:

```powershell
Invoke-Pester -Path './Tests'
```

### Forks and Pull Requests

GitHub fosters collaboration through the notion of [pull requests][using-prs].
On GitHub, anyone can [fork][fork-a-repo] an existing repository into their own user account, where they can make private changes to their fork.
To contribute these changes back into the original repository, a user simply creates a pull request in order to "request" that the changes be taken "upstream".

Additional references:

* GitHub's guide on [forking][forking]
* GitHub's guide on [Contributing to Open Source][contributing-to-open-source]
* GitHub's guide on [Understanding the GitHub Flow][understanding-the-github-flow]

### Lifecycle of a pull request

#### Before submitting

* To avoid merge conflicts, make sure your branch is rebased on the `master` branch of this repository.
* Many code changes will require new tests, so make sure you've added a new test if existing tests do not effectively test the code changed.
* Clean up your commit history. Each commit should be a **single complete** change. This discipline is important when reviewing the changes as well as when using `git bisect` and `git revert`.

#### Pull request - Submission

**Always create a pull request to the `master` branch of this repository**.

* If you're contributing in a way that changes the user or developer experience, you are expected to document those changes.
* Add a meaningful title of the PR describing what change you want to check in.

#### Pull Request - Automatic Checks

* After submitting your pull request, our CI system (AppVeyor and Travis CI) will run a suite of tests and automatically update the status of the pull request.



[good-git-resources]: https://help.github.com/articles/good-resources-for-learning-git-and-github/
[open-issue]: https://github.com/GavinEke/CloudflarePS/issues
[new-issue]: https://github.com/GavinEke/CloudflarePS/issues/new
[up-for-grabs]: https://github.com/GavinEke/CloudflarePS/issues?q=is%3Aopen+is%3Aissue+label%3AUp-for-Grabs
[docs-folder]: ../docs/
[vscode]: https://code.visualstudio.com/
[style-guide]: http://gavineke.com/PowerShellStyleGuide/
[using-prs]: https://help.github.com/articles/using-pull-requests/
[fork-a-repo]: https://help.github.com/articles/fork-a-repo/
[forking]: https://guides.github.com/activities/forking/
[contributing-to-open-source]: https://guides.github.com/activities/contributing-to-open-source/#pull-request
[understanding-the-github-flow]: https://guides.github.com/introduction/flow/
