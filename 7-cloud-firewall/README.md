NB. 
Need to add `"networksecurity.googleapis.com"` to activated services in `0-bootstrap/main.tf`. 
Need to add `"roles/compute.networkAdmin"` and `"roles/serviceusage.serviceUsageAdmin"` to `granular_sa_org_level_roles` for `net` in `0-bootstrap/sa.tf`.




1. Use `terraform output` to get the Cloud Build project ID and the networks step Terraform Service Account from 0-bootstrap output. An environment variable `GOOGLE_IMPERSONATE_SERVICE_ACCOUNT` will be set using the Terraform Service Account to enable impersonation.

   ```bash
   export CLOUD_BUILD_PROJECT_ID=$(terraform -chdir="../0-bootstrap/" output -raw cloudbuild_project_id)
   echo ${CLOUD_BUILD_PROJECT_ID}

   export GOOGLE_IMPERSONATE_SERVICE_ACCOUNT=$(terraform -chdir="../0-bootstrap/" output -raw networks_step_terraform_service_account_email)
   echo ${GOOGLE_IMPERSONATE_SERVICE_ACCOUNT}
   ```
