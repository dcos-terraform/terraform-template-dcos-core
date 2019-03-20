package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	yaml "github.com/smallfish/simpleyaml"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
func TestBase(t *testing.T) {

	t.Parallel()

	expectedIP := "expected_ip"

	multiLineText := `foo
bar
baz
`

	//ugly workaround for -var issue with terratest
	escapedMultiLineText := strings.Replace(multiLineText, "\n", "\\n", -1)

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/base",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"bootstrap_private_ip":              expectedIP,
			"dcos_fault_domain_detect_contents": escapedMultiLineText,
			"dcos_ip_detect_contents":           escapedMultiLineText,
			"dcos_ip_detect_public_contents":    escapedMultiLineText,
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
	ip_detect_contents, err := config.Get("ip_detect_contents").String()
	assert.NoError(t, err)
	assert.Equal(t, multiLineText, ip_detect_contents)
}
