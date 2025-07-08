function man --wraps man -a cmd
    if test (pacman -Qq | grep 'bat-extras')
        /usr/bin/batman $cmd
    else
        /usr/bin/man $cmd
    end
end
