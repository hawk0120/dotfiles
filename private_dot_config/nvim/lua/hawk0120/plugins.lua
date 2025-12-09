vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
				use 'wbthomason/packer.nvim'

				use {
								'nvim-telescope/telescope.nvim', tag = '0.1.8',
								requires = { {'nvim-lua/plenary.nvim'} }
				}
				

				use {
								'navarasu/onedark.nvim',
								config = function()
												require('onedark').setup {
																style = 'storm',
												}
												require('onedark').load()
								end
				}


				use {'letieu/btw.nvim'}

				use {
								'nvim-treesitter/nvim-treesitter',
								run = ':TSUpdate'
				}


				use('jose-elias-alvarez/null-ls.nvim')
			
				use('MunifTanjim/prettier.nvim')

				use ('wakatime/vim-wakatime')

				use { 'mbbill/undotree'}	
				use {'neoclide/coc.nvim', tag = 'master', run = 'npm ci'}
				
				use 'nvim-lualine/lualine.nvim'   
				use {'folke/zen-mode.nvim'}
				use {'iamcco/markdown-preview.nvim', run = 'cd app && npx --yes yarn install' }

end)


