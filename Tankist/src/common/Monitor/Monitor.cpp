﻿#define __STDC_WANT_SECURE_LIB__ 1          // warning C4668: '__STDC_WANT_SECURE_LIB__' is not defined as a preprocessor macro, replacing with '0' for '#if/

#ifdef WIN32
#pragma warning(push, 0)
#endif
#include <iostream>
#ifdef WIN32
#pragma warning(pop)
#endif


int main(int, char *[]) //-V2504
{
    setlocale(LC_ALL, "Russian");

    return 0;
}
