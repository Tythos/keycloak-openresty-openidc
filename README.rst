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

To replicate, from project root::

  > docker-compose build

  > docker-compose up --force-recreate --remove-orphans

Then browse to "http://localhost:8090" to start the OIDC flow. You can
circumvent the origin issue by, once you encounter the aforementioned origin
issue, by replacing "keycloak-svc" with "localhost", which will forward you to
the correct login interface. Once there, though, you will need to add a user
to proceed. To add a user, browse to "http://localhost:8080" in a separate tab
and follow these steps before returning to the original tab and entering the
credentials:

* Under Users > Add user:

  * username = "testuser"

  * email = "{{whatever}}"

  * email verified = ON

  * Groups > add "restybox-group"

* After user created:

  *	Go to "Credentials" tab

  * Set to "mypassword"

  * Temporary = OFF
