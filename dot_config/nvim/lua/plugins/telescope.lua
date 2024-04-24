require("telescope").setup({
  defaults = {
    file_ignore_patterns = { ".git/", "^node_modules/", ".clj-kondo/" }
  },
  extensions = {
    emoji = {
			action = function (emoji)
				vim.api.nvim_put({ emoji.value }, 'c', false, true)
			end
    }
  }
})

require("telescope").load_extension("emoji")

require("telescope").load_extension("bookmarks")
