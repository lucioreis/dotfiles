return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            { 'saghen/blink.cmp' },
        },
        opts = {
            servers = {
                lua_ls = {}
            }
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")
            for server, config in pairs(opts.servers) do
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- `opts[server].capabilities, if you've defined it
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end

            vim.api.nvim_create_autocmd('LSPAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end

                    if client.supports_method('textDocument/formatting') then
                        vim.keymap.set("n",
                            "<space>cf",
                            function()
                                vim.lsp.buf.format({ bufrn = args.buf, id = client.id })
                            end, { desc = "Format code" })

                        -- vim.api.nvim_create_autocmd('BufWritePre', {
                        --     buffer = args.buf,
                        --     callback = function()
                        --         vim.lsp.buf.format({ bufrn = args.buf, id = client.id })
                        --     end,
                        -- })
                    end

                    if client.supports_method('textDocument/publishDiagnostics') then
                        vim.keymap.set("n", "<space>cl", function()
                            vim.diagnostic.open_float(args.buf)
                        end)
                    end

                    if client.supports_method('textDocument/definition') then
                        vim.keymap.set("n", "<space>cd", function()
                            vim.lsp.buf.definition()
                        end)
                    end

                    if client.supports_method('textDocument/reference') then
                        vim.keymap.set("n", "<space>cr", function()
                            vim.lsp.buf.references({include_declaration = true})
                        end)
                    end
                end,
            })
        end,
    },
}
