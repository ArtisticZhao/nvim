require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- 启动时间分析
    use { "dstein64/vim-startuptime", cmd = "StartupTime" }
  end
})
