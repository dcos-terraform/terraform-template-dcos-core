DC/OS Core Template
============
A Terraform module to install, upgrade, and modify nodes for DC/OS clusters in an automated fashion.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bootstrap\_private\_ip | Private IP bootstrap nginx is listening on. Used to build the bootstrap URL. | string | n/a | yes |
| custom\_dcos\_download\_path | insert location of dcos installer script (optional) | string | `""` | no |
| dcos\_adminrouter\_tls\_1\_0\_enabled | Indicates whether to enable TLSv1 support in Admin Router. (optional) | string | `""` | no |
| dcos\_adminrouter\_tls\_1\_1\_enabled | Indicates whether to enable TLSv1.1 support in Admin Router. (optional) | string | `""` | no |
| dcos\_adminrouter\_tls\_1\_2\_enabled | Indicates whether to enable TLSv1.2 support in Admin Router. (optional) | string | `""` | no |
| dcos\_adminrouter\_tls\_cipher\_suite | [Enterprise DC/OS] Indicates whether to allow web browsers to send the DC/OS authentication cookie through a non-HTTPS connection. (optional) | string | `""` | no |
| dcos\_agent\_list | used to list the agents in the config.yaml (optional) | list | `<list>` | no |
| dcos\_audit\_logging | [Enterprise DC/OS] enable security decisions are logged for Mesos, Marathon, and Jobs. (optional) | string | `""` | no |
| dcos\_auth\_cookie\_secure\_flag | [Enterprise DC/OS] allow web browsers to send the DC/OS authentication cookie through a non-HTTPS connection. (optional) | string | `""` | no |
| dcos\_aws\_access\_key\_id | AWS key ID for exhibitor storage (optional but required with dcos_exhibitor_address) | string | `""` | no |
| dcos\_aws\_region | AWS region for exhibitor storage (optional but required with dcos_exhibitor_address) | string | `""` | no |
| dcos\_aws\_secret\_access\_key | AWS secret key for exhibitor storage (optional but required with dcos_exhibitor_address) | string | `""` | no |
| dcos\_aws\_template\_storage\_access\_key\_id | AWS key ID for CloudFormation template storage (optional) | string | `""` | no |
| dcos\_aws\_template\_storage\_bucket | AWS CloudFormation bucket name (optional) | string | `""` | no |
| dcos\_aws\_template\_storage\_bucket\_path | AWS CloudFormation bucket path (optional) | string | `""` | no |
| dcos\_aws\_template\_storage\_region\_name | AWS CloudFormation region name (optional) | string | `""` | no |
| dcos\_aws\_template\_storage\_secret\_access\_key | AWS secret key for the CloudFormation template (optional) | string | `""` | no |
| dcos\_aws\_template\_upload | To automatically upload the customized advanced templates to your S3 bucket. (optional) | string | `""` | no |
| dcos\_bootstrap\_port | Port of the bootstrap URL | string | `"8080"` | no |
| dcos\_bouncer\_expiration\_auth\_token\_days | [Enterprise DC/OS] Sets the auth token time-to-live (TTL) for Identity and Access Management. (optional) | string | `""` | no |
| dcos\_ca\_certificate\_chain\_path | [Enterprise DC/OS] Path (relative to the $DCOS_INSTALL_DIR) to a file containing the complete CA certification chain required for end-entity certificate verification, in the OpenSSL PEM format. (optional) | string | `""` | no |
| dcos\_ca\_certificate\_key\_path | [Enterprise DC/OS] Path (relative to the $DCOS_INSTALL_DIR) to a file containing a single X.509 certificate private key in the OpenSSL PEM format. (optional) | string | `""` | no |
| dcos\_ca\_certificate\_path | [Enterprise DC/OS] Path (relative to the $DCOS_INSTALL_DIR) to a file containing a single X.509 CA certificate in the OpenSSL PEM format. (optional) | string | `""` | no |
| dcos\_check\_time | Check if Network Time Protocol (NTP) is enabled during DC/OS startup. (optional) | string | `""` | no |
| dcos\_cluster\_docker\_credentials | Dictionary of Docker credentials to pass. (optional) | string | `""` | no |
| dcos\_cluster\_docker\_credentials\_dcos\_owned | Indicates whether to store the credentials file in /opt/mesosphere or /etc/mesosphere/docker_credentials. A sysadmin cannot edit /opt/mesosphere directly (optional) | string | `""` | no |
| dcos\_cluster\_docker\_credentials\_enabled | Indicates whether to pass the Mesos --docker_config option to Mesos. (optional) | string | `""` | no |
| dcos\_cluster\_docker\_credentials\_write\_to\_etc | Indicates whether to write a cluster credentials file. (optional) | string | `""` | no |
| dcos\_cluster\_docker\_registry\_enabled | DC/OS cluster docker registry enabled | string | `""` | no |
| dcos\_cluster\_docker\_registry\_url | The custom URL that Mesos uses to pull Docker images from. If set, it will configure the Mesos --docker_registry flag to the specified URL. (optional) | string | `""` | no |
| dcos\_cluster\_name | sets the DC/OS cluster name | string | `""` | no |
| dcos\_config | used to add any extra arguments in the config.yaml that are not specified here. (optional) | string | `""` | no |
| dcos\_custom\_checks | Custom installation checks that are added to the default check configuration process. (optional) | string | `""` | no |
| dcos\_customer\_key | [Enterprise DC/OS] sets the customer key (optional) | string | `""` | no |
| dcos\_dns\_bind\_ip\_blacklist | A list of IP addresses that DC/OS DNS resolvers cannot bind to. (optional) | string | `""` | no |
| dcos\_dns\_forward\_zones | Allow to forward DNS to certain domain requests to specific server. The following syntax must be used in combination with Terraform string heredoc. (optional) (:warning: DC/OS 1.10+) | string | `""` | no |
| dcos\_dns\_search | A space-separated list of domains that are tried when an unqualified domain is entered. (optional) | string | `""` | no |
| dcos\_docker\_remove\_delay | The amount of time to wait before removing stale Docker images stored on the agent nodes and the Docker image generated by the installer. (optional) | string | `""` | no |
| dcos\_ee\_download\_path | This is the path of all the enterprise dcos_generate_config.sh by version | map | `<map>` | no |
| dcos\_enable\_docker\_gc | Indicates whether to run the docker-gc script, a simple Docker container and image garbage collection script, once every hour to clean up stray Docker containers. (optional) | string | `""` | no |
| dcos\_enable\_gpu\_isolation | Indicates whether to enable GPU support in DC/OS. (optional) | string | `""` | no |
| dcos\_enable\_mesos\_input\_plugin | Indicates whether to enable Telegraf's Mesos input plugin to collect Mesos metrics from Mesos masters and agents. Options: `true` or `false` (optional) | string | `""` | no |
| dcos\_exhibitor\_address | The address of the load balancer in front of the masters (recommended) | string | `""` | no |
| dcos\_exhibitor\_azure\_account\_key | the azure account key for exhibitor storage (optional but required with dcos_exhibitor_address) | string | `""` | no |
| dcos\_exhibitor\_azure\_account\_name | the azure account name for exhibitor storage (optional but required with dcos_exhibitor_address) | string | `""` | no |
| dcos\_exhibitor\_azure\_prefix | the azure account name for exhibitor storage (optional but required with dcos_exhibitor_address) | string | `""` | no |
| dcos\_exhibitor\_explicit\_keys | set whether you are using AWS API keys to grant Exhibitor access to S3. (optional) | string | `""` | no |
| dcos\_exhibitor\_storage\_backend | options are static, aws_s3, azure, or zookeeper (recommended) | string | `""` | no |
| dcos\_exhibitor\_zk\_hosts | a comma-separated list of one or more ZooKeeper node IP and port addresses to use for configuring the internal Exhibitor instances. (not recommended but required with exhibitor_storage_backend set to ZooKeeper. Use aws_s3 or azure instead. Assumes external ZooKeeper is already online.) | string | `""` | no |
| dcos\_exhibitor\_zk\_path | the filepath that Exhibitor uses to store data (not recommended but required with exhibitor_storage_backend set to zookeeper. Use aws_s3 or azureinstead. Assumes external ZooKeeper is already online.) | string | `""` | no |
| dcos\_fault\_domain\_detect\_contents | [Enterprise DC/OS] fault domain script contents. Optional but required if no fault-domain-detect script present. | string | `""` | no |
| dcos\_fault\_domain\_enabled | [Enterprise DC/OS] used to control if fault domain is enabled | string | `""` | no |
| dcos\_gc\_delay | The maximum amount of time to wait before cleaning up the executor directories (optional) | string | `""` | no |
| dcos\_gpus\_are\_scarce | Indicates whether to treat GPUs as a scarce resource in the cluster. (optional) | string | `""` | no |
| dcos\_http\_proxy | http proxy (optional) | string | `""` | no |
| dcos\_https\_proxy | https proxy (optional) | string | `""` | no |
| dcos\_ip\_detect\_contents | Allows DC/OS to detect your private address. Use this to pass this as an input to the module rather than a file in side your bootstrap node. (recommended) | string | `""` | no |
| dcos\_ip\_detect\_public\_contents | Allows DC/OS to be aware of your publicly routeable address for ease of use (recommended) | string | `""` | no |
| dcos\_ip\_detect\_public\_filename | statically set your detect-ip-public path | string | `""` | no |
| dcos\_l4lb\_enable\_ipv6 | A boolean that indicates if layer 4 load balancing is available for IPv6 networks. (optional) | string | `""` | no |
| dcos\_license\_key\_contents | [Enterprise DC/OS] used to privide the license key of DC/OS for Enterprise Edition. Optional if license.txt is present on bootstrap node. | string | `""` | no |
| dcos\_log\_directory | The path to the installer host logs from the SSH processes. (optional) | string | `""` | no |
| dcos\_master\_discovery | The Mesos master discovery method. The available options are static or master_http_loadbalancer. (recommend the use of master_http_loadbalancer) | string | `""` | no |
| dcos\_master\_dns\_bindall | Indicates whether the master DNS port is open. (optional) | string | `""` | no |
| dcos\_master\_external\_loadbalancer | Allows DC/OS to configure certs around the External Load Balancer name. If not used SSL verfication issues will arrise. EE only. (recommended) | string | `""` | no |
| dcos\_master\_list | statically set your master nodes (not recommended but required with exhibitor_storage_backend set to static. Use aws_s3 or azure instead, that way you can replace masters in the cloud.) | list | `<list>` | no |
| dcos\_mesos\_container\_log\_sink | The log manager for containers (tasks). The options are to send logs to: 'journald', 'logrotate', 'journald+logrotate'. (optional) | string | `""` | no |
| dcos\_mesos\_dns\_set\_truncate\_bit | Indicates whether to set the truncate bit if the response is too large to fit in a single packet. (optional) | string | `""` | no |
| dcos\_mesos\_max\_completed\_tasks\_per\_framework | The number of completed tasks for each framework that the Mesos master will retain in memory. (optional) | string | `""` | no |
| dcos\_no\_proxy | A YAML nested list (-) of addresses to exclude from the proxy. (optional) | string | `""` | no |
| dcos\_num\_masters | set the num of master nodes (required with exhibitor_storage_backend set to aws_s3, azure, ZooKeeper) | string | `""` | no |
| dcos\_oauth\_enabled | [Open DC/OS Only] Indicates whether to enable authentication for your cluster. (optional) | string | `""` | no |
| dcos\_open\_download\_path | This is the path of all the open dcos_generate_config.sh by version | map | `<map>` | no |
| dcos\_overlay\_config\_attempts | Specifies how many failed configuration attempts are allowed before the overlay configuration modules stop trying to configure an virtual network. (optional) | string | `""` | no |
| dcos\_overlay\_enable | Enable to disable overlay (optional) | string | `""` | no |
| dcos\_overlay\_mtu | The maximum transmission unit (MTU) of the Virtual Ethernet (vEth) on the containers that are launched on the overlay. (optional) | string | `""` | no |
| dcos\_overlay\_network | This group of parameters define an virtual network for DC/OS. (optional) | string | `""` | no |
| dcos\_package\_storage\_uri | Where to permanently store DC/OS packages. The value must be a file URL. (optional) | string | `""` | no |
| dcos\_previous\_version | DC/OS 1.9+ requires users to set this value to ensure users know the version. Terraform helps populate this value, but users can override it here. (recommended) | string | `""` | no |
| dcos\_previous\_version\_master\_index | Used to track the index of master for quering the previous DC/OS version during upgrading. (optional) applicable: 1.9+ | string | `"0"` | no |
| dcos\_process\_timeout | The allowable amount of time, in seconds, for an action to begin after the process forks. (optional) | string | `""` | no |
| dcos\_public\_agent\_list | statically set your public agents (not recommended) | list | `<list>` | no |
| dcos\_resolvers | A YAML nested list (-) of DNS resolvers for your DC/OS cluster nodes. (recommended) | list | `<list>` | no |
| dcos\_rexray\_config | The REX-Ray configuration method for enabling external persistent volumes in Marathon. (optional) | string | `""` | no |
| dcos\_rexray\_config\_filename | The REX-Ray configuration filename for enabling external persistent volumes in Marathon. (optional) | string | `""` | no |
| dcos\_rexray\_config\_method | The REX-Ray configuration method for enabling external persistent volumes in Marathon. (optional) | string | `""` | no |
| dcos\_s3\_bucket | name of the s3 bucket for the exhibitor backend (recommended but required with dcos_exhibitor_address) | string | `""` | no |
| dcos\_s3\_prefix | name of the s3 prefix for the exhibitor backend (recommended but required with dcos_exhibitor_address) | string | `""` | no |
| dcos\_security | [Enterprise DC/OS] set the security level of DC/OS, either 'strict' or 'permissive'. Default is 'permissive'. (recommended) | string | `""` | no |
| dcos\_skip\_checks | Upgrade option: Used to skip all dcos checks that may block an upgrade if any DC/OS component is unhealthly. (optional) applicable: 1.10+ | string | `"false"` | no |
| dcos\_staged\_package\_storage\_uri | Where to temporarily store DC/OS packages while they are being added. (optional) | string | `""` | no |
| dcos\_superuser\_password\_hash | [Enterprise DC/OS] set the superuser password hash (recommended) | string | `""` | no |
| dcos\_superuser\_username | [Enterprise DC/OS] set the superuser username (recommended) | string | `""` | no |
| dcos\_telemetry\_enabled | Change the telemetry option (optional) | string | `""` | no |
| dcos\_ucr\_default\_bridge\_subnet | IPv4 subnet allocated to the mesos-bridge CNI network for UCR bridge-mode networking. (optional) | string | `""` | no |
| dcos\_use\_proxy | To enable use of proxy for internal routing (optional) | string | `""` | no |
| dcos\_variant | Specifies which DC/OS variant it should be: `open` (Open Source) or `ee` (Enterprise Edition) | string | `"open"` | no |
| dcos\_version | Specifies which DC/OS version instruction to use. Options: 1.13.5, 1.12.4, 1.11.11, etc. See dcos_download_path or dcos_version tree for a full list. | string | `"1.13.5"` | no |
| dcos\_versions\_service\_url | DC/OS Versions Service allows to identify DC/OS versions | string | `"https://versions.d2iq.com"` | no |
| dcos\_zk\_agent\_credentials | [Enterprise DC/OS] set the ZooKeeper agent credentials (recommended) | string | `""` | no |
| dcos\_zk\_master\_credentials | [Enterprise DC/OS] set the ZooKeeper master credentials (recommended) | string | `""` | no |
| dcos\_zk\_super\_credentials | [Enterprise DC/OS] set the zk super credentials (recommended) | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| commit | This returns the commit sha of the DC/OS version |
| config | The battle-tested provisioner contents of the output by DC/OS role to perform requried admin actions in behalf of the user as documented in http://mesosphere.com and http://dcos.io |
| download\_url | This returns the download url either from the custom_dcos_download_path or known list |
| download\_url\_checksum | This returns the sha256 checksum to download_url |
| version | This returns the DC/OS version |

