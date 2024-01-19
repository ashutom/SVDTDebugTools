META_PKG_FILE_NAMES=(
rocm_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-dev_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-developer-tools_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-dkms_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-hip-libraries_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-hip-runtime_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-hip-runtime-dev_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-hip-sdk_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-language-runtime_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-libs_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-ml-libraries_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-ml-sdk_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-opencl-runtime_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-opencl-sdk_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-openmp-sdk_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
rocm-utils_6.1.0.60100-crdnnh.13344~20.04_amd64.deb
)

COPYING_FOLDER="/home/master/sarav/meta_pkg_test/TEST_CONTENT_OF_PACKAGES/build_pks/"
ORIGNAL_FOLDER="/home/master/sarav/meta_pkg_test/TEST_CONTENT_OF_PACKAGES/orignal_pks"


for pkgfile in ${META_PKG_FILE_NAMES[*]};
do
	#echo $pkgfile
	filepath=`find . -name $pkgfile`
        if [ -z "$filepath" ]
        then
           echo " FATAL ---> [ $pkgfile ] is not built "
           echo
        else
           echo "$filepath"
           while IFS= read -r line ; do
                 echo " copying $line to the folder [ $COPYING_FOLDER ] "
                 cp -v $line $COPYING_FOLDER
           done <<< "$filepath"
           #list2=$'$filepath'
           #echo " [ -> $pkgfile <- ] is found here ->>>> $list2"
           #echo
        fi
        echo
        echo
done

for pkgfile in ${META_PKG_FILE_NAMES[*]};
do
        echo " Orignal package [ $pkgfile ]  contents --> "
        echo " File -> $ORIGNAL_FOLDER/$pkgfile "
	dpkg -c $ORIGNAL_FOLDER/$pkgfile
        echo " Built package [$pkgfile] contents << "
        echo " File -> $COPYING_FOLDER/$pkgfile "
	dpkg -c $COPYING_FOLDER/$pkgfile
        echo
done

