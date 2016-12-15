slideshow = {}
local slides = {}

local function showpic(imagename)
	local fsn = "formspeccer:image"
	formspeccer:clear(fsn)
	formspeccer:newform(fsn,"10,7",{
		background = {
			xy = "0,0",
			wh = "10,10",
			texture = imagename,
		},
	})
	formspeccer:show(minetest.get_player_by_name(playername),fsn)
end

local function run_slideshow(deck)
	if not deck then return end

	for i=1,#deck do
		showpic(deck[i])
	end
end

function slideshow.register_slide(deckname,imagename)
	if not slide[deckname] then
		slides[deckname] = {}
	end

	local deck = slideshow.slides[deckname]
	deck[#deck+1] = imagename
end

function slideshow.clear_deck(deckname)
	slides[deckname] = nil
end

function slideshow.show_deck(deckname)
	run_slideshow(slides[deckname])
end
