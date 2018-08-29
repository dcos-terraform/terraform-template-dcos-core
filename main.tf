/**
 * DC/OS Core Template
 * ============
 * A Terraform module to install, upgrade, and modify nodes for DC/OS clusters in an automated fashion.
 *
 * EXAMPLE - Bootstrap Node
 * -------
 *
 * ```hcl
 * module "dcos-bootstrap" {
 *    source  = "./modules/dcos-core"
 *    bootstrap_private_ip = "${aws_instance.bootstrap.private_ip}"
 *    dcos_install_mode = "${var.state}"
 *    dcos_version = "${var.dcos_version}"
 *    role = "dcos-bootstrap"
 *    dcos_bootstrap_port = "${var.custom_dcos_bootstrap_port}"
 *    custom_dcos_download_path = "${var.custom_dcos_download_path}"
 *    dcos_public_agent_list = "\n - ${join("\n - ", aws_instance.public-agent.*.private_ip)}"
 *    dcos_audit_logging = "${var.dcos_audit_logging}"
 *    dcos_auth_cookie_secure_flag = "${var.dcos_auth_cookie_secure_flag}"
 *    dcos_aws_access_key_id = "${var.dcos_aws_access_key_id}"
 *    dcos_aws_region = "${coalesce(var.dcos_aws_region, var.aws_region)}"
 *    dcos_aws_secret_access_key = "${var.dcos_aws_secret_access_key}"
 *    dcos_aws_template_storage_access_key_id = "${var.dcos_aws_template_storage_access_key_id}"
 *    dcos_aws_template_storage_bucket = "${var.dcos_aws_template_storage_bucket}"
 *    dcos_aws_template_storage_bucket_path = "${var.dcos_aws_template_storage_bucket_path}"
 *    dcos_aws_template_storage_region_name = "${var.dcos_aws_template_storage_region_name}"
 *    dcos_aws_template_storage_secret_access_key = "${var.dcos_aws_template_storage_secret_access_key}"
 *    dcos_aws_template_upload = "${var.dcos_aws_template_upload}"
 *    dcos_bouncer_expiration_auth_token_days = "${var.dcos_bouncer_expiration_auth_token_days}"
 *    dcos_adminrouter_tls_1_0_enabled = "${var.dcos_adminrouter_tls_1_0_enabled}"
 *    dcos_adminrouter_tls_1_1_enabled = "${var.dcos_adminrouter_tls_1_1_enabled}"
 *    dcos_adminrouter_tls_1_2_enabled = "${var.dcos_adminrouter_tls_1_2_enabled}"
 *    dcos_adminrouter_tls_cipher_suite= "${var.dcos_adminrouter_tls_cipher_suite}"
 *    dcos_ca_certificate_chain_path = "${var.dcos_ca_certificate_chain_path}"
 *    dcos_ca_certificate_key_path = "${var.dcos_ca_certificate_key_path}"
 *    dcos_ca_certificate_path = "${var.dcos_ca_certificate_path}"
 *    dcos_config= "${var.dcos_config}"
 *    dcos_custom_checks = "${var.dcos_custom_checks}"
 *    dcos_dns_bind_ip_blacklist = "${var.dcos_dns_bind_ip_blacklist}"
 *    dcos_enable_docker_gc= "${var.dcos_enable_docker_gc}"
 *    dcos_enable_gpu_isolation= "${var.dcos_enable_gpu_isolation}"
 *    dcos_fault_domain_detect_contents= "${var.dcos_fault_domain_detect_contents}"
 *    dcos_fault_domain_enabled= "${var.dcos_fault_domain_enabled}"
 *    dcos_gpus_are_scarce = "${var.dcos_gpus_are_scarce}"
 *    dcos_l4lb_enable_ipv6= "${var.dcos_l4lb_enable_ipv6}"
 *    dcos_license_key_contents= "${var.dcos_license_key_contents}"
 *    dcos_mesos_container_log_sink= "${var.dcos_mesos_container_log_sink}"
 *    dcos_mesos_dns_set_truncate_bit= "${var.dcos_mesos_dns_set_truncate_bit}"
 *    dcos_mesos_max_completed_tasks_per_framework = "${var.dcos_mesos_max_completed_tasks_per_framework}"
 *    dcos_ucr_default_bridge_subnet = "${var.dcos_ucr_default_bridge_subnet}"
 *    dcos_check_time = "${var.dcos_check_time}"
 *    dcos_cluster_docker_credentials = "${var.dcos_cluster_docker_credentials}"
 *    dcos_cluster_docker_credentials_dcos_owned = "${var.dcos_cluster_docker_credentials_dcos_owned}"
 *    dcos_cluster_docker_credentials_enabled = "${var.dcos_cluster_docker_credentials_enabled}"
 *    dcos_cluster_docker_credentials_write_to_etc = "${var.dcos_cluster_docker_credentials_write_to_etc}"
 *    dcos_cluster_name  = "${coalesce(var.dcos_cluster_name, data.template_file.cluster-name.rendered)}"
 *    dcos_customer_key = "${var.dcos_customer_key}"
 *    dcos_dns_search = "${var.dcos_dns_search}"
 *    dcos_dns_forward_zones = "${var.dcos_dns_forward_zones}"
 *    dcos_docker_remove_delay = "${var.dcos_docker_remove_delay}"
 *    dcos_exhibitor_address = "${aws_elb.internal-master-elb.dns_name}"
 *    dcos_exhibitor_azure_account_key = "${var.dcos_exhibitor_azure_account_key}"
 *    dcos_exhibitor_azure_account_name = "${var.dcos_exhibitor_azure_account_name}"
 *    dcos_exhibitor_azure_prefix = "${var.dcos_exhibitor_azure_prefix}"
 *    dcos_exhibitor_explicit_keys = "${var.dcos_exhibitor_explicit_keys}"
 *    dcos_exhibitor_storage_backend = "${var.dcos_exhibitor_storage_backend}"
 *    dcos_exhibitor_zk_hosts = "${var.dcos_exhibitor_zk_hosts}"
 *    dcos_exhibitor_zk_path = "${var.dcos_exhibitor_zk_path}"
 *    dcos_gc_delay = "${var.dcos_gc_delay}"
 *    dcos_http_proxy = "${var.dcos_http_proxy}"
 *    dcos_https_proxy = "${var.dcos_https_proxy}"
 *    dcos_log_directory = "${var.dcos_log_directory}"
 *    dcos_master_discovery = "${var.dcos_master_discovery}"
 *    dcos_master_dns_bindall = "${var.dcos_master_dns_bindall}"
 *    dcos_master_list = "\n - ${join("\n - ", aws_instance.master.*.private_ip)}"
 *    dcos_no_proxy = "${var.dcos_no_proxy}"
 *    dcos_num_masters = "${var.num_of_masters}"
 *    dcos_oauth_enabled = "${var.dcos_oauth_enabled}"
 *    dcos_overlay_config_attempts = "${var.dcos_overlay_config_attempts}"
 *    dcos_overlay_enable = "${var.dcos_overlay_enable}"
 *    dcos_overlay_mtu = "${var.dcos_overlay_mtu}"
 *    dcos_overlay_network = "${var.dcos_overlay_network}"
 *    dcos_process_timeout = "${var.dcos_process_timeout}"
 *    dcos_previous_version = "${var.dcos_previous_version}"
 *    dcos_agent_list = "\n - ${join("\n - ", aws_instance.agent.*.private_ip)}"
 *    dcos_resolvers  = "\n - ${join("\n - ", var.dcos_resolvers)}"
 *    dcos_rexray_config_filename = "${var.dcos_rexray_config_filename}"
 *    dcos_rexray_config_method = "${var.dcos_rexray_config_method}"
 *    dcos_s3_bucket = "${coalesce(var.dcos_s3_bucket, aws_s3_bucket.dcos_bucket.id)}"
 *    dcos_s3_prefix = "${coalesce(var.dcos_s3_prefix, aws_s3_bucket.dcos_bucket.id)}"
 *    dcos_security  = "${var.dcos_security}"
 *    dcos_superuser_password_hash = "${var.dcos_superuser_password_hash}"
 *    dcos_superuser_username = "${var.dcos_superuser_username}"
 *    dcos_telemetry_enabled = "${var.dcos_telemetry_enabled}"
 *    dcos_use_proxy = "${var.dcos_use_proxy}"
 *    dcos_zk_agent_credentials = "${var.dcos_zk_agent_credentials}"
 *    dcos_zk_master_credentials = "${var.dcos_zk_master_credentials}"
 *    dcos_zk_super_credentials = "${var.dcos_zk_super_credentials}"
 *    dcos_cluster_docker_registry_url = "${var.dcos_cluster_docker_registry_url}"
 *    dcos_rexray_config = "${var.dcos_rexray_config}"
 *    dcos_ip_detect_public_contents = "${var.dcos_ip_detect_public_contents}"
 *    dcos_ip_detect_contents = "${var.dcos_ip_detect_contents}"
 *    dcos_enable_docker_gc = "${var.dcos_enable_docker_gc}"
 *    dcos_staged_package_storage_uri = "${var.dcos_staged_package_storage_uri}"
 *    dcos_package_storage_uri = "${var.dcos_package_storage_uri}"
 * }
 * resource "null_resource" "bootstrap" {
 *   triggers {
 *     cluster_instance_ids = "${aws_instance.bootstrap.id}"
 *     dcos_version = "${var.dcos_version}"
 *     dcos_security = "${var.dcos_security}"
 *     num_of_masters = "${var.num_of_masters}"
 *     dcos_audit_logging = "${var.dcos_audit_logging}"
 *     dcos_auth_cookie_secure_flag = "${var.dcos_auth_cookie_secure_flag}"
 *     dcos_aws_access_key_id = "${var.dcos_aws_access_key_id}"
 *     dcos_aws_region = "${coalesce(var.dcos_aws_region, var.aws_region)}"
 *     dcos_aws_secret_access_key = "${var.dcos_aws_secret_access_key}"
 *     dcos_aws_template_storage_access_key_id = "${var.dcos_aws_template_storage_access_key_id}"
 *     dcos_aws_template_storage_bucket = "${var.dcos_aws_template_storage_bucket}"
 *     dcos_aws_template_storage_bucket_path = "${var.dcos_aws_template_storage_bucket_path}"
 *     dcos_aws_template_storage_region_name = "${var.dcos_aws_template_storage_region_name}"
 *     dcos_aws_template_storage_secret_access_key = "${var.dcos_aws_template_storage_secret_access_key}"
 *     dcos_aws_template_upload = "${var.dcos_aws_template_upload}"
 *     dcos_bouncer_expiration_auth_token_days = "${var.dcos_bouncer_expiration_auth_token_days}"
 *     dcos_check_time = "${var.dcos_check_time}"
 *     dcos_cluster_docker_credentials = "${var.dcos_cluster_docker_credentials}"
 *     dcos_cluster_docker_credentials_dcos_owned = "${var.dcos_cluster_docker_credentials_dcos_owned}"
 *     dcos_cluster_docker_credentials_enabled = "${var.dcos_cluster_docker_credentials_enabled}"
 *     dcos_cluster_docker_credentials_write_to_etc = "${var.dcos_cluster_docker_credentials_write_to_etc}"
 *     dcos_customer_key = "${var.dcos_customer_key}"
 *     dcos_dns_search = "${var.dcos_dns_search}"
 *     dcos_dns_forward_zones = "${var.dcos_dns_forward_zones}"
 *     dcos_docker_remove_delay = "${var.dcos_docker_remove_delay}"
 *     dcos_exhibitor_address = "${aws_elb.internal-master-elb.dns_name}"
 *     dcos_exhibitor_azure_account_key = "${var.dcos_exhibitor_azure_account_key}"
 *     dcos_exhibitor_azure_account_name = "${var.dcos_exhibitor_azure_account_name}"
 *     dcos_exhibitor_azure_prefix = "${var.dcos_exhibitor_azure_prefix}"
 *     dcos_exhibitor_explicit_keys = "${var.dcos_exhibitor_explicit_keys}"
 *     dcos_exhibitor_storage_backend = "${var.dcos_exhibitor_storage_backend}"
 *     dcos_exhibitor_zk_hosts = "${var.dcos_exhibitor_zk_hosts}"
 *     dcos_exhibitor_zk_path = "${var.dcos_exhibitor_zk_path}"
 *     dcos_adminrouter_tls_1_0_enabled = "${var.dcos_adminrouter_tls_1_0_enabled}"
 *     dcos_adminrouter_tls_1_1_enabled = "${var.dcos_adminrouter_tls_1_1_enabled}"
 *     dcos_adminrouter_tls_1_2_enabled = "${var.dcos_adminrouter_tls_1_2_enabled}"
 *     dcos_adminrouter_tls_cipher_suite= "${var.dcos_adminrouter_tls_cipher_suite}"
 *     dcos_ca_certificate_chain_path = "${var.dcos_ca_certificate_chain_path}"
 *     dcos_ca_certificate_key_path = "${var.dcos_ca_certificate_key_path}"
 *     dcos_ca_certificate_path = "${var.dcos_ca_certificate_path}"
 *     dcos_config= "${var.dcos_config}"
 *     dcos_custom_checks = "${var.dcos_custom_checks}"
 *     dcos_cluster_name  = "${coalesce(var.dcos_cluster_name, data.template_file.cluster-name.rendered)}"
 *     dcos_dns_bind_ip_blacklist = "${var.dcos_dns_bind_ip_blacklist}"
 *     dcos_enable_docker_gc= "${var.dcos_enable_docker_gc}"
 *     dcos_enable_gpu_isolation= "${var.dcos_enable_gpu_isolation}"
 *     dcos_fault_domain_detect_contents= "${var.dcos_fault_domain_detect_contents}"
 *     dcos_fault_domain_enabled= "${var.dcos_fault_domain_enabled}"
 *     dcos_gpus_are_scarce = "${var.dcos_gpus_are_scarce}"
 *     dcos_l4lb_enable_ipv6= "${var.dcos_l4lb_enable_ipv6}"
 *     dcos_license_key_contents= "${var.dcos_license_key_contents}"
 *     dcos_mesos_container_log_sink= "${var.dcos_mesos_container_log_sink}"
 *     dcos_mesos_dns_set_truncate_bit= "${var.dcos_mesos_dns_set_truncate_bit}"
 *     dcos_mesos_max_completed_tasks_per_framework = "${var.dcos_mesos_max_completed_tasks_per_framework}"
 *     dcos_ucr_default_bridge_subnet = "${var.dcos_ucr_default_bridge_subnet}"
 *     dcos_gc_delay = "${var.dcos_gc_delay}"
 *     dcos_http_proxy = "${var.dcos_http_proxy}"
 *     dcos_https_proxy = "${var.dcos_https_proxy}"
 *     dcos_log_directory = "${var.dcos_log_directory}"
 *     dcos_master_discovery = "${var.dcos_master_discovery}"
 *     dcos_master_dns_bindall = "${var.dcos_master_dns_bindall}"
 *     dcos_no_proxy = "${var.dcos_no_proxy}"
 *     dcos_num_masters = "${var.num_of_masters}"
 *     dcos_oauth_enabled = "${var.dcos_oauth_enabled}"
 *     dcos_overlay_config_attempts = "${var.dcos_overlay_config_attempts}"
 *     dcos_overlay_enable = "${var.dcos_overlay_enable}"
 *     dcos_overlay_mtu = "${var.dcos_overlay_mtu}"
 *     dcos_overlay_network = "${var.dcos_overlay_network}"
 *     dcos_process_timeout = "${var.dcos_process_timeout}"
 *     dcos_previous_version = "${var.dcos_previous_version}"
 *     dcos_resolvers  = "\n - ${join("\n - ", var.dcos_resolvers)}"
 *     dcos_rexray_config_filename = "${var.dcos_rexray_config_filename}"
 *     dcos_rexray_config_method = "${var.dcos_rexray_config_method}"
 *     dcos_s3_bucket = "${coalesce(var.dcos_s3_bucket, aws_s3_bucket.dcos_bucket.id)}"
 *     dcos_s3_prefix = "${coalesce(var.dcos_s3_prefix, aws_s3_bucket.dcos_bucket.id)}"
 *     dcos_security  = "${var.dcos_security}"
 *     dcos_superuser_password_hash = "${var.dcos_superuser_password_hash}"
 *     dcos_superuser_username = "${var.dcos_superuser_username}"
 *     dcos_telemetry_enabled = "${var.dcos_telemetry_enabled}"
 *     dcos_use_proxy = "${var.dcos_use_proxy}"
 *     dcos_zk_agent_credentials = "${var.dcos_zk_agent_credentials}"
 *     dcos_zk_master_credentials = "${var.dcos_zk_master_credentials}"
 *     dcos_zk_super_credentials = "${var.dcos_zk_super_credentials}"
 *     dcos_cluster_docker_registry_url = "${var.dcos_cluster_docker_registry_url}"
 *     dcos_rexray_config = "${var.dcos_rexray_config}"
 *     dcos_ip_detect_public_contents = "${var.dcos_ip_detect_public_contents}"
 *     dcos_ip_detect_contents = "${var.dcos_ip_detect_contents}"
 *     dcos_enable_docker_gc = "${var.dcos_enable_docker_gc}"
 *     dcos_staged_package_storage_uri = "${var.dcos_staged_package_storage_uri}"
 *     dcos_package_storage_uri = "${var.dcos_package_storage_uri}"
 *   }
 *   connection {
 *     host = "${element(aws_instance.bootstrap.*.public_ip, 0)}"
 *     user = "${module.aws-tested-oses.user}"
 *   }
 *
 *   # Generate and upload bootstrap script to node
 *   provisioner "file" {
 *     content     = "${module.dcos-bootstrap.script}"
 *     destination = "run.sh"
 *   }
 *
 *   # Install Bootstrap Script
 *   provisioner "remote-exec" {
 *     inline = [
 *       "sudo chmod +x run.sh",
 *       "sudo ./run.sh",
 *     ]
 *   }
 * }
 * ```
 *
 * EXAMPLE - Master Nodes
 * -------
 * Use this to make any type of Mesos agent you desire. In this example below is a public agent. You can have gpu agents, private agents, etc. They will be either use the `dcos-mesos-agent` or `dcos-mesos-agent-public` role.
 *
 * ```hcl
 *
 *  # Create DCOS Mesos Master Scripts to execute
 *  module "dcos-mesos-master" {
 *    source               = "github.com/dcos/tf_dcos_core"
 *    bootstrap_private_ip = "${aws_instance.bootstrap.private_ip}"
 *    dcos_install_mode    = "${var.state}"
 *    dcos_version         = "${var.dcos_version}"
 *    dcos_skip_checks     = "${var.dcos_skip_checks}"
 *    role                 = "dcos-mesos-master"
 *  }
 *
 *  resource "null_resource" "master" {
 *    triggers {
 *      cluster_instance_ids = "${null_resource.bootstrap.id}"
 *      current_ec2_instance_id = "${aws_instance.master.*.id[count.index]}"
 *    }
 *    connection {
 *      host = "${element(aws_instance.master.*.public_ip, count.index)}"
 *      user = "${module.aws-tested-oses.user}"
 *    }
 *    count = "${var.num_of_masters}"
 *
 *    # Generate and upload Master script to node
 *    provisioner "file" {
 *      content     = "${module.dcos-mesos-master.script}"
 *      destination = "run.sh"
 *    }
 *
 *    # Wait for bootstrapnode to be ready
 *    provisioner "remote-exec" {
 *      inline = [
 *       "until $(curl --output /dev/null --silent --head --fail http://${aws_instance.bootstrap.private_ip}/dcos_install.sh); do printf 'waiting for bootstrap node to serve...'; sleep 20; done"
 *      ]
 *    }
 *
 *    # Install Master Script
 *    provisioner "remote-exec" {
 *      inline = [
 *        "sudo chmod +x run.sh",
 *        "sudo ./run.sh",
 *      ]
 *    }
 *  }
 * ```
 *
 * EXAMPLE - Agents
 * -------
 * ```hcl
 *  module "dcos-mesos-agent-public" {
 *    source               = "github.com/dcos/tf_dcos_core"
 *    bootstrap_private_ip = "${aws_instance.bootstrap.private_ip}"
 *    dcos_install_mode    = "${var.state}"
 *    dcos_version         = "${var.dcos_version}"
 *    dcos_skip_checks     = "${var.dcos_skip_checks}"
 *    role                 = "dcos-mesos-agent-public"
 *  }
 *
 *  # Execute generated script on agent
 *  resource "null_resource" "agent" {
 *    triggers {
 *      cluster_instance_ids = "${null_resource.bootstrap.id}"
 *      current_ec2_instance_id = "${aws_instance.agent.*.id[count.index]}"
 *    }
 *    connection {
 *      host = "${element(aws_instance.agent.*.public_ip, count.index)}"
 *      user = "${module.aws-tested-oses.user}"
 *    }
 *    count = "${var.num_of_private_agents}"
 *
 *    # Generate and upload Agent script to node
 *    provisioner "file" {
 *      content     = "${module.dcos-mesos-agent.script}"
 *      destination = "run.sh"
 *    }
 *
 *    # Wait for bootstrapnode to be ready
 *    provisioner "remote-exec" {
 *      inline = [
 *       "until $(curl --output /dev/null --silent --head --fail http://${aws_instance.bootstrap.private_ip}/dcos_install.sh); do printf 'waiting for bootstrap node to serve...'; sleep 20; done"
 *      ]
 *    }
 *
 *    # Install Slave Node
 *    provisioner "remote-exec" {
 *      inline = [
 *        "sudo chmod +x run.sh",
 *        "sudo ./run.sh",
 *      ]
 *    }
 *  }
 * ```
 */

