function FileExtension()
    let ext = expand('%:e')
    return (ext == "h" ? "c" : ext)
endfunction

command -nargs=1 D lexpr system("def " . <q-args> . " " . FileExtension())
command -nargs=1 Dh lexpr system("def " . <q-args> . " h")
nmap <F12> :<C-U>D <C-R><C-W><CR>
nmap <S-F12> :<C-U>Dh <C-R><C-W><CR>
