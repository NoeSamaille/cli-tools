FROM registry.access.redhat.com/ubi8/podman:8.8

USER root 

# Install required packages
RUN dnf install -y httpd-tools openssl wget skopeo jq zip git tar vim && \
    dnf clean all

# Install Helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    rm -f ./get_helm.sh

# Install oc & kubectl 
RUN wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz && \
    tar -xvf openshift-client-linux.tar.gz && \
    mv oc /usr/local/bin && mv kubectl /usr/local/bin && \
    rm -f openshift-client-linux.tar.gz && rm -f README.md

# Install ncdu
RUN wget https://dev.yorhel.nl/download/ncdu-2.2.1-linux-x86_64.tar.gz && \
    tar -xvf ncdu-2.2.1-linux-x86_64.tar.gz && \
    mv ncdu /usr/local/bin && \
    rm -f ncdu-2.2.1-linux-x86_64.tar.gz

# Install yq
RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64.tar.gz && \
    tar -xvf yq_linux_amd64.tar.gz && \
    mv yq_linux_amd64 /usr/local/bin/yq && \
    rm -f yq_linux_amd64.tar.gz yq.1 install-man-page.sh

# Install rclone
RUN curl https://rclone.org/install.sh | bash

# Install grpcurl
RUN wget https://github.com/fullstorydev/grpcurl/releases/latest/download/grpcurl_1.8.7_linux_x86_64.tar.gz && \
    tar -xvf grpcurl_1.8.7_linux_x86_64.tar.gz && \
    mv grpcurl /usr/local/bin && \
    rm -f grpcurl_1.8.7_linux_x86_64.tar.gz LICENSE

USER podman

WORKDIR /home/podman

ENTRYPOINT ["/bin/sh"]
