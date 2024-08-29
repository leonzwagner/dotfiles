local function save_last_page()
	local handle = io.popen(
		"echo "
			.. zathura.document.page_number
			.. " > ~/.config/zathura/lastpage_"
			.. zathura.document.uri:match("([^/]+)$")
	)
	handle:close()
end

local function load_last_page()
	local handle = io.popen("cat ~/.config/zathura/lastpage_" .. zathura.document.uri:match("([^/]+)$"))
	local page = handle:read("*a")
	handle:close()
	if tonumber(page) then
		zathura.page_set(tonumber(page))
	end
end

zathura.add_signal("document-opened", load_last_page())
zathura.add_signal("document-closed", save_last_page())
zathura.add_signal("page-changed", save_last_page())
