require('packer').startup({function()
	use 'wbthomason/packer.nvim'

	use { 
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('config.treesitter')
		end
	}

	use {
		'hoob3rt/lualine.nvim',
		config = function()
			require('config.lualine')
		end
	}

	use {
		'akinsho/bufferline.nvim',
		config = function()
			require('config.bufferline')
		end
	}

	use {
		'kyazdani42/nvim-tree.lua',
		-- requires = { 'kyazdani42/nvim-web-devicons', opt = true,
		-- 	config = function()
		-- 		require('config.devicons')
		-- 	end
		-- },
		cmd = {'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeFindFile'},
		config = function()
			require('config.nvimtree')
		end
	}

	use {
		'kyazdani42/nvim-web-devicons',
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
	-- 	'lewis6991/gitsigns.nvim',
	-- 	requires = { 'nvim-lua/plenary.nvim' },
	-- 	-- load only on git directories
	-- 	cond = function()
	-- 		return vim.fn.isdirectory ".git" == 1
	-- 	end,
	-- 	config = function()
	-- 		require('config.gitsigns')
	-- 	end
	-- }

	use {
		'neovim/nvim-lspconfig',
		ft = { 'python', 'r', 'rmd', 'tex' },
		config = function()
			require('config.lsp')
		end
	}

	use {
		'nvim-telescope/telescope.nvim',
		cmd = {'Telescope'},
		requires = {
			{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
		},
		config = function()
			require('config.telescope')
		end
	}

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use {
		'kristijanhusak/orgmode.nvim',
		config = function()
			require('config.orgmode')
		end
	}

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

	-- use {
	-- 	'hrsh7th/nvim-compe',
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require('config.compe')
	-- 	end
	-- }

	-- use {
	-- 	'hrsh7th/vim-vsnip',
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require('config.vsnip')
	-- 	end
	-- }

	use {
		'L3MON4D3/LuaSnip',
		-- event = "InsertEnter",
		requires = 'rafamadriz/friendly-snippets',
		config = function()
			require('config.luasnip')
		end
	}

	use {
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		requires = {
			{'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
			{'hrsh7th/cmp-path', after = 'nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'},
			-- {'hrsh7th/cmp-nvim-lua', after = "nvim-cmp"},
			{'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'},
		},
		config = function()
			require('config.cmp')
		end
	}

	use {
		'windwp/nvim-autopairs',
		after = 'nvim-cmp',
		config = function()
			require('config.autopairs')
		end
	}

	use {
		'b3nj5m1n/kommentary',
		event = 'BufRead',
		config = function()
			require('config.kommentary')
		end
	}

	use {
		"blackCauldron7/surround.nvim",
		event = 'BufRead',
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
	-- 	ft = 'tex',
	-- 	config = function()
	-- 		require('config.vimtex')
	-- 	end
	-- }

	use 'romainl/vim-cool'
	use 'wellle/targets.vim'
	use {
		'tpope/vim-eunuch',
		cmd = {'Move', 'Rename', 'Delete', 'Chmod', 'SudoWrite'},
	}
	use 'tommcdo/vim-exchange'
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
