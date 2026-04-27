# dotfiles

Personal dotfiles managed with [`chezmoi`](https://www.chezmoi.io/).

I borrowed some ideas from [boranuzun](https://github.com/boranuzun/dotfiles/tree/main),
who also wrote a nice blog article about
[managing dotfiles](https://boranuzun.ch/blog/dotfiles-setup/).

## Setup on new machine

```bash
chezmoi init --apply samnooij
```

## Reminder to self: things that I think are nice to add in chezmoi

- script to download and update 'hosts' file
- DNS settings?
- preferences (theme, etc.) for:
  - ptyxis
  - Zen profile? (does it also work with extensions?)
- conky?
