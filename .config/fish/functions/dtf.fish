function dtf --wraps git -d "Manage dotfiles"
    set args "--git-dir=$HOME/.dotfiles --work-tree=$HOME"
    if test "$argv[1]" = c
        eval git "$args" commit -m \"$argv[2]\"
    else if test "$argv[1]" = s
        eval git "$args" status
    else if test "$argv[1]" = a
        eval git "$args" add "$argv[2]"
    else if test "$argv[1]" = ps
        if test "$argv[2]" = gh
            eval git "$args" push "$argv[2]" master
        else
            eval git "$args" push
        end
    else if test "$argv[1]" = pl
        eval git "$args" pull
    else if test "$argv[1]" = d
        if test "$argv[2]" = s
            eval git "$args" diff --staged "$argv[3]"
        else
            eval git "$args" diff "$argv[2]"
        end
    else
        eval git "$args" "$argv[1]"
    end
end
