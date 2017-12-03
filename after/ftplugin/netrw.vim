setlocal nonumber
setlocal cursorline


"BECAUSE IT DOESN'T FUCKING WORK
nmap gn <NOP>

nmap <buffer> <silent> <expr> o netrwild#open_file()
"open in background tab
nmap <buffer> T tgT
"make current folder the new root (a new base, if you will)
nmap <buffer> <silent> B :Ntree<CR>
"try to cd to directory/file under cursor
nmap <buffer> C :<C-U>call netrwild#change_dir()<CR>

"disable (slow) incsearch
nnoremap <buffer> / /
nnoremap <buffer> ? ?
"copy full path
nnoremap <buffer> <silent> yy :call netrwild#copy_path()<CR>

