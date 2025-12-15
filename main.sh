#!/data/data/com.termux/files/usr/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m'

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

# Backup original Termux colors if not already backed up
backup_original_colors() {
    if [ ! -f ~/.termux/colors_backup.properties ]; then
        if [ -f ~/.termux/colors.properties ]; then
            cp ~/.termux/colors.properties ~/.termux/colors_backup.properties
            echo -e "${GREEN}[+] Original colors backed up${NC}"
        else
            # Create default colors backup
            cat > ~/.termux/colors_backup.properties <<- EOM
# Termux Default Colors
background=#000000
foreground=#ffffff
cursor=#ffffff
color0=#000000
color1=#990000
color2=#00a600
color3=#999900
color4=#0000b2
color5=#b200b2
color6=#00a6b2
color7=#bfbfbf
color8=#666666
color9=#e50000
color10=#00d900
color11=#e5e500
color12=#0000ff
color13=#e500e5
color14=#00e5e5
color15=#e5e5e5
EOM
        fi
    fi
    
    if [ ! -f ~/.termux/font_backup.properties ]; then
        if [ -f ~/.termux/font.properties ]; then
            cp ~/.termux/font.properties ~/.termux/font_backup.properties
        else
            echo "font=monospace" > ~/.termux/font_backup.properties
        fi
    fi
}

