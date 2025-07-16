return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local if_nil = vim.F.if_nil

    local leader = "SPC"

    local function button(sc, txt, keybind, keybind_opts)
      local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

      local opts = {
        position = "center",
        shortcut = sc,
        cursor = 3,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
      }

      if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
      end

      local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
      end

      return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
      }
    end

    local section = {
      header = {
        type = "text",
        val = {
          [[                                                                       ]],
          [[                                                                       ]],
          [[                                                                       ]],
          [[                                                                     ]],
          [[       ████ ██████           █████      ██                     ]],
          [[      ███████████             █████                             ]],
          [[      █████████ ███████████████████ ███   ███████████   ]],
          [[     █████████  ███    █████████████ █████ ██████████████   ]],
          [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
          [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
          [[ ██████  █████████████████████ ████ ████ █████ ████ ██████ ]],
          [[                                                                       ]],
          [[                               Jacob Ng                                ]],
          [[                                                                       ]],
        },
        opts = {
          position = "center",
          hl = "Type",
        },
      },

      buttons = {
        type = "group",
        val = {
          button("e", "  New file", "<cmd>ene <CR>"),
          button("SPC f f", "󰈞  Find file"),
          button("SPC f h", "󰊄  Recently opened files"),
          button("SPC f r", "  Frecency/MRU"),
          button("SPC f g", "󰈬  Find word"),
          button("SPC f m", "  Jump to bookmarks"),
          button("SPC s l", "  Open last session"),
        },
        opts = {
          spacing = 1,
        },
      },

      footer = {
        type = "text",
        val = "", -- Will be set dynamically below
        opts = {
          position = "center",
          hl = "Number",
        },
      },
    }

    local function footer_text()
      local total_plugins = #require("lazy").plugins()
      local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
      local v = vim.version()
      local version_info = "   v" .. v.major .. "." .. v.minor .. "." .. v.patch
      return datetime .. "   " .. total_plugins .. " plugins" .. version_info
    end

    section.footer.val = footer_text()

    local config = {
      layout = {
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 2 },
        section.buttons,
        { type = "padding", val = 1 },
        section.footer,
      },
      opts = {
        margin = 5,
      },
    }

    alpha.setup(config)
  end,
}
