# Use the kasmweb/chrome:1.8.0-edge image as the base image
FROM kasmweb/chrome:1.13.0

# Switch to the root user
USER root

# Copy the custom_startup.sh file to the /dockerstartup/ directory
# COPY ./custom_startup.sh /dockerstartup/custom_startup.sh

# Make the custom_startup.sh script executable
# RUN chmod +x /dockerstartup/custom_startup.sh
RUN iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 3000 -j DNAT --to-destination 127.0.0.1:3000
# USER 1000
# Switch back to the original user (kasm)
# USER kasm

# Set the entry point to custom_startup.sh
# ENTRYPOINT ["/dockerstartup/custom_startup.sh"]
