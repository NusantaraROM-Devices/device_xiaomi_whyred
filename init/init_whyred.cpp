/*
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <cstdlib>
#include <fstream>
#include <string.h>
#include <sys/sysinfo.h>
#include <unistd.h>

#include <android-base/file.h>
#include <android-base/properties.h>
#include <android-base/strings.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "vendor_init.h"
#include "property_service.h"

using android::base::GetProperty;
using std::string;
using android::base::ReadFileToString;
using android::base::Trim;

string heapstartsize, heapgrowthlimit, heapsize,
       heapminfree, heapmaxfree, heaptargetutilization;

/* From Magisk@jni/magiskhide/hide_utils.c */
static const char *snet_prop_key[] = {
	"ro.boot.vbmeta.device_state",
	"ro.boot.verifiedbootstate",
	"ro.boot.flash.locked",
	"ro.boot.selinux",
	"ro.boot.veritymode",
	"ro.boot.warranty_bit",
	"ro.warranty_bit",
	"ro.debuggable",
	"ro.secure",
	"ro.build.type",
	"ro.build.tags",
	"ro.build.selinux",
	NULL
};

static const char *snet_prop_value[] = {
	"locked",
	"green",
	"1",
	"enforcing",
	"enforcing",
	"0",
	"0",
	"0",
	"1",
	"user",
	"release-keys",
	"1",
	NULL
};


void property_override(string prop, string value)
{
    auto pi = (prop_info*) __system_property_find(prop.c_str());

    if (pi != nullptr)
        __system_property_update(pi, value.c_str(), value.size());
    else
        __system_property_add(prop.c_str(), prop.size(), value.c_str(), value.size());
}

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_dual(char const system_prop[],
        char const vendor_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

static void workaround_snet_properties() {

	// Hide all sensitive props
	for (int i = 0; snet_prop_key[i]; ++i) {
		property_override(snet_prop_key[i], snet_prop_value[i]);
	}

	chmod("/sys/fs/selinux/enforce", 0640);
	chmod("/sys/fs/selinux/policy", 0440);
}

void vendor_load_properties()
{
   std::string product = GetProperty("ro.product.vendor.device", "");	
   if (product.find("whyred") != std::string::npos)
   {
  	std::string region = GetProperty("ro.boot.hwc", "");

    if (region.find("CN") != std::string::npos || region.find("Global") != std::string::npos || region.find("GLOBAL") != std::string::npos)
	{
        property_override_dual("ro.product.model", "ro.vendor.product.model", "Redmi Note 5");
        property_override_dual("ro.product.odm.model", "ro.product.system.model", "Redmi Note 5");
        property_override_dual("ro.product.vendor.model", "persist.vendor.camera.exif.model", "Redmi Note 5");
	}
	else
	{
        property_override_dual("ro.product.model", "ro.vendor.product.model", "Redmi Note 5 Pro");
        property_override_dual("ro.product.odm.model", "ro.product.system.model", "Redmi Note 5 Pro");
        property_override_dual("ro.product.vendor.model", "persist.vendor.camera.exif.model", "Redmi Note 5 Pro");
	}
  }

	// Workaround SafetyNet
    property_override_dual("ro.system.build.fingerprint", "ro.vendor.build.fingerprint", "google/coral/coral:11/RP1A.201105.002/6869500:user/release-keys");
    property_override_dual("ro.build.fingerprint", "ro.product.build.fingerprint", "google/coral/coral:11/RP1A.201105.002/6869500:user/release-keys");
    workaround_snet_properties();
}
