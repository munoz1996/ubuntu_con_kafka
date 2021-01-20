#!/bin/bash
# Usage: kafka-install-script.sh
# Author: Luis Angel Vanegas
# Version: 1.0

# instalar Java
sudo su
sudo apt-get update
sudo apt-get install default-jre -y

# instala Zookeeper
sudo apt-get install zookeeperd -y

# cree un usuario de servicio para Kafka
sudo adduser --system --no-create-home --disabled-password --disabled-login kafka

# instalación de Kafka
cd ~
wget http://www-eu.apache.org/dist/kafka/2.7.0/kafka_2.13-2.7.0.tgz
curl http://kafka.apache.org/KEYS | gpg --import
wget https://dist.apache.org/repos/dist/release/kafka/2.7.0/kafka_2.13-2.7.0.tgz.asc
gpg --verify kafka_2.13-2.7.0.tgz.asc kafka_2.13-2.7.0.tgz
sudo mkdir /opt/kafka
sudo tar -xvzf kafka_2.13-2.7.0.tgz --directory /opt/kafka --strip-components 1
rm -rf kafka_2.13-2.7.0.tgz kafka_2.13-2.7.0.tgz.asc

# Configurar Kafka Server
sudo mkdir /var/lib/kafka
sudo mkdir /var/lib/kafka/data

# garantizar el permiso de los directorios
sudo chown -R kafka:nogroup /opt/kafka
sudo chown -R kafka:nogroup /var/lib/kafka