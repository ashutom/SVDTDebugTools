set -x
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

for pkgfile in ${META_PKG_FILE_NAMES[*]};
do
	#echo $pkgfile
	filepath=`find . -name $pkgfile` 
	echo "Removing $filepath... "
	rm $filepath
done

