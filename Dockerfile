FROM lighthopper/openjdk-centos:latest
MAINTAINER Jason Sims

# Install dependencies
RUN su -c "yum --assumeyes install unzip"
RUN su -c "yum --assumeyes install wget"

# Fetch the wso2is package
RUN wget --user-agent="fido" \
--output-document /opt/wso2is.zip \
--referer="http://connect.wso2.com/wso2/getform/reg/new_product_download" \
http://product-dist.wso2.com/products/identity-server/5.0.0/wso2is-5.0.0.zip

# Install binary
RUN unzip /opt/wso2is.zip -d /opt

EXPOSE 9443
CMD ["/opt/wso2is-5.0.0/bin/wso2server.sh", "start"]
