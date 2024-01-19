#!/bin/bash


DEBUG=0

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

:'

DEMO_STR="drwxr-xr-x root/root         0 2024-01-18 01:55 ./opt/
drwxr-xr-x root/root         0 2024-01-18 01:55 ./opt/rocm-6.1.0-13344/
drwxr-xr-x root/root         0 2024-01-18 01:55 ./opt/rocm-6.1.0-13344/.info/
-rw-r--r-- root/root        12 2024-01-18 01:55 ./opt/rocm-6.1.0-13344/.info/version-openmp-sdk"

DEMO_STR2="drwxrwxr-x root/root         0 2024-01-19 10:05 ./opt/
drwxrwxr-x root/root         0 2024-01-19 10:05 ./opt/rocm-6.1.0-13344/
drwxrwxr-x root/root         0 2024-01-19 10:05 ./opt/rocm-6.1.0-13344/.info/
-rw-r--r-- root/root        12 2024-01-19 10:05 ./opt/rocm-6.1.0-13344/.info/version-openmp-sdk"

while IFS= read -r line1 && IFS= read -r line2 <&3; do
	echo " line1 = $line1"
	echo " line2 = $line2"
	var1=`echo $line1 | awk -F ' ' '{print $6 }'`
	var2=`echo $line2 | awk -F ' ' '{print $6 }'`
	echo " var1 = $var1"
	echo " var2 = $var2"
	if [ "$var1" = "$var2" ]
	then
		echo "BOTH contentestare same ------------------------------------->"
	else
	    echo "---> DIFFERENT CONTEST ################################"
		echo " var1 = $var1 "
		echo " var2 = $var2" 
	fi
done <<< $DEMO_STR  3<<< $DEMO_STR2


DEMO_STR3="new Debian package, version 2.0.
 size 1074 bytes: control archive=693 bytes.
    2175 bytes,    11 lines      control
      74 bytes,     1 lines      md5sums
 Architecture: amd64
 Depends: hipblas (= 2.1.0.60100-crdnnh.13344~20.04), hipblaslt (= 0.7.0.60100-crdnnh.13344~20.04), hipfft (= 1.0.14.60100-crdnnh.13344~20.04), hipsolver (= 2.1.0.60100-crdnnh.13344~20.04), hipsparse (= 3.0.1.60100-crdnnh.13344~20.04), hiptensor (= 1.1.0.60100-crdnnh.13344~20.04), miopen-hip (= 3.1.0.60100-crdnnh.13344~20.04), half (= 1.12.0.60100-crdnnh.13344~20.04), rccl (= 2.18.6.60100-crdnnh.13344~20.04), rocalution (= 3.1.1.60100-crdnnh.13344~20.04), rocblas (= 4.1.0.60100-crdnnh.13344~20.04), rocfft (= 1.0.26.60100-crdnnh.13344~20.04), rocrand (= 2.10.17.60100-crdnnh.13344~20.04), hiprand (= 2.10.16.60100-crdnnh.13344~20.04), rocsolver (= 3.25.0.60100-crdnnh.13344~20.04), rocsparse (= 3.1.1.60100-crdnnh.13344~20.04), rocm-core (= 6.1.0.60100-crdnnh.13344~20.04), hipsparselt (= 0.1.0.60100-crdnnh.13344~20.04), composablekernel-dev (= 1.1.0.60100-crdnnh.13344~20.04), hipblas-dev (= 2.1.0.60100-crdnnh.13344~20.04), hipblaslt-dev (= 0.7.0.60100-crdnnh.13344~20.04), hipcub-dev (= 2.13.1.60100-crdnnh.13344~20.04), hipfft-dev (= 1.0.14.60100-crdnnh.13344~20.04), hipsolver-dev (= 2.1.0.60100-crdnnh.13344~20.04), hipsparse-dev (= 3.0.1.60100-crdnnh.13344~20.04), hiptensor-dev (= 1.1.0.60100-crdnnh.13344~20.04), miopen-hip-dev (= 3.1.0.60100-crdnnh.13344~20.04), rccl-dev (= 2.18.6.60100-crdnnh.13344~20.04), rocalution-dev (= 3.1.1.60100-crdnnh.13344~20.04), rocblas-dev (= 4.1.0.60100-crdnnh.13344~20.04), rocfft-dev (= 1.0.26.60100-crdnnh.13344~20.04), rocprim-dev (= 2.13.1.60100-crdnnh.13344~20.04), rocrand-dev (= 2.10.17.60100-crdnnh.13344~20.04), hiprand-dev (= 2.10.16.60100-crdnnh.13344~20.04), rocsolver-dev (= 3.25.0.60100-crdnnh.13344~20.04), rocsparse-dev (= 3.1.1.60100-crdnnh.13344~20.04), rocthrust-dev (= 2.18.0.60100-crdnnh.13344~20.04), rocwmma-dev (= 1.3.0.60100-crdnnh.13344~20.04), hipsparselt-dev (= 0.1.0.60100-crdnnh.13344~20.04)
 Description: Radeon Open Compute (ROCm) Runtime software stack
 Homepage: https://github.com/RadeonOpenCompute/ROCm
 Maintainer: ROCm Dev Support <rocm-dev.support@amd.com>
 Package: rocm-libs
 Priority: optional
 Section: devel
 Version: 6.1.0.60100-crdnnh.13344~20.04
 Installed-Size: 13"


