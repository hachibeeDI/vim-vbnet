# Vim VB.NET #

This repository includes VB.Net syntax, indent and some snippets.

Be careful this bundle will override your vim's default filetype for `VB`.


VimにVB.NET用のシンタックスとかインデントを追加するやつです。スニペットもオレオレなのが入ってます。
VimデフォルトのVB用の設定を上書きするので注意してください。

試行錯誤中&僕好みな感じで作っているので、例えばスニペットはVisualStudioのものと互換性とか全然ありません。

![coloscheme is solarized](https://raw.github.com/hachibeeDI/vim-vbnet/master/ScreenShot.png)


## Warning ##

I'm no longer using this repository. However if you have an idea to improve this you can feel free to send PR. :+1:


## How to install ##

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
