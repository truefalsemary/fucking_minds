FROM ghcr.io/cirruslabs/flutter AS build

WORKDIR /app

# copy /frontend -> /app
COPY . . 

# get deps, genearte codegen files
RUN make deps
RUN make generate

# start flutter build for web release
RUN flutter build web --release

# switch to lightweight image which will contain only release files
FROM alpine

# copy artifact to nginx specific folder
RUN mkdir -p /usr/share/nginx/html
COPY --from=build /app/build/web /usr/share/nginx/html

# mark resulted path as volume 
# (
#    for docker compose it doesn't dreally mean anything
#    but it's good to see it in docker logs
# )
VOLUME [ "/usr/share/nginx/html" ]