DEMO_STR4="new Debian package, version 2.0.
 size 1074 bytes: control archive=694 bytes.
    2175 bytes,    11 lines      control
      74 bytes,     1 lines      md5sums
 Architecture: amd64
 Depends: hipblas (= 2.1.0.60100-crdnnh.13344~20.04), hipblaslt (= 0.7.0.60100-crdnnh.13344~20.04), hipfft (= 1.0.14.60100-crdnnh.13344~20.04), hipsolver (= 2.1.0.60100-crdnnh.13344~20.04), hipsparse (= 3.0.1.60100-crdnnh.13344~20.04), hiptensor (= 1.1.0.60100-crdnnh.13344~20.04), miopen-hip (= 3.1.0.60100-crdnnh.13344~20.04), half (= 1.12.0.60100-crdnnh.13344~20.04), rccl (= 2.18.6.60100-crdnnh.13344~20.04), rocalution (= 3.1.1.60100-crdnnh.13344~20.04), rocblas (= 4.1.0.60100-crdnnh.13344~20.04), rocfft (= 1.0.26.60100-crdnnh.13344~20.04), rocrand (= 2.10.17.60100-crdnnh.13344~20.04), hiprand (= 2.10.16.60100-crdnnh.13344~20.04), rocsolver (= 3.25.0.60100-crdnnh.13344~20.04), rocsparse (= 3.1.1.60100-crdnnh.13344~20.04), rocm-core (= 6.1.0.60100-crdnnh.13344~20.04), hipsparselt (= 0.1.0.60100-crdnnh.13344~20.04), composablekernel-dev (= 1.1.0.60100-crdnnh.13344~20.04), hipblas-dev (= 2.1.0.60100-crdnnh.13344~20.04), hipblaslt-dev (= 0.7.0.60100-crdnnh.13344~20.04), hipcub-dev (= 2.13.1.60100-crdnnh.13344~20.04), hipfft-dev (= 1.0.14.60100-crdnnh.13344~20.04), hipsolver-dev (= 2.1.0.60100-crdnnh.13344~20.04), hipsparse-dev (= 3.0.1.60100-crdnnh.13344~20.04), hiptensor-dev (= 1.1.0.60100-crdnnh.13344~20.04), miopen-hip-dev (= 3.1.0.60100-crdnnh.13344~20.04), rccl-dev (= 2.18.6.60100-crdnnh.13344~20.04), rocalution-dev (= 3.1.1.60100-crdnnh.13344~20.04), rocblas-dev (= 4.1.0.60100-crdnnh.13344~20.04), rocfft-dev (= 1.0.26.60100-crdnnh.13344~20.04), rocprim-dev (= 2.13.1.60100-crdnnh.13344~20.04), rocrand-dev (= 2.10.17.60100-crdnnh.13344~20.04), hiprand-dev (= 2.10.16.60100-crdnnh.13344~20.04), rocsolver-dev (= 3.25.0.60100-crdnnh.13344~20.04), rocsparse-dev (= 3.1.1.60100-crdnnh.13344~20.04), rocthrust-dev (= 2.18.0.60100-crdnnh.13344~20.04), rocwmma-dev (= 1.3.0.60100-crdnnh.13344~20.04), hipsparselt-dev (= 0.1.0.60100-crdnnh.13344~20.04)
 Description: Radeon Open Compute (ROCm) Runtime software stack
 Homepage: https://github.com/RadeonOpenCompute/ROCm
 Maintainer: ROCm Dev Support <rocm-dev.support@amd.com>
 Package: rocm-libs
 Priority: optional
 Section: devel
 Version: 6.1.0.60100-crdnnh.13344~20.04
 Installed-Size: 13"


counter=0

