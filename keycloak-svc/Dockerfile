FROM jboss/keycloak
ENV KEYCLOAK_USER admin
ENV KEYCLOAK_PASSWORD foobar
ENV KEYCLOAK_IMPORT /tmp/realm-export.json
ENV KEYCLOAK_FRONTEND_URL http://localhost:8080/auth
COPY realm-export.json /tmp/realm-export.json
