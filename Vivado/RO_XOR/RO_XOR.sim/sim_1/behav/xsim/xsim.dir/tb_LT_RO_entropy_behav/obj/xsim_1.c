/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_3970(char*, char *);
IKI_DLLESPEC extern void execute_3971(char*, char *);
IKI_DLLESPEC extern void execute_3972(char*, char *);
IKI_DLLESPEC extern void execute_3973(char*, char *);
IKI_DLLESPEC extern void execute_3974(char*, char *);
IKI_DLLESPEC extern void execute_3975(char*, char *);
IKI_DLLESPEC extern void execute_5977(char*, char *);
IKI_DLLESPEC extern void execute_5978(char*, char *);
IKI_DLLESPEC extern void execute_5979(char*, char *);
IKI_DLLESPEC extern void execute_5980(char*, char *);
IKI_DLLESPEC extern void execute_5981(char*, char *);
IKI_DLLESPEC extern void execute_5974(char*, char *);
IKI_DLLESPEC extern void execute_5975(char*, char *);
IKI_DLLESPEC extern void execute_5976(char*, char *);
IKI_DLLESPEC extern void execute_3981(char*, char *);
IKI_DLLESPEC extern void execute_3982(char*, char *);
IKI_DLLESPEC extern void execute_4110(char*, char *);
IKI_DLLESPEC extern void execute_3983(char*, char *);
IKI_DLLESPEC extern void execute_4111(char*, char *);
IKI_DLLESPEC extern void execute_4112(char*, char *);
IKI_DLLESPEC extern void execute_4364(char*, char *);
IKI_DLLESPEC extern void execute_4365(char*, char *);
IKI_DLLESPEC extern void execute_4366(char*, char *);
IKI_DLLESPEC extern void execute_4888(char*, char *);
IKI_DLLESPEC extern void execute_4889(char*, char *);
IKI_DLLESPEC extern void execute_4890(char*, char *);
IKI_DLLESPEC extern void execute_5972(char*, char *);
IKI_DLLESPEC extern void execute_3969(char*, char *);
IKI_DLLESPEC extern void execute_5973(char*, char *);
IKI_DLLESPEC extern void execute_3977(char*, char *);
IKI_DLLESPEC extern void execute_3978(char*, char *);
IKI_DLLESPEC extern void execute_3979(char*, char *);
IKI_DLLESPEC extern void execute_3980(char*, char *);
IKI_DLLESPEC extern void execute_5982(char*, char *);
IKI_DLLESPEC extern void execute_5983(char*, char *);
IKI_DLLESPEC extern void execute_5984(char*, char *);
IKI_DLLESPEC extern void execute_5985(char*, char *);
IKI_DLLESPEC extern void execute_5986(char*, char *);
IKI_DLLESPEC extern void execute_5987(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[40] = {(funcp)execute_3970, (funcp)execute_3971, (funcp)execute_3972, (funcp)execute_3973, (funcp)execute_3974, (funcp)execute_3975, (funcp)execute_5977, (funcp)execute_5978, (funcp)execute_5979, (funcp)execute_5980, (funcp)execute_5981, (funcp)execute_5974, (funcp)execute_5975, (funcp)execute_5976, (funcp)execute_3981, (funcp)execute_3982, (funcp)execute_4110, (funcp)execute_3983, (funcp)execute_4111, (funcp)execute_4112, (funcp)execute_4364, (funcp)execute_4365, (funcp)execute_4366, (funcp)execute_4888, (funcp)execute_4889, (funcp)execute_4890, (funcp)execute_5972, (funcp)execute_3969, (funcp)execute_5973, (funcp)execute_3977, (funcp)execute_3978, (funcp)execute_3979, (funcp)execute_3980, (funcp)execute_5982, (funcp)execute_5983, (funcp)execute_5984, (funcp)execute_5985, (funcp)execute_5986, (funcp)execute_5987, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 40;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_LT_RO_entropy_behav/xsim.reloc",  (void **)funcTab, 40);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_LT_RO_entropy_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_LT_RO_entropy_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_xsimdir_location_if_remapped(argc, argv)  ;
    iki_set_sv_type_file_path_name("xsim.dir/tb_LT_RO_entropy_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_LT_RO_entropy_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_LT_RO_entropy_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
