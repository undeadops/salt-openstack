base:
  '*':
    - openstack
    - secrets
    - apt

az1:
  '*az1-*':
    - endpoints-az1-v1
    - secrets-az1-v1

az2:
  '*az2-*':
    - endpoints-az2-v1
    - secrets-az2-v1

az3:
  '*az3-*':
    - endpoints-az3-v1
    - secrets-az3-v1
