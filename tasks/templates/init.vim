" Set Vundle as the plugin manager
set runtimepath+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/')

" Let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

{% for plugin in plugin_list %}
Plugin '{{ plugin }}'
{% endfor %}

" All of your plugins must be added before this line
call vundle#end()
filetype plugin indent on
set mouse=a