# grammarly-nvim-dotfiles
Just storing my neovim config

- clone znck
- run the pnpmmm whatever commands to install and run build
- run the pnpmm test and verify that markdown passes
- find the hidden grammarly-languageserver in a subdir of this repo
- remove $HOME/.config/nvim
- link this repo to $HOME/.config/nvim
- edit my_config.lua and set the grammarly LSP cmd (using the one you just built in the znck dir)
- edit a markdown file. You should see marks in the far left column indicating grammar and spelling errors. Navigate through the errors with `]d`


