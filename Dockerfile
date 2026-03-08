FROM node:22-slim

# Install git (required by openclaw)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install OpenClaw
RUN npm install -g openclaw@latest

# Create config directory
RUN mkdir -p /root/.openclaw

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 18789
CMD ["/entrypoint.sh"]
