# Capstone

![Build verified](https://github.com/rikuVan/devops-capstone/actions/workflows/verify.yml/badge.svg)

## Prerequisites

1. You must have AWS_CREDENTIALS env variable set to run the project locally. This includes the key and secret associated with the s3 bucket separated by a colon.
```
export AWS_CREDENTIALS=key:secret
```

2. To develop locally you also need Java 17 SDK installed.

## Getting started

You can run a number of useful commands with `make`: 
    - `env` to check your have the required environment set
    - `test` and `lint`for validating the application
    - `run` to run the app locally with gradle
    - `docker-build`, `docker-run`, and `docker-remove` to create a docker image and run it


## Release

To create a new release, creating a new docker image to be deployed.

1. Go to the [new release page](https://github.com/RikuVan/devops-capstone/releases/new)
2. Create a version number and click "Generate release notes"
3. Click "Publish release"
