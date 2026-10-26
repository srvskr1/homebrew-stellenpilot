# Homebrew tap for Stellenpilot

```bash
brew tap srvskr1/stellenpilot
brew trust --formula srvskr1/stellenpilot/stellenpilot
brew install stellenpilot
```

Homebrew 7 and newer refuses formulas from taps you haven't trusted, so the `brew trust` line is needed once.

Update with `brew upgrade stellenpilot`. The formula here is updated automatically on every release of [srvskr1/stellenpilot](https://github.com/srvskr1/stellenpilot), so you don't need to do anything else.

It installs the same package as `pip install stellenpilot`, in its own Python environment, so it never touches your other Python setups.
