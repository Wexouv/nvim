local Hydra = require 'hydra'

Hydra({
	name = "HTTP",
	mode = 'n',
	body = "",
    config = {
        color = 'pink'
	},
	heads = {
        { 'r', '<Plug>RestNvim' },
        { 'o', '<Plug>RestNvimPreview' },
        { '.', '<Plug>RestNvimLast' }
	},
})

