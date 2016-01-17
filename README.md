## vim_env
My vim settings, and mac development for front end.


### Before downloads this project, things you need to do.

####1. [Install NVM(Node version management)](https://github.com/creationix/nvm)

        curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash

####2. Use nvm to install node(choose any version you like)
    
        nvm install v.4.2.0

####3. Install lints for JavaScitp, CSS, HTML (For Mac)

1. [ESLint for airbnb](https://www.npmjs.com/package/eslint-config-airbnb), [babel-eslint](https://github.com/babel/babel-eslint), [airbnb](https://github.com/airbnb/javascript)

        npm install -g babel-eslint
        npm install -g eslint-config-airbnb eslint-plugin-react eslint

2. [CSSLint](https://github.com/CSSLint/csslint)
        
        npm install -g csslint

3. [Tidy HTML5](http://www.html-tidy.org/)

        brew install tidy-html5
