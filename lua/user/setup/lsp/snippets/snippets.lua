local status_ok, ls = pcall(require, "luasnip.loaders.from_vscode")
if not status_ok then
	return
end

ls.lazy_load({paths = "~/.config/nvim/lua/user/setup/lsp/snippets/"})
