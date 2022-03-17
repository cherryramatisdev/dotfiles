nnoremap <silent> <leader>j :EasyCompleteNextDiagnostic<CR>
nnoremap <silent> <leader>k :EasyCompletePreviousDiagnostic<CR>

noremap gr :EasyCompleteReference<CR>
noremap gd :EasyCompleteGotoDefinition<CR>
noremap rn :EasyCompleteRename<CR>

let g:easycomplete_diagnostics_enable = 1
let g:easycomplete_signature_enable = 1
" let g:easycomplete_tabnine_enable = 1
" please install nerdfont
let g:easycomplete_menuflag_buf = ""
let g:easycomplete_kindflag_buf = "[buf]"
let g:easycomplete_menuflag_snip = ""
let g:easycomplete_kindflag_snip = "[snip]"
let g:easycomplete_kindflag_dict = "[dict]"
let g:easycomplete_menuflag_dict = ""
let g:easycomplete_kindflag_tabnine = ""
  let g:easycomplete_sign_text = {
        \   'error':       ">>",
        \   'warning':     ">",
        \   'information': '!',
        \   'hint':        '?'
        \ }

let g:easycomplete_filetypes = {"r": {
        \ "whitelist": []
        \ }}
let g:easycomplete_tabnine_config = {
        \ 'line_limit': 800,
        \ 'max_num_result': 10,
        \ }
let g:easycomplete_lsp_type_font = {
        \ 'class': "<class>",
        \ 'color': "<color>",
        \ 'constant': "<constant>",
        \ 'constructor': "<constructor>",
        \ 'enum': "<enum>",
        \ 'enummember': "<enummember>",
        \ 'field': "<field>",
        \ 'file': "<file>",
        \ 'folder': "<folder>",
        \ 'function': "<function>",
        \ 'interface': "<interface>",
        \ 'keyword': "<keyword>",
        \ 'snippet': "<snippet>",
        \ 'struct': "<struct>",
        \ 'text': "<text>",
        \ 'typeparameter': "<typeparameter>",
        \ 'variable': "<variable>",
        \ 't':'<t>',
        \ 'f':'<f>',
        \ 'c':'<c>',
        \ 'u':'<u>',
        \ 'e':'<e>',
        \ 's':'<s>',
        \ 'v':'<v>',
        \ 'i':'<i>',
        \ 'm':'<m>',
        \ 'p':'<p>',
        \ 'k':'<k>',
        \ 'r':'<r>',
        \ 'o':"<o>",
        \ 'l':"<l>",
        \ 'a':"<a>",
        \ 'd':'<d>',
        \ } 
