vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	
	use "EdenEast/nightfox.nvim" 
	use {'letieu/btw.nvim'}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	
	}
  use {"neovim/nvim-lspconfig"}
	use {"williamboman/nvim-lsp-installer"}

	use { 'mbbill/undotree'}	
	use {'neoclide/coc.nvim', tag = 'master', run = 'npm ci'}
	use {'itchyny/lightline.vim'}
				use {'folke/zen-mode.nvim'}
				use {'iamcco/markdown-preview.nvim', run = 'cd app && npx --yes yarn install' }

end)
