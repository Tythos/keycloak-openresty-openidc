local cjson = require("cjson");

function init()
    local opts = {
        redirect_uri_path = "/redirect_uri",
        accept_none_alg = true,
        discovery = "http://keycloak-svc:8080/auth/realms/restybox-realm/.well-known/openid-configuration",
        client_id = "restybox-client",
        client_secret = "xcUh0eE5nCalyJBi2nGq6o1q3cYARdJg",
        redirect_uri_scheme = "http",
        logout_path = "/logout",
        redirect_after_logout_uri = "http://localhost:8080/auth/realms/restybox-realm/protocol/openid-connect/logout?redirect_uri=http://localhost:8090/",
        redirect_after_logout_with_id_token_hint = false,
        use_nonce = false,
        session_contents = {id_token = true}
    }

    local res, err = require("resty.openidc").authenticate(opts)
    if err then
        ngx.status = 403
        ngx.say(err)
        ngx.exit(ngx.HTTP_FORBIDDEN)
    end
end

return init
