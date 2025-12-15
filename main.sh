#!/data/data/com.termux/files/usr/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m'

# Animation function
animate_text() {
    text="$1"
    delay=0.05
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo
}

# Clear screen
clear

# Show header
echo -e "${GREEN}"
echo '╔══════════════════════════════════════════════════════════╗'
echo '║                                                          ║'
echo -e '║  ${RED}██╗  ██╗██╗${BLUE}███████╗${RED}██╗  ██╗ ${BLUE}██████╗ ${RED}██████╗     ${GREEN}║'
echo -e '║  ${RED}██║ ██╔╝██║${BLUE}██╔════╝${RED}██║  ██║${BLUE}██╔═══██╗${RED}██╔══██╗    ${GREEN}║'
echo -e '║  ${RED}█████╔╝ ██║${BLUE}███████╗${RED}███████║${BLUE}██║   ██║${RED}██████╔╝    ${GREEN}║'
echo -e '║  ${RED}██╔═██╗ ██║${BLUE}╚════██║${RED}██╔══██║${BLUE}██║   ██║${RED}██╔══██╗    ${GREEN}║'
echo -e '║  ${RED}██║  ██╗██║${BLUE}███████║${RED}██║  ██║${BLUE}╚██████╔╝${RED}██║  ██║    ${GREEN}║'
echo -e '║  ${RED}╚═╝  ╚═╝╚═╝${BLUE}╚══════╝${RED}╚═╝  ╚═╝ ${BLUE}╚═════╝ ${RED}╚═╝  ╚═╝    ${GREEN}║'
echo '║                                                          ║'
echo '╚══════════════════════════════════════════════════════════╝'
echo -e "${NC}"

echo -e "${RED}☠️☠️☠️☠️  ADVANCED HACKING THEME  ☠️☠️☠️☠️${NC}"
echo -e "${BLUE}══════════════════════════════════════════════${NC}"
echo ""

