# docker-magento2-apache2
Basic docker configuration for Magneto 2

### To get this up and running:
1. Copy/clone your Magento 2.x project into the magento folder
2. `$ docker-compose build`
3. `$ docker-compose up`
4. Create database and install fresh Magento 2 or import from a dump

### Additional:
- to get into the containers and run your commands use `$ docker exec -it <containername> /bin/bash`
- If you want to access the site from `http://magento.local/` url don't forget to update hosts file on your machine
- I assume here that files in the magento folder are owned by www-data group

### Structure:
```
$ tree -L 1
.
├── db/                    //database will be saved in this folder so changes will persist
├── docker-compose.yaml
├── Dockerfile
├── magento/               //put your magento 2 project here
├── magento.local.conf
└── README.md
```
