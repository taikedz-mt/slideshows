# Minetest: Slideshow

Display images on the screen.

Could be used for tutorials for example.

Avoid making too many slides - media always has to go over the wire to the user so keep it small!

The current version enforces use of a JPEG file and displays using a 4:3 ratio.

Requires [formspeccer](https://github.com/taikedz-mt/formspeccer)

# Usage

Example for registering tutorials

	slideshow.register_slide("tutorial1","mytut_first.jpg")
	slideshow.register_slide("tutorial1","mytut_second.jpg")

	slideshow.register_slide("tutorial2","mytut_other.jpg")
	slideshow.register_slide("tutorial2","mytut_more.jpg")

	minetest.register_chatcommand("tut1",{
		func = function(player,args)
			slideshow.show_deck("tutorial1",player)
		end
	})

	minetest.register_chatcommand("tut2",{
		func = function(player,args)
			slideshow.show_deck("tutorial2",player)
		end
	})

The JPEGs need to be stored in the `textures/` folder
