package = "lustre"
version = "dev-2"
source = {
   url = "git://github.com/FreeMasen/lustre",
   tag = "dev-2"
}
description = {
   homepage = "https://github.com/FreeMaseen/lustre",
   license = "MIT"
}
dependencies = {
   "lua >= 5.3",
   "sha1 >= 0.6.0",
   "base64 >= 1.5",
   "luncheon = 0",
}
build = {
   type = "builtin",
   modules = {
      ["lustre"] = "lustre/init.lua",
      ["lustre.frame"] = "lustre/frame/init.lua",
      ["lustre.frame.frame_header"] = "lustre/frame/frame_header.lua",
      ["lustre.frame.opcode"] = "lustre/fame/opcode.lua",
      ["lustre.frame.code_code"] = "lustre/frame/close_code.lua",
   }
}