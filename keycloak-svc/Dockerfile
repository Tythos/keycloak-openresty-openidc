FROM jboss/keycloak
ENV KEYCLOAK_USER dalong
ENV KEYCLOAK_PASSWORD dalongrong
ENV PROXY_ADDRESS_FORWARDING true
ENV KEYCLOAK_IMPORT /tmp/realm-export.json
COPY realm-export.json /tmp/realm-export.json
