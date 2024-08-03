local plugins = {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
            local lspconfig = require "lspconfig"
            lspconfig.gopls.setup {
                cmd = {"gopls"},
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    }
                }
            }
         end,
        },
        {
            "williamboman/mason.nvim",
            opts = {
                ensure_installed = {
                    "eslint-lsp",
                    "prettierd",
                    "tailwindcss-language-server",
                    "typescript-language-server",
                    "gopls",
                },
            },
        },
        {
            "nvimtools/none-ls.nvim",
            event = "VeryLazy",
            opts = function()
                local null_ls = require "null-ls"
                return {
                    sources = {
                        null_ls.builtins.formatting.gofmt,
                        null_ls.builtins.formatting.goimports,
                }
            }
            end,
        },
        {
            "windwp/nvim-ts-autotag",
            ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
            config = function()
                require("nvim-ts-autotag").setup()
            end,
        },
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function()
                local opts = require "plugins.configs.treesitter"
                opts.ensure_installed = {
                    "lua",
                    "javascript",
                    "typescript",
                    "tsx",
                    "go",
          }
          return opts
        end,
    },
    {
        "ray-x/go.nvim",
        ft = {"go"},
        config = function()
            require("go").setup()
        end,
    },
    {
        "ray-x/guihua.lua",
        build = "cf lua/fzy && make"
    }
}
return plugins



