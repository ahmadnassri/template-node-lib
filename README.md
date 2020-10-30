# Node Lib Template

node library project template

[![license][license-img]][license-url]
[![release][release-img]][release-url]
[![super linter][super-linter-img]][super-linter-url]
[![test][test-img]][test-url]
[![semantic][semantic-img]][semantic-url]

## Features

#### CI Automation

> Using [GitHub Actions](https://github.com/features/actions)

  - automatic releases with [conventional-commits](https://www.conventionalcommits.org/) & [semantic-release](https://github.com/marketplace/actions/conventional-semantic-release)
  - full history changelog in GitHub Releases
  - automatic pull-requests for dependency updates using [dependabot](https://dependabot.com/)
  - automatic merging of "patch" updates to dependencies using [dependabot-auto-merge](https://github.com/marketplace/actions/dependabot-auto-merge)
  - lint everything with [super-linter](https://github.com/github/super-linter)
  - test on all LTS versions of Node.js
  - run `npm audit` before releasing / testing to keep a higher security standard

##### Local Automation

> Using [Docker Compose](https://docs.docker.com/compose/)

  - lint everything with [super-linter](https://github.com/github/super-linter)
  - test on all LTS versions of Node.js
  - generate README using [pandoc](https://pandoc.org/) with a [template](./docs/README.template)

## Usage

#### A. GitHub Templates

1.  create a repository from the template
2.  clone locally
3.  run `./template.sh`
4.  add secrets in GitHub Actions for `NPM_TOKEN` & `GH_TOKEN`
5.  update `docs/README.md` with info about the project

> **Note:**
> 
>   - `GH_TOKEN` is required for action `auto-merge` action
>   - `GH_TOKEN` is **NOT** required for other actions, but used as a preferred value anyway

#### B. Ongoing Updates

> to update an existing repo with this template's structure

1.  clone template repo
2.  clone project repo
3.  run `./template --target path/to/project`

## Local Automation

use [Docker Compose](https://docs.docker.com/compose/) to run tasks locally:

  - `docker-compose run readme` to regenerate `README.md`
  - `docker-compose run test` to run tests across all LTS versions of Node.js
  - `docker-compose run lint` to execute [super-linter](https://github.com/github/super-linter) locally

> **Note:**  
> Your main `README.md` file is in `docs/README.md`, the file at root is generated using [pandoc](https://pandoc.org/) using the provided [template](./docs/README.template).
> 
> You should run `docker-compose run readme` after any change to `docs/README.md` and before commit / push

----
> Author: [Ahmad Nassri](https://www.ahmadnassri.com/) &bull;
> Twitter: [@AhmadNassri](https://twitter.com/AhmadNassri)

[license-url]: LICENSE
[license-img]: https://badgen.net/github/license/ahmadnassri/template-node-lib

[release-url]: https://github.com/ahmadnassri/template-node-lib/releases
[release-img]: https://badgen.net/github/release/ahmadnassri/template-node-lib

[super-linter-url]: https://github.com/ahmadnassri/template-node-lib/actions?query=workflow%3Asuper-linter
[super-linter-img]: https://github.com/ahmadnassri/template-node-lib/workflows/super-linter/badge.svg

[test-url]: https://github.com/ahmadnassri/template-node-lib/actions?query=workflow%3Atest
[test-img]: https://github.com/ahmadnassri/template-node-lib/workflows/test/badge.svg

[semantic-url]: https://github.com/ahmadnassri/template-node-lib/actions?query=workflow%3Arelease
[semantic-img]: https://badgen.net/badge/📦/semantically%20released/blue
