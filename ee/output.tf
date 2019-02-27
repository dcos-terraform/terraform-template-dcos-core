output "script" {
  value = "${data.template_file.script.rendered}"
}

output "path" {
  value = "${lookup(var.meta_dcos_version, var.dcos_version, "config.yaml instruction non existant")}"
}
