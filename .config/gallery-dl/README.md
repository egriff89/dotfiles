# gallery-dl config

Basic config for [gallery-dl](https://github.com/mikf/gallery-dl) using [Pkl](https://pkl-lang.org/).

### Getting Started

1. Install [mise-en-place](https://mise.jdx.dev/) if not already installed

2. Install Pkl and [just](https://github.com/casey/just)

```bash
mise install --locked
```

3. Rename `.env.example` to `.env`:

```bash
mv .env.example .env
```
4. Update the placeholders in `.env`, add other values as needed, and regenerate the `config.json`:

```bash
just build
```
