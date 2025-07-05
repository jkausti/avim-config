-- ~/.config/nvim/lua/user/polish.lua

-- Get the original diagnostic handler
local original_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]

-- Wrap the handler to filter out specific messages
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  if result and result.diagnostics then
    local filtered_diagnostics = {}
    for _, diagnostic in ipairs(result.diagnostics) do
      -- If the diagnostic message does NOT contain the text, keep it
      if not string.find(diagnostic.message, "Invalid offset LineCol", 1, true) then
        table.insert(filtered_diagnostics, diagnostic)
      end
    end
    -- Replace the original diagnostics with our filtered list
    result.diagnostics = filtered_diagnostics
  end

  -- Call the original handler with the filtered diagnostics
  return original_handler(err, result, ctx, config)
end
