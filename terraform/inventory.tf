data "external" "ansible_inventory" {
  program = ["python3", "${path.module}/scripts/read_inventory.py"]

  query = {
    inventory_file = "${path.module}/../ansible/inventory/${terraform.workspace}_inventory.yaml"
  }
}

locals {

  inventory_raw = data.external.ansible_inventory.result

  inventory = {
    for k, v in local.inventory_raw : k => {
      ip       = split("|", v)[0],
      hostname = split("|", v)[1]
    }
  }
}


