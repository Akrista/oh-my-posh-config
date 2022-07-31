local config = {
  -- Set dashboard header
  header = {
"                              / /                                ",
"             *             ,//  ./@,   @                         ",
"            @@@@@@@@@@@@@@&//    /(/@@@(@                        ",
"           @@@@@@@@@@@@@@///      .%@@@@/              /         ",
"         ,(@@@@@@@@@@%. %*//.%%@((..*@@@@/         &/            ",
"        //@@@@%   , /&/,*.&/   ,@@@(@@@@/%..  %% ,*              ",
"         %#@@@@ // /&/  ./   @/ .//*@@@,@/ @@@@@@@@@@@///        ",
"           %.@@@@@.././/&@@(((@@%/ @@@*@ /  ////&%/ //           ",
"              *#@@@@,//////@@@@@&(@@@@%   /@@@@//.//* *@*/       ",
"                @.@@@@@//@//@@@@/@@@@% @/////   //. @ ///        ",
"                // @*(@*%@@@@&.@&/&@. %@@@// //  @,  / /         ",
"               #@  (  .#@(@@@@//    .%@@#(/* ./&#/%/.            ",
"                @/@  * * */////@  .  /  @/@ @   //  /            ",
"                    %   &@@@/ / @@@@@ @@@@@@/. . ..              ",
"                   ,.*. @@&// /#(@(%@(@@@@@@/  //                ",
"                     * @@&/.  @@@@@@@&#//*                       ",
"                      *@(/  /@@@@@@@@@ @  @                      ",
"                    . @. . /&@@@@@(( /*/((//* &                  ",
"                 &%./ ,*.*//@@@%.(,.*  .* /*,#,%                 ",
"                         * @@  / /*      @ /                     ",
"                           /*.          https://linktr.ee/akrista",
  },

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme
  colorscheme = "gruvbox",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      guifont = "MesloLGS NF:h13",
      relativenumber = true, -- sets vim.opt.relativenumber
    },
    g = {
      minimap_width = 10,
      minimap_auto_start = 1,
      minimap_auto_start_win_enter = 1,
      mapleader = " ", -- sets vim.g.mapleader
    },
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
     -- "catppuccin/nvim",
      "ellisonleao/gruvbox.nvim",
      "folke/lsp-colors.nvim",
      "wfxr/minimap.vim",
      -- Wakatime should ask you for your api key, if not, run WakaTimeApiKey
      "wakatime/vim-wakatime",
      -- For github copilot, you must run :Copilot setup / and have node 17 installed
      "github/copilot.vim",
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the setup() call for default plugins
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.rufo,
        -- Set a linter
        null_ls.builtins.diagnostics.rubocop,
      }
      -- set up null-ls's on_attach function
      config.on_attach = function(client)
        -- NOTE: You can remove this on attach function to disable format on save
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table
    end,
    treesitter = {
      ensure_installed = { "lua", "javascript", "css","dockerfile","dot","html","http","json","php","scss","sql","svelte","typescript","vim","yaml"},
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua", "dockerls", "dotls", "html", "tsserver", "marksman" , "intelephense", "pyright", "sqls", "svelte","lemminx", "yamlls" },
    },
    packer = {
      -- compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
        },
      },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- This function is run last
  -- good place to configuring augroups/autocommands and custom filetypes
  polish = function()
    -- Set key binding
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
