" Description: functions for my netrw-sidebar plugin i rarely now use
" see plugin/netrw-sidebar.vim and after/ftplugin/netrw.vim


"plugin functions

fun! netrwild#open_at(place)
	if exists('t:netrw_sidebar_id')
		"go to it if exists
		exec t:netrw_sidebar_id . "wincmd w"
		return
	endif
	"open, go to it, resize and set variables
	exec "Lexplore " . a:place
	exec "vertical resize" . g:netrw_sidebar_width
	"unset the variable controlling where the opening takes place
	let g:netrw_chgwin = -1
	"set technical info
	let t:netrw_sidebar_id = winnr()
	let w:is_netrw_sidebar = 1
endfun

fun! netrwild#close()
	if !exists('t:netrw_sidebar_id')
		return
	endif
	exec  t:netrw_sidebar_id . "wincmd w"
	wincmd q "just q would work? i dunno i don't even vim
	unlet t:netrw_sidebar_id 
endfun

fun! netrwild#toggle()
	if exists('t:netrw_sidebar_id')
		call netrwild#close()
	else
		call netrwild#open_at('./')
	endif
endfun


"utility functions

"given the action string, modify it so after completing the action you stay on
"the line you started on
fun! netrwild#preserve_line(action) abort
	let l = line('.')
	return a:action . ":if &filetype == 'netrw' | exec 'normal! " . l . "gg' | endif\<CR>"
endfun

fun! netrwild#get_full_name_under_cursor() abort
	redir => fileinfo
	silent normal qf
	redir end
	"i sure hope it never breaks
	let fullname = split(fileinfo)[-1]
	return fullname
endfun

fun! netrwild#copy_path() abort
	call setreg(v:register, netrwild#get_full_name_under_cursor())
	"was it worth it to write a function? Maybe.
endfun

fun! netrwild#change_dir() abort
"	unsilent echom "trying to cd..."
	let fullname = netrwild#get_full_name_under_cursor()
"	unsilent echom "fullname: " . fullname
	let dirname  = fnamemodify(fullname, ':p:h')
	unsilent echom "moving to " . dirname
	unsilent exec "cd " . dirname
endfun

fun! netrwild#is_directory_under_cursor()
	let filename = netrwild#get_full_name_under_cursor()
	if filename[len(filename)-1] == '/'
		return 1
	else
		return 0
	endif
endfun

"an integral part of netrw sidebar
fun! netrwild#open_file()
	if exists('w:is_netrw_sidebar') && w:is_netrw_sidebar
		let g:netrw_browse_split = 4
	else
		let g:netrw_browse_split = 0
	endif
	"opening node resets cursor position (why?)
	return netrwild#preserve_line("\<CR>")
endfun
