-- move references from end of document to the references section. Filter ensures references in the right spot.
function Pandoc(doc)
    local main = {}
    local refs = {}
    local refs_count = 0
    for i, el in pairs(doc.blocks) do
        -- print(el.t)
        if el.t == "Div"  then
            if el.attr.identifier == "refs" then
                table.insert(refs, el)
                refs_count = refs_count + 1
            else
                table.insert(main, el)
            end
        else
            table.insert(main, el)
        end
    end
    local main2 = {}
    for i, el in pairs(main) do
        if el.t == "Header" then
            if el.attr.identifier == "references" then
                if refs_count > 0 then
                    table.insert(main2, el)
                    print(el)
                    for ii, ref in pairs(refs) do
                        print(ref)
                        table.insert(main2, ref)
                    end
                end
            else
                table.insert(main2, el)
            end
        else
            table.insert(main2, el)
        end
    end
    return pandoc.Pandoc(main2, doc.meta)
end