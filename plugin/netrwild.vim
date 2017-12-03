" Description: A simple plugin for nerdtree-like netrw sidebar and some cool
"              mappings and functions

let s:save_cpo = &cpo
set cpo&vim

if exists('g:loaded_netrwild')
	finish
endif
let g:loaded_netrwild = 1


"controls width of the split
if !exists('netrw_sidebar_width')
	let g:netrw_sidebar_width = 30
endif

"disable banner
if !exists('g:netrw_banner')
	let g:netrw_banner = 0
endif	

"do not show dotfiles except for parent and .vim
". not followed by (. or vim)
if !exists('g:netrw_list_hide')
	let g:netrw_list_hide = '^\.\(\.\|vim\)\@!'
endif	

"use tree view as default
if !exists('g:netrw_liststyle')
	let g:netrw_liststyle = 3
endif	

"<C-^> will get you to last edited file, not netrw
if !exists('g:netrw_altfile')
	let g:netrw_altfile = 1
endif	


command!                         NetrwSidebar   :call netrw_sidebar#open_at('./')
command! -nargs=1 -complete=file NetrwSidebarAt :call netrw_sidebar#open_at(<args>)

command! NetrwSidebarClose  :call netrw_sidebar#close()
command! NetrwSidebarToggle :call netrw_sidebar#toggle()


let &cpo = s:save_cpo
unlet s:save_cpo
