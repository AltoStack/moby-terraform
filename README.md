# Moby Terraform

Terraform CLI in a Docker image.

## Usage

### Docker Command

```shell script
docker run --rm -v ~/.aws:/home/terraform/.aws -v $(pwd):/opt/app altostack/terraform --version
```

### Docker Compose

```yaml
terraform:
  image: altostack/terraform
  env_file: .env
  volumes:
    - ~/.aws:/home/terraform/.aws
    - .:/opt/app:rw
```

## Build

Update the `TERRAFORM_VERSION` in both `Makefile` and `DockerFile`. Then run:

```shell script
make build
```
