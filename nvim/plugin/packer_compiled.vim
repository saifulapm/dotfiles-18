" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/adrian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/adrian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/adrian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/adrian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/adrian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/lazygit.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["minimap.vim"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/minimap.vim"
  },
  neoformat = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["v-vim"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/v-vim"
  },
  ["vim-leader-mapper"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/vim-leader-mapper"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/adrian/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
