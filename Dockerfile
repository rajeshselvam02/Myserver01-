FROM node:22-slim

RUN npm install -g openclaw@latest
RUN mkdir -p /root/.openclaw

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 18789
CMD ["/entrypoint.sh"]
