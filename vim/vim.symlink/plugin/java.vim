autocmd BufNewFile *.java
\ exe "normal Opackage todo\n\npublic class " . expand('%:t:r') . " {\npublic static void main(String[] args) {\n}\n}\<Esc>1G"
