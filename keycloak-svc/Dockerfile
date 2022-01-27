FROM jboss/keycloak
ENV KEYCLOAK_USER dalong
ENV KEYCLOAK_PASSWORD dalongrong
ENV KEYCLOAK_IMPORT /tmp/realm-export.json
ENV KEYCLOAK_FRONTEND_URL http://localhost:8080/auth
COPY realm-export.json /tmp/realm-export.json
