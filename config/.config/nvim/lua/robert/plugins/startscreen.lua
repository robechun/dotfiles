return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local startify = require("alpha.themes.startify")

        alpha.setup(startify.config)
    end
}
