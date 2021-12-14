function separate(filename)
    local main = {}
    local tag = "no tag"
    for line in io.lines(filename) do
        if string.find(line, "%%*%%") then
            tag = line:gsub("%%","")
        else
            table.insert(main, line.."\n")
        end
    end
    return table.concat(main), tag
end


function insertTable (el)
    local iter = io.popen([[ls ./tables]]):lines()
    if el.content[1].text then
        for dir in iter do
            local raw
            local t
            if string.find(dir, "md") then
                raw = dir:gsub(".md", "")
                t = "markdown"
                if raw == el.content[1].text:gsub("%%","") then
                    local tableObj = io.open("./tables/" .. dir)
                    local tableStr = tableObj:read(("*all"))
                    return pandoc.read(tableStr, t).blocks
                end
            else
                raw = dir:gsub(".html", "")
                t = "html"
                if raw == el.content[1].text:gsub("%%","") then
                    main, tag = separate("./tables/" .. dir)
                    return pandoc.read(main, t).blocks
                end
            end
        end
    end
end

return {
    {Para = insertTable}
}

