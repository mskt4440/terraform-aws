# Network
Terraform scripts which build VPC, subnets, nacl, VPC flowlogs and related components on AWS.

## Summary
- VPCの作成
- Internet Gatewayの作成
- NAT Gatewayの作成
- Public Subnets の作成
    - internetから直接reach可能。
- Protected Subnets の作成
    - VPC内からのみreach可能。NAT Gatwway経由でinternetにreach可能。
- Private Subnets の作成
    - VPC内からのみreach可能。internetへの経路なし。
- 各Subnet用Route tableの作成とAssociation
- Public Subnets用Network ACLの作成
- Protected Subnets用Network ACLの作成
- Private Subnets用Network ACLの作成
- VPC flowlogをS3/cloudwatch logsに転送

## Usage
- crearte varfile
- create a bucket for Terraform S3 backend
```bash
aws s3 mb s3://[bucket name]
aws s3api put-bucket-versioning --bucket [bucket name] --versioning-configuration Status=Enabled
aws s3api put-public-access-block --bucket [bucket name] --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
```
- create backend.terraformrc file
- init Terraform 
```bash
terraform init -backend-config=backend.terraformrc
```
- exex Terrafrom
```bash
terraform [plan|apply|destroy] -var-file=<varfile>
```