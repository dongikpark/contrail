#!/bin/sh
#    Copyright 2016 Mirantis, Inc.
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

# NOTE(AKirilochkin): These lines should be enabled if patch is not applied.
sed -i -e "/if common_attrs.get('use_vcenter', {}).get('value') is True and/,+5 d" /usr/lib/python2.7/site-packages/nailgun/api/v1/validators/cluster.py
sed -i -e 's#vCenterNetworkBackends:\["network:neutron:core:nsx"#vCenterNetworkBackends:\["network:neutron:contrail","network:neutron:core:nsx"#' /usr/share/nailgun/static/build/bundle.js
systemctl restart nailgun.service
