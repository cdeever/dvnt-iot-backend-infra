import yaml
import json
import sys

def main():
    query = json.loads(sys.stdin.read())
    inventory_file = query['inventory_file']
    
    with open(inventory_file, 'r') as file:
        inventory = yaml.safe_load(file)
    
    hosts = inventory.get('all', {}).get('hosts', {})
    result = {hostname: f"{data.get('ansible_host')}|{data.get('hostname')}" for hostname, data in hosts.items()}
    
    print(json.dumps(result))

if __name__ == "__main__":
    main()
