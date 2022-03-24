let s:win32yank = 'win32yank.exe'
if has('nvim') && executable(s:win32yank)
      let g:clipboard = {
            \  'name' : 'wsl',
            \  'copy' : {
            \    '+' : s:win32yank..' -i --crlf',
            \    '*' : s:win32yank..' -i --crlf',
            \  },
            \  'paste' : {
            \    '+' : s:win32yank..' -o --lf',
            \    '*' : s:win32yank..' -o --lf',
            \  },
            \}
      unlet s:win32yank
endif
