infra:
  datadog:
    tags:
      - deploy
  proxy:
    host: web-proxy.example.com
    port: 8080    
  mirror:
    ubuntu:  
      url: "deb http://ubuntu-cloud.archive.canonical.com/ubuntu precise-updates/grizzly main"
      human_name: private-openstack-repo
      keyid: 5EDB1B62EC4926EA
      file: "/etc/apt/sources.list.d/openstack-ubuntu-archive.list"
      keyserver: "keyserver.ubuntu.com"
  databases:
    - nova
    - glance
    - keystone
    - cinder
  database:
    galera_cluster_on: 1 
    mysql_db_wsrep_cluster_address: gcomm://
  ssl:
    org_name: HPCS
    org_unit: DBaaS
    locality: Sunnyvale
    state: California
    country: US
    email: support@example.com
    common_name: hostname
    

networking:
  salt:
    master: 10.8.3.2
    aliases:
      - salt
      - salt-master.example.org

keystone:
  debug: "True"
  verbose: "True"
  ssl:
    default_bits: 2048
    default_days: 3650
    country: US
    org_name: Widgets
    org_unit: Widgets
    locality: Seattle
    state: Washington
    country: US
    email: example.com
    common_name: keystone.example.com
    add_alt_names: True
    alt_names:
      DNS.1: keystone-az1-0001.example.com
      DNS.2: keystone-az2-0001.example.com
      DNS.3: keystone-az3-0001.example.com
      IP.1: 192.168.0.11/255.255.255.255
      IP.2: 192.168.32.11/255.255.255.255
  auth_port: "35357"
  service_port: "5000"
  auth_protocol: "https"
  ssl_enable: "True"
  cert_required:  "False"
  certfile: "/etc/keystone/ssl/certs/your_cert.pem"
  keyfile: "/etc/keystone/ssl/private/your_key.pem"
  signing_ca_certs: "/etc/keystone/ssl/certs/ca.pem"
  signing_certfile: "/etc/keystone/ssl/certs/signing_cert.pem"
  signing_keyfile: "/etc/keystone/ssl/private/signing_key.pem"
  pipeline:
    public_api: "access_log sizelimit stats_monitoring url_normalize token_auth admin_token_auth xml_body json_body debug user_crud_extension public_service"
    admin_api: "access_log sizelimit stats_monitoring url_normalize token_auth admin_token_auth xml_body json_body debug stats_reporting crud_extension admin_service"
    api_v3: "access_log sizelimit stats_monitoring url_normalize token_auth admin_token_auth xml_body json_body debug stats_reporting service_v3"

  
nova:
  verbose: "True"
  debug: "True"
  multi_host: true
  send_arp_for_ha: true
  scheduler_default_filters: "AggregateInstanceExtraSpecsFilter,AvailabilityZoneFilter,RamFilter,CoreFilter,DifferentHostFilter,DiskFilter,GroupAntiAffinityFilter,RetryFilter,SameHostFilter,SimpleCIDRAffinityFilter,ComputeFilter"
  protocol: "https"
  ec2_port: "8773"
  libvirt_type: "kvm"
  dhcpbridge: "/usr/local/bin/dbaas-nova-dhcpbridge"
  compute_driver: "nova.virt.libvirt.LibvirtDriver"
  network_manager: "driver.azmanager.AZDHCPManager"  # This is a driver we wrote https://github.com/hpcloud/nova-network-drivers
  network_private_num: "1"
  network_private_size: "8192"
  
glance:
  debug: "True"
  verbose: "True"
  use_syslog: "False"
  cleanup_scrubber: "False"
  cleanup_scrubber_time: "86400"
  protocol: "https"
  port: "9292"
  api_bind_port: "9292"
  registry_client_protocol: "https"
  registry_port: "9191"
  registry_bind_port: "9191"
  registry_client_insecure: "True"
  registry_client_timeout: "600"
  limit_param_default: "25"
  api_limit_max: "1000"
  sql_idle_timeout: "360"
  tcp_keepidle: "600"
  backlog: "4096"
  image_size_cap: "1099511627776"
  default_store: "file"
  workers: "4"
  known_stores: "glance.store.filesystem.Store"
  cert_file: "/etc/glance/ssl/certs/your_cert.pem"
  key_file: "/etc/glance/ssl/private/your_key.pem"
  delayed_delete: "False"
  scrub_time: "43200"
  default_images:
    precise-12.04.1-20130124: "http://cloud-images.ubuntu.com/releases/precise/release-20130124/ubuntu-12.04-server-cloudimg-amd64-disk1.img"
    raring-13.04-20130601: "http://cloud-images.ubuntu.com/releases/raring/release-20130601/ubuntu-13.04-server-cloudimg-amd64-disk1.img"


rabbit:
  use_ssl: "True"
  ha_queues: "True"


cinder:
  protocol: https
  port: 8776
  ssl_cert_file: /etc/cinder/ssl/certs/your_cert.pem
  ssl_key_file: /etc/cinder/ssl/private/your_key.pem
   
swift:

quantum:
  
