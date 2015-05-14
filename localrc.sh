DATABASE_PASSWORD=password
RABBIT_PASSWORD=password
SERVICE_TOKEN=password
SERVICE_PASSWORD=password
ADMIN_PASSWORD=password
FLOATING_RANGE=10.3.0.0/27
FLAT_INTERFACE=eth0
LOGFILE=/home/stack/stack.sh.log
Q_FLOATING_ALLOCATION_POOL=start=10.3.0.122,end=10.3.0.132
PUBLIC_NETWORK_GATEWAY=10.3.0.1

disable_service n-net
enable_service q-svc
enable_service q-agt
enable_service q-dhcp
enable_service q-l3
enable_service q-meta
enable_service neutron
# Optional, to enable tempest configuration as part of devstack
enable_service tempest
