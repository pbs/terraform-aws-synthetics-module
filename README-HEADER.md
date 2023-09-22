# PBS TF Synthetics Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-synthetics-module?ref=x.y.z
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

Creates a basic CloudWatch Synthetics Canary, along with the accoutrement to utilize it effectively.

Integrate this module like so:

```hcl
module "synthetics" {
  source = "github.com/pbs/terraform-aws-synthetics-module?ref=x.y.z"

  zip_file = "path/to/file.zip"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

Note that either a `zip_file` or a `canary_script_s3_location` must be provided to provide code for the canary to run.

An example showing how to use Terraform to generate a canary can be found in the [basic example](./examples/basic).

Note that this is not advised for most use-cases. `data` resources in Terraform are assumed to have no side effects (like creating a zip file), and you will run into trouble if you use this approach for frequent canary adjustments.

The recommended workaround for this is to use something external to Terraform (like a bash script or [Terragrunt](https://terragrunt.gruntwork.io/)) to handle the zip file creation, and then use Terraform to deploy the canary.

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs
