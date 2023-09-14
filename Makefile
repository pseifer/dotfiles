DCONFIG := dotfiles.config
MCONFIG := config.config
SCRIPTDIR := src

LINK := linkage
INIT := init
SETUP := setup
UPDATE := update
MKDIR_P := mkdir -p
PREF := `echo; echo "[~ DOT ~] " `

TS := `/bin/date "+%Y-%m-%d_%H-%M-%S"`
BACKDIR := "backup_$(TS)"

UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
	OS := "linux"
else
	OS := "macos"
endif

# Print help.
.PHONY: all
all: help

# Initial install of dotfiles project.
.PHONY: dot-install
dot-install:
	@echo "$(PREF)Installing DOTFILES..."
	@./$(SCRIPTDIR)/$(INIT)

# (Re)linking of dotfiles.
.PHONY: dot-link
dot-link:
	@echo "$(PREF)Linking DOTFILES..."
	@$(MKDIR_P) $(BACKDIR)
	@./$(SCRIPTDIR)/$(LINK) $(DCONFIG) $(BACKDIR) $(MCONFIG)

# Update dotfiles.
.PHONY: dot-update
dot-update:
	@echo "$(PREF)Updating DOTFILES..."
	@git pull

# Update a system.
.PHONY: system-update
system-update:
	@echo "$(PREF)Updating SYSTEM..." 
	@./$(SCRIPTDIR)/$(OS)/$(UPDATE)

# Run a full update.
.PHONY: update
update: system-update dot-update dot-link
	@echo ""

# Run setup on a new system.
.PHONY: system-setup
system-setup:
	@echo "$(PREF)Setting up SYSTEM..." 
	@export SETUP_PLATFORM=$(on); ./$(SCRIPTDIR)/$(OS)/$(SETUP) $(with)

# Run a full update.
.PHONY: setup
setup: system-setup dot-install update
	@echo ""

# Delete backups.
.PHONY: clean-backups
clean-backups:
	@echo -e "$(PREF)Cleaning.\n"
	@echo "   $(RM) -r backup_*/"; $(RM) -r backup_*/

# Delete backups and local config.
.PHONY: clear-all
clear-all: clean-backups
	@rm $(DCONFIG)
	@rm $(MCONFIG)

help:
	@echo "USAGE $(OS)"
	@echo "    make install to setup a fresh system or"
	@echo "    make update to run full system/dotfile update"
	@echo ""
	@echo "or see the following subcommands:"
	@echo ""
	@echo "----------------+--------------------------------------"
	@echo "setup           | initial setup"
	@echo "update          | regular update"
	@echo "----------------+--------------------------------------"
	@echo "dot-install     | setup the dotfile manager"
	@echo "dot-link        | write/update dotfiles on system"
	@echo "dot-update      | pull remote updates to dotfiles"
	@echo "----------------+--------------------------------------"
	@echo "system-setup    | install packages (new system)"
	@echo "system-update   | update the system"
	@echo "----------------+--------------------------------------"
	@echo "clean-backups   | remove backups"
	@echo "clear-all  	   | remove local config overwrites"
	@echo "----------------+--------------------------------------"
	@echo ""
