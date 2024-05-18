local lualine = require "lualine"

local colors = {
  bg = "#34343b",
  fg = "#7b7b7b",
  mbg = "#262537",
  yellow = "#ff6300",
  cyan = "#477bde",
  darkblue = "#081633",
  green = "#86dd7f",
  orange = "#ffb684",
  violet = "#c678dd",
  magenta = "#c678dd",
  blue = "#5f96ca",
  red = "#ffa3be",
  grey = "#3e3d50",
  lsp = "#97ff8f",
  diff_green = "#98be65",
  diff_orange = "#ff8800",
  diff_red = "#ec5f67",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  hide_lsp_diagnostics = function()
    return vim.o.columns > 140
  end,
  hide_diff = function()
    return vim.o.columns > 120
  end,
  hide_line_col = function()
    return vim.o.columns > 140
  end,
  hide_cwd = function()
    return vim.o.columns > 80
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = "auto",
    -- We are going to use lualine_c an lualine_x as left and
    -- right section. Both are highlighted by c theme .  So we
    -- are just setting default looks o statusline
    -- normal = { a = { bg = colors.mbg }, b = { bg = colors.mbg }, c = { bg = colors.mbg } },
    -- inactive = { c = { bg = light_colors.bg } },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "mode",
        icon = "",
        color = function()
          -- auto change color according to neovims mode
          local mode_color = {
            n = colors.blue,
            i = colors.violet,
            v = colors.cyan,
            [""] = colors.cyan,
            V = colors.cyan,
            c = colors.magenta,
            R = colors.orange,
            no = colors.blue,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.orange,
            ic = colors.yellow,
            Rv = colors.orange,
            cv = colors.blue,
            ce = colors.blue,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.blue,
            t = colors.green,
          }
          return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
        end,
        -- color = { bg = colors.fg },
      },
      {
        "filetype",
        icon_only = true,
        colored = false,
        -- color = { fg = colors.fg, bg = colors.mbg },
        color = { fg = colors.fg },
        padding = { left = 1, right = 0 },
      },
      {
        "filename",
        cond = conditions.buffer_not_empty,
        -- color = { fg = colors.fg, bg = colors.mbg },
        color = { fg = colors.fg },
        padding = { left = 1, right = 1 },
      },
      {
        "branch",
        icon = "",
        color = { fg = colors.fg },
        padding = { left = 1, right = 1 },
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = "󰅚 ", warn = " ", info = " ", hint = "󰛩 " },
        cond = conditions.hide_lsp_diagnostics,
        colored = true,
        always_visible = true,
      },
    },
    lualine_x = {
      {
        "diff",
        colored = true,
        symbols = { added = " ", modified = " ", removed = " " },
        diff_color = {
          added = { fg = colors.diff_green },
          modified = { fg = colors.diff_orange },
          removed = { fg = colors.diff_red },
        },
        cond = conditions.hide_diff,
      },
      {
        function()
          return "|"
        end,
        -- color = { fg = colors.diff_red, bg = colors.mbg },
        color = { fg = colors.diff_red },
        cond = conditions.hide_diff,
      },
      {
        function()
          return "Ln %l, Col %c"
        end,
        -- color = { fg = colors.fg, bg = colors.mbg },
        color = { fg = colors.fg },
        cond = conditions.hide_line_col,
        -- icon = "|",
      },
      {
        "o:encoding", -- option component same as &encoding in viml
        fmt = string.upper, -- I'm not sure why it's upper case either ;)
        cond = conditions.hide_in_width,
        -- color = { fg = colors.yellow, bg = colors.mbg, gui = "bold" },
        color = { fg = colors.yellow, gui = "bold" },
      },
      {
        function()
          return "{} %Y"
        end,
        -- color = { fg = colors.blue, bg = colors.mbg, gui = "bold" },
        color = { fg = colors.blue, gui = "bold" },
      },
      {
        function ()
          local msg = ""
          -- local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            if client.name == "copilot" then
              return ""
            end
          end
          return msg
        end
      },
      {
        function()
          local msg = "No Active Lsp"
          -- local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            if client.name ~= "null-ls" and client.name ~= "copilot" then
              return (vim.o.columns > 100 and client.name) or "LSP"
            end
          end
          return msg
        end,
        icon = "󰄭 ",
        -- color = { fg = colors.lsp, bg = colors.mbg },
        color = { fg = colors.lsp },
      },
    },
    lualine_y = {},
    lualine_z = {
      {
        function()
          local filepath = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          return "󰉖 " .. filepath
        end,
        color = { bg = colors.bg, fg = colors.red },
        cond = conditions.hide_cwd,
      },
    },
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

lualine.setup(config)
