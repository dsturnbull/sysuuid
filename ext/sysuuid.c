#include "ruby.h"
#include <uuid/uuid.h>

// SysUUID prototypes
VALUE sysuuid = Qnil;
VALUE sysuuid_uuid(VALUE self);

// other protoypes
void err(const char *err);

// Init_sysuuid - initialize the extension
void
Init_sysuuid()
{
	// class definition - dummy
	sysuuid = rb_define_class("SysUUID", rb_cObject);

	// instance methods
	rb_define_method(rb_cObject, "sysuuid", sysuuid_uuid, 0);
}

// sysuuid - return a uuid string
VALUE
sysuuid_uuid(VALUE self)
{
	char uuid_str[37];
	uuid_t uuid;

	uuid_generate(uuid);
	uuid_unparse(uuid, uuid_str);

	return rb_str_new2(uuid_str);
}

