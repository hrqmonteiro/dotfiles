return {
  {
    "VidocqH/lsp-lens.nvim",
    config = function()
      require("lsp-lens").setup({
        sections = {
          definition = false,
          references = function (count)
            if count <= 1 then
              return count .. " usage"
            else
              return count .. " usages"
            end
          end,
          implements = false,
          -- implements = function (count)
          --   if count <= 1 then
          --     return count .. " implementation"
          --   else
          --     return count .. " implementations"
          --   end
          -- end,
          git_authors = false
        }
      })
    end
  }
}