# Function to install theme
install_theme() {
    echo -e "${YELLOW}[*] Starting theme installation...${NC}"
    
    # Backup original colors first
    backup_original_colors
    
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
    else
        # Create initial backup if no bashrc exists
        cat > ~/.bashrc.backup <<- EOM
# Original Termux bashrc
export PS1='\\[\\033[1;32m\\]\\w \\[\\033[1;34m\\]\\$ \\[\\033[0m\\]'
EOM
    fi
    
    # Create theme directory
    mkdir -p ~/.termux/theme/
    
    # Save installation info
    echo "INSTALLED=1" > ~/.termux/theme/install.info
    echo "USERNAME=$username" >> ~/.termux/theme/install.info
    echo "DATE=$(date)" >> ~/.termux/theme/install.info
    
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
export PS1='\\[\\033[1;31m\\][\\[\\033[1;36m\\]$username\\[\\033[1;31m\\]@\\[\\033[1;32m\\]termux\\[\\033[1;31m\\]]\\[\\033[1;34m\\]-\\[\\033[1;31m\\][\\[\\033[1;33m\\]\\w\\[\\033[1;31m\\]]\\[\\033[1;34m\\]\\\\\$ \\[\\033[0m\\]'

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'
alias ..='cd ..'
alias ...='cd ../..'
alias cls='clear'
alias update='pkg update && pkg upgrade'
alias hacktheme='bash ~/.termux/theme/theme_manager.sh'
alias themerestore='bash ~/.termux/theme/restore.sh'

# Welcome message with hacking style
clear
echo -e "\\033[1;32m"
echo '╔══════════════════════════════════════════════════════════╗'
echo '║                                                          ║'
echo -e '║  \\033[1;31m██╗  ██╗██╗\\033[1;34m███████╗\\033[1;31m██╗  ██╗ \\033[1;34m██████╗ \\033[1;31m██████╗     \\033[1;32m║'
echo -e '║  \\033[1;31m██║ ██╔╝██║\\033[1;34m██╔════╝\\033[1;31m██║  ██║\\033[1;34m██╔═══██╗\\033[1;31m██╔══██╗    \\033[1;32m║'
echo -e '║  \\033[1;31m█████╔╝ ██║\\033[1;34m███████╗\\033[1;31m███████║\\033[1;34m██║   ██║\\033[1;31m██████╔╝    \\033[1;32m║'
echo -e '║  \\033[1;31m██╔═██╗ ██║\\033[1;34m╚════██║\\033[1;31m██╔══██║\\033[1;34m██║   ██║\\033[1;31m██╔══██╗    \\033[1;32m║'
echo -e '║  \\033[1;31m██║  ██╗██║\\033[1;34m███████║\\033[1;31m██║  ██║\\033[1;34m╚██████╔╝\\033[1;31m██║  ██║    \\033[1;32m║'
echo -e '║  \\033[1;31m╚═╝  ╚═╝╚═╝\\033[1;34m╚══════╝\\033[1;31m╚═╝  ╚═╝ \\033[1;34m╚═════╝ \\033[1;31m╚═╝  ╚═╝    \\033[1;32m║'
echo '║                                                          ║'
echo '╚══════════════════════════════════════════════════════════╝'
echo -e "\\033[0m"
echo -e "\\033[1;31m☠️☠️☠️☠️  WELCOME $username - SYSTEM SECURED  ☠️☠️☠️☠️\\033[0m"
echo -e "\\033[1;34m══════════════════════════════════════════════\\033[0m"
echo ""
echo -e "\\033[1;36m[*] System: Termux Hacking Edition\\033[0m"
echo -e "\\033[1;36m[*] User: $username\\033[0m"
echo -e "\\033[1;36m[*] Date: \$(date)\\033[0m"
echo -e "\\033[1;36m[*] Type 'hacktheme' for theme options\\033[0m"
echo -e "\\033[1;36m[*] Type 'themerestore' to restore original theme\\033[0m"
echo ""
EOM
    
    # Create restore script
    cat > ~/.termux/theme/restore.sh <<- EOM
#!/data/data/com.termux/files/usr/bin/bash

RED='\\033[1;31m'
GREEN='\\033[1;32m'
NC='\\033[0m'

echo -e "\${RED}[!] Restoring original Termux theme...\${NC}"

# Restore original colors
if [ -f ~/.termux/colors_backup.properties ]; then
    cp ~/.termux/colors_backup.properties ~/.termux/colors.properties
    echo -e "\${GREEN}[+] Original colors restored\${NC}"
else
    echo -e "\${RED}[!] Color backup not found, using defaults\${NC}"
    # Set default Termux colors
    cat > ~/.termux/colors.properties <<- DEFAULT
# Termux Default Colors
background=#000000
foreground=#ffffff
cursor=#ffffff
color0=#000000
color1=#990000
color2=#00a600
color3=#999900
color4=#0000b2
color5=#b200b2
color6=#00a6b2
color7=#bfbfbf
color8=#666666
color9=#e50000
color10=#00d900
color11=#e5e500
color12=#0000ff
color13=#e500e5
color14=#00e5e5
color15=#e5e5e5
DEFAULT
fi

# Restore original font
if [ -f ~/.termux/font_backup.properties ]; then
    cp ~/.termux/font_backup.properties ~/.termux/font.properties
fi

# Restore original bashrc
if [ -f ~/.bashrc.backup ]; then
    cp ~/.bashrc.backup ~/.bashrc
    echo -e "\${GREEN}[+] Original bashrc restored\${NC}"
else
    # Create default bashrc
    cat > ~/.bashrc <<- DEFAULT
# Default Termux bashrc
export PS1='\\\\[\\\\033[1;32m\\\\]\\\\w \\\\[\\\\033[1;34m\\\\]\\\\\\\\\$ \\\\[\\\\033[0m\\\\]'
DEFAULT
fi

# Apply changes
termux-reload-settings

echo -e "\${GREEN}[+] Original Termux theme completely restored!\${NC}"
echo -e "\${RED}[*] Please restart Termux or open new session\${NC}"
EOM
    
    # Create theme manager script
    cat > ~/.termux/theme/theme_manager.sh <<- EOM
#!/data/data/com.termux/files/usr/bin/bash

RED='\\033[1;31m'
GREEN='\\033[1;32m'
BLUE='\\033[1;34m'
CYAN='\\033[1;36m'
YELLOW='\\033[1;33m'
NC='\\033[0m'

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
    echo -e "\${CYAN}[4]\${NC} Restore Original Termux Theme"
    echo -e "\${CYAN}[5]\${NC} Uninstall Theme Completely"
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
            echo -e "\${YELLOW}Then run option 3 to apply changes\${NC}"
            ;;
        2)
            echo -e "\${YELLOW}[?] Enter new name:\${NC}"
            read newname
            if [ ! -z "\$newname" ]; then
                sed -i "s/WELCOME .*/WELCOME \$newname - SYSTEM SECURED  ☠️☠️☠️☠️/" ~/.bashrc
                sed -i "s/User: .*/User: \$newname/" ~/.bashrc
                sed -i "s/\\\$username/\\\$newname/" ~/.bashrc 2>/dev/null || true
                echo "\$newname" > ~/.termux/theme/current_user
                echo -e "\${GREEN}[+] Name updated to: \$newname\${NC}"
            fi
            ;;
        3)
            termux-reload-settings
            echo -e "\${GREEN}[+] Theme applied successfully!\${NC}"
            ;;
        4)
            echo -e "\${RED}[!] Restoring original Termux theme...\${NC}"
            bash ~/.termux/theme/restore.sh
            echo ""
            echo -e "\${YELLOW}[*] Press Enter to exit...\${NC}"
            read
            exit 0
            ;;
        5)
            echo -e "\${RED}[!] COMPLETE UNINSTALL - Are you sure? (y/n):\${NC}"
            read confirm
            if [ "\$confirm" = "y" ] || [ "\$confirm" = "Y" ]; then
                echo -e "\${RED}[*] Uninstalling completely...\${NC}"
                
                # Restore original theme first
                bash ~/.termux/theme/restore.sh
                
                # Remove all theme files
                rm -rf ~/.termux/theme/
                rm -f ~/.termux/colors_backup.properties
                rm -f ~/.termux/font_backup.properties
                
                echo -e "\${GREEN}[+] Theme completely uninstalled!\${NC}"
                echo -e "\${YELLOW}[*] All theme files removed\${NC}"
                echo -e "\${RED}[*] Restart Termux now\${NC}"
                exit 0
            else
                echo -e "\${GREEN}[+] Uninstall cancelled\${NC}"
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
    chmod +x ~/.termux/theme/restore.sh
    chmod +x ~/.bashrc
    
    # Apply theme settings
    termux-reload-settings
    
    echo -e "${GREEN}[+] Theme installation completed!${NC}"
    echo -e "${CYAN}[*] New session will show the theme immediately${NC}"
    echo -e "${YELLOW}[*] Type 'hacktheme' to manage your theme${NC}"
    echo -e "${YELLOW}[*] Type 'themerestore' to restore original theme${NC}"
    echo ""
    echo -e "${RED}⚠️  Restart Termux or open new session to see full effect!${NC}"
}

