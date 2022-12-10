vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

return require('packer').startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}
  -- Wakatime for measuring coding time
  use {'wakatime/vim-wakatime'}
  -- Impatient for faster load of neovim
  --use {'lewis6991/impatient.nvim'}
  -- VSCode like minimap, for minimap you need to have installed Cargo
  use({"wfxr/minimap.vim", run = "cargo install --locked code-minimap" })
  -- My Colorscheme of preference
  -- use("jacoborus/tender.vim")
  use("phanviet/vim-monokai-pro")
  -- Github Copilot needs NodeJs 16 or higher, github copilot is an IA code helper
  use("github/copilot.vim")
  -- Useful lua functions used by lots of plugins
  use { "nvim-lua/plenary.nvim"}
  -- Comment Plugin use gc or gb in visual mode
	use {'numToStr/Comment.nvim', config = function() require('Comment').setup {} end}
  -- Icons for File Explorer
  use { "nvim-tree/nvim-web-devicons"}
  -- File Explorer in Vim Ctrl+f
  use { "nvim-tree/nvim-tree.lua"}
  use { "akinsho/bufferline.nvim", requires = "nvim-tree/nvim-web-devicons"}
  use { "moll/vim-bbye"}
  -- Pretty status bar
	use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
	-- Terminal Toggle
  use {"akinsho/toggleterm.nvim", tag = '*', config = function() end}
	-- Use Ctrl+fp to list recent git projects
	use {"ahmedkhalf/project.nvim", config = function() require("project_nvim").setup {} end}
  use {"lukas-reineke/indent-blankline.nvim"} -- smarter indent
	-- alpha dashboard
  use {'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = function () require'alpha'.setup(require'alpha.themes.startify'.config) end}
  -- Telescope
  use { "nvim-telescope/telescope.nvim"}
  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter"}
  -- Git
  use { "lewis6991/gitsigns.nvim"}
  --use { "Pocco81/auto-save.nvim", config = "require('auto-save')" }
  use { "Pocco81/true-zen.nvim"}
  -- Discord Rich Presence
  use { "andweeb/presence.nvim", config = "require('presence-config')"}
  -- LSP
 --  use { "neovim/nvim-lspconfig"} -- enable LSP
 --  use { "williamboman/mason.nvim"}
 --  use { "williamboman/mason-lspconfig.nvim"}
 --  use({ "jose-elias-alvarez/null-ls.nvim", config = function() require("null-ls").setup() end, requires = { "nvim-lua/plenary.nvim" }, })
	-- use { "brymer-meneses/grammar-guard.nvim", requires = { "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" }}
  -- Quick word search under cursor alt+p and alt+n
  use { "RRethy/vim-illuminate"}
  use { "mbbill/undotree" }

  -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
