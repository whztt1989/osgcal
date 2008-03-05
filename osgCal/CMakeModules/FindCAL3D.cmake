
# This module defines
# CAL3D_LIBRARY
# CAL3D_INCLUDE_DIR, where to find the headers
#
# $CAL3D_DIR is an environment variable that would
# correspond to the ./configure --prefix=$CAL3D_DIR


FIND_PATH(CAL3D_INCLUDE_DIR cal3d/mesh.h
	$ENV{CAL3D_DIR}/include
)

MACRO(FIND_CAL3D_LIBRARY MYLIBRARY MYLIBRARYNAME)

    FIND_LIBRARY(${MYLIBRARY} 
        NAMES ${MYLIBRARYNAME} ${MYLIBRARYNAME}d
        PATHS
	      $ENV{CAL3D_DIR}/lib
    )

ENDMACRO(FIND_CAL3D_LIBRARY LIBRARY LIBRARYNAME)

FIND_CAL3D_LIBRARY(CAL3D_LIBRARY cal3d)

SET(CAL3D_LIBRARIES ${CAL3D_LIBRARY})

SET(CAL3D_FOUND "NO")
IF(CAL3D_LIBRARY AND CAL3D_INCLUDE_DIR)
    SET(CAL3D_FOUND "YES")
	GET_FILENAME_COMPONENT(CAL3D_LIBRARY_DIR ${CAL3D_LIBRARY} PATH)
ENDIF(CAL3D_LIBRARY AND CAL3D_INCLUDE_DIR)
