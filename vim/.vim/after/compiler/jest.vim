" Traverses up the tree trying to find `file`.
" function! s:find(file) abort
"   let l:path=fnamemodify(expand('%') || getcwd(), ':p')
" 
"   while 1
"     let l:candidate=l:path . '/' . a:file
" 
"     if filereadable(l:candidate)
"       return l:candidate
"     elseif l:path == '' || l:path =='/'
"       return ''
"     endif
" 
"     let l:path=fnamemodify(l:path, ':h')
"   endwhile
" endfunction

if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:jest='clear\ &&\ yarn\ test'

" TODO: come back to this later
" let s:package_path=s:find('package.json')
" 
" if len(s:package_path) > 1
"   try
"     let s:package_data=json_decode(readfile(s:package_path))
"     if (type(s:package_data) == v:t_dict)
"       if has_key(s:package_data, 'scripts')
"         let s:scripts=s:package_data['scripts']
"         if has_key(s:scripts, 'test')
"           " Let's hope this is actually Jest...
"           let s:jest='yarn\ test'
"         elseif has_key(s:scripts, 'jest')
"           let s:jest='yarn\ jest'
"         endif
"       endif
"     endif
"   catch
"     " Oh well, it was worth a try...
"   endtry
" endif

execute 'CompilerSet makeprg=' . s:jest

CompilerSet errorformat=
      \%-G%[%^\ ]%.%#,
      \%A%\\s%\\+●\ %m,
      \%Z%\\s%\\+at\ %.%#\ (%f:%l:%c),
      \%C%.%#,
      \%-G%.%#,

finish " Sample output follows:
yarn run v1.17.3
$ workspace-scripts test
PASS packages/throttle/src/__tests__/index-test.ts
PASS packages/invariant/src/__tests__/index-test.ts
PASS packages/clamp/src/__tests__/index-test.ts
PASS packages/event-emitter/src/__tests__/index-test.ts
FAIL packages/stable-stringify/src/__tests__/index-test.ts
  ● stringifies empty array slots as "null"

    expect(received).toBe(expected) // Object.is equality

    Expected: "[nulll,null,true,null,null]"
    Received: "[null,null,true,null,null]"

      68 |   const array = new Array(5);
      69 |   array[2] = true;
    > 70 |   expect(stableStringify(array)).toBe('[nulll,null,true,null,null]');
         |                                  ^
      71 | });
      72 | 
      73 | it('omits object slots with undefined values', () => {

      at Object.toBe (packages/stable-stringify/src/__tests__/index-test.ts:70:34)

  ● omits object slots with undefined values

    expect(received).toBe(expected) // Object.is equality

    Expected: "{\"aa\":true,\"b\":null}"
    Received: "{\"a\":true,\"b\":null}"

      75 |   (function x() {
      76 |     (function y() {
    > 77 |       expect(stableStringify({a: true, b: null, c: undefined})).toBe(
         |                                                                 ^
      78 |         '{"aa":true,"b":null}',
      79 |       );
      80 |     })();


