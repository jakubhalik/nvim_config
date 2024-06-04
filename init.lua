require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.cmd [[
    function! InsertLambdaAtCursor()
        let l:line = getline('.')
        let l:pos = col('.')
        let l:new_line = l:line[:l:pos-2] . 'λ' . l:line[l:pos-1:]
        call setline('.', l:new_line)
        call cursor(line('.'), l:pos + 1)
    endfunction

    command! -nargs=0 Lam call InsertLambdaAtCursor()
]]

