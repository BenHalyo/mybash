function viewpdf {
    kitty @ launch --title pdf-viewer --cwd current --hold --keep-focus
    kitty @ send-text --match title:pdf-viewer "export PATH=/Library/TeX/texbin:\$PATH\\x0d"
    kitty @ send-text --match title:pdf-viewer "pdf $1\\x0d"
}

function refreshpdf {
    kitty @ send-text --match title:pdf-viewer "export PATH=/Library/TeX/texbin:\$PATH\\x0d"
    kitty @ send-text --match title:pdf-viewer "pdf $1\\x0d"
}
