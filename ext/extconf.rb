require 'mkmf'
RbConfig::MAKEFILE_CONFIG['CC'] = ENV['CC'] if ENV['CC']

extension_name = 'sysuuid'
dir_config(extension_name)

if `uname`.strip == 'Linux'
    have_library('uuid')
end

$CFLAGS += ' -Werror -Wall'

create_makefile(extension_name)
