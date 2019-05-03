output "config" {
  value       = "${join("\n",compact(split("\n",replace(data.template_file.config.rendered, "/\n? +\n/","\n\n"))))}"
  description = "The battle-tested provisioner contents of the output by DC/OS role to perform requried admin actions in behalf of the user as documented in http://mesosphere.com and http://dcos.io"
}

output "download_url" {
  value = "${coalesce(var.custom_dcos_download_path, local.dcos_download_path)}"
  description = "This returns the download url either from the custom_dcos_download_path or known list"
}
