DCONFIG := dotfiles.config
MCONFIG := config.config
SCRIPTDIR := src

LINK := linkage
INIT := init
RELOAD := reload
SETUP := setup
MKDIR_P := mkdir -p
PREF := `echo "\n[~ DOT ~] "`

TS := `/bin/date "+%Y-%m-%d_%H-%M-%S"`
BACKDIR := "backup_$(TS)"

all: install link reload

install:
	@./$(SCRIPTDIR)/$(INIT)

link:
	@echo "$(PREF)Linking dotfiles..."
	@$(MKDIR_P) $(BACKDIR)
	@./$(SCRIPTDIR)/$(LINK) $(DCONFIG) $(BACKDIR) $(MCONFIG)

reload:
	@echo "$(PREF)Installing new dotfiles..."
	@./$(SCRIPTDIR)/$(RELOAD) 2>/dev/null; true

clean:
	@echo "$(PREF)Cleaning...";
	@echo "   $(RM) -r backup_*/"; $(RM) -r backup_*/

setup:
	@echo "$(PREF)Setting up...";
	@./$(SCRIPTDIR)/$(SETUP) select `cat "default/setup.config"`
