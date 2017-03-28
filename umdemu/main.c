#include <pspsdk.h>
#include <pspkernel.h>

#include "umdman.h"
#include "umd9660.h"
#include "mediaman.h"

PSP_MODULE_INFO("pspUmdEmu_Driver", 0x1007, 1, 0);

int module_start(SceSize args, void *argp)
{
	int res;
	
	res = InitUmdMan();
	if (res < 0)
		return res;

	res = InitUmd9660();
	if (res < 0)
		return res;

	res = InitMediaMan();
	if (res < 0)
		return res;

	return 0;
}

