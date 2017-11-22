#ifndef CRYPTOLIGHT_H
#define CRYPTOLIGHT_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

void cryptolight_hash(const char* input, char* output, uint32_t len);
void cryptolight_fast_hash(const char* input, char* output, uint32_t len);

#ifdef __cplusplus
}
#endif

#endif
