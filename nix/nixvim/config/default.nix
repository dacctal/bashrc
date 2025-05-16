{
# Import all your configuration modules here
	imports = [ ./bufferline.nix ];

	colorschemes.onedark.enable = true;
	colorschemes.onedark.settings.style = "warmer";

    globalOpts = {
        number = true;
        relativenumber = true;

        tabstop = 4;
        softtabstop = 4;
        shiftwidth = 4;
        expandtab = true;

        smartindent = true;

        wrap = false;

        termguicolors = true;

        scrolloff = 8;
    };

	globals.mapleader = " ";

	keymaps = [
	{
		action = "<cmd>Ex<CR>";
		key = "<leader>fm";
    }
    {
        action = "<cmd>UndotreeToggle<CR>";
        key = "<leader>u";
    }
    ];

	plugins = {
        autoclose.enable = true;
        lualine.enable = true;
        transparent.enable = true;
        treesitter.enable = true;
        luasnip.enable = true;
        undotree.enable = true;
        telescope = {
                enable = true;
#                settings.mappings = {
#                        i = {
#                                "<leader>ff" = {
#                                        __raw = "require('telescope.actions').find_files";
#                                    };
#                            };
#                    };
            };
        lsp = {
            enable = true;
            servers = {
                clangd.enable = true;               #c/c++
                    golangci-lint-ls.enable = true; #go
                    tsserver.enable = true; 	    #js/ts
                    lua-ls.enable = true; 	    	#lua
                    nixd.enable = true;             #nix
                    pylyzer.enable = true;          #python
                    rust-analyzer = {               #rust
                        enable = true;
                        installRustc = true;
                        installCargo = true;
                    };
            };
        };

        cmp = {
            enable = true;
			autoEnableSources = true;
		};
	};
}
