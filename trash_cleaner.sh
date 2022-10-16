#!/bin/bash

trash_dirs=/home/*/trash/   # 一般ユーザのゴミ箱へのパス
# trash_day=3
trash_min=5     # ゴミ箱に保存する時間(分)

# 全ユーザのゴミ箱を巡回
for trash_dir in ${trash_dirs}
do
    # ディレクトリへの移動を試みる
    cd ${trash_dir} || continue

    # 消去
    # find ./ -daystart -ctime +${trash_day} | grep -E '^\./[^/]+$' | xargs rm -rf
    find ./ -cmin +${trash_min} | grep -E '^\./[^/]+$' | xargs rm -rf
done
exit 0