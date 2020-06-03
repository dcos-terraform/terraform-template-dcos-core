package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	yaml "github.com/smallfish/simpleyaml"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
func TestBase(t *testing.T) {
	expectedIP := "expected_ip"

	multiLineText := `foo
bar
baz
`

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/base",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"dcos_num_masters":                  "1",
			"bootstrap_private_ip":              expectedIP,
			"dcos_fault_domain_detect_contents": multiLineText,
			"dcos_ip_detect_contents":           multiLineText,
			"dcos_ip_detect_public_contents":    multiLineText,
		},

		// Variables to pass to our Terraform code using -var-file options
		// VarFiles: []string{"varfile.tfvars"},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	configString := terraform.Output(t, terraformOptions, "config")

	config, err := yaml.NewYaml([]byte(configString))
	assert.NoError(t, err)

	// Verify we're getting back the outputs we expect
	resolvers, err := config.Get("resolvers").Array()
	assert.NoError(t, err)
	assert.Equal(t, 2, len(resolvers))
	ipDetectContents, err := config.Get("ip_detect_contents").String()
	assert.NoError(t, err)
	assert.Equal(t, multiLineText, ipDetectContents)
}

func TestVersionService(t *testing.T) {
	versionTests := map[string]map[string]string{
		"1.13.1": map[string]string{
			"download_url":          "https://downloads.dcos.io/dcos/stable/1.13.1/dcos_generate_config.sh",
			"version":               "1.13.1",
			"download_url_checksum": "ff9c69412395705fad7887900ad6204a60c950bfd9ec61b62c91630e92536be0",
			"commit":                "",
		},
		"1.13.5": map[string]string{
			"download_url":          "https://downloads.dcos.io/dcos/stable/1.13.5/dcos_generate_config.sh",
			"version":               "1.13.5",
			"download_url_checksum": "205218299e76267fde5bba7f4e6dec79fbbf7589702e73b9315c3ad4d36bb27a",
			"commit":                "",
		},
		"2.1.0-beta1": map[string]string{
			"download_url":          "https://downloads.dcos.io/dcos/testing/2.1.0-beta1/dcos_generate_config.sh",
			"version":               "2.1.0-beta1",
			"download_url_checksum": "a4dcdbd8680a7553da43757f62e8e55ccc5657e27ca25c29c25dc344e7cbd74f",
			"commit":                "",
		},
	}

	for v := range versionTests {
		terraformOptions := &terraform.Options{
			// The path to where our Terraform code is located
			TerraformDir: "../examples/base",

			// Variables to pass to our Terraform code using -var options
			Vars: map[string]interface{}{
				"dcos_num_masters":     "1",
				"dcos_version":         v,
				"bootstrap_private_ip": "192.168.1.2",
			},

			// Variables to pass to our Terraform code using -var-file options
			// VarFiles: []string{"varfile.tfvars"},

			// Disable colors in Terraform commands so its easier to parse stdout/stderr
			NoColor: true,
		}

		// At the end of the test, run `terraform destroy` to clean up any resources that were created
		defer terraform.Destroy(t, terraformOptions)

		// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
		terraform.InitAndApply(t, terraformOptions)

		// Run `terraform output` to get the values of output variables
		for _, output := range []string{"download_url", "version", "download_url_checksum", "commit"} {
			assert.Equalf(t, versionTests[v][output], terraform.Output(t, terraformOptions, output), fmt.Sprintf("For version: %s output: %s", v, output))
		}
	}
}

func TestVersionAirGapped(t *testing.T) {
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/base",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"dcos_num_masters":          "1",
			"dcos_version":              "2.1.0-beta1",
			"custom_dcos_download_path": "https://downloads.dcos.io/dcos/stable/2.1.0-beta1/dcos_generate_config.sh",
			"bootstrap_private_ip":      "192.168.1.2",
		},

		// Variables to pass to our Terraform code using -var-file options
		// VarFiles: []string{"varfile.tfvars"},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	assert.Equal(t, "https://downloads.dcos.io/dcos/stable/2.1.0-beta1/dcos_generate_config.sh", terraform.Output(t, terraformOptions, "download_url"))
	assert.Equal(t, "2.1.0-beta1", terraform.Output(t, terraformOptions, "version"))
	// we expect thhose to be empty as we're not asking the version serice in this case
	assert.Equal(t, "", terraform.Output(t, terraformOptions, "download_url_checksum"))
	assert.Equal(t, "", terraform.Output(t, terraformOptions, "commit"))
}
