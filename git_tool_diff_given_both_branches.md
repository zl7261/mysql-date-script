### way 1
  setting  with command 
```
  git config --global diff.tool bc3 
  git config --global merge.tool bc3 
  git config --global difftool.bc3.path "path of beyondcompare"
  git config --global mergetool.bc3.path "path of beyondcompare"
```
  
### way2  
  find .gitconfig file 
  default path is  C:\Users\{UserName}\.gitconfig

change file context append 
```txt
[merge]  
    tool = bc3
[mergetool "bc3"]
    path = path of beyondcompare
[diff]
    tool = bc3
[difftool "bc3"]
    path = path of beyondcompare
```
  
### how to use  
  git difftool --dir-diff --tool=bc3 BRANCH-A BRANCH-B  
