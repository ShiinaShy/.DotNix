# i hate intellij but i have to qwq
{...}:
{
  home-manager.user.shiina = {...}: {
    home.file.".ideavimrc".text = ''
      set expandtab
      set tabstop=4
      set shiftwidth=4
      set nowrap

      set number relativenumber
      set signcolumn=yes
      set visualbell


      nnoremap <SPACE> <Nop>
      let mapleader=" "

      set clipboard+=unnamedplus

      " Paste without copy
      xnoremap <leader>p "_dP

      " Open Telescope equivalent
      nmap <leader>g <Action>(GotoFile) 
      " Find Class by name
      nmap <leader>c <Action>(GotoClass)
      " Run Programm
      nmap <leader>r <Action>(Run)
      " AAAAAAAAAAAAA
      nmap <C-j> <Down>
      nmap <C-k> <Up>

      " Go tab left and right
      nmap <A-.> <Action>(NextTab)
      nmap <A-,> <Action>(PreviousTab)
      nmap <A-c> <Action>(CloseTab)

      " NvimTreeOpen
      nmap <leader>- <cmd>NvimTreeToggle<cr>

      " Evil save
      nmap <C-s> <cmd>w<cr>
    '';
  };   
}
