" Vim indent file
" Language   : VisualBasic.NET
" Maintainers: OGURA Daiki
" Last Change: 2013-01-25

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal nolisp
setlocal autoindent
setlocal expandtab
setlocal tabstop<
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal indentexpr=VbNetGetIndent(v:lnum)
"setlocal indentkeys&
"setlocal indentkeys+=!^F,o,O,=~?catch,=~?else,=~?elseif,=~?end,=~?next,<:>
setlocal indentkeys+=!^F,o,O,=~?catch,=~?else,=~?elseif,=~?end,=~?next,<:>

" Only define the function once.
if exists("*VbNetGetIndent")
  finish
endif
let s:keepcpo= &cpo
set cpo&vim

function VbNetGetIndent(lnum)
  let plnum = prevnonblank(v:lnum - 1)
  let ind = indent(plnum)

  let access_modifier = '\<\(Public\|Protected\|Private\|Friend\)\>'

  let previous_line = getline(a:lnum - 1)
  if previous_line =~ '\s_$' || previous_line =~ '\s,' || previous_line =~ '^\s*\.'
    return ind
  elseif previous_line =~ '{$' || previous_line =~ '($' || previous_line =~ '=$'
    return ind + &l:shiftwidth
  elseif previous_line =~? '^'.access_modifier || previous_line =~? '^Namespace'
    return ind + &l:shiftwidth
  elseif previous_line =~? '^\s*'.access_modifier.'\s\(\Class\|Module\|Enum\|Interface\|Operator\)'
    return ind + &l:shiftwidth
  elseif previous_line =~? '\s\(Overrides\|Overridable\|Overloads\|NotOverridable\|MustOverride\|Shadows\|Shared\|ReadOnly\|WriteOnly\)\s'
    return ind + &l:shiftwidth
  endif

  if previous_line =~? 'Then$'
    return ind + &l:shiftwidth
  elseif previous_line =~? '^\s*\<\(Select Case\|Else\|ElseIf\|For\|While\|Using\|Try\|Catch\|Finally\)\>'
    return ind + &l:shiftwidth
  elseif previous_line =~? '^\s\+}$'
    return &l:shiftwidth + &l:shiftwidth
  endif

  if previous_line =~? 'End \(If\|Case\|Try\|Sub\|Function\|Class\|Operator\)$'
    return ind

  endif

  " labels and preprocessor get zero indent immediately
  let this_line = getline(a:lnum)
  let LABELS_OR_PREPROC = '^\s*\(\<\k\+\>:\s*$\|#.*\)'
  if this_line =~? LABELS_OR_PREPROC
    return 0
  endif

  if this_line =~? '^\s*#'
    return 0

  endif

  " Find a non-blank line above the current line.
  " Skip over labels and preprocessor directives.
  let lnum = a:lnum
  while lnum > 0
    let lnum = prevnonblank(lnum - 1)
    let previous_line = getline(lnum)
    if previous_line !~? LABELS_OR_PREPROC
      let pp_line = getline(lnum - 1)
      break
    endif
  endwhile

"  " Search backwards for the previous non-empty line.
"  let plnum = prevnonblank(v:lnum - 1)
"  if pp_line == 0
"    " This is the first non-empty line, use zero indent.
"    return 0
"  endif

"  if previous_line =~? '>\s\+_$'
"    let ind = ind - &sw
"  endif

"  " Add
"  if previous_line =~? '^\s*\(\(Public\|Protected\|Protected Friend\|Private\|Friend\|Overrides\|Overridable\|Overloads\|NotOverridable\|MustOverride\|Shadows\|Shared\|ReadOnly\|WriteOnly\)\s\+\)*\<\(Function\|Sub\|Class\|Module\|Namespace\|Property\|Get\|Set\|Custom Event\|Enum\)\>'
"      \ || previous_line =~? '^\s*\<\(AddHandler\|RemoveHandler\|RaiseEvent\)\s*('
"    let ind = ind + &sw
"    if pp_line =~? '>\s\+_$'
"      let ind = ind + &sw
"    endif
"  elseif previous_line =~? '^\s*<[A-Z]' && previous_line =~? '>\s\+\(\(Public\|Protected\|Protected Friend\|Private\|Friend\|Overrides\|Overridable\|Overloads\|NotOverridable\|MustOverride\|ReadOnly\|WriteOnly\|Shadows\|Shared\)\s\+\)*\<\(Function\|Sub\|Class\|Module\|Namespace\|Property\|Get\|Set\|Enum\)\>'
"    let ind = ind + &sw
"  elseif previous_line =~? '^\s*\<\(Select\|Case\|Default\|Else\|ElseIf\|Do\|For\|While\|With\|SyncLock\|Using\|Try\|Catch\|Finally\)\>'
"    let ind = ind + &sw
"  elseif previous_line =~? '\<Then$'
"    let ind = ind + &sw
"  endif

"  " Subtract
"  if this_line =~? '^\s*\<End\>\s\+\<Select\>'
"    if previous_line !~? '^\s*\<Select\>'
"      let ind = ind - 2 * &sw
"    else
"      " this case is for an empty 'select' -- 'end select'
"      " (w/o any case statements) like:
"      "
"      " select case readwrite
"      " end select
"      let ind = ind - &sw
"    endif
"  elseif this_line =~? '^\s*\<\(Catch\|End\|Else\|ElseIf\|Until\|Loop\|Next\)\>'
"    let ind = ind - &sw
"  elseif this_line =~? '^\s*\<\(Case\)\>'
"    if previous_line !~? '^\s*\<Select\>'
"      let ind = ind - &sw
"    endif
"  endif

return ind
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo

let b:undo_indent = 'setlocal '.join([
\   'autoindent<',
\   'expandtab<',
\   'indentexpr<',
\   'indentkeys<',
\   'shiftwidth<',
\   'softtabstop<',
\ ])

" vim:sw=2
