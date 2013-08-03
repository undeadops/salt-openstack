# This is for US West 2 in AZ3
endpoints:
  openstack_public_address: "192.168.32.17"  # Need to check!!!
  openstack_admin_address: "10.8.4.11"
  openstack_internal_address: "10.8.4.11"
  datadog:
     tags: 
      - deploy
      - az3
  galera:
    servers:
      ip_01: "10.8.2.10"
      ip_02: "10.8.3.10"
      ip_03: "10.8.4.10"
    mysql_db_wsrep_cluster_address: gcomm://
  interfaces:
    control: "bond0"
    public: "vlan317"
    private: "vlan316"
  glance:
    bind_host: "0.0.0.0"
    registry_host: "0.0.0.0"
  hosts:
    database: "127.0.0.1"
    keystone: "192.168.32.17"
    nova: "10.8.4.11"
    glance: "192.168.32.17"
    rabbit: "10.8.4.10"
    rabbit_cluster: "10.8.3.10:5671, 10.8.2.10:5671, 10.8.4.10:5671"
    rabbit_master_node: "your-rabbit-hostname"
    cinder: "10.8.4.11"
  rabbit:
    master_node: "your-rabbit-01"
    servers:
      your-rabbit-01: "10.8.2.10"
      your-rabbit-02: "10.8.3.10"
      your-rabbit-03: "10.8.4.10"
  nova:
    nova_url: "192.168.32.17:8774/v1.1/"
    availability_zone: "your-az3-v1"
    osapi_compute_listen: "0.0.0.0"
    osapi_volume_listen: "0.0.0.0"
    host: "10.8.4.11"
    network_floating: "192.168.32.0/20"
    fixed_nets: "10.9.64.0/19 10.9.128.0/19"
    fixed_net_gw: "10.9.192.1"
    flat_network_dhcp_start: "10.9.192.10"
    fixed_bridge: "br100"
    s3_host: "10.8.4.11"
    ec2_host: "10.8.4.11" 
    ec2_dmz_host: "10.8.4.11"
    ec2_url: "192.168.32.17:8773/services/Cloud"
    cc_host: "10.8.4.11"
    network_floating: "192.168.32.0/20"
    network_private_num: "1"
    network_private_size: "8192"
    metadata_listen_OLD: {{ salt['network.interfaces']()['bond0']['inet'][0]['address'] }}
    metadata_listen: "0.0.0.0"
    network:
      private_interface: "bond0"
      bridge_interface: "br100"
      public_interface: "vlan317"
      fixed_nets: "10.9.64.0/19 10.9.128.0/19"
      fixed_net: "10.9.192.0/19" 
      fixed_net_gw: "10.9.192.1"
      fixed_bridge: "br100"
      flat_network_dhcp_start: "10.9.192.10"
      flat_interface: "vlan316"
      public_net_gw: "192.168.32.1"
      public_nets: "192.168.32.0/20"
      private_net: "10.9.192.0/19"
      fixed_range: "10.9.192.0/19"
      mgmnt_net: "10.8.4.0/24"
      routing_net: "10.8.4.0/24"
      my_ip: {{ salt['network.interfaces']()['bond0']['inet'][0]['address'] }}
    delete_floating:
      - 192.168.32.0
      - 192.168.32.0/24
      - 192.168.32.1
      - 192.168.32.255
      - 192.168.33.0
      - 192.168.33.0/24
      - 192.168.33.1
      - 192.168.33.255
