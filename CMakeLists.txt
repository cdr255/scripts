cmake_minimum_required (VERSION 3.0)
project (cdr255-script-suite NONE)
SET(CMAKE_INSTALL_PREFIX "/usr")
install (PROGRAMS "bash/ripalbum" "bash/mpdburn" "bash/ec" "bash/ep" "bash/et" DESTINATION bin)
