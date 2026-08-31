# gallery-dl config

Basic config for [gallery-dl](https://github.com/mikf/gallery-dl) using [Pkl](https://pkl-lang.org/).

### Getting Started

1. Install Pkl
2. Install [just](https://github.com/casey/just)
3. Rename `.env.example` to `.env`:

```bash
mv .env.example .env
```
4. Update the placeholders in `.env`, add other values as needed, and regenerate the `config.json`:

```bash
just build
```
