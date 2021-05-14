sudo apt-get update # ubdate
sudo apt-get install zsh # install zsh


### Oh-my-zsh ###
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo apt-get install zsh-syntax-highlighting
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

sudo apt-get install zsh-autosuggestions
echo "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

function escape_slashes {
    sed 's/\//\\\//g' 
}

function change_line {
    local OLD_LINE_PATTERN=$1; shift
    local NEW_LINE=$1; shift
    local FILE=$1

    local NEW=$(echo "${NEW_LINE}" | escape_slashes)
    sed -i .bak '/'"${OLD_LINE_PATTERN}"'/s/.*/'"${NEW}"'/' "${FILE}"
    mv "${FILE}.bak" /tmp/
}

change_line 'ZSH_THEME="robbyrussell"' 'ZSH_THEME="powerlevel10k/powerlevel10k"' ~/.zshrc 

