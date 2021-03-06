INCLUDE(FindPackageHandleStandardArgs)

FIND_PATH(
	LIBDC1394_V1_INCLUDE_DIR
	libdc1394/dc1394_control.h
	$ENV{HOME}/include
	/usr/local/include
	/usr/include
)

FIND_PATH(
	LIBDC1394_V2_INCLUDE_DIR
	dc1394/dc1394.h
	$ENV{HOME}/include
	/usr/local/include
	/usr/include
)

FIND_LIBRARY(
	LIBDC1394_V1_LIBRARY
	NAMES
	dc1394_control
	PATHS
	$ENV{HOME}/lib
	/usr/local/lib
	/usr/lib
)

FIND_LIBRARY(
	LIBDC1394_V2_LIBRARY
	NAMES
	dc1394
	PATHS
	$ENV{HOME}/lib
	/usr/local/lib
	/usr/lib
)

IF(LIBDC1394_V1_INCLUDE_DIR AND LIBDC1394_V1_LIBRARY)
	SET(LIBDC1394_DEFINITIONS -DLIBDC1394_VERSION_MAJOR=10)
	SET(LIBDC1394_INCLUDE_DIRS ${LIBDC1394_V1_INCLUDE_DIR})
	SET(LIBDC1394_LIBRARIES ${LIBDC1394_V1_LIBRARY})
ENDIF(LIBDC1394_V1_INCLUDE_DIR AND LIBDC1394_V1_LIBRARY)

IF(LIBDC1394_V2_INCLUDE_DIR AND LIBDC1394_V2_LIBRARY)
	SET(LIBDC1394_DEFINITIONS -DLIBDC1394_VERSION_MAJOR=20)
	SET(LIBDC1394_INCLUDE_DIRS ${LIBDC1394_V2_INCLUDE_DIR})
	SET(LIBDC1394_LIBRARIES ${LIBDC1394_V2_LIBRARY})
ENDIF(LIBDC1394_V2_INCLUDE_DIR AND LIBDC1394_V2_LIBRARY)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(
	libdc1394
	DEFAULT_MSG
	LIBDC1394_INCLUDE_DIRS
	LIBDC1394_LIBRARIES
)

MARK_AS_ADVANCED(
	LIBDC1394_DEFINITIONS
	LIBDC1394_INCLUDE_DIRS
	LIBDC1394_LIBRARIES
	LIBDC1394_V1_INCLUDE_DIR
	LIBDC1394_V1_LIBRARY
	LIBDC1394_V2_INCLUDE_DIR
	LIBDC1394_V2_LIBRARY
) 
