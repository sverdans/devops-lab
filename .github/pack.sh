bin_path="/home/sverdans/Documents/cpp/devops/arrmax-1.0.0/build/bin/arrmax"
debian_const_path="/home/sverdans/Documents/cpp/devops/arrmax-1.0.0/.github/debian-const.json"
git_dir="/home/sverdans/Documents/cpp/devops/arrmax-1.0.0/"

start_dir=`pwd`
cd $git_dir
pckg_maintainers=`git log --pretty="%an %ae%n%cn %ce" | sort -u`
cd $start_dir

program_version=`$bin_path --version`
program_version=$(echo "$program_version" | awk -F': ' '{print $2}')

build_arch=`dpkg-architecture | grep "DEB_BUILD_ARCH="`
build_arch=$(echo "$build_arch" | awk -F'=' '{print $2}')

build_number=1

pckg_name=$(jq -r     '.Package'  $debian_const_path)
pckg_section=$(jq -r  '.Section'  $debian_const_path)
pckg_priority=$(jq -r '.Priority' $debian_const_path)
pckg_homepage=$(jq -r '.Homepage' $debian_const_path)

pckg_installed_size=$(ls -l --block-size=k "$bin_path" | awk '{print $5}')
pckg_installed_size="${pckg_installed_size//"K"}"

pckg_dir_name="${pckg_name}_${program_version}-${build_number}_${build_arch}"

echo "version: $program_version"
echo "arch:    $build_arch"
echo "Installed-Size: $pckg_installed_size"

echo $pckg_dir_name

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
echo "Architecture: $build_arch"                   >> $control_file
echo "Maintainer: $pckg_maintainers"               >> $control_file
echo "Section: $pckg_section"                      >> $control_file
echo "Priority: $pckg_priority"                    >> $control_file
echo "Installed-Size: $pckg_installed_size"        >> $control_file
echo "Homepage: $pckg_homepage"                    >> $control_file
echo "Description: $pckg_homepage"                 >> $control_file

cd .. 
dpkg-deb --build $pckg_dir_name
