# i hate intellij but i have to qwq
{...}:
{
  home-manager.users.shiina = {...}: {
    home.file.".ideavimrc".text = ''
      set expandtab
      set tabstop=4
      set shiftwidth=4
      set nowrap
      set number relativenumber
      set signcolumn=yes

      " Who came up with this???
      set visualbell

      " Set leader to space
      nnoremap <SPACE> <Nop>
      let mapleader=" "

      " Default to system clipboard 
      set clipboard+=unnamedplus

      " Paste without copy
      xnoremap <leader>p "_dP

      " Open Telescope equivalent
      nmap <leader>g <Action>(GotoFile) 
      " Find Class by name
      nmap <leader>c <Action>(GotoClass)
      " Run Programm
      nmap <leader>r <Action>(Run)

      " Select autocomplete
      nmap <C-n> <Action>(EditorDown) 
      nmap <C-p> <Action>(EditorUp) 

      " Go tab left and right
      nmap <A-.> <Action>(NextTab)
      nmap <A-,> <Action>(PreviousTab)
      nmap <A-c> <Action>(CloseTab)

      " Show error
      nmap <leader>e <Action>(ShowErrorDescription)
      " Reformat Code
      nmap <leader>f <Action>(ReformatCode)
      " Evil save
      nmap <C-s> <Action>(SaveAll)

      " Set debug break, run, continue
      nmap <leader>db <Action>(ToggleLineBreakpoint)
      nmap <leader>dr <Action>(Debug)
      nmap <leader>dc <Action>(Resume)
    '';
  };   
}
