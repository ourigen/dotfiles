return require('packer').startup({function()
	use 'wbthomason/packer.nvim'

	use { 
		'nvim-treesitter/nvim-treesitter',
		branch = '0.5-compat',
		run = ':TSUpdate',
		config = function()
			require('config.treesitter')
		end
	}

	use {
		'hoob3rt/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		-- requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('config.lualine')
		end
	}

	use {
		'akinsho/bufferline.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		-- requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('config.bufferline')
		end
	}

	-- use {
	-- 	'kdheepak/tabline.nvim',
	-- 	requires = { {'hoob3rt/lualine.nvim'}, {'kyazdani42/nvim-web-devicons', opt = true}
	-- 	},
	-- 	config = function()
	-- 		require('config.tabline')
	-- 	end
	-- }

	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons'
		-- requires = { 'kyazdani42/nvim-web-devicons', opt = true,
			-- config = function()
			-- 	require('config.devicons')
			-- end
		},
		cmd = {'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeFindFile'},
		config = function()
			require('config.nvimtree')
		end
	}

	use {
		'kyazdani42/nvim-web-devicons',
		-- 'kyazdani42/nvim-web-devicons', opt = true,
		config = function()
			require('config.devicons')
		end
	}

	use {
		'norcalli/nvim-colorizer.lua',
		ft = { 'vim', 'lua', 'html', 'css', 'conf', 'yaml'},
		config = function()
			require('config.colorizer')
		end
	}

	use {
		'folke/tokyonight.nvim',
		config = function()
			require('config.tokyonight')
		end
	}

	-- use {
	-- 	"folke/which-key.nvim",
	-- 	config = function()
	-- 		require('config.whichkey')
	-- 	end
	-- }

	use {
		"folke/zen-mode.nvim",
		cmd = {'ZenMode'},
		config = function()
			require('config.zenmode')
		end
	}

	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('config.gitsigns')
		end
	}

	use {
		'neovim/nvim-lspconfig',
		ft = { 'python', 'r', 'rmd', 'tex' },
		config = function()
			require('config.lsp')
		end
	}

	use {
		'onsails/lspkind-nvim',
		after = 'nvim-lspconfig',
		config = function()
			require('config.lspkind')
		end
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
		},
		cmd = {'Telescope'},
		config = function()
			require('config.telescope')
		end
	}

	use {
		'kristijanhusak/orgmode.nvim',
		config = function()
			require('config.orgmode')
		end}

	use {
		'akinsho/org-bullets.nvim', 
		ft = 'org',
		after = 'orgmode.nvim',
		config = function()
			require('config.orgbullets')
		end
	}

	use {
		'hkupty/iron.nvim',
		cmd = {'IronRepl'},
		config = function()
			require('config.iron')
		end
	}

	use {
		'hrsh7th/nvim-compe',
		event = "InsertEnter *",
		config = function()
			require('config.compe')
		end
	}

	use {
		'hrsh7th/vim-vsnip',
		event = "InsertEnter *",
		config = function()
			require('config.vsnip')
		end
	}

	-- use {
	-- 	'L3MON4D3/LuaSnip',
	-- 	event = "InsertEnter *",
	-- 	config = function()
	-- 		require('config.luasnip')
	-- 	end
	-- }

	use {
		'windwp/nvim-autopairs',
		after = 'nvim-compe',
		config = function()
			require('config.autopairs')
		end}

	use {
		'b3nj5m1n/kommentary',
		config = function()
			require('config.kommentary')
		end
	}

	-- use {
	-- 	'terrortylor/nvim-comment',
	-- 	config = function()
	-- 		require('config.comment')
	-- 	end,
	-- }

	use {
		"blackCauldron7/surround.nvim",
		config = function()
			require('config.surround') 
		end
	}

	use {
		'plasticboy/vim-markdown',
		ft = 'markdown',
		setup = function()
			require('config.markdown')
		end
	} 

	-- use {
	-- 	'lervag/vimtex',
	-- config = function()
	-- 		require('config.vimtex')
	-- 	end
	-- }

	use 'romainl/vim-cool'
	use 'wellle/targets.vim'
	-- use 'tpope/vim-surround' 
	use 'tpope/vim-eunuch' 
	use 'tommcdo/vim-exchange'
	-- use 'tpope/vim-commentary'
	-- use 'tommcdo/vim-lion'

end,
	config = {
		-- opt_default = true, -- Default to using opt (as opposed to start) plugins
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end
		}
	},
})
