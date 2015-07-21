#!/bin/bash

APIC_IP=
APIC_USERNAME=
APIC_PASSWORD=c

#launch the db node
echo "********************"
echo "*Launching Database*"
echo "********************"
sudo docker run -d --name db chapeter/db
#wait for the db node to come up so that it can be linked
sleep 20
echo "********************"
echo "*  Launching App   *"
echo "********************"
sudo docker run -d --link db:db --name app chapeter/app /opt/acitoolkit/applications/endpointtracker/aci-endpoint-tracker.py -u https://$APIC_IP -l $APIC_USERNAME -p $APIC_PASSWORD -i db -a root -s ''
# launch presentation nodes
echo "********************"
echo "*  Launching Viz   *"
echo "********************"
sudo docker run -d -p 5001:5001 --link db:db --name viz chapeter/viz
echo "********************"
echo "*  Launching Web   *"
echo "********************"
sudo docker run -d -p 5000:5000 --link db:db --name web chapeter/web
echo "********************"
echo "*Launching Snapback*"
echo "********************"
sudo docker run -d -p 5002:5002 --name snapback chapeter/snapback
echo "********************"
echo "*Launching Webtools*"
echo "********************"
sudo docker run -p 5003:80 -d dockercisco/aci

echo "Launching Config Explorer"
sudo docker run -d -p 5004:5004 --name confexplorer chapeter/confexplorer python /opt/confexplorer/explorer.py -u http://$APIC_IP -l $APIC_USERNAME -p $APIC_PASSWORD --host 0.0.0.0 --port 5004

echo "*************************************"
echo "* localhost:5000 - Endpoint Tracker *"
echo "* localhost:5001 - Vizualizer       *"
echo "* localhost:5002 - Snapback         *"
echo "* localhost:5003 - Webtools         *"
echo "* localhost:5004 - Configexplorer   *"
echo "*************************************"
