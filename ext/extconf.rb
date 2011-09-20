require 'mkmf'
RbConfig::MAKEFILE_CONFIG['CC'] = ENV['CC'] if ENV['CC']

extension_name = 'sysuuid'
dir_config(extension_name)

if ['Linux', 'SunOS'].include?(`uname`.strip)
  have_library('uuid')
end

$CFLAGS += ' -Werror -Wall -Wno-unused-parameter'

create_makefile(extension_name)
