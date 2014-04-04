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

command! -nargs=1 CCollab call s:GetZipFromReview(<f-args>)

" ------------------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo
