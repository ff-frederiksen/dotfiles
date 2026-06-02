return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua", "vim", "vimdoc",
                "c_sharp", "typescript", "javascript",
                "html", "css", "json", "bash", "markdown",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
