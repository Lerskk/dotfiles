{ pkgs }:

pkgs.mkShell {
  name = "cpp-dev";

  nativeBuildInputs = [
    pkgs.cmake
    pkgs.pkg-config
    pkgs.clang-tools
  ];

  buildInputs = with pkgs; [
    gcc
    gdb
    valgrind

    # Graphics / windowing
    glfw
    wayland
    libxkbcommon
    xorg.libXcursor

    # Vulkan toolchain
    shaderc
    vulkan-headers
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools           # vulkaninfo
    vulkan-tools-lunarg    # vkconfig

    glsl_analyzer

    # Math lib
    glm
  ];

  C_INCLUDE_PATH = "${pkgs.glibc.dev}/include";
  VULKAN_SDK = "${pkgs.vulkan-headers}";
  VK_LAYER_PATH = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";

  shellHook = ''
    # Launch fish automatically, but exit the subshell after leaving
    if [ -n "$PS1" ]; then
      exec fish
    fi
  '';
}
