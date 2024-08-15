FROM ghcr.io/cirruslabs/flutter AS build

WORKDIR /app

# copy /frontend -> /app
COPY . . 

# get deps, build models, build web release
RUN make build_web

# copy artifact to nginx specific folder
RUN mkdir -p /usr/share/nginx/html
COPY build/web /usr/share/nginx/html

# cleanup (remove sources) for minimal image size
RUN rm -rf /app

# mark resulted path as volume 
# (
#    for docker compose it doesn't dreally mean anything
#    but it's good to see it in docker logs
# )
VOLUME [ "/usr/share/nginx/html" ]
