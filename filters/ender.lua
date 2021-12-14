function Pandoc(doc)
    local main = {}
    local tables = {}
    local figures = {}
    local ref = nil
    local tables_count = 0
    local figures_count = 0
    for i, el in pairs(doc.blocks) do
        -- print(el.t)
        if el.t == "Table" then
            table.insert(tables, el)
            tables_count = tables_count + 1
        elseif el.t == "Para" then 
            if el.c[1].t == "Image" then
                table.insert(figures, el)
                figures_count = figures_count + 1
            else
                table.insert(main, el) 
            end
        elseif el.t == "Div"  then
            -- if el.c[2][1].t == "Image" then
            table.insert(figures, el)
            figures_count = figures_count + 1
            -- end
        elseif el.t == "Header" then
            if el.c[1] == "References" then
                ref = el
            else
                table.insert(main, el)  
            end
        else
            table.insert(main, el)
        end
    end
    table.insert(main, pandoc.RawBlock("tex", "\\newpage")) 
    if tables_count > 0 then
        table.insert(main, pandoc.Header(1, "Tables"))
        for i, tab in pairs(tables) do
            table.insert(main, tab)
            table.insert(main, pandoc.RawBlock("tex", "\\newpage")) 
        end
    end
    if figures_count > 0 then
        table.insert(main, pandoc.Header(1, "Figures"))
        for i, fig in pairs(figures) do
            table.insert(main, fig)
            table.insert(main, pandoc.RawBlock("tex", "\\newpage")) 
        end
    end
    table.insert(main, ref)
    return pandoc.Pandoc(main, doc.meta)
end