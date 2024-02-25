-- Author: Roy Francis

-- Add html dependencies
local function addHTMLDeps()
  -- add the HTML requirements
  quarto.doc.add_html_dependency({
    name = 'team',
    stylesheets = {'team.css'}
  })
end

-- Check if empty or nil
local function isEmpty(s)
  return s == '' or s == nil
end

-- Main team Function Shortcode
return {

["team"] = function(args, kwargs, meta)
  
  if quarto.doc.is_format("html:js") then
    addHTMLDeps()

    local teamId = args[1]
    local team_items = meta["team"]

    for i = 1, #team_items do
        if next(team_items[i]) == teamId then
            team_items = team_items[i][teamId]
            break
        end
    end

    local team_start = "<div id = \"quarto-team-" .. teamId .. "\" class = \"quarto-team\">\n"
    team_start = team_start .. "<div class=\"team-parent\">\n"
    local team_end = "</div>\n</div>\n"
    
    for i = 1, #team_items do
      
      local item = team_items[i]

      if isEmpty(item.name) then
        error("Error: Missing required field 'name' in extension 'team'.")
      end

      if isEmpty(item.image) then
        error("Error: Missing required field 'image' in extension 'team'.")
      end

      local teamImage = pandoc.utils.stringify(item.image)
      local teamName = pandoc.utils.stringify(item.name)
      
      team_start = team_start .. "<div class=\"team-child\" >\n"

      team_start = team_start .. "<div>\n"
      if not isEmpty(item.image_url) then
        local teamImageUrl = pandoc.utils.stringify(item.image_url)
        team_start = team_start .. "<a href=\"" .. teamImageUrl .. "\">\n<img src=\"" .. teamImage .. "\"></a>\n"
      else
        team_start = team_start .. "<img src=\"" .. teamImage .. "\">\n"
      end
      team_start = team_start .. "</div>\n"

      if not isEmpty(item.name_url) then
        local teamNameUrl = pandoc.utils.stringify(item.name_url)
        team_start = team_start .. "<a href=\"" .. teamNameUrl .. "\">\n<div class=\"name\">\n" .. teamName .. "</div></a>\n"
      else
        team_start = team_start .. "<div class=\"name\">\n" .. teamName .. "</div>\n"
      end
      
      if not isEmpty(item.description) then
        local teamDescription = pandoc.utils.stringify(item.description)
        team_start = team_start .. "<div class=\"description\">\n"
        team_start = team_start .. teamDescription
        team_start = team_start .. "</div>\n"
      end

      team_start = team_start .. "</div>\n"
      
    end

    team_start = team_start .. team_end
    return pandoc.RawInline("html", team_start)

  else
    print("Warning: teams are disabled because output format is not HTML.")
    return pandoc.Null()
  end

end
}
