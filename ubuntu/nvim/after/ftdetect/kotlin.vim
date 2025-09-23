" Ensure Kotlin filetypes are detected
augroup ftdetect_kotlin
  autocmd!
  autocmd BufRead,BufNewFile *.kt,*.kts setfiletype kotlin
augroup END
