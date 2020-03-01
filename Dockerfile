FROM centos:centos6

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-centos-centos6-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-centos-centos6-action"

LABEL "com.github.actions.name"="check-ansible-centos-centos6"
LABEL "com.github.actions.description"="Check ansible role or playbook with CentOS centos6"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

RUN yum update --assumeyes
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

RUN yum install --assumeyes python-devel \
    libffi-devel \
    openssl-devel \
    python-pip \
    git \
    ansible

RUN ansible --version
RUN python --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
