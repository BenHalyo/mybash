function Viewpdf()
    let file_name = expand('%:t:r')
    exec printf(":!zsh -ic \"viewpdf %s.pdf\"", file_name)
endfunction

function Refreshpdf()
    let file_name = expand('%:t:r')
    exec printf(":!zsh -ic \"refreshpdf %s.pdf\"", file_name)
endfunction
