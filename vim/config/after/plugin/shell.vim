let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
let g:vimshell_split_command = 'split'
let g:vimshell_scrollback_limit = 4000
let g:vimshell_interactive_update_time = 400
let g:vimshell_max_command_history = 100000 " default is 1000
let g:vimshell_editor_command = "gvim -u $VIMRUNTIME/defaults.vim -U NONE --nofork" " do not use 'gvim -g  --servername=GVIM --remote-tab-wait-silent'

call vimshell#set_alias('vim', ':edit')
