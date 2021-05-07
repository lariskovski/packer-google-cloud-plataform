# Packer Template

> Packer version 1.5.0 introduced support for HCL2 templates as a beta feature. As of version 1.7.0, HCL2 support is no longer in beta and is the **preferred way to write Packer configuration(s)**. - [Hashicorp Docs](https://www.packer.io/guides/hcl/from-json-v1)

- Install [Packer CLI](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli) >=1.7

- Install Ansible

- Install [Google CLI](https://cloud.google.com/sdk/docs/install#deb)

- Create a new project on GCP

- Create a Service Account for Packer

- Criar chave json para SA

- Enable Compute Engine API  for the project

- Add chave json path to env var GOOGLE_APPLICATION_CREDENTIALS

- packer validate ami.pkr.hcl

- packer build ami.pkr.hcl

### Creating Service Account for Packer

~~~~
GCP_PROJECT=""
$ gcloud iam service-accounts create packer \
  --project $GCP_PROJECT \
  --description="Packer Service Account" \
  --display-name="Packer Service Account"

$ gcloud projects add-iam-policy-binding $GCP_PROJECT \
    --member=serviceAccount:packer@$GCP_PROJECT.iam.gserviceaccount.com \
    --role=roles/compute.instanceAdmin.v1

$ gcloud projects add-iam-policy-binding $GCP_PROJECT \
    --member=serviceAccount:packer@$GCP_PROJECT.iam.gserviceaccount.com \
    --role=roles/iam.serviceAccountUser

# Enable Compute Engine API
$ gcloud services enable compute.googleapis.com
~~~~

## Gotchas

- CentOS and recent Debian images have root ssh access disabled by default. Set ssh_username to any user, which will be created by packer with sudo access.

- The machine type must have a scratch disk, which means you can't use an f1-micro or g1-small to build images.

## Sources

[Google Service Accounts Docs](https://cloud.google.com/docs/authentication/production)

[Packer Google Cloud Docs](https://www.packer.io/docs/builders/googlecompute)

[GCP Auth in Github Actions](https://github.com/google-github-actions/deploy-cloudrun#credentials)

[Packer Github Actions](https://github.com/marketplace/actions/packer-github-actions)