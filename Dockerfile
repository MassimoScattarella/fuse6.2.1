FROM centos:7

#install openjdk 8 and util
RUN yum install -y java-1.8.0-openjdk-devel wget unzip

# install maven 3.6.3
RUN wget https://www-us.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -P /tmp \
    && tar xf /tmp/apache-maven-3.6.3-bin.tar.gz -C /opt

# install fuse 6.2.1 redhat 159
ADD https://repository.jboss.org/nexus/content/groups/ea/org/jboss/fuse/jboss-fuse-full/6.2.1.redhat-159-04/jboss-fuse-full-6.2.1.redhat-159-04.zip /tmp
RUN unzip /tmp/jboss-fuse-full-6.2.1.redhat-159-04.zip -d /opt

ENV JAVA_HOME=/usr/lib/jvm/java-openjdk
ENV M2_HOME=/opt/apache-maven-3.6.3
ENV MAVEN_HOME=/opt/apache-maven-3.6.3
ENV FUSE=/opt/jboss-fuse-6.2.1.redhat-159-04
ENV PATH=${M2_HOME}/bin:${FUSE}/bin:${PATH}

EXPOSE 8181 



