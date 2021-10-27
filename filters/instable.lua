function insertTable (el)
    iter = io.popen([[ls ./tables]]):lines()
    for dir in iter do
        if string.find(dir, "md") then
            raw = dir:gsub(".md", "")
            t = "markdown"
        else
            raw = dir:gsub(".html", "")
            t = "html"
        end
        if raw == el.content[1].text:gsub("%%","") then
            tableObj = io.open("./tables/" .. dir)
            tableStr = tableObj:read(("*all"))
            return pandoc.read(tableStr, t).blocks
        end
    end
end

return {
    {Para = insertTable}
}

