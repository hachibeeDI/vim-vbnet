" Vim syntax file
" Language   : VisualBasic.NET
" Maintainers: OGURA Daiki
" Last Change: 2013-01-25

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword vbnetStatement Auto Ansi Assembly Declare Lib
syn keyword vbnetStatement Continue Custom
syn keyword vbnetStatement Default
syn keyword vbnetStatement Dim As
syn keyword vbnetStatement Event Error
syn keyword vbnetStatement RaiseEvent
syn keyword vbnetStatement Step Stop
syn keyword vbnetStatement SyncLock
syn keyword vbnetStatement TypeOf
syn keyword vbnetStatement Unicode Variant When

syn keyword vbnetTypes Boolean Byte Char Date Decimal Double
syn keyword vbnetTypes Integer Long Object Short Single String
syn keyword vbnetTypes UInteger ULong UShort SByte
syn keyword vbnetTypes List Dictionary IEnumerable IObservable Func Action

syn match vbnetOperator "[()+\-/*=&]"
syn match vbnetOperator "[<>]=\="
syn match vbnetOperator "<>"
syn match vbnetOperator "\s\+_$"
" {{{
syn keyword vbnetStorage Delegate Namespace
syn keyword vbnetTypeDef Class Interface
syn match vbnetTypeDefEnd "\<End\> \(Class\|Interface\|NameSpace\)$"

syn keyword vbnetStructure Structure Enum Module
syn match vbnetStructureEnd "\<End\> \(Structure\|Enum\|Module\)$"

syn keyword vbnetRepeat For Each Return While Next To
syn keyword vbnetConditional If Then Else ElseIf Case
syn match vbnetConditional "^\s+Select Case"
syn match vbnetConditionalEnd "\<End\> \(If\|Select\)$"

syn keyword vbnetModifier Inherits Implements MustInherit MustOverride Const Overrides Overridable Overloads Readonly WriteOnly Shared NotInheritable NotOverridable Shadows
syn keyword vbnetFunction Sub Function Operator
syn match vbnetFunction "\<End\> \(Function\|Sub\)"

syn keyword vbnetScopeDecl Private Protected Public Friend

syn keyword vbnetSpecial Call Of
syn keyword vbnetSugar AddHandler AddressOf Alias WithEvents RemoveHandler Handles From
syn match vbnetDefAnonymousTypedef "=\s\<New\> \(With$\|With {$\)"

syn keyword vbnetProperty Property Get Set
syn match vbnetPropertyEnd "^\s*End \(Get\|Set\|Property\)$"

syn keyword vbnetKeyword ByVal GetType ParamArray On Option Optional Exit Imports
syn keyword vbnetException Try Catch Finally Throw
syn match vbnetException "\<End\> Try$"
syn keyword vbnetUsing Using
syn match vbnetUsing "\<End\> Using$"
syn keyword vbnetOperator New And Or AndAlso OrElse Is Not IsNot Like Mod
syn keyword vbnetBoolean True False
syn match vbnetDelimiter "\(,\|\.\|:\|{\|}\|\s_$\)"
syn keyword vbnetDeprecated Do Until Loop Goto Redim GoSub Resume Erase Preserve IIF ByRef
"}}}

syn keyword vbnetConst MyBase MyClass Me Nothing

syn keyword vbnetTodo contained TODO

"integer number, or floating point number without a dot.
syn match vbnetNumber "\<\d\+\>"
"floating point number, with dot
syn match vbnetNumber "\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match vbnetNumber "\.\d\+\>"

" String and Character contstants
syn match vbnetchar "\"[0-9A-Za-z_]\"c"
syn region vbnetString start=+"+ end=+"+

syn region vbnetComment start="\<REM\>" end="$" contains=vbnetTodo
syn region vbnetComment start="'" end="$" contains=vbnetTodo