# Function to uninstall theme completely
uninstall_theme() {
    echo -e "${RED}[!] Complete Uninstallation Process${NC}"
    echo -e "${YELLOW}[*] This will restore original Termux look${NC}"
    echo ""
    
    # First restore original theme
    if [ -f ~/.termux/theme/restore.sh ]; then
        bash ~/.termux/theme/restore.sh
    else
        # Manual restoration
        echo -e "${YELLOW}[*] Manual restoration...${NC}"
        
        # Restore colors
        if [ -f ~/.termux/colors_backup.properties ]; then
            cp ~/.termux/colors_backup.properties ~/.termux/colors.properties
            echo -e "${GREEN}[+] Colors restored${NC}"
        else
            # Set default Termux colors
            cat > ~/.termux/colors.properties <<- DEFAULT
# Termux Default Colors
background=#000000
foreground=#ffffff
cursor=#ffffff
color0=#000000
color1=#990000
color2=#00a600
color3=#999900
color4=#0000b2
color5=#b200b2
color6=#00a6b2
color7=#bfbfbf
color8=#666666
color9=#e50000
color10=#00d900
color11=#e5e500
color12=#0000ff
color13=#e500e5
color14=#00e5e5
color15=#e5e5e5
DEFAULT
        fi
        
        # Restore bashrc
        if [ -f ~/.bashrc.backup ]; then
            cp ~/.bashrc.backup ~/.bashrc
            echo -e "${GREEN}[+] bashrc restored${NC}"
        else
            cat > ~/.bashrc <<- DEFAULT
# Default Termux bashrc
export PS1='\\[\\033[1;32m\\]\\w \\[\\033[1;34m\\]\\$ \\[\\033[0m\\]'
DEFAULT
        fi
    fi
    
    # Remove theme files
    rm -rf ~/.termux/theme/ 2>/dev/null
    rm -f ~/.termux/colors_backup.properties 2>/dev/null
    rm -f ~/.termux/font_backup.properties 2>/dev/null
    
    # Apply settings
    termux-reload-settings
    
    echo ""
    echo -e "${GREEN}[✓] Theme completely uninstalled!${NC}"
    echo -e "${YELLOW}[*] Original Termux look restored${NC}"
    echo -e "${RED}[*] Please RESTART TERMUX for full effect${NC}"
}

# Quick uninstall function (if already installed)
quick_uninstall() {
    echo -e "${RED}[!] Quick Uninstall Mode${NC}"
    
    # Check if theme is installed
    if [ ! -f ~/.termux/theme/install.info ]; then
        echo -e "${YELLOW}[!] Theme not found or already uninstalled${NC}"
        return
    fi
    
    # Restore original colors
    if [ -f ~/.termux/colors_backup.properties ]; then
        cp ~/.termux/colors_backup.properties ~/.termux/colors.properties
    else
        # Reset to default colors
        rm -f ~/.termux/colors.properties
    fi
    
    # Restore original font
    if [ -f ~/.termux/font_backup.properties ]; then
        cp ~/.termux/font_backup.properties ~/.termux/font.properties
    else
        rm -f ~/.termux/font.properties
    fi
    
    # Restore bashrc
    if [ -f ~/.bashrc.backup ]; then
        cp ~/.bashrc.backup ~/.bashrc
    else
        # Default bashrc
        cat > ~/.bashrc <<- DEFAULT
export PS1='\\[\\033[1;32m\\]\\w \\[\\033[1;34m\\]\\$ \\[\\033[0m\\]'
DEFAULT
    fi
    
    # Cleanup
    rm -rf ~/.termux/theme/
    rm -f ~/.termux/colors_backup.properties
    rm -f ~/.termux/font_backup.properties
    
    termux-reload-settings
    
    echo -e "${GREEN}[+] Original Termux theme restored!${NC}"
    echo -e "${YELLOW}[*] Restart Termux to see changes${NC}"
}

# Main menu
show_main_menu() {
    echo -e "${CYAN}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║                  MAIN MENU OPTIONS                       ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${GREEN}[1]${NC} Install Hacking Theme"
    echo -e "${RED}[2]${NC} Uninstall Theme (Restore Original)"
    echo -e "${YELLOW}[3]${NC} Quick Uninstall (If Already Installed)"
    echo -e "${BLUE}[4]${NC} Exit"
    echo ""
    echo -e "${YELLOW}[?] Select option (1-4):${NC}"
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
            quick_uninstall
            break
            ;;
        4)
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
echo -e "${GREEN}[*] Process completed!${NC}"