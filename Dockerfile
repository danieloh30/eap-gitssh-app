FROM quay.io/danieloh30/jboss-eap-7-tech-preview-eap74-openjdk11-openshift-rhel8:7.4.0.Beta-4 

COPY jboss-eap-7.4.0.Beta/cs_example.cs /opt/eap/bin

USER root
RUN dnf install -y openssh-clients

RUN mkdir -p /home/jboss/.ssh
RUN ssh-keyscan github.com >> /home/jboss/.ssh/known_hosts

USER root
RUN chown -R jboss /home/jboss/.ssh
RUN chmod -R a+w /home/jboss/.ssh
