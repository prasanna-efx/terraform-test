# terraform-test

1.VPC/VNET with subnets in all Availability Zones created part of script terraform_network. Also egress to Internet on ports 80 and 443 added with a firewall rule.
2. Auto scaling web server created part of terraform_nginx_vm script, webserver installation and serving hello world page is incomplete.
3. terraform_gke script creates a gke cluster. 
4. http://34.82.148.40/ is the ip address for the hello-world page deployed using the product documentation page - https://cloud.google.com/kubernetes-engine/docs/tutorials/hello-app#option_b_use_command-line_tools_locally
Gcp service account is expored as JSON key and added securely as environment variable to ensure connectivity between terraform and google cloud.
Ansible playbook isn't ready at the time of updating this note. Time permitting can add through the week.
