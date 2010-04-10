require 'mkmf'
RbConfig::MAKEFILE_CONFIG['CC'] = ENV['CC'] if ENV['CC']

extension_name = 'sysuuid'
dir_config(extension_name)

$CFLAGS += ' -Werror -Wall'

create_makefile(extension_name)
