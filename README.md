# GCP VM Terraform

A [Terraform](https://en.wikipedia.org/wiki/Terraform_(software)) configuration to provision Linux VM in Google Cloud Platform (GCP).

## Prerequisites

* Create a Google Cloud account

## STEPS

* Create a google project in the [GCP Console](https://cloud.google.com/).

* Create Service account through API credential with name `deploy_terraform` in [serviceaccountkey](https://console.cloud.google.com/apis/credentials/).

* Create a key for the new service account credential in `json` format. Download and store in a safe place.

* Set IAM Credential with *Editor*, *Admin* permissions over `[Computer Engine](https://cloud.google.com/compute)`.

* Clone this repository `git@gitlab.com:0xnu/gcp_vm_terraform.git`

```bash
git clone git@gitlab.com:0xnu/gcp_vm_terraform.git
cd gcp_vm_terraform
```

### Authentication
When `json` credential is created on the service account, a `json` file holding credentials is downloaded only once. Authentication can be done by setting path for account file in `terraform` or by setting google `environment` variable. By default, this project uses terraform method.

- `environment`: Set system environment path variable for credential file.

```
export GOOGLE_CLOUD_KEYFILE_JSON={{path_account_file.json}}
```

- `terraform`: Adding the credential argument into `provider.tf`

```
credentials = file("config/account_file.json")
```

> The credential file can be stored in project repository if `.gitignore` is used to avoid pushing credentials.

## Deploy

* Adjust desired vars in `config/vars.tfvars` file:

> `project, region, zone, vm_type, name, imagedisk`

* Init the terraform backend

```
terraform init
```

* Generate and show the plan

```
terraform plan -var-file=config/vars.tfvars
```

* Apply the plan

```
terraform apply -var-file=config/vars.tfvars
```

## Destroy

* Destroy the resources with a single terraform command

```
terraform destroy -var-file=config/vars.tfvars
```

## Authors

- **Finbarrs Oketunji** _aka 0xnu_ - _Main Developer_ - [0xnu](https://github.com/0xnu)

## License

This project is licensed under the [WTFPL License](LICENSE) - see the file for details.

## Copyright

(c) 2020 [Finbarrs Oketunji](https://finbarrs.eu).

