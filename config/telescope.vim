
nnoremap <silent> <Leader>b <cmd>Telescope buffers<CR>
nnoremap <silent> <Leader>ff <cmd>Telescope find_files<CR>
nnoremap <silent> <Leader>fg <cmd>Telescope live_grep<CR>
nnoremap <silent> <Leader>f: <cmd>Telescope commands<CR>
nnoremap <silent> <Leader>fb <cmd>Telescope file_browser<CR>
nnoremap <silent> <Leader>/ <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <Leader>' <cmd>Telescope registers<CR>
nnoremap <silent> <Leader>u <cmd>Telescope undo<CR>
nnoremap <silent> <Leader>g <cmd>Telescope git_files<CR>
nnoremap <silent> <Leader>H <cmd>Telescope help_tags<CR>
nnoremap <silent> <Leader>hh <cmd>Telescope oldfiles<CR>
nnoremap <silent> <Leader>h: <cmd>Telescope command_history<CR>
nnoremap <silent> <Leader>h/ <cmd>Telescope search_history<CR>

lua << EOF
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension("file_browser")
require('telescope').load_extension('undo')
EOF
