Keycloak-OpenResty-OpenIDC
==========================

Question
--------

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

Answer
------

Authorization Servers such as Keycloak have a base / internet URL when running
behind a reverse proxy. You don't need to do anything dynamic in the reverse
proxy - have a look at the frontend URL configuration.

Out of interest I just answered a similar question here, that may help you to
understand the general pattern. Aim for good URLs (not localhost) and a
discovery endpoint that returns intermet URLs rather than internal URLs.

Many thanks to Gary Archer:

  https://stackoverflow.com/users/9019885/gary-archer)

He wrote the above reply to the original StackOverflow post:

  https://stackoverflow.com/questions/70795255/configuring-keycloak-oidc-with-an-nginx-openresty-reverse-proxy/70854753#70854753

Confirmation
------------

Most groovy. Upon closer inspection, based on your feedback, the
KEYCLOAK_FRONTEND_URL environmental variable was set to
"http://localhost:8080/auth" (see recent commit if you are coming upon this
later in history), and the PROXY_ADDRESS_FORWARDING environmental variable was
removed entirely. Not only does this address the frontend address issues
(after a few try-fail iterations on the exact value), it even passes the
successful authorization back through the correct flow now. Wonderful. The
official Docker Hub page for jboss/keycloak was also useful:

  https://hub.docker.com/r/jboss/keycloak
