-- Load the TokyoNight colorscheme
require("tokyonight").load()


--- LIGHTLINE CONFIGURATION -----
-- Function to get the current date
vim.cmd([[
function! LightlineDate()
    return strftime('%Y-%m-%d')
endfunction
]])

-- Lightline configuration
vim.g.lightline = {
  colorscheme = 'tokyonight',
  active = {
    left = { { 'mode', 'paste' }, { 'readonly', 'filename', 'modified' } },
    right = { { 'LightlineDate' }, { 'lineinfo' }, { 'percent' }, { 'fileformat', 'fileencoding', 'filetype' } }
  },
  component_function = {
    fileformat = 'LightlineFileformat',
    filetype = 'LightlineFiletype',
    fileencoding = 'LightlineFileencoding',
    LightlineDate = 'LightlineDate'
  }
}
