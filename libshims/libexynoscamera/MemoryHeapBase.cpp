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
