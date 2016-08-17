solution "Retro"

      --------------------------------------------------------------------------

      configurations      { "Debug", "Release" }
     
      targetdir           "bin"
      debugdir            "bin"

      configuration "Debug"
        defines           { "DEBUG", "_CRT_SECURE_NO_WARNINGS", "_WINSOCK_DEPRECATED_NO_WARNINGS" }
        flags             { "Symbols" }

      configuration "Release"
        defines           { "NDEBUG", "_CRT_SECURE_NO_WARNINGS", "_WINSOCK_DEPRECATED_NO_WARNINGS" }
        flags             { "Optimize" }

      --------------------------------------------------------------------------

      project "LibRetro"
          kind            "SharedLib"
          language        "C"
          objdir          "_build"
          flags           { "FatalWarnings", "NoExceptions", "NoRTTI" }
          defines         { "RETRO_IS_LIBRARY" }
          links           { "SDL2", "SDL2main" }
          includedirs     { "ref/SDL2/include", "ref/" }
          libdirs         { "ref/SDL2/lib/x86/" }
          
          files           { "retro.c", "ref/*.c", "ref/*.h" }
          excludes        { "ref/*.c", "ref/*.h" }

      --------------------------------------------------------------------------

      project "LibGame"
          kind            "SharedLib"
          language        "C"
          objdir          "_build"
          flags           { "FatalWarnings", "NoExceptions", "NoRTTI" }
          defines         { }
          links           { "SDL2", "SDL2main", "LibRetro" }
          includedirs     { "ref/SDL2/include", "ref/" }
          libdirs         { "ref/SDL2/lib/x86/" }
          
          files           { "retro.h", "game.c" }
          excludes        { }

      --------------------------------------------------------------------------

      project "Editor"
          kind            "ConsoleApp"
          language        "C"
          objdir          "_build"
          flags           { "FatalWarnings", "NoExceptions", "NoRTTI", "WinMain" }
          defines         { }
          links           { "SDL2", "SDL2main" }
          includedirs     { "ref/SDL2/include", "ref/" }
          libdirs         { "ref/SDL2/lib/x86/" }
          
          files           { "retro.c", "retro.h", "editor/editor.c", "editor/*.c", "editor/*.h", "ref/*.c", "ref/*.h", "editor/editor_resources.rc", "editor/assets/*.png", "editor/assets/*.wav", "editor/assets/*.mod" }
          excludes        { "retro.c", "ref/*.c", "ref/*.h" }

      --------------------------------------------------------------------------

      project "Game"
          kind            "ConsoleApp"
          language        "C"
          objdir          "_build"
          flags           { "FatalWarnings", "NoExceptions", "NoRTTI", "WinMain" }
          defines         { }
          links           { "SDL2", "SDL2main" }
          includedirs     { "ref/SDL2/include", "ref/" }
          libdirs         { "ref/SDL2/lib/x86/" }
          
          files           { "retro.c", "retro.h", "*.c", "*.h", "ref/*.c", "ref/*.h", "resources.rc", "resources.rc", "assets/*.png", "assets/*.wav", "assets/*.mod" }
          excludes        { "retro.c", "ref/*.c", "ref/*.h" }

      --------------------------------------------------------------------------
