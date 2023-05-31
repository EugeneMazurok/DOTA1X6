# Описание

Репозиторий хранит файл конфигураций, необходимых для работы Fastlane. Рекомендуется к интеграции во все проекты IOS и Flutter. 

**Перед передачей проекта с подключенным (этим) подмодулем третьей стороне обязательно очистить содержимое папки подмодуля. Это строго конфиденциальный репозиторий.**

## Обновление подмодуля в проекте

Если что-то "прям беда не получается", можно перейти в папку подмодуля и сделать стандартный пулл, однако более верным является следующий вариант:

```git pull --recurse-submodules``` - для непосредственного обновления подмодулей  
```git config --global submodule.recurse true``` - для включения рекурсивного обновления по дефолту 

## Интеграция в проект

Для начала необходимо добавить сам подмодуль:  
```git submodule add git@gitlab.webant.ru:ios/teamconfidential-ios.git fastlane/team-confidential```  

Затем указать ветку для отслеживания:  
```git config -f .gitmodules submodule.fastlane/team-confidential.branch master```  

И, наконец, обновить (именно обновить, а не добавить еще один!) путь к файлу конфигов в fastlane/Matchfile:  
```team_confidential = OpenStruct.new(YAML.load(open("#{Dir.pwd}/fastlane/team-confidential/team_confidential.yml")))```  
