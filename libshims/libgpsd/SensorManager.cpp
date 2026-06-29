#include <sensor/SensorManager.h>
#include <utils/String8.h>
#include <utils/String16.h>
#include <utils/StrongPointer.h>
#include <sensor/SensorEventQueue.h>

namespace android {

// Export the old symbol that gpsd looks for:
// android::SensorManager::createEventQueue(android::String8, int)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
extern "C" sp<SensorEventQueue> _ZN7android13SensorManager16createEventQueueENS_7String8Ei(
        SensorManager* manager, String8 packageName, int mode) {
    // Call the new Android 12 version which has a 3rd argument (attributionTag)
    return manager->createEventQueue(packageName, mode, String16(""));
}

} // namespace android
