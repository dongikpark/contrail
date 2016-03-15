============
DPDK testing
============


Contrail HA DPDK
----------------


ID
##

contrail_ha_dpdk


Description
###########

Check Contrail deploy on HA environment


Complexity
##########

advanced


Steps
#####

    1. Create an environment with "Neutron with tunneling segmentation" as a network configuration and CEPH storage
    2. Enable and configure Contrail plugin
    3. Deploy cluster with some controller+mongo, compute+ceph-osd, compute+dpdk and contrail-specified nodes
    4. Run OSTF tests


Expected results
################

All steps should pass


Contrail DPDK add compute
-------------------------


ID
##

contrail_dpdk_add_compute


Description
###########

Verify that Contrail compute role can be added after deploying


Complexity
##########

advanced


Steps
#####

    1. Create an environment with "Neutron with tunneling segmentation" as a network configuration
    2. Enable and configure Contrail plugin
    3. Deploy cluster with some controller+mongo, compute+ceph-osd, compute+dpdk and contrail-specified nodes
    4. Run OSTF tests
    5. Check Controller and Contrail nodes status
    6. Add one node with "compute+ceph-osd" role
    7. Deploy changes
    8. Run OSTF tests


Expected results
################

All steps should pass


Contrail DPDK delete compute
----------------------------


ID
##

contrail_dpdk_delete_compute


Description
###########

Verify that Contrail compute role can be deleted after deploying


Complexity
##########

advanced


Steps
#####

    1. Create an environment with "Neutron with tunneling segmentation" as a network configuration
    2. Enable and configure Contrail plugin
    3. Deploy cluster with some controller+mongo, compute+ceph-osd, compute+dpdk and contrail-specified nodes
    4. Run OSTF tests
    5. Delete node with "compute" role
    6. Deploy changes
    7. Run OSTF tests


Expected results
################

All steps should pass


Contrail DPDK add dpdk
----------------------


ID
##

contrail_dpdk_add_dpdk


Description
###########

Verify that DPDK role can be added after deploying


Complexity
##########

advanced


Steps
#####

    1. Create an environment with "Neutron with tunneling segmentation" as a network configuration
    2. Enable and configure Contrail plugin
    3. Deploy cluster with some controller+mongo, compute+ceph-osd, compute+dpdk and contrail-specified nodes
    4. Run OSTF tests
    6. Add a node with "compute+dpdk" roles
    7. Deploy changes
    8. Run OSTF tests


Expected results
################

All steps should pass


Contrail DPDK delete dpdk
-------------------------


ID
##

contrail_dpdk_delete_dpdk


Description
###########

Verify that DPDK role can be deleted after deploying


Complexity
##########

advanced


Steps
#####

    1. Create an environment with "Neutron with tunneling segmentation" as a network configuration
    2. Enable and configure Contrail plugin
    3. Deploy cluster with some controller+mongo, compute+ceph-osd, compute+dpdk and contrail-specified nodes
    4. Run OSTF tests
    5. Delete node with compute+dpdk roles
    6. Deploy changes
    7. Run OSTF tests


Expected results
################

All steps should pass


Check updating core repos with Contrail plugin and DPDK
-------------------------------------------------------


ID
##

contrail_dpdk_update_core_repos


Description
###########

Check updating core repos with Contrail plugin and DPDK


Complexity
##########

advanced


Steps
#####

    1. Deploy cluster with some controller+mongo, compute+ceph-osd, compute+dpdk and contrail-specified nodes
    2. Run “fuel-createmirror -M” on the master node
    3. Update repos for all deployed nodes with command "fuel --env <ENV_ID> node --node-id <NODE_ID1>, <NODE_ID2>, <NODE_ID_N> --tasks upload_core_repos" on the master node


Expected results
################

All steps must be completed successfully, without any errors