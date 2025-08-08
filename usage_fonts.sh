#!/usr/bin/env bash
set -e

[[ -z "$VIRTUAL_ENV" ]] && echo "Refusing to run outside of venv. See README.md." && exit 100

python3 -m pip install 'fonttools >= 4.41.1'

# import functions and globals
source url.sh
source helper.sh
source categories.sh

# --- execution starts here ---
mkdir -p cache/

# GoNotoCurrentRegular.ttf
create_cjk_subset
# create_duployan_subset
create_japanese_kana_subset
create_korean_hangul_subset
# create_math_subset
create_tibetan_subset
# create_go_noto_current_with_full_korean

# drop_vertical_tables NotoSansMongolian-Regular.ttf
# drop_vertical_tables NotoSansNushu-Regular.ttf
# drop_vertical_tables NotoTraditionalNushu-Bold.ttf


echo "Generating GoNotoHighUsageScriptsRegular.ttf. Current time: $(date)."
go_build GoNotoHighUsageScriptsRegular.ttf "${GoNotoHighUsageScriptsRegular[@]}"

echo "Generating GoNotoHighUsageScriptsBold.ttf. Current time: $(date)."
go_build GoNotoHighUsageScriptsBold.ttf "${GoNotoHighUsageScriptsBold[@]}"