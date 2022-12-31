-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

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
	use 'wbthomason/packer.nvim'
  -- Wakatime for measuring coding time
  use {'wakatime/vim-wakatime'}
  -- use("jacoborus/tender.vim")
  -- use({"phanviet/vim-monokai-pro", as = 'monokai_pro'})
  use({"morhetz/gruvbox"})
  -- Telescope
  use { "nvim-telescope/telescope.nvim", tag = '0.1.0', requires = {{'nvim-lua/plenary.nvim'}}}
  -- Treesitter - for Windows you need a C compiler, like zig
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- Comment Plugin use gc or gb in visual mode
  use {'numToStr/Comment.nvim', config = function() require('Comment').setup {} end}
  -- Undotree
  use { "mbbill/undotree" }
  -- Discord Rich Presence
  use { "andweeb/presence.nvim", config = "require('akrista.presence-config')"}
  -- VSCode like minimap, for minimap you need to have installed Cargo
  use({"wfxr/minimap.vim", run = "cargo install --locked code-minimap" })
  -- Github Copilot needs NodeJs 16 or higher, github copilot is an IA code helper.
  -- After install use :Copilot setup
  use("github/copilot.vim")
  -- Pretty status bar
	use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
	-- Terminal Toggle
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
require("toggleterm").setup({
	open_mapping = [[<c-x>]],
	shade_terminals = false
})
  end}
  -- Bufferline
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons', config = function() require("bufferline").setup({}) end}
  -- smarter indent
  use {"lukas-reineke/indent-blankline.nvim", config = function() require("indent_blankline").setup({show_current_context = true, show_current_context_start = true}) end}
	-- Alpha dashboard
  --use {'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = function () require'alpha'.setup(require'alpha.themes.startify'.config) end}
  -- use { "Pocco81/auto-save.nvim", config = "require('auto-save')" }
  --use { "Pocco81/true-zen.nvim"}

  -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
		require("packer").sync()
	end

end)