while IFS= read -r line1 && IFS= read -r line2 <&3; do
        counter=$((counter+=1))
	echo " line1 = $line1"
	echo " line2 = $line2"
	echo " counter = $counter"
	if [ "$line1" != "$line2" ]
	then
	    echo "---> DIFFERENT CONTEST ################################"
		echo " line1  = $line1 "
		echo " line2  = $line2" 
	else
		echo "BOTH contentestare same ------------------------------------->"
	fi
done <<< $DEMO_STR3  3<<< $DEMO_STR4

 '


compare_whole_output() {

  while IFS= read -r line1 && IFS= read -r line2 <&3; do
	var1=`echo $line1 | awk -F ' ' '{print $6 }'`
	var2=`echo $line2 | awk -F ' ' '{print $6 }'`
	if [ "$DEBUG" != "0" ]
	then
  		echo " line1 = $line1"
		echo " line2 = $line2"
		echo " var1 = $var1"
		echo " var2 = $var2"
	fi
	if [ "$var1" != "$var2" ]
	   then
		echo "---> DIFFERENT CONTENT ################################"
		echo " var1 = $var1 "
		echo " var2 = $var2"
		RET_VAL_STRING_COMPARE=1
		break
	fi
  done <<< "$1"  3<<< "$2"

  RET_VAL_STRING_COMPARE=0

}



compare_dependencies_output() {

  	RET_VAL_DEPENDENCY_COMPARE=0
	counter=0
	flag=0
	while IFS= read -r line1 && IFS= read -r line2 <&3; do
        	counter=$((counter+=1))
		if [ "$DEBUG" != "0" ]
		then
			echo " line1 = $line1"
			echo " line2 = $line2"
			echo " counter = $counter"
		fi
		if [[ "$line1" =~ "Architecture" ]]; then
			flag=1
		fi
		if [ "$line1" != "$line2" ]
		then
			echo " [ $line1 ]  IS NOT EQUAL TO [ $line2 ]"
			if [ "$flag" -ge "1" ]
			then
				echo "---> DEPENDENCY DO NOT MATCH #################################"
				RET_VAL_DEPENDENCY_COMPARE=1
				break
			else
				echo "string content different but its ok!!"
			fi
		fi
	done <<< "$1"  3<<< "$2"

}



COPYING_FOLDER="/home/master/sarav/meta_pkg_test/TEST_CONTENT_OF_PACKAGES/build_pks/"
ORIGNAL_FOLDER="/home/master/sarav/meta_pkg_test/TEST_CONTENT_OF_PACKAGES/orignal_pks"

echo " Checking Contents of the PACKAGES "

RET_VAL_STRING_COMPARE=0
RET_VAL_DEPENDENCY_COMPARE=0

for pkgfile in ${META_PKG_FILE_NAMES[*]};
do
        echo " Orignal file => [ $ORIGNAL_FOLDER/$pkgfile ] contents --> "
        echo " Built package file => [ $COPYING_FOLDER/$pkgfile ] contents << "
        ORG_STR=`dpkg -c $ORIGNAL_FOLDER/$pkgfile`
        BUILT_STR=`dpkg -c $COPYING_FOLDER/$pkgfile`
	RET_VAL_STRING_COMPARE=0
        compare_whole_output "$ORG_STR" "$BUILT_STR"
        if [ "$RET_VAL_STRING_COMPARE" != "0" ]
        then
           echo "---> PACKAGES CONTENTS ARE DIFFERENT ******************************************************"
           echo "First == $ORG_STR"
           echo "Second  == $BUILT_STR"
        else
           echo "BOTH PACKAGES CONTENTS ARE SAME ==========================================="
        fi
	echo
done

echo
echo " Checking Dependencies of the PACKAGES "
echo

for pkgfile in ${META_PKG_FILE_NAMES[*]};
do
        echo " Orignal package file => [ $ORIGNAL_FOLDER/$pkgfile ] Dependencies ==----> "
        echo " Built package file => [ $COPYING_FOLDER/$pkgfile ] Dependencies  << "
        ORG_STR=`dpkg -I $ORIGNAL_FOLDER/$pkgfile`
        BUILT_STR=`dpkg -I $COPYING_FOLDER/$pkgfile`
	RET_VAL_DEPENDENCY_COMPARE=0
        compare_dependencies_output "$ORG_STR" "$BUILT_STR"
        if [ "$RET_VAL_DEPENDENCY_COMPARE" != "0" ]
        then
           echo "---> PACKAGES DEPENDENCIES ARE DIFFERENT ******************************************************"
           echo "First == $ORG_STR"
           echo "Second  == $BUILT_STR"
        else
           echo "BOTH PACKAGES DEPENDENCIES ARE SAME ==========================================="
        fi
	echo
done
echo

