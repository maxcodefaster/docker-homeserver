### Start of configuration add by letsencrypt container
location ^~ /.well-known/acme-challenge/ {
    auth_basic off;
    allow all;
    root /usr/share/nginx/html;
    try_files $uri =404;
    break;
}
### End of configuration add by letsencrypt container



# static files
location ^~ /loleaflet {
    proxy_pass https://office.maxperience.com;
    proxy_set_header Host $http_host;
}

# WOPI discovery URL
location ^~ /hosting/discovery {
    proxy_pass https://office.maxperience.com;
    proxy_set_header Host $http_host;
}

# main websocket
location ~ ^/lool/(.*)/ws$ {
    proxy_pass https://office.maxperience.com;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header Host $http_host;
    proxy_read_timeout 36000s;
}

# download, presentation and image upload
location ~ ^/lool {
    proxy_pass https://office.maxperience.com;
    proxy_set_header Host $http_host;
}

# Admin Console websocket
location ^~ /lool/adminws {
    proxy_pass https://office.maxperience.com;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header Host $http_host;
    proxy_read_timeout 36000s;
}

