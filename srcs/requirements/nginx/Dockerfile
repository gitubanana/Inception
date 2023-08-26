FROM alpine:3.17
RUN apk update && \
    apk add nginx dumb-init openssl
RUN openssl req \
    -x509 \
    -newkey rsa:2048 \
    -nodes \
    -subj "/C=KO/ST=Seoul/L=Gangnam/O=42seoul/CN=taeypark.42.fr" \
    -keyout /etc/nginx/private.key -out /etc/nginx/certificate.crt

COPY nginx.conf /etc/nginx/nginx.conf
COPY my_files /etc/nginx/my_files


ENTRYPOINT ["dumb-init", "--"]
CMD ["nginx", "-g", "daemon off;"]
