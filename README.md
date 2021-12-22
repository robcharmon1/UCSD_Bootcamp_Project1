# UCSD_Bootcamp_Project1
Files for UCSD Cybersecurity Bootcamp Project 1 cloud network and monitoring.

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](Diagrams/Cloud_Project_Network.drawio.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above. Alternatively, the various individual files may be used to install only certain pieces of it, such as Filebeat.

![Ansible Playbook to Configure DMVA Container](Ansible/my_playbook.yml)

![Ansible Playbook to Configure ELK Container](Ansible/project1_playbook.yml)

![Ansible Playbook to Configure Filebeat & Metricbeat](Ansible/filebeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the Damn Vulnerable Web Application.

Load balancing ensures that the application will be highly resilient, in addition to restricting traffic to the network.
- A load balancer helps to mitigate denial of service attacks by evenly distributing incoming traffic.
- Using the jump box creates a more secure architecture. Traffic must be forwarded to the jump box which forwards to the web servers rather than allowing public traffic straight to web servers. The jump box is set up with access controls to ensure only authorized access occurs. This also reduces the attack surface of the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the user and system files.
- Filebeat collects data about the file system.
- Metricbeat collects data about machine metrics, such as uptime or CPU usage.

The configuration details of each machine may be found below.

| Name     | Function   | IP Address | Operating System    |
|----------|------------|------------|---------------------|
| Jump Box | Gateway    | 10.0.0.4   | Ubuntu Server 20.04 |
| Web-1    | Web Server | 10.0.0.5   | Ubuntu Server 20.04 |
| Web-2    | Web Server | 10.0.0.6   | Ubuntu Server 20.04 |
| ELK1     | ELK Stack  | 10.1.0.5   | Ubuntu Server 20.04 |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the administrator's IP addresses.
- Note the public IP used to configure these machines is not shown for privacy.

Machines within the network can only be accessed by the Ansible container on the Jump Box machine.
- The Jump Box machine (10.0.0.4) accesses the other machines from the Ansible container via ssh.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | Admin public IP      |
| Web-1    | No                  | 10.0.0.4             |
| Web-2    | No                  | 10.0.0.4             |
| ELK1     | Yes                 | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because multiple machines could be configured at the same time. The Ansible playbook file contains the information needed to configure multiple machines in a network simultaneously.

The playbook implements the following tasks:
- Configure target VM to use more memory
- Install docker.io
- Install python3-pip
- Install docker pip package
- Download ELK container
- Enable docker service to run on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text](Images/docker_on_elk_vm.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filbeat collects data about the file system. For example, when a file was last edited.
- Metricbeat collects data about machine metrics, such as the CPU usage of the monitored machine.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the desired playbook file (depending on the need to configure DVWA, ELK, or Filebeat/Metricbeat) to the control node at the location /etc/ansible.
- See above for links to each playbook file for various applications.
- Update the playbook file to include the desired host group name (consisting of the machines to configure) and remote_user.
- The playbook file can be updated with: vim playbookname.sh
- Run the playbook, and navigate to the puclic IP address of the desired machine from a web browser at the appropriate port (depending on application) to check that the installation worked as expected.
- I.E.  http://[your.ELK-VM.External.IP]:5601/app/kibana