# Function to install theme
install_theme() {
    echo -e "${YELLOW}[*] Starting theme installation...${NC}"
    
    # Ask for username
    echo -e "${CYAN}[?] Enter your name for theme customization:${NC}"
    read -p ">>> " username
    
    if [ -z "$username" ]; then
        username="Hacker"
    fi
    
    echo -e "${GREEN}[+] Customizing theme for: $username${NC}"
    
    # Backup current bashrc
    if [ -f ~/.bashrc ]; then
        cp ~/.bashrc ~/.bashrc.backup
        echo -e "${GREEN}[+] Backup created: .bashrc.backup${NC}"
    fi
    
    # Create theme directory
    mkdir -p ~/.termux/theme/
    
    # Create colors.properties
    cat > ~/.termux/colors.properties <<- EOM
# Hacking Theme Colors
background=#0c0c0c
foreground=#00ff00
cursor=#ff0000
color0=#000000
color1=#ff0000
color2=#00ff00
color3=#ffff00
color4=#0000ff
color5=#ff00ff
color6=#00ffff
color7=#ffffff
color8=#808080
color9=#ff5555
color10=#55ff55
color11=#ffff55
color12=#5555ff
color13=#ff55ff
color14=#55ffff
color15=#ffffff
EOM
    
    # Create font properties
    cat > ~/.termux/font.properties <<- EOM
# Hacking Font
font=monospace
EOM
    
    # Create custom bashrc
    cat > ~/.bashrc <<- EOM
#!/data/data/com.termux/files/usr/bin/bash

# Fast load - no delay
export TMOUT=0

# Custom PS1 with username
export PS1='\[\033[1;31m\][\[\033[1;36m\]$username\[\033[1;31m\]@\[\033[1;32m\]termux\[\033[1;31m\]]\[\033[1;34m\]-\[\033[1;31m\][\[\033[1;33m\]\w\[\033[1;31m\]]\[\033[1;34m\]\\$ \[\033[0m\]'

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'
alias ..='cd ..'
alias ...='cd ../..'
alias cls='clear'
alias update='pkg update && pkg upgrade'
alias hacktheme='bash ~/.termux/theme/theme_manager.sh'

# Welcome message with hacking style
clear
echo -e "\033[1;32m"
echo '╔══════════════════════════════════════════════════════════╗'
echo '║                                                          ║'
echo -e '║  \033[1;31m██╗  ██╗██╗\033[1;34m███████╗\033[1;31m██╗  ██╗ \033[1;34m██████╗ \033[1;31m██████╗     \033[1;32m║'
echo -e '║  \033[1;31m██║ ██╔╝██║\033[1;34m██╔════╝\033[1;31m██║  ██║\033[1;34m██╔═══██╗\033[1;31m██╔══██╗    \033[1;32m║'
echo -e '║  \033[1;31m█████╔╝ ██║\033[1;34m███████╗\033[1;31m███████║\033[1;34m██║   ██║\033[1;31m██████╔╝    \033[1;32m║'
echo -e '║  \033[1;31m██╔═██╗ ██║\033[1;34m╚════██║\033[1;31m██╔══██║\033[1;34m██║   ██║\033[1;31m██╔══██╗    \033[1;32m║'
echo -e '║  \033[1;31m██║  ██╗██║\033[1;34m███████║\033[1;31m██║  ██║\033[1;34m╚██████╔╝\033[1;31m██║  ██║    \033[1;32m║'
echo -e '║  \033[1;31m╚═╝  ╚═╝╚═╝\033[1;34m╚══════╝\033[1;31m╚═╝  ╚═╝ \033[1;34m╚═════╝ \033[1;31m╚═╝  ╚═╝    \033[1;32m║'
echo '║                                                          ║'
echo '╚══════════════════════════════════════════════════════════╝'
echo -e "\033[0m"
echo -e "\033[1;31m☠️☠️☠️☠️  WELCOME $username - SYSTEM SECURED  ☠️☠️☠️☠️\033[0m"
echo -e "\033[1;34m══════════════════════════════════════════════\033[0m"
echo ""
echo -e "\033[1;36m[*] System: Termux Hacking Edition\033[0m"
echo -e "\033[1;36m[*] User: $username\033[0m"
echo -e "\033[1;36m[*] Date: \$(date)\033[0m"
echo -e "\033[1;36m[*] Type 'hacktheme' for theme options\033[0m"
echo ""
EOM
    
    # Create theme manager script
    cat > ~/.termux/theme/theme_manager.sh <<- EOM
#!/data/data/com.termux/files/usr/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

show_menu() {
    clear
    echo -e "\${GREEN}"
    echo '╔══════════════════════════════════════════════════════════╗'
    echo '║                     THEME MANAGER                        ║'
    echo '╚══════════════════════════════════════════════════════════╝'
    echo -e "\${NC}"
    echo -e "\${RED}☠️☠️☠️☠️  HACKING THEME CONTROL PANEL  ☠️☠️☠️☠️\${NC}"
    echo -e "\${BLUE}══════════════════════════════════════════════\${NC}"
    echo ""
    echo -e "\${CYAN}[1]\${NC} Change Theme Colors"
    echo -e "\${CYAN}[2]\${NC} Update Welcome Name"
    echo -e "\${CYAN}[3]\${NC} Apply Theme Now"
    echo -e "\${CYAN}[4]\${NC} Restore Default Theme"
    echo -e "\${CYAN}[5]\${NC} Uninstall Theme"
    echo -e "\${CYAN}[6]\${NC} Exit"
    echo ""
    echo -e "\${YELLOW}[?] Select option (1-6):\${NC}"
}

while true; do
    show_menu
    read choice
    
    case \$choice in
        1)
            echo -e "\${GREEN}[*] Opening color editor...\${NC}"
            sleep 1
            echo -e "\${YELLOW}Edit ~/.termux/colors.properties to change colors\${NC}"
            ;;
        2)
            echo -e "\${YELLOW}[?] Enter new name:\${NC}"
            read newname
            if [ ! -z "\$newname" ]; then
                sed -i "s/WELCOME .*/WELCOME \$newname - SYSTEM SECURED  ☠️☠️☠️☠️/" ~/.bashrc
                sed -i "s/User: .*/User: \$newname/" ~/.bashrc
                sed -i "s/\\\$username/\\\$newname/" ~/.bashrc 2>/dev/null || true
                echo -e "\${GREEN}[+] Name updated to: \$newname\${NC}"
            fi
            ;;
        3)
            termux-reload-settings
            echo -e "\${GREEN}[+] Theme applied successfully!\${NC}"
            ;;
        4)
            if [ -f ~/.bashrc.backup ]; then
                cp ~/.bashrc.backup ~/.bashrc
                echo -e "\${GREEN}[+] Default theme restored!\${NC}"
            else
                echo -e "\${RED}[!] No backup found!\${NC}"
            fi
            ;;
        5)
            echo -e "\${RED}[!] Are you sure? (y/n):\${NC}"
            read confirm
            if [ "\$confirm" = "y" ] || [ "\$confirm" = "Y" ]; then
                if [ -f ~/.bashrc.backup ]; then
                    cp ~/.bashrc.backup ~/.bashrc
                fi
                rm -rf ~/.termux/theme/
                echo -e "\${GREEN}[+] Theme uninstalled!\${NC}"
                exit 0
            fi
            ;;
        6)
            echo -e "\${GREEN}[+] Exiting...\${NC}"
            exit 0
            ;;
        *)
            echo -e "\${RED}[!] Invalid option!\${NC}"
            ;;
    esac
    
    echo ""
    echo -e "\${YELLOW}[*] Press Enter to continue...\${NC}"
    read
