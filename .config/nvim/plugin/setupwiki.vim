function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  if s:uri != ""
    silent exec "Dispatch! brave '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction

function! InsertJiraLink()
  let s:code = input('Jira Code: ')

  if s:code != ''
    let s:jira_link = '[[https://lamimed.atlassian.net/browse/TEC-' . s:code . ']]'
    let line = getline('.')
    let pos = col('.')-1 " IIRC
    let line = line[:pos-1] . s:jira_link . line[pos:]
    call setline('.', line)
  endif
endfunction

augroup vimwiki_config
  autocmd!
  autocmd FileType vimwiki nmap <buffer> <leader>wx :VimwikiToggleListItem<CR>
  autocmd FileType vimwiki nmap <buffer> gx :call HandleURL()<cr>
  autocmd FileType vimwiki nmap <buffer> gi :call InsertJiraLink()<cr>
  autocmd FileType vimwiki nmap <buffer> <C-j> ddp
  autocmd FileType vimwiki nmap <buffer> <C-k> ddP
augroup END
