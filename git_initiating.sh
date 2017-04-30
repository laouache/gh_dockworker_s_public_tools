
if [ ! -f $HOME/GIT/dockworker/s_public_tools/app.tools.sh ]; then
    git clone git@gitlab.com:dockworker/s_public_tools.git $HOME/GIT/dockworker/s_public_tools/
fi
source $HOME/GIT/dockworker/s_public_tools/app.tools.sh
