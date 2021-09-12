require('packer').startup({
	function()
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
		cmd = {'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeFindFile'},
		config = function()
			require('config.nvimtree')
		end
	}

	use  {
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
		"folke/zen-mode.nvim",
		cmd = 'ZenMode',
		config = function()
			require('config.zenmode')
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
		'nvim-telescope/telescope.nvim',
		cmd = {'Telescope'},
		requires = {
			-- Lazy load only when require('module') is called
			{ 'nvim-lua/plenary.nvim', module = "plenary"},
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
		},
		config = function()
			require('config.telescope')
		end
	}

	use {
		'kristijanhusak/orgmode.nvim',
		config = function()
			require('config.orgmode')
		end,
	}

	use {
		'akinsho/org-bullets.nvim',
		ft = 'org',
		module = 'org-bullets',
		config = function()
			require('config.orgbullets')
		end
	}

	use {
		"lukas-reineke/headlines.nvim",
		ft = {'org', 'markdown'},
		config = function()
			require('config.headlines')
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
		'L3MON4D3/LuaSnip',
		requires = {'rafamadriz/friendly-snippets', opt = true},
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
			{'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', module = 'cmp_nvim_lsp'},
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
		'folke/tokyonight.nvim',
		config = function()
			require('config.tokyonight')
		end
	}

	use {
		'plasticboy/vim-markdown',
		ft = {'markdown', 'rmd'},
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

	use {
		'tpope/vim-eunuch',
		cmd = {'Move', 'Rename', 'Delete', 'Chmod', 'SudoWrite'},
	}

	use 'romainl/vim-cool'
	use 'wellle/targets.vim'
	use 'tommcdo/vim-exchange'
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
