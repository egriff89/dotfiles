## WIP
## Need to find a way to refactor, but I suck at fish :(

function dtf --wraps git -d "Manage dotfiles"
    # default args for bare dotfiles repo
    set args "--git-dir=$HOME/.dotfiles --work-tree=$HOME"

    # git commit
    if test "$argv[1]" = c
        eval git "$args" commit -m \"$argv[2]\"

        # git status
    else if test "$argv[1]" = s
        eval git "$args" status

        # git add
    else if test "$argv[1]" = a
        eval git "$args" add "$argv[2]"

        # git push
    else if test "$argv[1]" = ps

        # github mirror
        if test "$argv[2]" = gh
            eval git "$args" push "$argv[2]" master
        else
            eval git "$args" push
        end

        # git pull
    else if test "$argv[1]" = pl
        eval git "$args" pull

        # git diff
    else if test "$argv[1]" = d

        # staged changes
        if test "$argv[2]" = s
            eval git "$args" diff --staged "$argv[3]"
        else
            eval git "$args" diff "$argv[2]"
        end

        # default git
    else
        eval git "$args" "$argv[1]"
    end
end
