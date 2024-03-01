
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")

-- Debugger
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true });
vim.keymap.set("n", "<F1>", "<cmd>lua require'dap'.step_into()<CR>",  { noremap = true, silent = true });
vim.keymap.set("n", "<F2>", "<cmd>lua require'dap'.step_out()<CR>",  { noremap = true, silent = true });
vim.keymap.set("n", "<F3>", "<cmd>lua require'dap'.step_over()<CR>",  { noremap = true, silent = true });
vim.keymap.set("n", "<leader>con", "<cmd>lua require'dap'.continue()<CR>",  { noremap = true, silent = true });
vim.keymap.set("n", "<leader>dis", "<cmd>lua require'dap'.disconnect()<CR><cmd>lua require'dap'.close()<CR>",  { noremap = true, silent = true });

-- Start the debugger
local function dap_run_config()
  -- Prompt the user for language type, executable path, and name
  local lang_type = vim.fn.input('Language type (e.g., cpp): ')
  local program_path = vim.fn.input('Path to executable: ')
  local config_name = vim.fn.input('Configuration name (optional, press Enter to skip): ')

  -- Use default name if not provided
  if config_name == "" then
    config_name = "Launch file"
  end

  -- Run dap with the provided configuration
  require'dap'.run({
    type = lang_type,
    request = 'launch',
    name = config_name,
    program = program_path
  })
end

vim.keymap.set('n', '<leader>sdb', dap_run_config, {noremap = true, silent = true})

end)

