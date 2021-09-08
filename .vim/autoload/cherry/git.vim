function s:runGitCommand(command)
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

function! cherry#git#Commit() abort
  let l:options = ['Commit type: ', 'feat', 'fix', 'chore', 'doc', 'refactor']

  let l:commit_type = inputlist(l:options)
  redraw

  if l:commit_type == 0
    return
  endif

  let l:commit_message = input('Commit message: ')
  redraw

  if l:commit_message == ''
    return
  endif

  let l:should_verify_commit = confirm('Should verify? ', "&Yes\n&No", 1)
  redraw

  let l:runner = 'Git commit -m "' .
        \ l:options[l:commit_type] .
        \ ': ' .
        \ l:commit_message .
        \ '"'

  if l:should_verify_commit == 1
    let l:runner = l:runner . ' --no-verify'
  else
    let l:runner = l:runner
  endif

  call s:runGitCommand(l:runner)
endfunction
