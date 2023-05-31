.NOTPARALLEL, .SILENT:

# Project constants
global_project_name = BaseGalleryProject
global_project_bundle_id = com.webant.baseapp

old_bundle_id = $(global_project_bundle_id)
new_bundle_id = com.webant.baseapp

old_name = $(global_project_name)
new_name = BaseApp

old_name_lower = $(shell echo $(old_name) | tr '[:upper:]' '[:lower:]')
new_name_lower = $(shell echo $(new_name) | tr '[:upper:]' '[:lower:]')

is_ci = false

team_confidencial_path = fastlane/team-confidential/team_confidential.yml

project:
	git submodule init
	git submodule update
	git submodule foreach 'git reset --hard && git checkout master && git pull --ff-only'
	xcodegen
	pod install --repo-update
	test -f $(team_confidencial_path) && if [ $(is_ci) == false ]; then fastlane sync; fi && echo "\033[0;32m$$SUCCESS_BANNER" && exit 0 || echo "\033[0;31m$$ERROR_BANNER" && exit 1
	if [ $(is_ci) == false ]; then open $(global_project_name).xcworkspace; fi

utils:
	 if [ $(is_ci) == true ]; then \
	 ./build-scripts/utilities/install_utilities.sh --ci; \
	 else \
	 ./build-scripts/utilities/install_utilities.sh; \
	 fi


define SUCCESS_BANNER
       
           .--.                  Проект не засрать
 ::\`--._,'.::.`._.--'/::           постарайся.
 ::::.  ` __::__ '  .::::    Техлид благословляет тебя.
 ::::::-:.`'..`'.:-::::::
 ::::::::\ `--' /::::::::              - Cheeezcake
       
endef
export SUCCESS_BANNER

define ERROR_BANNER
       
           .--.               team_confidential.yml забыл ты
 ::\`--._,'.::.`._.--'/::         положить в /fastlane/,
 ::::.  ` __::__ '  .::::             дурень.
 ::::::-:.`'..`'.:-::::::
 ::::::::\ `--' /::::::::              - Cheeezcake
       
endef
export ERROR_BANNER

RESET=tput sgr0
GREEN=tput setaf 2
RED=tput setaf 1
