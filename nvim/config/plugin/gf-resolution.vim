" TODO: Transform this on lua ???
" goto file and create it if is not present
" from https://stackoverflow.com/a/29068665/7683365
function! Gf()
  let l:filepath = expand('<cfile>')

  " check if it is a URL, if it is then load it up
  if l:filepath[0:len('https://')-1] ==# 'https://' || l:filepath[0:len('http://')-1] ==# 'http://'
    " from autoload/fugitive.vim s:BrowserOpen function
    if !exists('g:loaded_netrw')
      runtime! autoload/netrw.vim
    endif

    if exists('*netrw#BrowseX')
      call netrw#BrowseX(l:filepath, 0)
    endif

    if has('clipboard')
      let @+ = l:filepath
      echo 'Opening URL in browser, it has been copied to clipboard too.'
    endif

    return
  endif

  let l:curr_buf_path = expand("%:p:h")
  let l:fullpath = ''
  try
    if l:filepath[0:len('./')-1] ==# './' || l:filepath[0:len('../')-1] ==# '../'
      let l:fullpath = resolve(l:curr_buf_path . '/' . l:filepath)

      if !filereadable(l:fullpath)
        exec "normal! gf"
      endif

      let l:cwd = getcwd()
      if getcwd() ==# l:fullpath[0:len(l:cwd)-1]
        exec 'edit ' . l:fullpath[len(l:cwd)+1:]
      else
        exec 'edit ' l:fullpath
      endif
    else
      exec "normal! gf"
    endif
  catch /E447/
    " if I'm going into edit mode, I'm not technically creating it
    echo "File doesn't exist, `edit` it anyway? (y/N) "
    let l:confirm = nr2char(getchar())

    if empty(l:confirm) || l:confirm !=? 'y'
      " skipping `Press Enter or command to continue` prompt by feeding a key
      " update: doing this w/ this way
      exec "norm :echo 'Cancelled'\<cr>"
      return
    endif

    exec "norm :echo ''\<cr>"

    if len(l:fullpath)
      let l:cwd = getcwd()
      if getcwd() ==# l:fullpath[0:len(l:cwd)-1]
        exec 'edit ' . l:fullpath[len(l:cwd)+1:]
      else
        exec 'edit ' l:fullpath
      endif
    else
      edit <cfile>
    endif
  endtry
endfunction

noremap <silent>gf :call Gf()<CR>
