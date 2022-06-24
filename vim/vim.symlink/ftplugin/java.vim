if exists("b:did_javaftplugin") | finish | endif
let b:did_javaftplugin = 1

autocmd BufNewFile *.java
\ exe "normal O/**\r*\r* @author: \r* @version: \r* \r*/\r\rpublic class " . expand('%:t:r') . "\r       public static void main(String[] args){\r\r   }\r}\<Esc>1G"
