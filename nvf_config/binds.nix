{
  vim.binds = {
    whichKey.enable = true;
    cheatsheet.enable = true;
  };
  vim.globals = {
    mapleader = " ";
  };

  vim.maps = {
    normal = {
      "<leader>pv".action = ":Ex<CR>";
      "<leader>t".action = ":ToggleTerm<CR>";
    };
    visual = { };
    insert = { };
    command = { };
  };
}

