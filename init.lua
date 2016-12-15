slideshow = {}
local slides = {}

local function showpic(imagename)
	local fsn = "formspeccer:image"
	formspeccer:clear(fsn)
	formspeccer:newform(fsn,"4,3",{
		background = {
			xy = "0,0",
			wh = "4,3",
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
	if not imagename:match(".jpg$") and not imagename:match(".jpeg$") then
		-- all media needs to be loaded over the wire to each client
		-- reduce load time and bandwidth usage by making sure images are less than 64KB
		-- using JPEG is a start
		minetest.log("error","Use only properly compressed JPEG images with slideshows in 4:3 ratio. Reduce network traffic!")
		return
	end

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
