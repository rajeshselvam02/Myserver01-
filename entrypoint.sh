#!/bin/sh
cat > /root/.openclaw/openclaw.json << CONF
{
  "models": {
    "mode": "merge",
    "providers": {
      "nvidia": {
        "baseUrl": "https://integrate.api.nvidia.com/v1",
        "apiKey": "$NVIDIA_API_KEY",
        "api": "openai-completions",
        "models": [{"id": "z-ai/glm5", "name": "GLM5", "contextWindow": 16000, "maxTokens": 4096}]
      }
    }
  },
  "agents": {"defaults": {"model": {"primary": "nvidia/z-ai/glm5"}}},
  "channels": {
    "telegram": {
      "enabled": true,
      "dmPolicy": "open",
      "allowFrom": ["*"],
      "botToken": "$TELEGRAM_BOT_TOKEN",
      "groupPolicy": "open",
      "groupAllowFrom": ["*"]
    }
  },
  "gateway": {
    "port": 18789,
    "mode": "local",
    "bind": "loopback",
    "auth": {"mode": "token", "token": "$GATEWAY_TOKEN"}
  }
}
CONF
exec node --max-old-space-size=400 $(which openclaw-gateway || which openclaw) gateway
