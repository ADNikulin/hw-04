<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.8.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.126.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_example-vm"></a> [example-vm](#module\_example-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |
| <a name="module_nw-netology"></a> [nw-netology](#module\_nw-netology) | ./modules/vpc | n/a |
| <a name="module_test-vm"></a> [test-vm](#module\_test-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |

## Resources

| Name | Type |
|------|------|
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [yandex_compute_image.ubuntu](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_default_cidr"></a> [default\_cidr](#input\_default\_cidr) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_env-develop"></a> [env-develop](#input\_env-develop) | n/a | `string` | `"develop"` | no |
| <a name="input_env-stage"></a> [env-stage](#input\_env-stage) | n/a | `string` | `"stage"` | no |
| <a name="input_family_os-ubuntu-name"></a> [family\_os-ubuntu-name](#input\_family\_os-ubuntu-name) | family os name | `string` | `"ubuntu-2004-lts"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_network-settings"></a> [network-settings](#input\_network-settings) | n/a | <pre>map(object({<br>    name             = string<br>    zone             = string<br>    v4_cidr_blocks   = list(string)<br>    environment_name = string<br>  }))</pre> | <pre>{<br>  "develop": {<br>    "environment_name": "develop",<br>    "name": "develop",<br>    "v4_cidr_blocks": [<br>      "10.0.1.0/24"<br>    ],<br>    "zone": "ru-central1-a"<br>  }<br>}</pre> | no |
| <a name="input_packages"></a> [packages](#input\_packages) | n/a | `string` | `"nginx"` | no |
| <a name="input_path_to_ssh_key"></a> [path\_to\_ssh\_key](#input\_path\_to\_ssh\_key) | n/a | `string` | `"proto user for vm data"` | no |
| <a name="input_vm-settings-name-all"></a> [vm-settings-name-all](#input\_vm-settings-name-all) | n/a | `string` | `"web"` | no |
| <a name="input_vm_instance-settings"></a> [vm\_instance-settings](#input\_vm\_instance-settings) | n/a | <pre>map(object({<br>    name             = string<br>    count            = number<br>    is_has_public_ip = bool<br>    label            = string<br>  }))</pre> | <pre>{<br>  "example": {<br>    "count": 1,<br>    "is_has_public_ip": true,<br>    "label": "analytics",<br>    "name": "web"<br>  },<br>  "test": {<br>    "count": 2,<br>    "is_has_public_ip": true,<br>    "label": "marketing",<br>    "name": "web"<br>  }<br>}</pre> | no |
| <a name="input_zone-ru_central1_a"></a> [zone-ru\_central1\_a](#input\_zone-ru\_central1\_a) | zone on ru-central1-a | `string` | `"ru-central1-a"` | no |
| <a name="input_zone-ru_central1_b"></a> [zone-ru\_central1\_b](#input\_zone-ru\_central1\_b) | zone on ru-central1-b | `string` | `"ru-central1-b"` | no |
| <a name="input_zone-ru_central1_c"></a> [zone-ru\_central1\_c](#input\_zone-ru\_central1\_c) | zone on ru-central1-c | `string` | `"ru-central1-c"` | no |
| <a name="input_zone-ru_central1_d"></a> [zone-ru\_central1\_d](#input\_zone-ru\_central1\_d) | zone on ru-central1-d | `string` | `"ru-central1-d"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_out"></a> [out](#output\_out) | n/a |
<!-- END_TF_DOCS -->