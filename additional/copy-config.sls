# Copyright 2012-2013 Hewlett-Packard Development Company, L.P.
# All Rights Reserved.
# Authored by Yazz D. Atlas <yazz.atlas@hp.com>
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
#
#------------------------
# Sometimes I just want to copy over new configs and not have 
# salt restart things.
#------------------------
/root/scripts:
  file:
    - recurse
    - source: salt://openstack/scripts
    - file_mode: 755
    - template: jinja
    - context:
        infra: {{ pillar['infra'] }}
        networking: {{ pillar['networking'] }}
        endpoints: {{ pillar['endpoints'] }}
        keystone: {{ pillar['keystone'] }}
        nova: {{ pillar['nova'] }}
        glance: {{ pillar['glance'] }}
        cinder: {{ pillar['cinder'] }}
        rabbit: {{ pillar['rabbit'] }}
        swift: {{ pillar['swift'] }}
        quantum: {{ pillar['quantum'] }}

/etc/nova:
  file:
    - recurse
    - source: salt://openstack/nova
    - template: jinja
    - context:
        infra: {{ pillar['infra'] }}
        networking: {{ pillar['networking'] }}
        endpoints: {{ pillar['endpoints'] }}
        keystone: {{ pillar['keystone'] }}
        nova: {{ pillar['nova'] }}
        glance: {{ pillar['glance'] }}
        cinder: {{ pillar['cinder'] }}
        rabbit: {{ pillar['rabbit'] }}
        swift: {{ pillar['swift'] }}
        quantum: {{ pillar['quantum'] }}

/etc/keystone:
  file:
    - recurse
    - source: salt://openstack/keystone
    - template: jinja
    - context:
        infra: {{ pillar['infra'] }}
        networking: {{ pillar['networking'] }}
        endpoints: {{ pillar['endpoints'] }}
        keystone: {{ pillar['keystone'] }}
        nova: {{ pillar['nova'] }}
        glance: {{ pillar['glance'] }}
        cinder: {{ pillar['cinder'] }}
        rabbit: {{ pillar['rabbit'] }}
        swift: {{ pillar['swift'] }}
        quantum: {{ pillar['quantum'] }}

/etc/glance:
  file:
    - recurse
    - source: salt://openstack/glance
    - context:
        infra: {{ pillar['infra'] }}
        networking: {{ pillar['networking'] }}
        endpoints: {{ pillar['endpoints'] }}
        keystone: {{ pillar['keystone'] }}
        nova: {{ pillar['nova'] }}
        glance: {{ pillar['glance'] }}
        cinder: {{ pillar['cinder'] }}
        rabbit: {{ pillar['rabbit'] }}
        swift: {{ pillar['swift'] }}
        quantum: {{ pillar['quantum'] }}
