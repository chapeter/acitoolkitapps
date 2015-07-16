ACI Toolkit Apps
====================

Scripts to pull pre-built docker containers based on the ACI Toolkit apps


## Environment

Required

* Docker


## Downloading

Clone the repository

     git clone https://github.com/chapeter/acitoolkitapps


# Usage

Modify run.sh with the appropriate values for 

     APIC_IP=10.10.10.10
     APIC_USERNAME=admin
     APIC_PASSWORD=password

Run run.sh
	./run.sh


Check out the pages:
	http://127.0.0.1:5000 - Endpoint tracker
        http://127.0.0.1:5001 - Visualizer
        http://127.0.0.1:5002 - Snapback

You can also access these remotely

dockerkillall.sh can be used to remove all images you currently have

