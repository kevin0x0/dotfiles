vim9script
if exists('g:loaded_emacscmd')
  finish
endif
g:loaded_emacscmd = 1

const key_right = "\<Right>"
const key_left = "\<Left>"
const key_backspace = "\<Backspace>"
const key_del = "\<Del>"

def Skip(forward: bool, Is_expected: func): number
  var line = getcmdline()
  var col = getcmdpos()

  var before = strpart(line, 0, col - 1)
  var startidx = strchars(before)
  var idx_delta: number
  if forward
    idx_delta = 1
    if col == strlen(line) + 1
      return 0
    endif
  else
    idx_delta = -1
    if col == 0
      return 0
    endif
    startidx = startidx - 1
  endif

  var charidx = startidx

  var found = false
  var ch = strcharpart(line, charidx, 1)
  while ch != '' && (!found || Is_expected(ch))
    if !found && Is_expected(ch)
      found = true
    endif

    charidx += idx_delta

    ch = strcharpart(line, charidx, 1)
  endwhile

  return abs(charidx - startidx)
enddef

def Skip_word(forward: bool): number
  return Skip(forward, (ch) => ch =~ '^[[:alnum:]]$')
enddef

def Forward_word()
  var count = Skip_word(true)
  for _ in range(count)
    feedkeys(key_right)
  endfor
enddef

def Backward_word()
  var count = Skip_word(false)
  for _ in range(count)
    feedkeys(key_left)
  endfor
enddef

def Forward_delete_word()
  var count = Skip_word(true)
  for _ in range(count)
    feedkeys(key_del)
  endfor
enddef

def Backward_delete_word()
  var count = Skip_word(false)
  for _ in range(count)
    feedkeys(key_backspace)
  endfor
enddef

def Delete_to_end()
  var line = getcmdline()
  var count = strcharlen(line[getcmdpos() - 1 :])
  for _ in range(count)
    feedkeys(key_del)
  endfor
enddef

def Skip_WORD(forward: bool): number
  return Skip(forward, (ch) => ch != "\t" && ch != " " && ch != "\n")
enddef

def Backward_delete_WORD()
  var count = Skip_WORD(false)
  for _ in range(count)
    feedkeys(key_backspace)
  endfor
enddef

cnoremap <M-f> <Cmd>call <sid>Forward_word()<CR>
cnoremap <M-b> <Cmd>call <sid>Backward_word()<CR>
cnoremap <M-d> <Cmd>call <sid>Forward_delete_word()<CR>
cnoremap <M-Backspace> <Cmd>call <sid>Backward_delete_word()<CR>
cnoremap <C-w> <Cmd>call <sid>Backward_delete_WORD()<CR>
cnoremap <C-k> <Cmd>call <sid>Delete_to_end()<CR>

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-d> <Del>