syn region vbnetPreCondit start="^#If\s" end="Then$"
syn region vbnetPreCondit start="^#ElseIf\s" end="Then$"
syn match vbnetPreCondit "^#Else$"
syn match vbnetPreCondit "^#End If$"

syn region vbnetPreCondit start="^#Region\s\+\"" end="\"$"
syn match vbnetPreCondit "^#End Region$"

syn region vbnetPreCondit start="^#ExternalSource(" end=")$"
syn match vbnetPreCondit "^#End ExternalSource$"

syn region vbnetPreCondit start="^#Const\s" end="$"

syn region vbnetLineNumber start="^\d" end="\s"

syn match vbnetTypeSpecifier "[a-zA-Z0-9][\$%&!#]"ms=s+1


" xml literals {{{
"syn match vbnetXmlTag "<[a-zA-Z]\_[^>]*/>" contains=vbnetXmlQuote,vbnetXmlEscape,vbnetXmlString
"syn region vbnetXmlString start="\"" end="\"" contained
"syn match vbnetXmlStart "<[a-zA-Z]\_[^>]*>" contained contains=vbnetXmlQuote,vbnetXmlEscape,vbnetXmlString
"syn region vbnetXml start="<\([a-zA-Z]\_[^>]*\_[^/]\|[a-zA-Z]\)>" matchgroup=vbnetXmlStart end="</\_[^>]\+>" contains=vbnetXmlEscape,vbnetXmlQuote,vbnetXml,vbnetXmlStart,vbnetXmlComment
"syn region vbnetXmlEscape matchgroup=vbnetXmlEscapeSpecial start="<%=" matchgroup=vbnetXmlEscapeSpecial end="%>" contained contains=TOP
"syn match vbnetXmlQuote "&[^;]\+;" contained
"syn match vbnetXmlComment "<!--\_[^>]*-->" contained
"" }}}


syn region vbnetAttribute start="^\s*<[a-zA-Z]" end=">" contains=vbnetString

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_vbnet")
    let did_vbnet_syntax_inits = 1

    hi link vbnetLineNumber Comment
    hi link vbnetNumber Number
    hi link vbnetConst Constant
    hi link vbnetBoolean Boolean
    hi link vbnetRepeat Repeat
    hi link vbnetConditional Conditional
    hi link vbnetConditionalEnd Conditional
    hi link vbnetKeyword Keyword
    hi link vbnetException Exception
    hi link vbnetUsing Exception
    hi link vbnetAttribute PreProc
    hi link vbnetStorage StorageClass
    hi link vbnetModifier vbnetStorage
    hi link vbnetScopeDecl vbnetStorage
    hi link vbnetTypeDef TypeDef
    hi link vbnetTypeDefEnd TypeDef
    hi link vbnetStructure Structure
    hi link vbnetStructureEnd Structure
    hi link vbnetError Error
    hi link vbnetStatement Statement
    hi link vbnetString String
    hi link vbnetchar vbnetString
    hi link vbnetComment Comment
    hi link vbnetTodo Todo
    hi link vbnetFunction Function
    hi link vbnetMethods PreProc
    hi link vbnetPreCondit PreCondit
    hi link vbnetSpecial Special
    hi link vbnetSugar vbnetSpecial
    hi link vbnetDefAnonymousTypedef vbnetSpecial
    hi link vbnetProperty vbnetSugar
    hi link vbnetPropertyEnd vbnetSugar
    hi link vbnetTypeSpecifier Type
    hi link vbnetTypes Type
    hi link vbnetOperator Operator
    hi link vbnetDelimiter Delimiter
    hi link vbnetDeprecated Error

"    hi link vbnetXml String
"    hi link vbnetXmlTag Include
"    hi link vbnetXmlString String
"    hi link vbnetXmlStart Include
"    hi link vbnetXmlEscape Normal
"    hi link vbnetXmlEscapeSpecial Special
"    hi link vbnetXmlQuote Special
"    hi link vbnetXmlComment Comment
endif

let b:current_syntax = "vbnet"
