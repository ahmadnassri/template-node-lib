## Features

#### CI Automation

> Using [GitHub Actions]

- release with [conventional-commits] & [semantic-release]
- publish to both npm Public Registry & GitHub Package Manager
- full history changelog in [GitHub Releases]
- automatic pull-requests for dependency updates using [dependabot]
- automatic merging of "patch" updates to dependencies using [dependabot-auto-merge]
- lint everything with [mega-linter]
- lint commit message format against [Conventional Commits]
- test on all LTS versions of Node.js
- run `npm audit` before releasing / testing to keep a higher security standard
- repositories are kept up to date using [`@ahmadnassri/action-template-repository-sync`][]

##### Local Automation

> Using [Docker Compose]

- lint everything with [mega-linter]
- test on all LTS versions of Node.js
- generate README using [pandoc] with a [template](./docs/README.template)

## Usage

#### GitHub Templates

> Automated through [`@ahmadnassri/action-template-repository-sync`][]

1. create a repository from the template
1. clone locally
1. add secrets in GitHub Actions for `NPM_TOKEN` & `GH_TOKEN`
1. update `colophon.yml`, `docs/README.md` with info about the project
  
> **Note:**  
> `GH_TOKEN` is required for action `auto-merge`, `readme`, `release` workflows

## Local Automation

use [Docker Compose][docker compose] to run tasks locally:

- `docker compose run readme` to regenerate `README.md`
- `docker compose run test` to run tests across all LTS versions of Node.js
- `docker compose run lint` to execute [mega-linter] locally

> **Note:**  
> Your main `README.md` file is in `docs/README.md`, the file at root is generated using [pandoc] using the provided [template][].  
>
> You should run `docker compose run readme` after any change to `docs/README.md` and before commit / push

[template]: ./docs/README.template
[GitHub Releases]: /template-node-lib/releases
[conventional-commits]: https://www.conventionalcommits.org/
[dependabot-auto-merge]: https://github.com/marketplace/actions/dependabot-auto-merge
[dependabot]: https://dependabot.com/
[Docker Compose]: https://docs.docker.com/compose/
[GitHub Actions]: https://github.com/features/actions
[pandoc]: https://pandoc.org/
[semantic-release]: https://github.com/marketplace/actions/conventional-semantic-release
[mega-linter]: https://oxsecurity.github.io/megalinter/
[Conventional Commits]: https://www.conventionalcommits.org/en/v1.0.0/
[`@ahmadnassri/action-template-repository-sync`]: https://github.com/ahmadnassri/action-template-repository-sync
