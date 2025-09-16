#!/bin/bash

# 修复Jekyll主题中Unicode字符编码问题的脚本
# 这个脚本会自动替换导致SCSS编译失败的Unicode字符

echo "🔧 正在修复Jekyll主题中的编码问题..."

# 检查是否存在vendor目录
if [ ! -d "vendor/bundle/ruby" ]; then
    echo "❌ 未找到vendor目录，请先运行 'bundle install'"
    exit 1
fi

# 查找所有包含em dash的SCSS文件并修复
find vendor/bundle/ruby -name "*.scss" -type f -exec grep -l "—" {} \; | while read file; do
    echo "🔍 修复文件: $file"
    # 替换em dash为普通连字符
    sed -i 's/—/-/g' "$file"
done

# 查找所有包含其他Unicode字符的SCSS文件
find vendor/bundle/ruby -name "*.scss" -type f -exec grep -l "[\x80-\xFF]" {} \; | while read file; do
    echo "🔍 检查文件中的Unicode字符: $file"
    # 替换常见的Unicode标点符号
    sed -i 's/"/"/g' "$file"  # 替换左双引号
    sed -i 's/"/"/g' "$file"  # 替换右双引号
    sed -i 's/'/'/g' "$file"  # 替换左单引号
    sed -i 's/'/'/g' "$file"  # 替换右单引号
    sed -i 's/…/.../g' "$file"  # 替换省略号
    sed -i 's/–/-/g' "$file"  # 替换en dash
done

echo "✅ 编码问题修复完成！"
echo "💡 提示：每次运行 'bundle install' 后都需要重新运行此脚本"
