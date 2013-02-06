if exists('b:did_ftplugin_vbnet')
    finish
endif
let b:did_ftplugin_vbnet = 1
let s:keepcpo = &cpo
set cpo&vim


setlocal cinkeys-=0#
setlocal indentkeys-=0#
setlocal suffixesadd=.vb
setlocal comments-=:%
setlocal commentstring='%s

fun! <SID>VbSearch(pattern, flags)
    let cnt = v:count1
    while cnt > 0
      call search(a:pattern, a:flags)
      let cnt = cnt - 1
    endwhile
endfun

nnoremap <buffer> <silent> [[ :call <SID>VbSearch('^\s*\(\(private\|public\)\s\+\)\=\(function\\|sub\)', 'bW')<cr>
nnoremap <buffer> <silent> ]] :call <SID>VbSearch('^\s*\(\(private\|public\)\s\+\)\=\(function\\|sub\)', 'W')<cr>
nnoremap <buffer> <silent> [] :call <SID>VbSearch('^\s*\<end\>\s\+\(function\\|sub\)', 'bW')<cr>
nnoremap <buffer> <silent> ][ :call <SID>VbSearch('^\s*\<end\>\s\+\(function\\|sub\)', 'W')<cr>

if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_words = '\<Namespace\>:\<End Namespace\>'
          \ . ',\<Module\>:\<End Module\>'
          \ . ',\<Class\>:\<End Class\>'
          \ . ',\<Interface\>:\<End Interface\>'
          \ . ',\<Property\>:\<End Property\>'
          \ . ',\<Enum\>:\<End Enum\>'
          \ . ',\<Function\>:\<End Function\>'
          \ . ',\<Sub\>:\<End Sub\>'
          \ . ',\<Get\>:\<End Get\>'
          \ . ',\<Set\>:\<End Set\>'
          \ . ',\<For\>:\<Next\>'
          \ . ',\<While\>:\<End While\>'
          \ . ',\<Select\>:\<End Select\>'
          \ . ',\<Using\>:\<End Using\>'
          \ . ',\<With\>:\<End With\>'
          \ . ',\<Try\>:\<End Try\>'
          \ . ',\<If\>:\<End If\>'
endif

let &cpo = s:keepcpo
unlet s:keepcpo
