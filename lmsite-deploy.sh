#!/bin/env zsh
REPO_NAME="lmsite-bookmarks"
dateTime="$(date '+%Y%m%d_%H%M%S')"
echo "进入项目目录："
cd "/src/lmsite-bookmarks" || return
git pull origin master:master
git reset --hard origin/master
git stash clear
git clean  -d  -fx .
echo "已成功拉取最新代码！"

##############################################################
#########  这里编写其余逻辑,如编译/部署等操作  #############
##############################################################
# 生成静态文件
cd /src/lmsite-bookmarks

npm run build

# 部署
rm -r -f /webroot/lmsite.cn
cp -r -f /src/lmsite-bookmarks/docs/.vuepress/dist /webroot/lmsite.cn
echo "部署完成"
exit 0;

##############################################################
##############################################################

echo "ΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩ"
echo "ΩΩΩΩ      已成功部署 lmsite-bookmarks!      ΩΩΩΩ"
echo "ΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩΩ"
exit 0;
