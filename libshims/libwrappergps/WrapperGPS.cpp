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

extern "C" {

void* wrapperOpenClient_RILD() {
    return (void*)1;
}

int wrapperConnect_RILD(void*) {
    return 0;
}

int wrapperisConnected_RILD(void*) {
    return 1;
}

int wrapperCloseClient_RILD(void*) {
    return 0;
}

int wrapperDisconnect_RILD(void*) {
    return 0;
}

int wrapperInvokeOemRequestHookRaw(void*, int, void*, int) {
    return -1;
}

int wrapperSendInvokeOemRequestHookRaw() {
    return -1;
}

void wrapperRegisterRequestCompleteHandler() {
}

void wrapperRegisterUnsolicitedHandler() {
}

void wrapperRegisterErrorCallback() {
}

}
