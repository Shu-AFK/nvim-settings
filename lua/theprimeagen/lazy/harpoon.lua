return {
  "theprimeagen/harpoon",
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup()

    -- Keymap to append the current file to the Harpoon mark list
    vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, {desc = "Add file to Harpoon"})

    -- Keymap to toggle the Harpoon UI quick menu
    vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, {desc = "Toggle Harpoon Quick Menu"})

    -- Keymaps for selecting specific Harpoon marks
    vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end, {desc = "Harpoon: Go to Mark 1"})
    vim.keymap.set("n", "<C-j>", function() require("harpoon.ui").nav_file(2) end, {desc = "Harpoon: Go to Mark 2"})
    vim.keymap.set("n", "<C-k>", function() require("harpoon.ui").nav_file(3) end, {desc = "Harpoon: Go to Mark 3"})
    vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end, {desc = "Harpoon: Go to Mark 4"})
  end
}
