-- Some compat issue with another plugin?
-- With months-outdated tagged semver version, crates.nvim triggered a popup
-- notification everytime nvim is started. Fixed temporarily by forcing update
-- to latest HEAD in its main branch.
return {
  "Saecki/crates.nvim",
  branch = "main",
}
