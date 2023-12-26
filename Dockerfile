FROM jboss/keycloak:latest

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
# ENV KC_DB=postgres


# change these values to point to a running postgres instance
# ENV KC_DB=postgres
# ENV KC_DB_URL=<DBURL>
# ENV KC_DB_USERNAME=<DBUSERNAME>
# ENV KC_DB_PASSWORD=<DBPASSWORD>
ENV KEYCLOAK_HOSTNAME=localhost
# ENV KEYCLOAK_USER=<KCUSER>
# ENV KEYCLOAK_PASSWORD=<KCPASSWORD>
ENV KEYCLOAK_HTTPS_CERTIFICATE=keycloak-server-ugrg.onrender
ENV KEYCLOAK_HTTPS_KEY=keycloak-server-ugrg.onrender
ENV KEYCLOAK_HTTP_PORT=8000
ENV PORT=8000

COPY docker-entrypoint.sh /opt/jboss/tools
USER root
RUN chmod +x /opt/jboss/tools/docker-entrypoint.sh
ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]

