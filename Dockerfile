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

RUN yum install --assumeyes libffi-devel \
    openssl-devel \
    git gcc \
    bzip2-devel \
    wget

RUN cd /usr/src && wget https://www.python.org/ftp/python/2.7.16/Python-2.7.16.tgz && tar xzf Python-2.7.16.tgz

RUN cd /usr/src/Python-2.7.16 && ./configure --enable-optimizations && make altinstall

RUN /usr/local/bin/python2.7 -V

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python2.7 get-pip.py

RUN pip install --upgrade setuptools && pip install ansible urllib3 pyOpenSSL ndg-httpsclient pyasn1

RUN ansible --version
RUN python --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