done
EOM
    
    # Make scripts executable
    chmod +x ~/.termux/theme/theme_manager.sh
    chmod +x ~/.bashrc
    
    # Apply theme settings
    termux-reload-settings
    
    echo -e "${GREEN}[+] Theme installation completed!${NC}"
    echo -e "${CYAN}[*] New session will show the theme immediately${NC}"
    echo -e "${YELLOW}[*] Type 'hacktheme' to manage your theme${NC}"
    echo ""
    echo -e "${RED}⚠️  Restart Termux or open new session to see full effect!${NC}"
}

# Function to uninstall theme
uninstall_theme() {
    echo -e "${RED}[!] Uninstalling theme...${NC}"
    
    if [ -f ~/.bashrc.backup ]; then
        cp ~/.bashrc.backup ~/.bashrc
        echo -e "${GREEN}[+] Original .bashrc restored${NC}"
    else
        # Create default bashrc
        cat > ~/.bashrc <<- EOM
#!/data/data/com.termux/files/usr/bin/bash
export PS1='\[\033[1;32m\]\w \[\033[1;34m\]\$ \[\033[0m\]'
EOM
    fi
    
    # Remove theme files
    rm -rf ~/.termux/theme/
    
    # Reset termux colors
    termux-reload-settings
    
    echo -e "${GREEN}[+] Theme completely uninstalled!${NC}"
    echo -e "${YELLOW}[*] Restart Termux to see changes${NC}"
}

# Main menu
show_main_menu() {
    echo -e "${CYAN}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║                  MAIN MENU OPTIONS                       ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${GREEN}[1]${NC} Install Hacking Theme"
    echo -e "${RED}[2]${NC} Uninstall Theme"
    echo -e "${BLUE}[3]${NC} Exit"
    echo ""
    echo -e "${YELLOW}[?] Select option (1-3):${NC}"
}

# Show menu
while true; do
    show_main_menu
    read -p ">>> " option
    
    case $option in
        1)
            install_theme
            break
            ;;
        2)
            uninstall_theme
            break
            ;;
        3)
            echo -e "${BLUE}[+] Exiting...${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}[!] Invalid option!${NC}"
            ;;
    esac
done

echo ""
echo -e "${BLUE}══════════════════════════════════════════════${NC}"
echo -e "${GREEN}[*] Script execution completed!${NC}"