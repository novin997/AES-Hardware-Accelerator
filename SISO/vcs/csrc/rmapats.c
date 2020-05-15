#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

scalar dummyScalar;
scalar fScalarIsForced=0;
scalar fScalarIsReleased=0;
scalar fScalarHasChanged=0;
scalar fForceFromNonRoot=0;
scalar fNettypeIsForced=0;
scalar fNettypeIsReleased=0;
void  hsG_0 (struct dummyq_struct * I999, EBLK  * I1000, U  I708);
void  hsG_0 (struct dummyq_struct * I999, EBLK  * I1000, U  I708)
{
    U  I1227;
    U  I1228;
    U  I1229;
    struct futq * I1230;
    I1227 = ((U )vcs_clocks) + I708;
    I1229 = I1227 & 0xfff;
    I1000->I641 = (EBLK  *)(-1);
    I1000->I645 = I1227;
    if (I1227 < (U )vcs_clocks) {
        I1228 = ((U  *)&vcs_clocks)[1];
        sched_millenium(I999, I1000, I1228 + 1, I1227);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I708 == 1)) {
        I1000->I646 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I641 = I1000;
        peblkFutQ1Tail = I1000;
    }
    else if ((I1230 = I999->I965[I1229].I658)) {
        I1000->I646 = (struct eblk *)I1230->I657;
        I1230->I657->I641 = (RP )I1000;
        I1230->I657 = (RmaEblk  *)I1000;
    }
    else {
        sched_hsopt(I999, I1000, I1227);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
