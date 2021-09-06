map <buffer> q gq
nmap <buffer> <Tab> =
nmap <buffer> Pp :call cherry#git#Push()<cr>
nmap <buffer> Fp :call cherry#git#Pull()<cr>
nmap <buffer> bc :call cherry#git#CreateBranch()<cr>
nmap <buffer> bb :call cherry#git#SwitchBranch()<cr>
