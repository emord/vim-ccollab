if exists("g:loaded_CCollab") || &cp
    finish
endif

let g:loaded_CCollab    = 1 " version number
let s:keepcpo           = &cpo
set cpo&vim

function! s:GetZipFromReview(review)
    :let zipFile = '/tmp/blah.zip'
    :let baseurl = '/data/server\?changelist\=latest\&reviewid\='
    :execute ':!ccollab admin wget ' . baseurl . a:review . ' > ' . zipFile
    :vsp /tmp/blah.zip
endfunction

function! s:GetDiffFromReview(review)
    :let diffFile = '/tmp/blah.diff'
    :let baseurl = '/diff\?context\=10\&reviewid\='
    :execute ':!ccollab admin wget ' . baseurl . a:review . ' > ' . diffFile
    :execute ':!git apply ' . diffFile
endfunction

command! -nargs=1 CCollab     call s:GetZipFromReview(<f-args>)
command! -nargs=1 CCollabDiff call s:GetDiffFromReview(<f-args>)

" ------------------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo
