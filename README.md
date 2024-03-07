# vscode-lualine
#### A lualine theme based on vscode statusline.Hope you like it!🎉

[![GitHub](https://img.shields.io/github/license/hanasa2023/neovim-dotfile?style=for-the-badge)](https://github.com/hanasa2023/vscode-lualine?tab=MIT-1-ov-file)

## 📸 ScreenShot
![vscode-lualine](https://files.catbox.moe/wbht81.png)

## ⚡️ Requirements
- neovim 0.7+
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- Nerd Font

## 📦 Usage

If you are using NvChad you can put the file in `$NVIM_CONFIG/lua/custom/configs/lualine/vscode.lua` and add the following to your `$NVIM_CONFIG/lua/custom/plugins.lua` file.
```lua { 5-7 }
  {
    "nvim-lualine/lualine.nvim",
    -- You can optionally lazy-load heirline on UIEnter
    event = "UIEnter",
    config = function()
      require "custom.configs.lualine.vscode"
    end,
  },
```
<details>
    <summary>File structure</summary>
    
``` { 35, 23 }
.
├── init.lua
├── lazy-lock.json
├── LICENSE
├── lua
│   ├── core
│   │   ├── bootstrap.lua
│   │   ├── default_config.lua
│   │   ├── init.lua
│   │   ├── mappings.lua
│   │   └── utils.lua
│   ├── custom
│   │   ├── chadrc.lua
│   │   ├── configs
│   │   │   ├── conform.lua
│   │   │   ├── dropbar.lua
│   │   │   ├── hlchunk.lua
│   │   │   ├── lazygit.lua
│   │   │   ├── lspconfig.lua
│   │   │   ├── lualine
│   │   │   │   ├── default.lua
│   │   │   │   ├── evil_lualine.lua
│   │   │   │   └── vscode.lua
│   │   │   ├── nvim-notify.lua
│   │   │   ├── nvim-scrollbar.lua
│   │   │   ├── nvim-ts-autotag.lua
│   │   │   ├── overrides.lua
│   │   │   ├── todo-comments.lua
│   │   │   ├── trouble.lua
│   │   │   └── wilder.lua
│   │   ├── highlights.lua
│   │   ├── init.lua
│   │   ├── mappings.lua
│   │   ├── nohup.out
│   │   ├── plugins.lua
│   │   └── README.md
│   └── plugins
│       ├── configs
│       │   ├── cmp.lua
│       │   ├── lazy_nvim.lua
│       │   ├── lspconfig.lua
│       │   ├── mason.lua
│       │   ├── nvimtree.lua
│       │   ├── others.lua
│       │   ├── telescope.lua
│       │   └── treesitter.lua
│       └── init.lua
├── README.md
└── README.ZH_CN.md
```
</details>

### Linux / MacOs(Unix)
```git clone https://github.com/hanasa2023/vscode-lualine ~/.config/nvim/lua/custom/configs/lualine```

### Windows
- If you're using Command Prompt(CMD)
```git clone https://github.com/hanasa2023/vscode-lualine %USERPROFILE%\AppData\Local\nvim\nvim\lua\custom\configs\lualine```

- If you're using PowerShell(pwsh)
```git clone https://github.com/hanasa2023/vscode-lualine $ENV:USERPROFILE\AppData\Local\nvim\nvim\lua\custom\configs\lualine```

**If the above path doesnt work, try any of these paths:**
- For CMD : %LOCALAPPDATA%\nvim-lualine
```C:\Users\%USERNAME%\AppData\Local\nvim\lua\custom\configs\lualine```

- For pwsh : $ENV:LOCALAPPDATA\nvim-lualine
```C:\Users\ENV:USERNAME\AppData\Local\nvim\lua\custom\configs\lualine```
