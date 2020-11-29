-- Handles `raw_html` shortcode and hugo-book's `hint` shortcode and converts into a blockquote

incomment = false

function Para(el)
    if el.content[1].text == "{{<" and el.content[3].text == "rawhtml" and el.content[5].text == ">}}" then
        return pandoc.Para(pandoc.RawInline('latex','\\begin{quote}'))
    elseif el.content[1].text == "{{<" and el.content[3].text == "/rawhtml" and el.content[5].text == ">}}" then
        return pandoc.Para(pandoc.RawInline('latex','\\end{quote}'))
    elseif el.content[1].text == "{{<" and el.content[3].text == "hint" and el.content[7].text == ">}}"then
        incomment = true
        hint_type = el.content[5].text
        return pandoc.Para(pandoc.Str())
    elseif el.content[1].text == "{{<" and el.content[3].text == "/hint" and el.content[5].text == ">}}" then
        incomment = false
        return pandoc.Para(pandoc.Str())
    end
    if incomment then
        div = pandoc.Div{pandoc.BlockQuote(pandoc.Para(el.content))}
        div.classes = {"hint-" .. hint_type}
        return div
    end
end