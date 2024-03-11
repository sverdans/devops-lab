#!/bin/bash

# .github/pack.sh "build/src/arrmax" "." 2
# $1 = путь до бинарника
# $2 = путь до корневой папки проекта
# $3 = номер билда

pckg_name="arrmax"
pckg_section="utils"
pckg_priority="optional"
pckg_homepage="https://github.com/sverdans/devops-lab"

bin_path=`realpath -s $1`
git_dir=$2
build_number=$3

if [ ! -f $bin_path ]; then
	echo "\"$bin_path\" not found!"
	exit 1
fi

start_dir=`pwd`
cd $git_dir
pckg_maintainers=`git log --pretty="%an %ae%n%cn %ce" | sort -u`
cd $start_dir

program_version=`$bin_path --version`
program_version=$(echo "$program_version" | awk -F': ' '{print $2}')

pckg_arch=`dpkg-architecture | grep "DEB_BUILD_ARCH="`
pckg_arch=$(echo "$pckg_arch" | awk -F'=' '{print $2}')

pckg_installed_size=$(ls -l --block-size=k "$bin_path" | awk '{print $5}')
pckg_installed_size="${pckg_installed_size//"K"}"

pckg_dir_name="${pckg_name}_${program_version}-${build_number}_${pckg_arch}"

echo "version: $program_version"
echo "arch:    $pckg_arch"

rm -rf $pckg_dir_name
mkdir $pckg_dir_name
cd $pckg_dir_name

mkdir DEBIAN usr usr/local usr/local/bin
cp $bin_path usr/local/bin

md5sums_file="DEBIAN/md5sums"
touch $md5sums_file
echo `md5sum usr/local/bin/arrmax` >> $md5sums_file

control_file="DEBIAN/control"
touch $control_file

echo "Package: $pckg_name"                         >> $control_file
echo "Version: ${program_version}-${build_number}" >> $control_file
echo "Architecture: $pckg_arch"                    >> $control_file
echo "Maintainer: $pckg_maintainers"               >> $control_file
echo "Section: $pckg_section"                      >> $control_file
echo "Priority: $pckg_priority"                    >> $control_file
echo "Installed-Size: $pckg_installed_size"        >> $control_file
echo "Homepage: $pckg_homepage"                    >> $control_file
echo "Description: $pckg_homepage"                 >> $control_file

cd .. 
dpkg-deb --build $pckg_dir_name

