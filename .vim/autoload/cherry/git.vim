function s:runGitCommand(command)
  execute 'q'
  execute a:command
endfunction

function cherry#git#Push()
  call s:runGitCommand('Gina ps')
endfunction

function cherry#git#Pull()
  call s:runGitCommand('Gina pl')
endfunction

function! cherry#git#SwitchBranch() abort
  let l:branch_name = input('Branch name: ')
  call s:runGitCommand('Git co ' . l:branch_name)
endfunction

function! cherry#git#CreateBranch() abort
  let l:branch_name = input('Branch name: ')
  call s:runGitCommand('Git checkout -b ' . l:branch_name)
endfunction
