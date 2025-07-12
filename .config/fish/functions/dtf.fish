function dtf --wraps git -d "Manage dotfiles"
    set args "--git-dir=$HOME/.dotfiles --work-tree=$HOME"
    if test "$argv[1]" = c
        eval git "$args" commit -m "$argv[2]"
    else if test "$argv[1]" = s
        eval git "$args" status
    else if test "$argv[1]" = a
        eval git "$args" add "$argv[2]"
    else if test "$argv[1]" = ps
        eval git "$args" push
    else if test "$argv[1]" = pl
        eval git "$args" pull
    else if test "$argv[1]" = d
        eval git "$args" diff "$argv[2]"
    else
        eval git "$args" "$argv[1]"
    end
end
