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
	@mkdir -pv ~/.config/zathura && ./$(SCRIPTDIR)/genzathurarc > ~/.config/zathura/zathurarc
	@./$(SCRIPTDIR)/genbashrc

reload:
	@echo -e "$(PREF)Installing new dotfiles...\n"
	@./$(SCRIPTDIR)/$(RELOAD) 2>/dev/null; true

clean:
	@echo -e "$(PREF)Cleaning...\n"
	@echo "   $(RM) -r backup_*/"; $(RM) -r backup_*/

clear: clean
	@rm $(DCONFIG)
	@rm $(MCONFIG)

setup:
	@echo -e "$(PREF)Setting up...\n"
	@./$(SCRIPTDIR)/$(SETUP) select `cat "default/setup.config"`
