cmake_minimum_required(VERSION 3.14)

project(Notler VERSION 0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Core Quick REQUIRED)

set(PROJECT_HEADERS
    src/objects/note.h
    src/objects/notebook.h
    src/models/notebookmodel.h
)

set(PROJECT_SOURCES
    src/main.cpp
    qml/qml.qrc
    src/objects/note.cpp
    src/objects/notebook.cpp
    src/models/notebookmodel.cpp
)

qt_add_executable(${PROJECT_NAME} MANUAL_FINALIZATION ${PROJECT_SOURCES} ${PROJECT_HEADERS})

target_compile_definitions(${PROJECT_NAME}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Core Qt6::Quick)

qt_import_qml_plugins(${PROJECT_NAME})
qt_finalize_executable(${PROJECT_NAME})
