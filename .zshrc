# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/leandro/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

#plugins=(zsh_codex)
#bindkey '^X' create_completion

# Shutdown
alias bn="sudo shutdown -h now"
alias e="exit"
alias ss="gnome-screenshot -a"

# Traj Encoding Survey
alias trajEncoding="source ~/repos/traj-encoding-survey/bin/activate"

# Model Free RL
alias mfrl="source ~/repos/model-free-rl/mfrl/bin/activate"

#ROS2 enviroment
alias noetic="source /opt/ros/noetic/setup.zsh"
alias iiwa="source ~/repos/kuka/iiwa_ros/devel/setup.zsh"
alias panda="export ROS_MASTER_URI=http://172.16.0.1:11311;
             export ROS_IP=172.16.0.33;
             export ROS_HOSTNAME=172.16.0.33"
alias teri="source ~/repos/teri_ws/devel*/setup.zsh" 
#alias panda="source /home/leandro/repos/franka/franka_ros_TUD/devel/setup.zsh;"

# Unibo
alias bernadette='ssh -i ~/.ssh/leandro_rsa leandro@bernadette.arces.unibo.it'
alias amy='ssh -i ~/.ssh/leandro_rsa leandro@amy.arces.unibo.it'
alias xai="source ~/repos/XAI/xai-venv/bin/activate"
source $ZSH/oh-my-zsh.sh      
                            
PATH=$PATH:/home/leandro/.local/bin:/home/leandro/libraries/install/bini:/opt/vim/bin

export PATH="/home/leandro/Desktop/platformtools:$PATH"
