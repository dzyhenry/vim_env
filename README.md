# vim_env

My vim configurations & mac development environment.

## Install nvm & node

- [Install NVM(Node version management)](https://github.com/creationix/nvm)

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash
```
- Use nvm to install node(choose any version you like)
```bash
nvm install v7
```
## Install lints for JavaScitp, CSS, HTML (For Mac)
- [ESLint for airbnb](https://www.npmjs.com/package/eslint-config-airbnb), [babel-eslint](https://github.com/babel/babel-eslint), [airbnb](https://github.com/airbnb/javascript)
```bash        
npm install -g babel-eslint
npm install -g eslint-config-airbnb eslint-plugin-react eslint
```

- [CSSLint](https://github.com/CSSLint/csslint)
```bash        
npm install -g csslint
```

- [Tidy HTML5](http://www.html-tidy.org/)
```bash        
brew install tidy-html5
```
## Launch Your Vim
1. Copy `.vimrc` file to your `~/`
2. We set `'(leader) + u`(short cut) to intialize your vim plugins, so you may use vim to open any file(just ignore the errors vim emits), and then just press `' + u` to fetch the plugins configured in the `.vimrc`.
3. It's suggested that you got time to read the `.vimrc` file. You may not understand the vim syntax completely, since the programming languages are somehow connected, I believe you could easily get the idea. 
4. Install vim plugin [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#full-installation-guide)
  - go to YouCompleteMe director: `$cd ~/vim/bundle/YouCompleteMe`
  - fetch YCM's dependencies: `$git submodule update --init --recursive`
  - install cmake: `$brew install cmake`
  - Build YCM core: `$./install.py`

## Use Vim to Edit MarkDown
- install [instant-markdown-d & xdg-utils](https://github.com/suan/vim-instant-markdown)
```bash
npm install -g instant-markdown-d
npm install -g xdg-utils
```
- clone vim-instant-markdown to your pathogen bundle('~/.vim/bundle/')
```
git clone https://github.com/suan/vim-instant-markdown.git
```
