FROM registry.access.redhat.com/openshift3_beta/ose-docker-builder:v0.4.3.2
MAINTAINER Daniel Tschan <tschan@puzzle.ch>

RUN yum -y --disablerepo=brew --enablerepo=rhel-7-server-extras-rpms --enablerepo=rhel-7-server-optional-rpms install docker java-1.7.0-openjdk-devel maven; yum clean all

ADD ./build.sh /tmp/build.sh
ADD ./settings.xml /root/.m2/settings.xml

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/tmp/build.sh"]
