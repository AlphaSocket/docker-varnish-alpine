FROM alpine:latest

ADD setup.sh setup.sh
RUN chmod +rx setup.sh && sync && ./setup.sh

EXPOSE 80