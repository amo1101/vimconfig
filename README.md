VIM IDE setup:
1.copy vimrc to ~/.vimrc
2.setup coc (https://mp.weixin.qq.com/s/ehzMVGVS1PiVSt5CP-EqWA):
  2.1 install plug.vim: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  2.2 install node.js: curl -sL install-node.now.sh/lts | bash
  2.3 install clangd: sudo apt install clangd-12; sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
  2.4 install bear if needed and bear make to generate compile_commands.json (optional)
  2.5 vim :PlugInstall
  2.6 vim :CocInstall coc-json coc-clangd
3.install ctags & cscope
4.setup regular vim plugins: vim :PluginInstall
