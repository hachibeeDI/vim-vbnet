# Vim VB.NET #

This vim bundle adds syntax, indenting and some snippets.

This bundle will override vim's default filetype VB.


VimにVB.NET用のシンタックスとかインデントを追加するやつです。スニペットもオレオレなのが入ってます。
VimデフォルトのVB用の設定を上書きするので注意してください。

試行錯誤中&僕好みな感じで作っているので、例えばスニペットはVisualStudioのものと互換性とか全然ありません。


![coloscheme is solarized](https://raw.github.com/hachibeeDI/vim-vbnet/master/ScreenShot.png)




## settings ##

You should add filetype.vim in your USER_RUNTIME directory. If you want to replace default filetype detection with *.vb.

 - case Windows

    ~/vimfiles/filetype.vim

 - case Unix

    ~/.vim/filetype.vim


```VimL

if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.vb setfiletype vbnet
augroup END

```