module "open-download-uri" {
  source       = "./open/uri"
  dcos_version = "${var.dcos_version}"
}

module "ee-download-uri" {
  source       = "./ee/uri"
  dcos_version = "${var.dcos_version}"
}

locals {
  dcos_generate_config_path = "${var.dcos_type == "open" ? "${module.open-download-uri.path}" : "${module.ee-download-uri.path}"}"
}

data "template_file" "script" {
  template = "${file("${path.module}/${var.dcos_type}/dcos-versions/${var.dcos_version}/${var.role}/templates/${var.dcos_install_mode}/run.sh")}"

  vars {
    dcos_type                                    = "${var.dcos_type}"
    bootstrap_private_ip                         = "${var.bootstrap_private_ip}"
    dcos_bootstrap_port                          = "${var.dcos_bootstrap_port}"
    dcos_download_path                           = "${coalesce(var.custom_dcos_download_path, local.dcos_generate_config_path)}"
    dcos_agent_list                              = "${var.dcos_agent_list}"
    dcos_version                                 = "${var.dcos_version}"
    dcos_audit_logging                           = "${var.dcos_audit_logging}"
    dcos_auth_cookie_secure_flag                 = "${var.dcos_auth_cookie_secure_flag}"
    dcos_aws_access_key_id                       = "${var.dcos_aws_access_key_id}"
    dcos_aws_region                              = "${var.dcos_aws_region}"
    dcos_aws_secret_access_key                   = "${var.dcos_aws_secret_access_key}"
    dcos_aws_template_storage_access_key_id      = "${var.dcos_aws_template_storage_access_key_id}"
    dcos_aws_template_storage_bucket             = "${var.dcos_aws_template_storage_bucket}"
    dcos_aws_template_storage_bucket_path        = "${var.dcos_aws_template_storage_bucket_path}"
    dcos_aws_template_storage_region_name        = "${var.dcos_aws_template_storage_region_name}"
    dcos_aws_template_storage_secret_access_key  = "${var.dcos_aws_template_storage_secret_access_key}"
    dcos_aws_template_upload                     = "${var.dcos_aws_template_upload}"
    dcos_adminrouter_tls_1_0_enabled             = "${var.dcos_adminrouter_tls_1_0_enabled}"
    dcos_adminrouter_tls_1_1_enabled             = "${var.dcos_adminrouter_tls_1_1_enabled}"
    dcos_adminrouter_tls_1_2_enabled             = "${var.dcos_adminrouter_tls_1_2_enabled}"
    dcos_adminrouter_tls_cipher_suite            = "${var.dcos_adminrouter_tls_cipher_suite}"
    dcos_ca_certificate_chain_path               = "${var.dcos_ca_certificate_chain_path}"
    dcos_ca_certificate_key_path                 = "${var.dcos_ca_certificate_key_path}"
    dcos_ca_certificate_path                     = "${var.dcos_ca_certificate_path}"
    dcos_config                                  = "${var.dcos_config}"
    dcos_custom_checks                           = "${var.dcos_custom_checks}"
    dcos_dns_bind_ip_blacklist                   = "${var.dcos_dns_bind_ip_blacklist}"
    dcos_enable_gpu_isolation                    = "${var.dcos_enable_gpu_isolation}"
    dcos_fault_domain_detect_contents            = "${var.dcos_fault_domain_detect_contents}"
    dcos_fault_domain_enabled                    = "${var.dcos_fault_domain_enabled}"
    dcos_gpus_are_scarce                         = "${var.dcos_gpus_are_scarce}"
    dcos_l4lb_enable_ipv6                        = "${var.dcos_l4lb_enable_ipv6}"
    dcos_license_key_contents                    = "${var.dcos_license_key_contents}"
    dcos_mesos_container_log_sink                = "${var.dcos_mesos_container_log_sink}"
    dcos_mesos_dns_set_truncate_bit              = "${var.dcos_mesos_dns_set_truncate_bit}"
    dcos_mesos_max_completed_tasks_per_framework = "${var.dcos_mesos_max_completed_tasks_per_framework}"
    dcos_ucr_default_bridge_subnet               = "${var.dcos_ucr_default_bridge_subnet}"
    dcos_bouncer_expiration_auth_token_days      = "${var.dcos_bouncer_expiration_auth_token_days}"
    dcos_check_time                              = "${var.dcos_check_time}"
    dcos_cluster_docker_credentials              = "${var.dcos_cluster_docker_credentials}"
    dcos_cluster_docker_credentials_dcos_owned   = "${var.dcos_cluster_docker_credentials_dcos_owned}"
    dcos_cluster_docker_credentials_enabled      = "${var.dcos_cluster_docker_credentials_enabled}"
    dcos_cluster_docker_credentials_write_to_etc = "${var.dcos_cluster_docker_credentials_write_to_etc}"
    dcos_cluster_name                            = "${var.dcos_cluster_name}"
    dcos_customer_key                            = "${var.dcos_customer_key}"
    dcos_dns_search                              = "${var.dcos_dns_search}"
    dcos_dns_forward_zones                       = "${var.dcos_dns_forward_zones}"
    dcos_docker_remove_delay                     = "${var.dcos_docker_remove_delay}"
    dcos_exhibitor_address                       = "${var.dcos_exhibitor_address}"
    dcos_exhibitor_azure_account_key             = "${var.dcos_exhibitor_azure_account_key}"
    dcos_exhibitor_azure_account_name            = "${var.dcos_exhibitor_azure_account_name}"
    dcos_exhibitor_azure_prefix                  = "${var.dcos_exhibitor_azure_prefix}"
    dcos_exhibitor_explicit_keys                 = "${var.dcos_exhibitor_explicit_keys}"
    dcos_exhibitor_storage_backend               = "${var.dcos_exhibitor_storage_backend}"
    dcos_exhibitor_zk_hosts                      = "${var.dcos_exhibitor_zk_hosts}"
    dcos_exhibitor_zk_path                       = "${var.dcos_exhibitor_zk_path}"
    dcos_gc_delay                                = "${var.dcos_gc_delay}"
    dcos_http_proxy                              = "${var.dcos_http_proxy}"
    dcos_https_proxy                             = "${var.dcos_https_proxy}"
    dcos_log_directory                           = "${var.dcos_log_directory}"
    dcos_master_external_loadbalancer            = "${var.dcos_master_external_loadbalancer}"
    dcos_master_discovery                        = "${var.dcos_master_discovery}"
    dcos_master_dns_bindall                      = "${var.dcos_master_dns_bindall}"
    dcos_master_list                             = "${var.dcos_master_list}"
    dcos_no_proxy                                = "${var.dcos_no_proxy}"
    dcos_num_masters                             = "${var.dcos_num_masters}"
    dcos_oauth_enabled                           = "${var.dcos_oauth_enabled}"
    dcos_overlay_config_attempts                 = "${var.dcos_overlay_config_attempts}"
    dcos_overlay_enable                          = "${var.dcos_overlay_enable}"
    dcos_overlay_mtu                             = "${var.dcos_overlay_mtu}"
    dcos_overlay_network                         = "${var.dcos_overlay_network}"
    dcos_process_timeout                         = "${var.dcos_process_timeout}"
    dcos_public_agent_list                       = "${var.dcos_public_agent_list}"
    dcos_previous_version                        = "${var.dcos_previous_version}"
    dcos_previous_version_master_index           = "${var.dcos_previous_version_master_index}"
    dcos_resolvers                               = "${var.dcos_resolvers}"
    dcos_rexray_config_filename                  = "${var.dcos_rexray_config_filename}"
    dcos_rexray_config_method                    = "${var.dcos_rexray_config_method}"
    dcos_s3_bucket                               = "${var.dcos_s3_bucket}"
    dcos_s3_prefix                               = "${var.dcos_s3_prefix}"
    dcos_security                                = "${var.dcos_security}"
    dcos_superuser_password_hash                 = "${var.dcos_superuser_password_hash}"
    dcos_superuser_username                      = "${var.dcos_superuser_username}"
    dcos_skip_checks                             = "${var.dcos_skip_checks}"
    dcos_telemetry_enabled                       = "${var.dcos_telemetry_enabled}"
    dcos_use_proxy                               = "${var.dcos_use_proxy}"
    dcos_zk_agent_credentials                    = "${var.dcos_zk_agent_credentials}"
    dcos_zk_master_credentials                   = "${var.dcos_zk_master_credentials}"
    dcos_zk_super_credentials                    = "${var.dcos_zk_super_credentials}"
    dcos_cluster_docker_registry_url             = "${var.dcos_cluster_docker_registry_url}"
    dcos_rexray_config                           = "${var.dcos_rexray_config}"
    dcos_ip_detect_public_filename               = "${var.dcos_ip_detect_public_filename}"
    dcos_ip_detect_public_contents               = "${var.dcos_ip_detect_public_contents}"
    dcos_ip_detect_contents                      = "${var.dcos_ip_detect_contents}"
    dcos_cluster_docker_registry_enabled         = "${var.dcos_cluster_docker_registry_enabled}"
    dcos_enable_docker_gc                        = "${var.dcos_enable_docker_gc}"
    dcos_staged_package_storage_uri              = "${var.dcos_staged_package_storage_uri}"
    dcos_package_storage_uri                     = "${var.dcos_package_storage_uri}"
  }
}
