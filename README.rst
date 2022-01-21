I am experimenting with a two-service docker-compose recipe, largely based on
the following GitHub project:

    https://github.com/rongfengliang/keycloak-openresty-openidc

After streamlining, my configuration looks something like the following fork
commit:

    https://github.com/Tythos/keycloak-openresty-openidc

My current issue is, the authorization endpoint ("../openid-connect/auth") uses
the internal origin ("http://keycloak-svc:"). Obviously, if users are
redirected to this URL, their browsers will need to cite the external origin
("http://localhost:"). I thought the PROXY_ADDRESS_FORWARDING variable for the
Keycloak service would fix this, but I'm wondering if I need to do something
like a rewrite on-the-fly in the nginx/openresty configuration.
