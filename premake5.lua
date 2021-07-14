-- premake5.lua
workspace "Workspace"
   configurations { "Debug", "Release" }
   platforms { "x86", "x86_64" }
   location "Build"
   cppdialect "C++17"
   --cdialect "C11"

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"
      buildoptions { 
      "-Wall",
      --"-pendantic",
      }

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
      warnings "Extra"
      buildoptions { 
      "-Wall",
      --"-Werror",
      --"-pendantic",
      }

   filter "platforms:x86"
      system "Windows"
      architecture "x86"

   filter "platforms:x86_64"
      system "Windows"
      architecture "x86_64"

project "Project1"
   kind "ConsoleApp"
   language "C++"
   location "Build/Project1"
   targetdir "bin/%{cfg.buildcfg}"

   
   --When specifying pchsource make sure to include the path to the pchsource file just like you would for your regular source files. 
   --Otherwise Visual Studio will not build the *.pch file. 
   pchsource "Code/pch.cpp"
   pchheader "pch.h"

   files { "Code/**.h", "Code/**.cpp" }

  --files { "%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp", "**.cpp" }