output "script" {
  value       = "${data.template_file.script.rendered}"
  description = "The battle-tested provisioner contents of the output by DC/OS role to perform requried admin actions in behalf of the user as documented in http://mesosphere.com and http://dcos.io"
}
