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
IKI_DLLESPEC extern void execute_3269(char*, char *);
IKI_DLLESPEC extern void execute_3270(char*, char *);
IKI_DLLESPEC extern void execute_3271(char*, char *);
IKI_DLLESPEC extern void execute_3272(char*, char *);
IKI_DLLESPEC extern void execute_3273(char*, char *);
IKI_DLLESPEC extern void execute_3274(char*, char *);
IKI_DLLESPEC extern void execute_3275(char*, char *);
IKI_DLLESPEC extern void execute_3276(char*, char *);
IKI_DLLESPEC extern void execute_3277(char*, char *);
IKI_DLLESPEC extern void execute_3278(char*, char *);
IKI_DLLESPEC extern void execute_3279(char*, char *);
IKI_DLLESPEC extern void execute_3280(char*, char *);
IKI_DLLESPEC extern void execute_3281(char*, char *);
IKI_DLLESPEC extern void execute_3282(char*, char *);
IKI_DLLESPEC extern void execute_3283(char*, char *);
IKI_DLLESPEC extern void execute_3284(char*, char *);
IKI_DLLESPEC extern void execute_4940(char*, char *);
IKI_DLLESPEC extern void execute_4941(char*, char *);
IKI_DLLESPEC extern void execute_4942(char*, char *);
IKI_DLLESPEC extern void execute_4943(char*, char *);
IKI_DLLESPEC extern void execute_4944(char*, char *);
IKI_DLLESPEC extern void execute_4945(char*, char *);
IKI_DLLESPEC extern void execute_3267(char*, char *);
IKI_DLLESPEC extern void execute_3268(char*, char *);
IKI_DLLESPEC extern void execute_4932(char*, char *);
IKI_DLLESPEC extern void execute_4933(char*, char *);
IKI_DLLESPEC extern void execute_4934(char*, char *);
IKI_DLLESPEC extern void execute_4935(char*, char *);
IKI_DLLESPEC extern void execute_4936(char*, char *);
IKI_DLLESPEC extern void execute_4937(char*, char *);
IKI_DLLESPEC extern void execute_4938(char*, char *);
IKI_DLLESPEC extern void execute_4939(char*, char *);
IKI_DLLESPEC extern void execute_3290(char*, char *);
IKI_DLLESPEC extern void execute_3291(char*, char *);
IKI_DLLESPEC extern void execute_3295(char*, char *);
IKI_DLLESPEC extern void execute_3292(char*, char *);
IKI_DLLESPEC extern void execute_3296(char*, char *);
IKI_DLLESPEC extern void execute_3297(char*, char *);
IKI_DLLESPEC extern void execute_3423(char*, char *);
IKI_DLLESPEC extern void execute_3424(char*, char *);
IKI_DLLESPEC extern void execute_3425(char*, char *);
IKI_DLLESPEC extern void execute_3927(char*, char *);
IKI_DLLESPEC extern void execute_3928(char*, char *);
IKI_DLLESPEC extern void execute_3929(char*, char *);
IKI_DLLESPEC extern void execute_4931(char*, char *);
IKI_DLLESPEC extern void execute_3286(char*, char *);
IKI_DLLESPEC extern void execute_3287(char*, char *);
IKI_DLLESPEC extern void execute_3288(char*, char *);
IKI_DLLESPEC extern void execute_3289(char*, char *);
IKI_DLLESPEC extern void execute_4946(char*, char *);
IKI_DLLESPEC extern void execute_4947(char*, char *);
IKI_DLLESPEC extern void execute_4948(char*, char *);
IKI_DLLESPEC extern void execute_4949(char*, char *);
IKI_DLLESPEC extern void execute_4950(char*, char *);
IKI_DLLESPEC extern void execute_4951(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[56] = {(funcp)execute_3269, (funcp)execute_3270, (funcp)execute_3271, (funcp)execute_3272, (funcp)execute_3273, (funcp)execute_3274, (funcp)execute_3275, (funcp)execute_3276, (funcp)execute_3277, (funcp)execute_3278, (funcp)execute_3279, (funcp)execute_3280, (funcp)execute_3281, (funcp)execute_3282, (funcp)execute_3283, (funcp)execute_3284, (funcp)execute_4940, (funcp)execute_4941, (funcp)execute_4942, (funcp)execute_4943, (funcp)execute_4944, (funcp)execute_4945, (funcp)execute_3267, (funcp)execute_3268, (funcp)execute_4932, (funcp)execute_4933, (funcp)execute_4934, (funcp)execute_4935, (funcp)execute_4936, (funcp)execute_4937, (funcp)execute_4938, (funcp)execute_4939, (funcp)execute_3290, (funcp)execute_3291, (funcp)execute_3295, (funcp)execute_3292, (funcp)execute_3296, (funcp)execute_3297, (funcp)execute_3423, (funcp)execute_3424, (funcp)execute_3425, (funcp)execute_3927, (funcp)execute_3928, (funcp)execute_3929, (funcp)execute_4931, (funcp)execute_3286, (funcp)execute_3287, (funcp)execute_3288, (funcp)execute_3289, (funcp)execute_4946, (funcp)execute_4947, (funcp)execute_4948, (funcp)execute_4949, (funcp)execute_4950, (funcp)execute_4951, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 56;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_tt_um_ihp26a_ring_osc_behav/xsim.reloc",  (void **)funcTab, 56);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_tt_um_ihp26a_ring_osc_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_tt_um_ihp26a_ring_osc_behav/xsim.reloc");
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
    iki_set_sv_type_file_path_name("xsim.dir/tb_tt_um_ihp26a_ring_osc_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_tt_um_ihp26a_ring_osc_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_tt_um_ihp26a_ring_osc_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
