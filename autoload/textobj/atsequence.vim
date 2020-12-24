" textobj-atsequence Text objects for selecting a specfic match, a full word/WORD containing the match, or the remaining portion of a line including and after a sequence of characters.
" Version: 0.5.0
" Author : Tim Boehm <tmb92dev+vim@gmail.com>

let s:save_cpo = &cpo
set cpo&vim

function! textobj#atsequence#select_str_t()
  return s:select_target_at_sequence()
endfunction


function! textobj#atsequence#select_a_str_w()
  return s:select_word_at_sequence(1, 0)
endfunction

function! textobj#atsequence#select_i_str_w()
  return s:select_word_at_sequence(0, 0)
endfunction


function! textobj#atsequence#select_a_str_W()
  return s:select_word_at_sequence(1, 1)
endfunction

function! textobj#atsequence#select_i_str_W()
  return s:select_word_at_sequence(0, 1)
endfunction

" todo caution, the usage of a and i might feel unintuitive (and incorrect) for
" VIM users. The regular meaning, however, does not make much sense for me here.

function! textobj#atsequence#select_str_l()
  return s:select_remaining_line_at_sequence()
endfunction


function! s:select_target_at_sequence()
  try
    call inputsave()
    let target = input('jump to target: ')
    call inputrestore()
    if !search(target, 'c', 1)
      return 0
    endif
    let startpos = getpos('.')
    " todo is there a way to improve this
    if !search(target, 'ce', 1)
      return 0
    endif
    let endpos = getpos('.')
    return ['v', startpos, endpos]
  endtry
endfunction

function! s:select_word_at_sequence(A, W)
  try
    call inputsave()
    let target = input('jump to target: ')
    call inputrestore()
    if !search(target, 'c', 1)
      return 0
    endif
    if a:A
      if a:W
        normal! B
      else
        normal! b
    endif
    let startpos = getpos('.')
    if a:W
      normal! E
    else
      normal! e
    endif
    let endpos = getpos('.')
    return ['v', startpos, endpos]
  endtry
endfunction


function! s:select_remaining_line_at_sequence()
  try
    call inputsave()
    let target = input('jump to target: ')
    call inputrestore()
    if !search(target, 'c', 1)
      return 0
    endif
    let startpos = getpos('.')
    normal! $
    let endpos = getpos('.')
    return ['v', startpos, endpos]
  endtry
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
