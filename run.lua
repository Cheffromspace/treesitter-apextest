local q = require"vim.treesitter.query"
local function i(value)
  -- print('>>>>')
  print (vim.inspect(value))
end

local bufnr = 3-- vim.api.nvim_get_current_buf()

local cursor_position = {bufnr, line_number}
i(crsor_position)
local language_tree = vim.treesitter.get_parser(bufnr, 'java')
local syntax_tree = language_tree:parse()
local root = syntax_tree[1]:root()

-- local query = vim.treesitter.parse_query('java', [[
--   -- (method_declaration
--   --   (modifiers
--   --     (marker_annotation
--   --       name: (identifier) @annotation
--   --         (#match? @annotation "^[iI][sS][tT][eE][sS][tT]$")))
--   --   name: (identifier) @method (#offset! @method))
--   -- ]])

local query = vim.treesitter.parse_query('java', [[
  (class_declaration @class)
]])

for _, captures, metadata in query:iter_matches(root, bufnr) do
  i(captures)
  -- i(q.get_node_text(captures[2], bufnr))
  -- i(metadata)
end
