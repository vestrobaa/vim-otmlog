" Vim syntax file
" Language:         otm log files
" Maintainer:       vestrobaa <vestrobaa@gmail.com>
" Latest Revision:  yyyy-mm-dd
" Changes:          yyyy-mm-dd Initial version
"                   2014-04-17 GUID's now include subdomains
"                   2014-04-17 GUID's now include dashes (-)

" Based on generic log files by Alex Dzyoba

if exists("b:current_syntax")
  finish
endif

syn region otmlogString start=/'/ end=/'/ end=/$/ skip=/\\./
syn region otmlogString start=/"/ end=/"/ skip=/\\./
syn match otmlogNumber '0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'

syn match   otmlogDate '\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) [ 0-9]\d *'
syn match   otmlogDate '\d\{4}-\d\d-\d\d'
" 
syn match   otmlogTime '\d\d:\d\d:\d\d\s*'
syn match   otmlogTime '\d\d:\d\d:\d\d\.\d\{,3}\s*'
syn match   otmlogTime '\c\d\d:\d\d:\d\d\(\.\d\+\)\=\([+-]\d\d:\d\d\|Z\)'

syn keyword otmlogMessageType Exception Agent Planning GLog
syn keyword otmlogException Error
syn match otmlogGUID '\<\u[0-9A-Z\\\/]*\.[ 0-9A-Z_-]*\>'
syn match otmlogComment '\[.*\]'

hi def link otmlogGUID          Function
hi def link otmlogException     Exception
hi def link otmlogComment       Ignore
hi def link otmlogMessageType   Label
hi def link otmlogDate          Constant
hi def link otmlogTime          Type
hi def link otmlogKeyword       Keyword
hi def link otmlogString        String
hi def link otmlogNumber        Number

let b:current_syntax = "otmlog"
