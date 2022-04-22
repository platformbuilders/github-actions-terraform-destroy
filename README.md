# Terraform destroy actions

GitHub action used in Terraform destroy workflow

## Inputs

- **TERRAFORM_DESTROY_STEP:** Tell to the action if it's a step before or after terraform destroy;
- **ENVIRONMENT:** The GCP environment;
- **REGION:** The GCP region;
- **SERVICE:** The GCP service;
- **RESOURCE:** The GCP resource name;
- **GITHUB_TOKEN:** The github token used to open PR;

**OBS.:** All inputs are **required**

## Outputs

There are no outputs for this action

## Example usage

```yaml
      - name: Terraform destroy prepare step
        uses: platformbuilders/github-actions-terraform-destroy@master
        with:
          TERRAFORM_DESTROY_STEP: 'before-destroy'
          ENVIRONMENT: ${{ github.event.inputs.environment }}
          REGION: ${{ github.event.inputs.region }}
          SERVICE: ${{ github.event.inputs.service }}
          RESOURCE: ${{ github.event.inputs.resource }}"
          GITHUB_TOKEN: ${{ secrets.BB_GITHUB_TOKEN }}
```

## How to send updates?
If you wants to update or make changes in module code you should use the **develop** branch of this repository, you can test your module changes passing the `@develop` in module calling. Ex.:

```yaml
      - name: Terraform destroy prepare step
        uses: platformbuilders/github-actions-terraform-destroy@develop
        with:
          TERRAFORM_DESTROY_STEP: 'before-destroy'
          ENVIRONMENT: ${{ github.event.inputs.environment }}
          REGION: ${{ github.event.inputs.region }}
          SERVICE: ${{ github.event.inputs.service }}
          RESOURCE: ${{ github.event.inputs.resource }}"
          GITHUB_TOKEN: ${{ secrets.BB_GITHUB_TOKEN }}
```

After execute all tests you can open a pull request to the master branch.