# ac-stack-ghc

Emacs auto-complete source for haskell.

## Requirements

 * stack
 * Emacs 24++
 * auto-complete

## Instllation

1. Clone this repo
2. Configure `.emacs`

```bash
(add-to-list 'load-path "/pathto/ac-stack-ghc/")
(setq ac-stack-ghc-dictionary-directory "/pathto/ac-stack-ghc/")
(require 'ac-stack-ghc)
```
