autocmd BufNewFile *.java
\ exe "normal Opackage todo\n\npublic class " . expand('%:t:r') . " {\n       public static void main(String[] args) {\n\n   }\n}\<Esc>1G"
