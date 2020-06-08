output "config" {
  value = join(
    "\n",
    compact(
      split(
        "\n",
        replace(data.template_file.config.rendered, "/\n? +\n/", "\n\n"),
      ),
    ),
  )
  description = "The battle-tested provisioner contents of the output by DC/OS role to perform requried admin actions in behalf of the user as documented in http://mesosphere.com and http://dcos.io"
}

output "download_url" {
  value       = local.dcos_download_path
  description = "This returns the download url either from the custom_dcos_download_path or known list"
}

output "download_url_checksum" {
  value       = local.dcos_download_checksum
  description = "This returns the sha256 checksum to download_url"
}

output "version" {
  value       = local.dcos_version
  description = "This returns the DC/OS version"
}

output "commit" {
  value       = local.dcos_commit
  description = "This returns the commit sha of the DC/OS version"
}

