variable "dcos_download_path" {
  type = "map"

  default = {
    "1.11.0"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/25ec1e97e86e8c33fc775e474a779a7001a203e7/dcos_generate_config.ee.sh"
    "1.11.1"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/a7908b05bf226783484a97463eacd5d1dcbaa9c6/dcos_generate_config.ee.sh"
    "1.11.2"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/ad1aa93db99afacfa0099e419667ab60519c081e/dcos_generate_config.ee.sh"
    "1.11.3"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/5fdf7dfae5c4bdb233e8e6a7f198ef6b08c5b067/dcos_generate_config.ee.sh"
    "1.11.4"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/2153e9ad7e4e64b57b7c7e323d40b1cdde7f7428/dcos_generate_config.ee.sh"
    "1.11.5"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/72124980b21b2b79b0f891dcc67b5f2382dee68a/dcos_generate_config.ee.sh"
    "1.11.6"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/e23128e161c6c7892b204b1da43e5f27cd64a208/dcos_generate_config.ee.sh"
    "1.11.7"       = "https://downloads.mesosphere.com/dcos-enterprise/testing/1.11.7/commit/3e26a39e77138a9204b8bd7b02a3088ddf780789/dcos_generate_config.ee.sh"
    "1.11.8"       = "https://downloads.mesosphere.com/dcos-enterprise/testing/1.11.8/commit/6ee98b51acf16ce6a1ca60ab9f7d1c1de741158a/dcos_generate_config.ee.sh"
    "1.11.9"       = "https://downloads.mesosphere.com/dcos-enterprise/testing/1.11.9.1/commit/07200c92180d5749ed3f6bcbb0b69846a7cb1a6b/dcos_generate_config.ee.sh"
    "1.11.10"      = "https://downloads.mesosphere.com/dcos-enterprise/testing/1.11.10/commit/07200c92180d5749ed3f6bcbb0b69846a7cb1a6b/dcos_generate_config.ee.sh"
    "1.12.0"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/20fa047bbd37188ccb55f61ab9590edc809030ec/dcos_generate_config.ee.sh"
    "1.12.1"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/commit/b7f04138fbb43f81a157fbd1f64904681532f61e/dcos_generate_config.ee.sh"
    "1.12.2"       = "https://downloads.mesosphere.com/dcos-enterprise/testing/1.12.2/commit/c3af9042b96c5f70ca304083d1ac760ccf82ad69/dcos_generate_config.ee.sh"
    "1.12.3"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/1.12.3/commit/e8ecb9c00dc5bdc27d830df0b7fc91b6311660b8/dcos_generate_config.ee.sh"
    "1.13.0-alpha" = "https://downloads.mesosphere.com/dcos-enterprise/stable/1.13.0-alpha/commit/4da3d45e19ce0c04193a237d5a170e0b08108305/dcos_generate_config.ee.sh"
    "1.13.0-beta"  = "https://downloads.mesosphere.com/dcos-enterprise/stable/1.13.0-beta/commit/7d38a400be9f3773ec58fdbbe5e19a96ea8f9e59/dcos_generate_config.ee.sh"
    "1.13.0"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/1.13.0/commit/1ec160b03e26d6e951083f524945c1ed2af3f3a3/dcos_generate_config.ee.sh"
    "1.13.1"       = "https://downloads.mesosphere.com/dcos-enterprise/stable/1.13.1/commit/5b1576c498bcebe234b7c68ad21e6a08101972fc/dcos_generate_config.ee.sh"
    "master"       = "https://downloads.mesosphere.com/dcos-enterprise/testing/master/dcos_generate_config.ee.sh"
  }
}
