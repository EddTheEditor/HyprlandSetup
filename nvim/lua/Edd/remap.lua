vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>cpp", function()
  local filepath = vim.fn.expand("%:p")
  local filename_no_ext = vim.fn.expand("%:p:r")
  vim.cmd("w")  -- Save the file

  local compile_cmd = "g++ '" .. filepath .. "' -o '" .. filename_no_ext .. "'"
  local run_cmd = filename_no_ext

  -- Compile first
  vim.fn.jobstart(compile_cmd, {
    on_exit = function(_, code)
      if code == 0 then
        -- If compile succeeds, run the executable in a floating terminal
        vim.cmd("botright split")
        vim.cmd("resize 15")
        vim.cmd("term " .. run_cmd)
        vim.cmd("startinsert")
      else
        print("Compilation failed.")
      end
    end,
    stderr_buffered = true,
    stdout_buffered = true,
  })
end, { desc = "Compile and run C++ file in terminal" })


vim.keymap.set("v", "<leader>r", function()
  -- Yank selection into register v
  vim.cmd('normal! "vy')

  -- Get text and trim it
  local selected = vim.fn.getreg("v"):gsub("\n", "")
  selected = selected:match("^%s*(.-)%s*$")  -- trim leading/trailing whitespace

  if not selected or selected == "" then
    print("No valid word selected.")
    return
  end

  -- Ask for replacement
  vim.ui.input({ prompt = "Rename all instances of '" .. selected .. "' to: " }, function(replacement)
    if not replacement or replacement == "" then return end

    -- Escape special characters in the selected word
    local escaped = vim.fn.escape(selected, "\\/.*$^~[]")

    -- Do whole-word replace across the file
    vim.cmd([[%s/\<]] .. escaped .. [[\>/]] .. replacement .. [[/g]])
  end)
end, { desc = "Rename selected word globally" })

