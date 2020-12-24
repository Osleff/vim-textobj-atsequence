" textobj-atsequence Text objects for selecting a specfic match, a full word/WORD containing the match, or the remaining portion of a line including and after a sequence of characters.
" Version: 0.5.0
" Author : Tim Boehm <tmb92dev+vim@gmail.com>

if exists('g:loaded_textobj_atsequence')
  finish
endif
let g:loaded_textobj_atsequence = 1

let s:save_cpo = &cpo
set cpo&vim

" Interface "{{{1
call textobj#user#plugin('atsequence', {
\      'target': {
\        'select': 'ztt', '*select-function*': 'textobj#atsequence#select_str_t',
\      },
\      'word': {
\        'select-a': 'aztw', '*select-a-function*': 'textobj#atsequence#select_a_str_w',
\        'select-i': 'iztw', '*select-i-function*': 'textobj#atsequence#select_i_str_w',
\      },
\      'WORD': {
\        'select-a': 'aztW', '*select-a-function*': 'textobj#atsequence#select_a_str_W',
\        'select-i': 'iztW', '*select-i-function*': 'textobj#atsequence#select_i_str_W',
\      },
\      'line': {
\        'select': 'ztl', '*select-function*': 'textobj#atsequence#select_str_l',
\      },
\    })
" between
" atchar
"
let &cpo = s:save_cpo
unlet s:save_cpo
