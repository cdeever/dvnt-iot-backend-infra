# Deevnet IoT Backend Infrastructure

> **Notice:** This project is currently a work in progress. Changes are being pushed regularly, and not all functionalities have been fully tested.

## Project Overview

Welcome to the Deevnet IoT Backend Infrastructure repository! This project is focused on using Infrastructure as Code (IaC) to establish a foundational virtual backend on Proxmox, which will support a variety of IoT functions. The primary aim of this repository is to set up the essential infrastructure upon which IoT functionalities will be built in subsequent projects.

## Features

The Deevnet IoT Backend Infrastructure lays down the base components including:

- **Common Logging**: Using the ELK Stack for effective log aggregation and search capabilities.
- **Metrics**: Implementing Prometheus for metrics collection, integrated with Grafana for visualization and dashboard creation.
- **Dashboards**: Customized Grafana dashboards to monitor IoT device metrics and overall system health.
- **MQTT Messaging**: Preparing for real-time messaging between IoT devices with MQTT broker integration.

## Infrastructure Design

This infrastructure is designed to be scalable and secure, ensuring strong performance and dependability for IoT workloads. It is provisioned and managed entirely through code using Terraform, Packer, and Ansible on a Proxmox environment. This repository sets the stage for future projects that will implement specific IoT functionalities.

## Getting Started

To begin deploying the Deevnet IoT Backend, please follow the detailed instructions in the installation section. Familiarity with Proxmox and basic knowledge of Terraform, Packer, and Ansible are assumed.

## Tools Required

To follow along with the automation processes demonstrated, you will need the following tools installed and configured:

- **Terraform**: For defining and provisioning infrastructure as code.
- **Packer**: For creating machine images.
- **Ansible**: For configuration management.
- **Web Server**: A web server of your choice to host the public SSH key for the automation account on the target servers. This can be set up on your build server or within your local network.

Ensure that Terraform and Packer scripts are configured to locate the private SSH key within ssh-agent for secure operations.

## Setting Up Your Build Environment

To replicate the automation demonstrated in this presentation, you will need to prepare your environment accordingly. Here are the steps to set up your own build environment:

1. **Proxmox Setup**:
   - Ensure you have Proxmox installed on your server or virtual environment.
   - Set up provisioning accounts that have the necessary permissions to create and manage VMs.

2. **SSH Key Pair**:
   - Generate an SSH key pair that will be used for secure communication between your automation tool and the target server. This key ensures that the provisioning and deployment processes are secure.

3. **Ansible Galaxy - Prometheus**:
   - Utilize Ansible Galaxy's Prometheus role for your monitoring needs. This can be found at: [Ansible Galaxy - Prometheus](https://galaxy.ansible.com/ui/repo/published/prometheus/prometheus/)

4. **Environment Variables Setup**:
   - To streamline the provisioning process, set up the following environment variables. Replace the placeholder data with your own credentials and URLs:
     - `TF_VAR_opnsense_key`: [your opnsense key]
     - `TF_VAR_opnsense_secret`: [your opnsense secret]
     - `TF_VAR_opnsense_url`: [your opnsense url]
     - `TF_VAR_proxmox_node`: [your proxmox node]
     - `TF_VAR_proxmox_token_id`: [your proxmox token id]
     - `TF_VAR_proxmox_token_secret`: [your proxmox token secret]
     - `TF_VAR_proxmox_url`: [your proxmox url]

   _Please Note: The OPNSense updates are not yet implemented._




## License

This project is licensed under the [Unlicense](LICENSE), which permits nearly unrestricted reuse and sharing for both personal and commercial purposes.

