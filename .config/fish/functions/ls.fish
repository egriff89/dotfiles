function ls --wraps eza -a dir
    eza --icons --color=always --group-directories-first $dir
end
