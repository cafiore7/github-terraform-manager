# GITHUB-TERRAFORM-MANAGER

This is a work in progress project. I was inspired by a similar repository I build for my employer for Gitlab. As I used Github for personal projects, I thought it would be beneficial to understand their Terraform Provider also.

## Getting Started

This project is primarily for my own personal learning with the future goal of having a full fledged module I can refer to.

### Prerequisites

* Have Terraform installed (version requires is specified in versions.tf) 
* If you want to store you remote state in the cloud you will need to set up an account with a cloud provider or another solution and provision a resource to hold the state (ex. an S3 bucket)

## Usage

You will need to generate you own key to add as your ```var_github_token```

## Deployment

Terraform Plan/Apply

### Server

* Local only (at this time)

### Branches

* Main

## Additional Documentation and Acknowledgments

* I will primarily be folowing the Terraform style guide of a previous co-worker found [here](https://github.com/jonbrouse/terraform-style-guide) 

