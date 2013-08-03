infra:
  proxy:
    host: web-proxy.example.com
    port: 8080    
  datadog:
    api_key: <REDACTED>
    tags: 
      - paas-deploy
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
  ssl:
    org_name: YourCloud
    org_unit: IT
    locality: Sunnyvale
    state: California 
    country: US
    email: ssl@example.com
    common_name: hostname

networking:
  salt:
    master: 10.1.0.72
    aliases:
      - salt
      - node-controller0001
      - node-controller0001.example.com

keystone:
  debug: "False"
  verbose: "True"
  ssl:
    org_name: YourCloud
    org_unit: IT
    locality: Sunnyvale
    state: California 
    country: US
    email: ssl@example.com
    common_name: hostname
  auth_port: "35357"
  service_port: "5000"
  auth_protocol: "https"
  ssl_enable: "True"
  cert_required = "False"
  certfile: "/etc/keystone/ssl/certs/example_cert.pem"
  keyfile: "/etc/keystone/ssl/private/example_key.pem"
  ca_certs: "/etc/keystone/ssl/certs/ca.pem"
  signing_certfile = "/etc/keystone/ssl/certs/signing_cert.pem"
  signing_keyfile = "/etc/keystone/ssl/private/signing_key.pem"
  pipeline:
    public_api: "access_log sizelimit stats_monitoring url_normalize token_auth admin_token_auth xml_body json_body debug user_crud_extension public_service"
    admin_api: "access_log sizelimit stats_monitoring url_normalize token_auth admin_token_auth xml_body json_body debug stats_reporting crud_extension admin_service"
    api_v3: "access_log sizelimit stats_monitoring url_normalize token_auth admin_token_auth xml_body json_body debug stats_reporting service_v3"

  
nova:
  verbose: true
  debug: true
  mulit_host: true
  send_arp_for_ha: true
  scheduler_default_filters: "AggregateInstanceExtraSpecsFilter,AvailabilityZoneFilter,RamFilter,ComputeFilter"
  protocol: "https"
  ec2_port: "8773"
  libvirt_type: "kvm"
  dhcpbridge: "/usr/bin/nova-dhcpbridge"
  compute_driver: "nova.virt.libvirt.LibvirtDriver"
  network_private_num: "1"
  network_private_size: "8192"
  
glance:
  debug: "False"
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
  sql_idle_timeout: "3600"
  tcp_keepidle: "600"
  backlog: "4096"
  image_size_cap: "1099511627776"
  default_store: "file"
  workers: "4"
  known_stores: "glance.store.filesystem.Store"
  cert_file = "/etc/glance/ssl/certs/example_cert.pem"
  key_file = "/etc/glance/ssl/private/example_key.pem"
  delayed_delete: "False"
  scrub_time: "43200"
  default_images:
    precise-12.04.1-20130124: "http://cloud-images.ubuntu.com/releases/precise/release-20130124/ubuntu-12.04-server-cloudimg-amd64-disk1.img"
    raring-13.04-20130601: "http://cloud-images.ubuntu.com/releases/raring/release-20130601/ubuntu-13.04-server-cloudimg-amd64-disk1.img"


rabbit:
  use_ssl: "true"
  ha_queues: "true"


cinder:
  protocol: https
  port: 8776
  ssl_cert_file: /etc/cinder/ssl/certs/example_cert.pem
  ssl_key_file: /etc/cinder/ssl/private/example_key.pem
   
swift:

quantum:
  
