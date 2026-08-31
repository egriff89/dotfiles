# gallery-dl config

Basic config for [gallery-dl](https://github.com/mikf/gallery-dl) using [Pkl](https://pkl-lang.org/).

### Getting Started

1. Install Pkl
2. Install [just](https://github.com/casey/just)
3. Rename `config.pkl.example` to `config.pkl` and `.env.example` to `.env`:

```bash
mv config.pkl.example config.pkl
mv .env.example .env
```
4. Replace the `XXXX` placeholders in `.env`, add other values as needed, and regenerate the `config.json`:

```bash
just build
```
