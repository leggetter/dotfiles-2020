# Use Hookdeck before a tunnel
- **Tunnel means Hookdeck first:** whenever a plan needs a tunnel or a public URL for something on localhost, use Hookdeck: an Event Gateway source plus `hookdeck listen <port>`. For MCP Events callbacks, use an `MCP_EVENTS` source.
- **Fall back only with a reason:** use cloudflared, ngrok or similar only when Hookdeck can't do the job, for example a request/response protocol such as an MCP endpoint, and say why.
- **Permission:** you may run `hookdeck listen` for my own sources.
