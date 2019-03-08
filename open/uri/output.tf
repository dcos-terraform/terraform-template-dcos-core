output "path" {
  value = "${lookup(var.dcos_download_path, var.dcos_version, "DCOS GENERATE CONFIG INSTALLER DOWNLOAD PATH WAS NOT PROVIDED")}"
}
