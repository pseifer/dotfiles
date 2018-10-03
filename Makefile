DCONFIG := dotfiles.config
MCONFIG := config.config
SCRIPTDIR := src

LINK := linkage
INIT := init
RELOAD := reload
SETUP := setup
MKDIR_P := mkdir -p
PREF := `echo; echo [~ DOT ~] `

TS := `/bin/date "+%Y-%m-%d_%H-%M-%S"`
BACKDIR := "backup_$(TS)"

all: install link reload

install:
	@./$(SCRIPTDIR)/$(INIT)

link:
	@echo "$(PREF)Linking dotfiles..."
	@$(MKDIR_P) $(BACKDIR)
	@./$(SCRIPTDIR)/$(LINK) $(DCONFIG) $(BACKDIR) $(MCONFIG)
	@./$(SCRIPTDIR)/genbashrc

reload:
	@echo -e "$(PREF)Installing new dotfiles...\n"
	@./$(SCRIPTDIR)/$(RELOAD) 2>/dev/null; true
	@mkdir -pv ~/.config/zathura && ./$(SCRIPTDIR)/genzathurarc > ~/.config/zathura/zathurarc

clean:
	@echo -e "$(PREF)Cleaning...\n"
	@echo "   $(RM) -r backup_*/"; $(RM) -r backup_*/

clear: clean
	@rm $(DCONFIG)
	@rm $(MCONFIG)

setup:
	@export SETUP_PLATFORM=$(on); ./$(SCRIPTDIR)/$(SETUP) $(with)

help:
	@echo "---------+---------------------------------"
	@echo "make all | install + link + reload"
	@echo "---------+---------------------------------"
	@echo "install  | setup the dotfile manager"
	@echo "link     | write config to local system"
	@echo "reload   | reload the system configuration"
	@echo "---------+---------------------------------"
	@echo "clean    | remove backups"
	@echo "clear    | remove local config overwrites"
	@echo "---------+---------------------------------"
	@echo "setup    | on=<platform> with=<mode>"
	@echo "---------+---------------------------------"
	@echo ""
