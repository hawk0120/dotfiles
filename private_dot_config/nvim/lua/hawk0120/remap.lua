vim.g.mapleader = " "

-- Shorten function call
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<C-p>", vim.cmd.Ex)

keymap("n", "<leader>u", ":UndotreeToggle<CR>")
keymap("n", "<leader>y", "y`+")

-- Move lines up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor centered while jumping
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Better line navigation
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("n", "<leader>h", "<home>") 
keymap("n", "<leader>e", "<end>") 

-- Save and quit
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>x", ":wq<CR>", opts)

-- Clipboard yank
keymap("n", "<leader>y", '"+y')
keymap("v", "<leader>y", '"+y')

-- Clear search highlight
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Window splits
keymap("n", "<leader>sv", ":vsplit<CR>", opts)
keymap("n", "<leader>sh", ":split<CR>", opts)
keymap("n", "<leader>se", "<C-w>=", opts)
keymap("n", "<leader>sx", ":close<CR>", opts)

-- Navigate splits easily
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tabs
keymap("n", "<leader>tn", ":tabnew<CR>", opts)
keymap("n", "<leader>tc", ":tabclose<CR>", opts)
keymap("n", "<leader>to", ":tabonly<CR>", opts)
keymap("n", "<leader>tn", ":tabnew<CR>", opts)
keymap("n", "<leader>t[", ":tabprevious<CR>", opts)
keymap("n", "<leader>t]", ":tabnext<CR>", opts)

-- Toggle relative numbers
keymap("n", "<leader>rn", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end)

-- Telescope (if installed)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- LSP
keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "gr", vim.lsp.buf.references, opts)
keymap("n", "gi", vim.lsp.buf.implementation, opts)
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap("n", "<leader>fm", function() vim.lsp.buf.format { async = true } end, opts)

