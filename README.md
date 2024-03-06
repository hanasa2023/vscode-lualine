# vscode-lualine
#### A lualine theme based on vscode statusline.Hope you like it!🎉


## 📸 ScreenShot
![vscode-lualine](https://files.catbox.moe/wbht81.png)

## ⚡️ Requirements
- neovim 0.7+
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

## 📦 Usage

If you are using NvChad you can put the file in `$NVIM_CONFIG/lua/custom/configs/lualine/vscode.lua` and add the following to your `$NVIM_CONFIG/lua/custom/plugins.lua` file.
```lua
  {
    "nvim-lualine/lualine.nvim",
    -- You can optionally lazy-load heirline on UIEnter
    event = "UIEnter",
    config = function()
      require "custom.configs.lualine.vscode"
    end,
  },
```

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
