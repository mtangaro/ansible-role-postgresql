#FROM grycap/travis:centos7
FROM grycap/travis:ubuntu1604
#FROM centos:7
#FROM indigodatacloud/centos-sshd:7
#FROM indigodatacloud/ubuntu-sshd:16.04

MAINTAINER ma.tangaro@gmail.com

ENV container docker

COPY ["playbook.yaml","/"]

RUN apt-get -y install software-properties-common &&\
    apt-add-repository -y ppa:ansible/ansible &&\
    apt-get -y update &&\
    apt-get -y install ansible

RUN ansible-galaxy install mtangaro.ansible-role-postgresql

RUN echo "localhost" > /etc/ansible/hosts

RUN ansible-playbook /playbook.yaml

EXPOSE 21 22 80
