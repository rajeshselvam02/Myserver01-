FROM node:22-slim

# Install OpenClaw
RUN npm install -g openclaw@latest

# Create config directory
RUN mkdir -p /root/.openclaw

# Copy config
COPY openclaw.json /root/.openclaw/openclaw.json

# Expose gateway port
EXPOSE 18789

# Start OpenClaw gateway
CMD ["openclaw", "gateway"]
