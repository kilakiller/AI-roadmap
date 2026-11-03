#!/usr/bin/env bash
# Week 01 · Day 3 — Linux 命令行 20 -command drill
# 用法（在 WSL 里）:
#   cd ~/ai-roadmap-wsl/week01 && chmod +x cmd-drill.sh && ./cmd-drill.sh
#
# 每个命令都在 /tmp 沙盒里跑，输出先打印"你该敲什么"，再自动执行一遍。
# 你必须自己手动再敲 2 遍 —— 脚本只是示范 + 自检。

set -u
SANDBOX="/tmp/linux-drill"
rm -rf "$SANDBOX"; mkdir -p "$SANDBOX/demo"
cd "$SANDBOX/demo"
echo "hello linux" > a.txt
echo "numpy" > b.txt
mkdir -p sub && echo "nested" > sub/c.txt

hr() { printf '%s\n' "------------------------------------------------------------"; }

run() {
  local desc="$1"; shift
  hr
  echo "💡 $desc"
  echo "▶  手动敲: $*"
  echo "↩  自动执行结果:"
  "$@" 2>&1 | head -12
  echo
}

echo "============================================================"
echo " Linux 20 命令训练场  (sandbox: $SANDBOX)"
echo " 每个命令: 看示范 → 自己再敲 2 遍 → 下一条"
echo "============================================================"

run "1. ls 列目录"            ls -la
run "2. cd 切换目录"           pwd
run "3. pwd 显示当前路径"       pwd
run "4. mkdir 创建目录"         mkdir -p "$SANDBOX/newdir" && ls -d "$SANDBOX/newdir"
run "5. rm 删除(用 -r 别删错)"   rm -rf "$SANDBOX/newdir" && ls -d "$SANDBOX/newdir" 2>&1
run "6. mv 移动/改名"           mv a.txt renamed.txt && ls
run "7. cp 复制"               cp renamed.txt copy.txt && ls
run "8. cat 查看文件内容"       cat renamed.txt
run "9. less 分页查看(按 q 退出)" bash -c 'less renamed.txt 2>/dev/null || cat renamed.txt'
run "10. grep 文本搜索"         grep -rn "nested" "$SANDBOX"
run "11. find 查找文件"         find "$SANDBOX" -name "*.txt" -type f
run "12. tar 打包"             tar -czf "$SANDBOX/demo.tar.gz" -C "$SANDBOX" demo && ls -lh "$SANDBOX/demo.tar.gz"
run "13. zip 压缩"             bash -c 'cd '"$SANDBOX"' && zip -qr demo.zip demo && ls -lh demo.zip'
run "14. chmod 改权限"         bash -c 'cp '"$SANDBOX"'/demo/renamed.txt '"$SANDBOX"'/exec-demo.sh && chmod +x '"$SANDBOX"'/exec-demo.sh && ls -l '"$SANDBOX"'/exec-demo.sh'
run "15. chown 改所有者(需 sudo)" bash -c 'chown --help >/dev/null 2>&1 && echo "chown 可用(改文件属主用 sudo chown \$USER file)"'
run "16. ps 看进程"            ps aux --sort=-%cpu 2>/dev/null | head -6
run "17. top 看实时资源"        bash -c 'top -b -n 1 | head -10'
run "18. curl 请求网页"        curl -s -o /dev/null -w "http_code=%{http_code}\n" --max-time 8 https://example.com
run "19. ssh 连远程(列配置)"    bash -c 'ls -la ~/.ssh 2>/dev/null || echo "还没配 SSH key —— 今天顺手生成一个"'
run "20. vi 编辑器(最小操作)"  bash -c 'printf "hi\n" > /tmp/vi_test.txt; vim -c ":q" /tmp/vi_test.txt 2>/dev/null || echo "vim 已装: i 输入 / :q 退出"'

hr
echo "🎉 20 条跑完。现在做正事:"
echo "   1) 回到 WSL 里 cd ~/ai-roadmap-wsl"
echo "   2) 手动重复上面 20 条命令各 2 遍(真敲,别复制)"
echo "   3) git checkout -b feature/day3-drill && git add . && git commit -m 'feat(day3): linux 20 command drill'"
echo "   4) git push -u origin feature/day3-drill"
