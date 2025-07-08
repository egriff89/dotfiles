function mirrors -d "Update the pacman mirrorlist by \"delay\", \"score\", or \"age\"."
    if test "$argv" = ""
        sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
    else
        sudo reflector --country "United States" --protocol https -f 30 -l 30 --number 20 --sort $argv --save /etc/pacman.d/mirrorlist
    end
end

