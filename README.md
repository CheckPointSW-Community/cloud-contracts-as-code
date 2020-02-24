# Cloud Contracts as Code

Examples of using Dome9 Terraform Provider to build a Cloud Security Contract or Compliance Ruleset

## Sample Cloud Security Contract

- Storage Buckets must always be encrypted
- Storage buckets must always be Private unless tagged with: PublicBucketXYZ
- Load Balancers use TLS 1.2 and above
- In PROD and STAGE only use RHEL 7.3
- Everyone must use SSO with MFA enabled
- DEV should only use US-East2 or US-West2