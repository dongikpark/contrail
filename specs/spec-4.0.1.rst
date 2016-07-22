================================
Fuel Contrail plugin 4.0.1 specs
================================


Provide dedicated Contrail Analytics node
=========================================

Problem description
-------------------

Contrail plugin 3.0 implements deployment of Contrail analytics services
in co-location with Contrail config services on the nodes with role
'contrail-config'.
In highly scaled environments under load by thousands of network objects
and instances, a high amount of analytics data can be continiously generated,
causing the high resource usage by contrail-analytics services. That can
negatively impact the performance of contrail-config services running on
the name node.

Proposed solution
-----------------

Create a plugin-defined node role with name 'contrail-analytics' to provide the
possibility to deploy the components of contrail-analytics to a dedicated node or
set of nodes.
The services that should be moved to a dedicated role are Collector, Analytics
API, Query engine, Topology and Alarm generator.
Haproxy configuration should be updated to change the backend addresses to hosts
running analytics api [0].
This role is mandatory for the contrail-enabled environments, so there must be
at least one node with this role. To achieve high availability the environment
should contain multiple nodes with 'contrail-analytics' role, odd number is
recommended.
The 'contrail-analytics' role can be mixed with other contrail roles
('contrail-db','contrail-config','contrail-control') in small environments,
but not compatible with other OpenStack roles on the same node.
It should be possible to add or remove contrail-analytics nodes after environment
has been deployed.

UI impact
---------

There are no changes in plugin settings tab.

Performance impact
------------------

Using dedicated nodes for contrail analytics can enhance performance of contrail
config services.

Documentation Impact
--------------------

User guide should be updated with information on new node role.

Upgrade impact
--------------

Experimental scripts for contrail packages upgrade should be updated with
upgrade tasks for 'contrail-analytics' role.

Data model impact
-----------------

None

Other end user impact
---------------------

A new role with name 'contrail-analytics' will be available for assigning to
slaves in nodes tab of Fuel Web UI.

Security impact
---------------

None

Notifications impact
--------------------

None

Requirements
------------

Server requirements are described in [1].
There is no additional disk space requirements for this role, as analytics
services store the data in Cassandra database.



Enable memcache support for contrail keystone middleware
========================================================

Problem description
-------------------

In highly scaled environments under load by thousands of network objects
and instances validating the identity of every client on every request can cost a lot of
computing resources that can produces a big latency in work of Contrail and OpenStack services.
That can negatively impact the performance of whole environment.

Proposed solution
-----------------

Enable caching keystone tokens for Contrail purposes. Similar to `OpenStack approach <http://docs.openstack.org/developer/keystonemiddleware/middlewarearchitecture.html#improving-response-time>`_
Contrail can cache authentication responses from the keystone in memcache. This feature will be enabled by
default and doesn't require any additional settings from Fuel UI. Kyestone middleware will use memcache servers running on OpenStack controllers.

UI impact
---------

There are no changes in plugin settings tab.

Performance impact
------------------

Using caching keystone tokens for Contrail can reduce load of keystone service
respectively enhance performance of Contrail and OpenStack services

Documentation Impact
--------------------

None

Upgrade impact
--------------

None

Data model impact
-----------------

None

Other end user impact
---------------------

None

Security impact
---------------

None

Notifications impact
--------------------

None

Requirements
------------

None

Implementation
==============

Assignee(s)
-----------

Primary assignee:

- Oleksandr Martsyniuk <omartsyniuk> - tech lead, developer
- Vitalii Kovalchuk <vkovalchuk> - developer

Project manager:

- Andrian Noga <anoga>

Quality assurance:

- Oleksandr Kosse <okosse>
- Olesya Tsvigun <otsvigun>

Work items
----------

* Development

 - Update the plugins metadata with 'contrail-analytics' role definition
 - Create new deployment tasks
 - Re-factor the contrail module to ensure that all analytics tasks can be executed separately
 - Update other manifests to support dedicated analytics nodes
 - Adjust the experimental upgrade scripts to run on contrail-analytics role
 - Add python-memcache package to manifests for 'contrail-config' role and adjust the contrail-keystone configuration with memcached server IPs

* Testing

 - Update tests and test plans to cover new functionality
 - Automation scripts should be updated to deploy environments which contain nodes with 'contrail-analytics' role

* Documentation

 - User guide should be updated to cover the new roles and features


Acceptance criteria
===================

User can deploy contrail analytics services on node with contrail-analytics role.
Analytics services should be up and running, the status can be verified with
contrail-status command.

References
==========

[0] https://github.com/Juniper/contrail-controller/wiki/Roles-Daemons-Ports
[1] http://www.juniper.net/techpubs/en_US/contrail3.0/topics/task/installation/hardware-reqs-vnc.html