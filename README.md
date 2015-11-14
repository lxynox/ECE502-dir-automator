# This an windows command line based simple auto folder-creation tool
> planned functionalities:
  - right folder structure for ECE502 homework
  - user option to DIY folder, file(text, image, audio) etc
  - zip all the folders (all the containing homework files)
  - more interactive functionalities to increase its usability

## App directory structure simplified introduction
```
  - mac-bash: mac version created for mac osx PC users
  
  - windows-cmd: windows version created for windows PC Users
    - creator.bat
        the laucnher of the program user first time accessed from here
    - modifier.bat
        call this command when user choose to modify the config file the on cmd
    - zipper.bat
        call this command when user choose to zip this homework for submission
```

## Expected homework output directory layout
```
  - ECE502_HWGENERATOR
    - homework_version
      - assignment_1
        - problem_1
        - problem_2
        .......

      - assignment_2
      - assignment_3
      ......
```


