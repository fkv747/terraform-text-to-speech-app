# Terraform Text-to-Speech App

A serverless, infrastructure-as-code application that converts text to speech using Amazon Polly, deployed entirely with Terraform.

This project combines the power of AWS Lambda, API Gateway, S3, and Amplify to deliver a modern, full-stack solution — all without manually touching the AWS Console.

---

## Demo

[Watch the YouTube video](https://your-demo-link.com)  
Built in less than a day using Terraform modules and AWS services.

> This demo is no longer live to reduce cloud costs.  
> But you can deploy your own version in minutes using the instructions below.

---

## App Architecture

User Input (Amplify) ↓ API Gateway (HTTP API v2) ↓ Lambda (Python) — Calls Polly + Uploads to S3 ↓ S3 — Generates presigned URL for audio ↓ Returns audio URL to Amplify frontend

---

## Tech Stack

- Infrastructure: Terraform (modular)
- Frontend: Static HTML/CSS/JS (Amplify deployed)
- Backend: AWS Lambda (Python)
- Cloud Services:
  - Amazon Polly (Text-to-Speech)
  - S3 (audio file storage)
  - API Gateway (HTTP)
  - IAM (role + permission control)
  - Amplify (hosting frontend)

---

## Features

- Converts text into `.mp3` audio using Polly
- Uploads audio to S3 and returns a presigned URL
- Deployable via Terraform from scratch
- CORS-safe and Amplify-friendly
- Clean and modern mobile-style UI

---

## Folder Structure

```text
/text-to-speech-backend/
├── main.tf
├── modules/
│   ├── amplify/
│   ├── api_gateway/
│   ├── lambda/
│   ├── iam/
│   └── s3/
├── lambda/
│   └── polly_handler.py
├── frontend/
│   └── index.html
├── .gitignore
├── outputs.tf
├── README.md
└── terraform.lock.hcl
```
---

## How to Deploy Your Own

### Prerequisites
- Terraform CLI installed
- AWS CLI configured (`aws configure`) or credentials loaded via environment variables

### Steps

```bash
# Clone this repo
git clone https://github.com/YOUR_USERNAME/terraform-text-to-speech-app.git
cd terraform-text-to-speech-app

# Zip your Lambda function
cd lambda
zip function.zip polly_handler.py -r
cd ..

# Deploy infrastructure
terraform init
terraform apply
```
Manual Step (Frontend)
- Go to the Amplify Console
- Open the main branch
- Click "Manual deploy" and upload frontend.zip from the frontend/ folder

Built by Kev
This project was a Terraform-first rebuild of my original AWS text-to-speech app — now fully modular, reproducible, and cloud-native.
