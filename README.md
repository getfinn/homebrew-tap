# Homebrew Tap for Finn

This is the official [Homebrew](https://brew.sh) tap for [Finn](https://tryfinn.ai) - the desktop daemon that lets you control LLM assistants from your phone.

## Installation

```bash
brew tap getfinn/tap
brew install finn
```

## Updating

```bash
brew update
brew upgrade finn
```

## Usage

After installation, run `finn` to start the daemon. It will appear in your menu bar.

1. Click the menu bar icon and select **Sign In**
2. Approve the folders you want to work with
3. Use the Finn mobile app to send prompts

For detailed instructions, visit [tryfinn.ai/download](https://tryfinn.ai/download).

## Troubleshooting

### Gatekeeper warning

If macOS shows a security warning:

```bash
xattr -d com.apple.quarantine $(which finn)
```

### Uninstall

```bash
brew uninstall finn
brew untap getfinn/tap
```

## Links

- [Website](https://tryfinn.ai)
- [Download Page](https://tryfinn.ai/download)
- [Source Code](https://github.com/getfinn/finn)
