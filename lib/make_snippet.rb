def make_snippet(string)
    if string.split.length <= 5
        string
    else
        new_string = string.split[0...5].join(" ") + "..."
    end
end