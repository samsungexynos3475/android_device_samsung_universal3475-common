/*
 * Copyright (C) 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * MemoryHeapBase constructor shim
 * Old Lollipop blob calls: MemoryHeapBase(int, unsigned int, unsigned int, unsigned int)
 * Mangled: _ZN7android14MemoryHeapBaseC1Eijjj
 * 
 * Android 10 has:  MemoryHeapBase(int fd, size_t size, uint32_t flags, off_t offset)
 * On 32-bit ARM, off_t is long, so mangled: _ZN7android14MemoryHeapBaseC1Eijjl
 */

extern "C" void _ZN7android14MemoryHeapBaseC1Eijjl(void*, int, unsigned int, unsigned int, long);

extern "C" void _ZN7android14MemoryHeapBaseC1Eijjj(
        void* thiz,
        int fd, unsigned int size, unsigned int flags, unsigned int offset)
{
    _ZN7android14MemoryHeapBaseC1Eijjl(thiz, fd, size, flags, static_cast<long>(offset));
}

extern "C" void _ZN7android14MemoryHeapBaseC2Eijjl(void*, int, unsigned int, unsigned int, long);

extern "C" void _ZN7android14MemoryHeapBaseC2Eijjj(
        void* thiz,
        int fd, unsigned int size, unsigned int flags, unsigned int offset)
{
    _ZN7android14MemoryHeapBaseC2Eijjl(thiz, fd, size, flags, static_cast<long>(offset));
}

/*
 * Android 12 missing constructor shims for legacy camera blobs
 * _ZN7android14MemoryHeapBaseC1Ejj (size, flags) -> proxy to _ZN7android14MemoryHeapBaseC1EjjPKc
 * _ZN7android14MemoryHeapBaseC1Eij (fd, size) -> proxy to _ZN7android14MemoryHeapBaseC1Eijjl
 */

extern "C" void _ZN7android14MemoryHeapBaseC1EjjPKc(void* thiz, unsigned int size, unsigned int flags, const char* name);
extern "C" void _ZN7android14MemoryHeapBaseC1Ejj(void* thiz, unsigned int size, unsigned int flags) {
    _ZN7android14MemoryHeapBaseC1EjjPKc(thiz, size, flags, nullptr);
}

extern "C" void _ZN7android14MemoryHeapBaseC2EjjPKc(void* thiz, unsigned int size, unsigned int flags, const char* name);
extern "C" void _ZN7android14MemoryHeapBaseC2Ejj(void* thiz, unsigned int size, unsigned int flags) {
    _ZN7android14MemoryHeapBaseC2EjjPKc(thiz, size, flags, nullptr);
}

extern "C" void _ZN7android14MemoryHeapBaseC1Eij(void* thiz, int fd, unsigned int size) {
    _ZN7android14MemoryHeapBaseC1Eijjl(thiz, fd, size, 0, 0);
}

extern "C" void _ZN7android14MemoryHeapBaseC2Eij(void* thiz, int fd, unsigned int size) {
    _ZN7android14MemoryHeapBaseC2Eijjl(thiz, fd, size, 0, 0);
}
