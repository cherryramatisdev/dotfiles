au FileType {javascript,typescript} vmap <buffer> <leader>vv :VjsExtractVariable<cr>
au FileType {javascript,typescript} vmap <buffer> <leader>vf :VjsExtractFunctionOrMethod<cr>
au FileType {javascript,typescript} nmap <buffer> <leader>ve :VjsExtractDeclarationIntoFile<cr>
au FileType {javascript,typescript} nmap <buffer> <leader>vd :VjsCreateDeclaration<cr>
au FileType {javascript,typescript} nmap <buffer> <leader>vr :VjsRenameFile<cr>
au FileType {javascript,typescript} nmap <buffer> <leader>vl :VjsListDependents<cr>
