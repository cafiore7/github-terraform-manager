# GITHUB-TERRAFORM-MANAGER

This is a work in progress project. I was inspired by a similar repository I build for my employer for Gitlab. As I used Github for personal projects, I thought it would be beneficial to understand their Terraform Provider also.

## Getting Started

This project is primarily for my own personal learning with the future goal of having a full fledged module I can refer to.

### Prerequisites

* Have Terraform installed (version requires is specified in versions.tf) 
* If you want to store you remote state in the cloud you will need to set up an account with a cloud provider or another solution and provision a resource to hold the state (ex. an S3 bucket)

## Usage

You will need to generate you own key in Github to add as your ```var.token```. With this repo, the intent is primarily to keep a majority of the modifications required contained within the ```variable.tf``` file. This provides a central location for most of the key information and minimizise having to hunt through other files.

## Deployment

* Terraform Plan/Apply/Fmt
* Recommend running you commands in the format ```TF_VAR_token="<<yourtokenhere>>" plan/apply``` or storing your token in a local ```.tfvars``` file and setting up a .gitignore. That way you pass the required github token before the command prompts you for it (quality of life)

### Server

* Local only (at this time)

### Branches

* Main

## Additional Documentation and Acknowledgments

* I will primarily be folowing the Terraform style guide of my former co-worker found [here](https://github.com/jonbrouse/terraform-style-guide) 

