textobj-atsequence.vim
===============

This plugin provides the ability to move to a character (sequence) inside the current line and select the specific match , the full word/WORD containing the match,  or the rest of the line content following it.


Installation
------------

Using [vim-plug][]:

``` vim
" add this line to your ~/.vimrc
Plug 'Osleff/vim-textobj-atsequence'
```

then run `:PlugInstall` from within Vim.

This plugin depends on [vim-textobj-user](https://github.com/kana/vim-textobj-user).
Please install it in advance.

Usage
-----

Example:

- `castw` `<input>` => Move to the next occurence of the `<input>`, delete the full word it is part of and put user in insert mode.
