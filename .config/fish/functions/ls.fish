function ls
    eza --icons --color=always --group-directories-first
end

function ll
    eza -lg --icons --color=always --group-directories-first --header
end

function la
    eza -lag --icons --color=always --group-directories-first --header
end
