lua << EOF
require("toggleterm").setup{
	open_mapping = [[<leader>t]],
	direction = "float",
	float_opts = {
		border = 'curved',
	},
	shell =  vim.o.shell,
}
EOF
