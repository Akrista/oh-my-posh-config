 vim.cmd [[
 try
   syntax enable
   colorscheme  gruvbox
 catch /^Vim\%((\a\+)\)\=:E185/
   colorscheme default
   set background=dark
 endtry
 ]]
