local M = {
	"Zeioth/compiler.nvim",
	cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
	dependencies = { "stevearc/overseer.nvim" },
	opts = {},
}

-- To use properly, ensure the following packages are installed
-- sudo apt update;
-- sudo apt install --install-if-missing "mingw-w64" "dotnet8" "monodevelop" "java-common" "nasm" "r-base" "rustup" "rustc" "golang" "python" "ruby" "perl" "lua5.3" "kotlin" "elixir" "make" "nodejs" "npm" "node-typescript" "nuitka"; pip install "pyinstaller";
-- sudo snap install --classic "flutter"

-- Check if done correctly
-- :lua require("complier")
-- :checkhealth compiler

return M
