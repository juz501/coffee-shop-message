/**
 * Configures AWS infrastructure for running the coffee-shop-message function.
 *
 * To use, download Terraform and run `terraform init` followed by `terraform apply`.
 * To set variables, edit ./vars.tf.
 * For full instructions, see README.md.
 *
 * This file sets up Terraform, including remote state management. Infrastructure itself is managed
 * in other .tf files in this directory.
 *
 * @author Tim Malone <tdmalone@gmail.com>
 */

/**
 * AWS provider configuration, with version constraints.
 * Credentials are taken from the usual AWS authentication methods such as environment variables.
 *
 * @see https://www.terraform.io/docs/providers/aws/index.html
 * @see https://www.terraform.io/docs/configuration/providers.html#provider-versions
 */
provider "aws" {
  version    = "~> 1.14"
  region     = "ap-southeast-2"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

/**
 * Make the current AWS region accessible as a data attribute.
 *
 * @see https://www.terraform.io/docs/providers/aws/d/region.html
 * @see https://www.terraform.io/docs/configuration/data-sources.html
 */
data "aws_region" "current" {}

/**
 * Make the current AWS account accessible as a data attribute.
 *
 * @see https://www.terraform.io/docs/providers/aws/d/caller_identity.html
 * @see https://www.terraform.io/docs/configuration/data-sources.html
 */
data "aws_caller_identity" "current" {}
