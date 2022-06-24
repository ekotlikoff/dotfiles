" Put plugins and dictionaries in this dir (also on Windows)
let configDir = '$HOME/.config'

if stridx(&runtimepath, expand(configDir)) == -1
  " configDir is not on runtimepath, add it
  let &runtimepath.=','.configDir
endif

if has('persistent_undo')
    let myUndoDir = expand(configDir . '/undo')
    " Create dirs
    call system('mkdir ' . configDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

