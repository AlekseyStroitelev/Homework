## OpenSearch Installation with Dashboards

This ansible playbook supports the following,

- Can be deployed on baremetal and VMs(AWS EC2)
- Supports most popular **Linux distributions**(Centos7, RHEL7, Amazon Linux2, Ubuntu 20.04)
- Install and configure the Apache2.0 opensource OpenSearch
- Configure TLS/SSL for OpenSearch transport layer(Nodes to Nodes communication) and REST API layer
- Generate self-signed certificates to configure TLS/SSL for opensearch
- Configure the Internal Users Database with limited users and user-defined passwords
- Configuration of authentication and authorization via OpenID
- Overriding default settings with your own
- Install and configure the Apache2.0 opensource OpenSearch Dashboards