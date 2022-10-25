package com.crashlytics.android.core;

import android.app.ActivityManager;
import android.os.Build;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.services.common.IdManager;
import java.util.List;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class SessionProtobufHelper {
    private static final String SIGNAL_DEFAULT = "0";
    private static final ByteString SIGNAL_DEFAULT_BYTE_STRING = ByteString.copyFromUtf8("0");
    private static final ByteString UNITY_PLATFORM_BYTE_STRING = ByteString.copyFromUtf8("Unity");

    private SessionProtobufHelper() {
    }

    public static void writeBeginSession(CodedOutputStream cos, String sessionId, String generator, long startedAtSeconds) throws Exception {
        cos.writeBytes(1, ByteString.copyFromUtf8(generator));
        cos.writeBytes(2, ByteString.copyFromUtf8(sessionId));
        cos.writeUInt64(3, startedAtSeconds);
    }

    public static void writeSessionApp(CodedOutputStream cos, String packageName, String apiKey, String versionCode, String versionName, String installUuid, int deliveryMechanism, String unityVersion) throws Exception {
        ByteString packageNameBytes = ByteString.copyFromUtf8(packageName);
        ByteString apiKeyBytes = ByteString.copyFromUtf8(apiKey);
        ByteString versionCodeBytes = ByteString.copyFromUtf8(versionCode);
        ByteString versionNameBytes = ByteString.copyFromUtf8(versionName);
        ByteString installIdBytes = ByteString.copyFromUtf8(installUuid);
        ByteString unityVersionBytes = unityVersion != null ? ByteString.copyFromUtf8(unityVersion) : null;
        cos.writeTag(7, 2);
        cos.writeRawVarint32(getSessionAppSize(packageNameBytes, apiKeyBytes, versionCodeBytes, versionNameBytes, installIdBytes, deliveryMechanism, unityVersionBytes));
        cos.writeBytes(1, packageNameBytes);
        cos.writeBytes(2, versionCodeBytes);
        cos.writeBytes(3, versionNameBytes);
        cos.writeTag(5, 2);
        cos.writeRawVarint32(getSessionAppOrgSize(apiKeyBytes));
        cos.writeBytes(1, apiKeyBytes);
        cos.writeBytes(6, installIdBytes);
        if (unityVersionBytes != null) {
            cos.writeBytes(8, UNITY_PLATFORM_BYTE_STRING);
            cos.writeBytes(9, unityVersionBytes);
        }
        cos.writeEnum(10, deliveryMechanism);
    }

    public static void writeSessionOS(CodedOutputStream cos, boolean isRooted) throws Exception {
        ByteString releaseBytes = ByteString.copyFromUtf8(Build.VERSION.RELEASE);
        ByteString codeNameBytes = ByteString.copyFromUtf8(Build.VERSION.CODENAME);
        cos.writeTag(8, 2);
        cos.writeRawVarint32(getSessionOSSize(releaseBytes, codeNameBytes, isRooted));
        cos.writeEnum(1, 3);
        cos.writeBytes(2, releaseBytes);
        cos.writeBytes(3, codeNameBytes);
        cos.writeBool(4, isRooted);
    }

    public static void writeSessionDevice(CodedOutputStream cos, String clsDeviceId, int arch, String model, int availableProcessors, long totalRam, long diskSpace, boolean isEmulator, Map<IdManager.DeviceIdentifierType, String> ids, int state, String manufacturer, String modelClass) throws Exception {
        ByteString clsDeviceIDBytes = ByteString.copyFromUtf8(clsDeviceId);
        ByteString modelBytes = stringToByteString(model);
        ByteString modelClassBytes = stringToByteString(modelClass);
        ByteString manufacturerBytes = stringToByteString(manufacturer);
        cos.writeTag(9, 2);
        cos.writeRawVarint32(getSessionDeviceSize(arch, clsDeviceIDBytes, modelBytes, availableProcessors, totalRam, diskSpace, isEmulator, ids, state, manufacturerBytes, modelClassBytes));
        cos.writeBytes(1, clsDeviceIDBytes);
        cos.writeEnum(3, arch);
        cos.writeBytes(4, modelBytes);
        cos.writeUInt32(5, availableProcessors);
        cos.writeUInt64(6, totalRam);
        cos.writeUInt64(7, diskSpace);
        cos.writeBool(10, isEmulator);
        for (Map.Entry<IdManager.DeviceIdentifierType, String> id : ids.entrySet()) {
            cos.writeTag(11, 2);
            cos.writeRawVarint32(getDeviceIdentifierSize(id.getKey(), id.getValue()));
            cos.writeEnum(1, id.getKey().protobufIndex);
            cos.writeBytes(2, ByteString.copyFromUtf8(id.getValue()));
        }
        cos.writeUInt32(12, state);
        if (manufacturerBytes != null) {
            cos.writeBytes(13, manufacturerBytes);
        }
        if (modelClassBytes != null) {
            cos.writeBytes(14, modelClassBytes);
        }
    }

    public static void writeSessionUser(CodedOutputStream cos, String id, String name, String email) throws Exception {
        if (id == null) {
            id = "";
        }
        ByteString idBytes = ByteString.copyFromUtf8(id);
        ByteString nameBytes = stringToByteString(name);
        ByteString emailBytes = stringToByteString(email);
        int size = 0 + CodedOutputStream.computeBytesSize(1, idBytes);
        if (name != null) {
            size += CodedOutputStream.computeBytesSize(2, nameBytes);
        }
        if (email != null) {
            size += CodedOutputStream.computeBytesSize(3, emailBytes);
        }
        cos.writeTag(6, 2);
        cos.writeRawVarint32(size);
        cos.writeBytes(1, idBytes);
        if (name != null) {
            cos.writeBytes(2, nameBytes);
        }
        if (email != null) {
            cos.writeBytes(3, emailBytes);
        }
    }

    public static void writeSessionEvent(CodedOutputStream cos, long eventTime, String eventType, TrimmedThrowableData exception, Thread exceptionThread, StackTraceElement[] exceptionStack, Thread[] otherThreads, List<StackTraceElement[]> otherStacks, Map<String, String> customAttributes, LogFileManager logFileManager, ActivityManager.RunningAppProcessInfo runningAppProcessInfo, int orientation, String packageName, String buildId, Float batteryLevel, int batteryVelocity, boolean proximityEnabled, long usedRamInBytes, long diskUsedInBytes) throws Exception {
        ByteString packageNameBytes = ByteString.copyFromUtf8(packageName);
        ByteString optionalBuildIdBytes = buildId == null ? null : ByteString.copyFromUtf8(buildId.replace("-", ""));
        ByteString logByteString = logFileManager.getByteStringForLog();
        if (logByteString == null) {
            Fabric.getLogger().d(CrashlyticsCore.TAG, "No log data to include with this event.");
        }
        logFileManager.clearLog();
        cos.writeTag(10, 2);
        cos.writeRawVarint32(getSessionEventSize(eventTime, eventType, exception, exceptionThread, exceptionStack, otherThreads, otherStacks, 8, customAttributes, runningAppProcessInfo, orientation, packageNameBytes, optionalBuildIdBytes, batteryLevel, batteryVelocity, proximityEnabled, usedRamInBytes, diskUsedInBytes, logByteString));
        cos.writeUInt64(1, eventTime);
        cos.writeBytes(2, ByteString.copyFromUtf8(eventType));
        writeSessionEventApp(cos, exception, exceptionThread, exceptionStack, otherThreads, otherStacks, 8, packageNameBytes, optionalBuildIdBytes, customAttributes, runningAppProcessInfo, orientation);
        writeSessionEventDevice(cos, batteryLevel, batteryVelocity, proximityEnabled, orientation, usedRamInBytes, diskUsedInBytes);
        writeSessionEventLog(cos, logByteString);
    }

    private static void writeSessionEventApp(CodedOutputStream cos, TrimmedThrowableData exception, Thread exceptionThread, StackTraceElement[] exceptionStack, Thread[] otherThreads, List<StackTraceElement[]> otherStacks, int maxChainedExceptionsDepth, ByteString packageNameBytes, ByteString optionalBuildIdBytes, Map<String, String> customAttributes, ActivityManager.RunningAppProcessInfo runningAppProcessInfo, int orientation) throws Exception {
        cos.writeTag(3, 2);
        cos.writeRawVarint32(getEventAppSize(exception, exceptionThread, exceptionStack, otherThreads, otherStacks, maxChainedExceptionsDepth, packageNameBytes, optionalBuildIdBytes, customAttributes, runningAppProcessInfo, orientation));
        writeSessionEventAppExecution(cos, exception, exceptionThread, exceptionStack, otherThreads, otherStacks, maxChainedExceptionsDepth, packageNameBytes, optionalBuildIdBytes);
        if (customAttributes != null && !customAttributes.isEmpty()) {
            writeSessionEventAppCustomAttributes(cos, customAttributes);
        }
        if (runningAppProcessInfo != null) {
            cos.writeBool(3, runningAppProcessInfo.importance != 100);
        }
        cos.writeUInt32(4, orientation);
    }

    private static void writeSessionEventAppExecution(CodedOutputStream cos, TrimmedThrowableData exception, Thread exceptionThread, StackTraceElement[] exceptionStack, Thread[] otherThreads, List<StackTraceElement[]> otherStacks, int maxChainedExceptionsDepth, ByteString packageNameBytes, ByteString optionalBuildIdBytes) throws Exception {
        cos.writeTag(1, 2);
        cos.writeRawVarint32(getEventAppExecutionSize(exception, exceptionThread, exceptionStack, otherThreads, otherStacks, maxChainedExceptionsDepth, packageNameBytes, optionalBuildIdBytes));
        writeThread(cos, exceptionThread, exceptionStack, 4, true);
        int len = otherThreads.length;
        for (int i = 0; i < len; i++) {
            Thread thread = otherThreads[i];
            writeThread(cos, thread, otherStacks.get(i), 0, false);
        }
        writeSessionEventAppExecutionException(cos, exception, 1, maxChainedExceptionsDepth, 2);
        cos.writeTag(3, 2);
        cos.writeRawVarint32(getEventAppExecutionSignalSize());
        cos.writeBytes(1, SIGNAL_DEFAULT_BYTE_STRING);
        cos.writeBytes(2, SIGNAL_DEFAULT_BYTE_STRING);
        cos.writeUInt64(3, 0L);
        cos.writeTag(4, 2);
        cos.writeRawVarint32(getBinaryImageSize(packageNameBytes, optionalBuildIdBytes));
        cos.writeUInt64(1, 0L);
        cos.writeUInt64(2, 0L);
        cos.writeBytes(3, packageNameBytes);
        if (optionalBuildIdBytes != null) {
            cos.writeBytes(4, optionalBuildIdBytes);
        }
    }

    private static void writeSessionEventAppCustomAttributes(CodedOutputStream cos, Map<String, String> customAttributes) throws Exception {
        for (Map.Entry<String, String> entry : customAttributes.entrySet()) {
            cos.writeTag(2, 2);
            cos.writeRawVarint32(getEventAppCustomAttributeSize(entry.getKey(), entry.getValue()));
            cos.writeBytes(1, ByteString.copyFromUtf8(entry.getKey()));
            String value = entry.getValue();
            if (value == null) {
                value = "";
            }
            cos.writeBytes(2, ByteString.copyFromUtf8(value));
        }
    }

    private static void writeSessionEventAppExecutionException(CodedOutputStream cos, TrimmedThrowableData exception, int chainDepth, int maxChainedExceptionsDepth, int field) throws Exception {
        StackTraceElement[] stackTraceElementArr;
        cos.writeTag(field, 2);
        cos.writeRawVarint32(getEventAppExecutionExceptionSize(exception, 1, maxChainedExceptionsDepth));
        cos.writeBytes(1, ByteString.copyFromUtf8(exception.className));
        String message = exception.localizedMessage;
        if (message != null) {
            cos.writeBytes(3, ByteString.copyFromUtf8(message));
        }
        for (StackTraceElement element : exception.stacktrace) {
            writeFrame(cos, 4, element, true);
        }
        TrimmedThrowableData cause = exception.cause;
        if (cause != null) {
            if (chainDepth < maxChainedExceptionsDepth) {
                writeSessionEventAppExecutionException(cos, cause, chainDepth + 1, maxChainedExceptionsDepth, 6);
                return;
            }
            int overflowCount = 0;
            while (cause != null) {
                cause = cause.cause;
                overflowCount++;
            }
            cos.writeUInt32(7, overflowCount);
        }
    }

    private static void writeThread(CodedOutputStream cos, Thread thread, StackTraceElement[] stackTraceElements, int importance, boolean isCrashedThread) throws Exception {
        cos.writeTag(1, 2);
        int s = getThreadSize(thread, stackTraceElements, importance, isCrashedThread);
        cos.writeRawVarint32(s);
        cos.writeBytes(1, ByteString.copyFromUtf8(thread.getName()));
        cos.writeUInt32(2, importance);
        for (StackTraceElement stackTraceElement : stackTraceElements) {
            writeFrame(cos, 3, stackTraceElement, isCrashedThread);
        }
    }

    private static void writeFrame(CodedOutputStream cos, int fieldIndex, StackTraceElement element, boolean isCrashedThread) throws Exception {
        int i = 4;
        cos.writeTag(fieldIndex, 2);
        cos.writeRawVarint32(getFrameSize(element, isCrashedThread));
        if (element.isNativeMethod()) {
            cos.writeUInt64(1, Math.max(element.getLineNumber(), 0));
        } else {
            cos.writeUInt64(1, 0L);
        }
        cos.writeBytes(2, ByteString.copyFromUtf8(element.getClassName() + "." + element.getMethodName()));
        if (element.getFileName() != null) {
            cos.writeBytes(3, ByteString.copyFromUtf8(element.getFileName()));
        }
        if (!element.isNativeMethod() && element.getLineNumber() > 0) {
            cos.writeUInt64(4, element.getLineNumber());
        }
        if (!isCrashedThread) {
            i = 0;
        }
        cos.writeUInt32(5, i);
    }

    private static void writeSessionEventDevice(CodedOutputStream cos, Float batteryLevel, int batteryVelocity, boolean proximityEnabled, int orientation, long heapAllocatedSize, long diskUsed) throws Exception {
        cos.writeTag(5, 2);
        cos.writeRawVarint32(getEventDeviceSize(batteryLevel, batteryVelocity, proximityEnabled, orientation, heapAllocatedSize, diskUsed));
        if (batteryLevel != null) {
            cos.writeFloat(1, batteryLevel.floatValue());
        }
        cos.writeSInt32(2, batteryVelocity);
        cos.writeBool(3, proximityEnabled);
        cos.writeUInt32(4, orientation);
        cos.writeUInt64(5, heapAllocatedSize);
        cos.writeUInt64(6, diskUsed);
    }

    private static void writeSessionEventLog(CodedOutputStream cos, ByteString log) throws Exception {
        if (log != null) {
            cos.writeTag(6, 2);
            cos.writeRawVarint32(getEventLogSize(log));
            cos.writeBytes(1, log);
        }
    }

    private static int getSessionAppSize(ByteString packageName, ByteString apiKey, ByteString versionCode, ByteString versionName, ByteString installUuid, int deliveryMechanism, ByteString unityVersion) {
        int size = 0 + CodedOutputStream.computeBytesSize(1, packageName);
        int orgSize = getSessionAppOrgSize(apiKey);
        int size2 = size + CodedOutputStream.computeBytesSize(2, versionCode) + CodedOutputStream.computeBytesSize(3, versionName) + CodedOutputStream.computeTagSize(5) + CodedOutputStream.computeRawVarint32Size(orgSize) + orgSize + CodedOutputStream.computeBytesSize(6, installUuid);
        if (unityVersion != null) {
            size2 = size2 + CodedOutputStream.computeBytesSize(8, UNITY_PLATFORM_BYTE_STRING) + CodedOutputStream.computeBytesSize(9, unityVersion);
        }
        return size2 + CodedOutputStream.computeEnumSize(10, deliveryMechanism);
    }

    private static int getSessionAppOrgSize(ByteString apiKey) {
        int size = 0 + CodedOutputStream.computeBytesSize(1, apiKey);
        return size;
    }

    private static int getSessionOSSize(ByteString release, ByteString codeName, boolean isRooted) {
        int size = 0 + CodedOutputStream.computeEnumSize(1, 3);
        return size + CodedOutputStream.computeBytesSize(2, release) + CodedOutputStream.computeBytesSize(3, codeName) + CodedOutputStream.computeBoolSize(4, isRooted);
    }

    private static int getDeviceIdentifierSize(IdManager.DeviceIdentifierType type, String value) {
        int size = CodedOutputStream.computeEnumSize(1, type.protobufIndex);
        return size + CodedOutputStream.computeBytesSize(2, ByteString.copyFromUtf8(value));
    }

    private static int getSessionDeviceSize(int arch, ByteString clsDeviceID, ByteString model, int availableProcessors, long totalRam, long diskSpace, boolean isEmulator, Map<IdManager.DeviceIdentifierType, String> ids, int state, ByteString manufacturer, ByteString modelClass) {
        int size = 0 + CodedOutputStream.computeBytesSize(1, clsDeviceID) + CodedOutputStream.computeEnumSize(3, arch) + (model == null ? 0 : CodedOutputStream.computeBytesSize(4, model)) + CodedOutputStream.computeUInt32Size(5, availableProcessors) + CodedOutputStream.computeUInt64Size(6, totalRam) + CodedOutputStream.computeUInt64Size(7, diskSpace) + CodedOutputStream.computeBoolSize(10, isEmulator);
        if (ids != null) {
            for (Map.Entry<IdManager.DeviceIdentifierType, String> id : ids.entrySet()) {
                int idSize = getDeviceIdentifierSize(id.getKey(), id.getValue());
                size += CodedOutputStream.computeTagSize(11) + CodedOutputStream.computeRawVarint32Size(idSize) + idSize;
            }
        }
        return size + CodedOutputStream.computeUInt32Size(12, state) + (manufacturer == null ? 0 : CodedOutputStream.computeBytesSize(13, manufacturer)) + (modelClass == null ? 0 : CodedOutputStream.computeBytesSize(14, modelClass));
    }

    private static int getBinaryImageSize(ByteString packageNameBytes, ByteString optionalBuildIdBytes) {
        int size = 0 + CodedOutputStream.computeUInt64Size(1, 0L) + CodedOutputStream.computeUInt64Size(2, 0L) + CodedOutputStream.computeBytesSize(3, packageNameBytes);
        if (optionalBuildIdBytes != null) {
            return size + CodedOutputStream.computeBytesSize(4, optionalBuildIdBytes);
        }
        return size;
    }

    private static int getSessionEventSize(long eventTime, String eventType, TrimmedThrowableData exception, Thread exceptionThread, StackTraceElement[] exceptionStack, Thread[] otherThreads, List<StackTraceElement[]> otherStacks, int maxChainedExceptionsDepth, Map<String, String> customAttributes, ActivityManager.RunningAppProcessInfo runningAppProcessInfo, int orientation, ByteString packageNameBytes, ByteString optionalBuildIdBytes, Float batteryLevel, int batteryVelocity, boolean proximityEnabled, long heapAllocatedSize, long diskUsed, ByteString log) {
        int size = 0 + CodedOutputStream.computeUInt64Size(1, eventTime);
        int eventAppSize = getEventAppSize(exception, exceptionThread, exceptionStack, otherThreads, otherStacks, maxChainedExceptionsDepth, packageNameBytes, optionalBuildIdBytes, customAttributes, runningAppProcessInfo, orientation);
        int eventDeviceSize = getEventDeviceSize(batteryLevel, batteryVelocity, proximityEnabled, orientation, heapAllocatedSize, diskUsed);
        int size2 = size + CodedOutputStream.computeBytesSize(2, ByteString.copyFromUtf8(eventType)) + CodedOutputStream.computeTagSize(3) + CodedOutputStream.computeRawVarint32Size(eventAppSize) + eventAppSize + CodedOutputStream.computeTagSize(5) + CodedOutputStream.computeRawVarint32Size(eventDeviceSize) + eventDeviceSize;
        if (log != null) {
            int logSize = getEventLogSize(log);
            return size2 + CodedOutputStream.computeTagSize(6) + CodedOutputStream.computeRawVarint32Size(logSize) + logSize;
        }
        return size2;
    }

    private static int getEventAppSize(TrimmedThrowableData exception, Thread exceptionThread, StackTraceElement[] exceptionStack, Thread[] otherThreads, List<StackTraceElement[]> otherStacks, int maxChainedExceptionsDepth, ByteString packageNameBytes, ByteString optionalBuildIdBytes, Map<String, String> customAttributes, ActivityManager.RunningAppProcessInfo runningAppProcessInfo, int orientation) {
        int executionSize = getEventAppExecutionSize(exception, exceptionThread, exceptionStack, otherThreads, otherStacks, maxChainedExceptionsDepth, packageNameBytes, optionalBuildIdBytes);
        int size = 0 + CodedOutputStream.computeTagSize(1) + CodedOutputStream.computeRawVarint32Size(executionSize) + executionSize;
        if (customAttributes != null) {
            for (Map.Entry<String, String> entry : customAttributes.entrySet()) {
                int entrySize = getEventAppCustomAttributeSize(entry.getKey(), entry.getValue());
                size += CodedOutputStream.computeTagSize(2) + CodedOutputStream.computeRawVarint32Size(entrySize) + entrySize;
            }
        }
        if (runningAppProcessInfo != null) {
            size += CodedOutputStream.computeBoolSize(3, runningAppProcessInfo.importance != 100);
        }
        return size + CodedOutputStream.computeUInt32Size(4, orientation);
    }

    private static int getEventAppExecutionSize(TrimmedThrowableData exception, Thread exceptionThread, StackTraceElement[] exceptionStack, Thread[] otherThreads, List<StackTraceElement[]> otherStacks, int maxChainedExceptionDepth, ByteString packageNameBytes, ByteString optionalBuildIdBytes) {
        int threadSize = getThreadSize(exceptionThread, exceptionStack, 4, true);
        int size = 0 + CodedOutputStream.computeTagSize(1) + CodedOutputStream.computeRawVarint32Size(threadSize) + threadSize;
        int len = otherThreads.length;
        for (int i = 0; i < len; i++) {
            Thread thread = otherThreads[i];
            int threadSize2 = getThreadSize(thread, otherStacks.get(i), 0, false);
            size += CodedOutputStream.computeTagSize(1) + CodedOutputStream.computeRawVarint32Size(threadSize2) + threadSize2;
        }
        int exceptionSize = getEventAppExecutionExceptionSize(exception, 1, maxChainedExceptionDepth);
        int signalSize = getEventAppExecutionSignalSize();
        int binaryImageSize = getBinaryImageSize(packageNameBytes, optionalBuildIdBytes);
        return size + CodedOutputStream.computeTagSize(2) + CodedOutputStream.computeRawVarint32Size(exceptionSize) + exceptionSize + CodedOutputStream.computeTagSize(3) + CodedOutputStream.computeRawVarint32Size(signalSize) + signalSize + CodedOutputStream.computeTagSize(3) + CodedOutputStream.computeRawVarint32Size(binaryImageSize) + binaryImageSize;
    }

    private static int getEventAppCustomAttributeSize(String key, String value) {
        int size = CodedOutputStream.computeBytesSize(1, ByteString.copyFromUtf8(key));
        if (value == null) {
            value = "";
        }
        return size + CodedOutputStream.computeBytesSize(2, ByteString.copyFromUtf8(value));
    }

    private static int getEventDeviceSize(Float batteryLevel, int batteryVelocity, boolean proximityEnabled, int orientation, long heapAllocatedSize, long diskUsed) {
        int size = 0;
        if (batteryLevel != null) {
            size = 0 + CodedOutputStream.computeFloatSize(1, batteryLevel.floatValue());
        }
        return size + CodedOutputStream.computeSInt32Size(2, batteryVelocity) + CodedOutputStream.computeBoolSize(3, proximityEnabled) + CodedOutputStream.computeUInt32Size(4, orientation) + CodedOutputStream.computeUInt64Size(5, heapAllocatedSize) + CodedOutputStream.computeUInt64Size(6, diskUsed);
    }

    private static int getEventLogSize(ByteString log) {
        return CodedOutputStream.computeBytesSize(1, log);
    }

    private static int getEventAppExecutionExceptionSize(TrimmedThrowableData ex, int chainDepth, int maxChainedExceptionsDepth) {
        StackTraceElement[] stackTraceElementArr;
        int size = 0 + CodedOutputStream.computeBytesSize(1, ByteString.copyFromUtf8(ex.className));
        String message = ex.localizedMessage;
        if (message != null) {
            size += CodedOutputStream.computeBytesSize(3, ByteString.copyFromUtf8(message));
        }
        for (StackTraceElement element : ex.stacktrace) {
            int frameSize = getFrameSize(element, true);
            size += CodedOutputStream.computeTagSize(4) + CodedOutputStream.computeRawVarint32Size(frameSize) + frameSize;
        }
        TrimmedThrowableData cause = ex.cause;
        if (cause != null) {
            if (chainDepth < maxChainedExceptionsDepth) {
                int exceptionSize = getEventAppExecutionExceptionSize(cause, chainDepth + 1, maxChainedExceptionsDepth);
                return size + CodedOutputStream.computeTagSize(6) + CodedOutputStream.computeRawVarint32Size(exceptionSize) + exceptionSize;
            }
            int overflowCount = 0;
            while (cause != null) {
                cause = cause.cause;
                overflowCount++;
            }
            return size + CodedOutputStream.computeUInt32Size(7, overflowCount);
        }
        return size;
    }

    private static int getEventAppExecutionSignalSize() {
        int size = 0 + CodedOutputStream.computeBytesSize(1, SIGNAL_DEFAULT_BYTE_STRING);
        return size + CodedOutputStream.computeBytesSize(2, SIGNAL_DEFAULT_BYTE_STRING) + CodedOutputStream.computeUInt64Size(3, 0L);
    }

    private static int getFrameSize(StackTraceElement element, boolean isCrashedThread) {
        int i = 2;
        int size = (element.isNativeMethod() ? 0 + CodedOutputStream.computeUInt64Size(1, Math.max(element.getLineNumber(), 0)) : 0 + CodedOutputStream.computeUInt64Size(1, 0L)) + CodedOutputStream.computeBytesSize(2, ByteString.copyFromUtf8(element.getClassName() + "." + element.getMethodName()));
        if (element.getFileName() != null) {
            size += CodedOutputStream.computeBytesSize(3, ByteString.copyFromUtf8(element.getFileName()));
        }
        if (!element.isNativeMethod() && element.getLineNumber() > 0) {
            size += CodedOutputStream.computeUInt64Size(4, element.getLineNumber());
        }
        if (!isCrashedThread) {
            i = 0;
        }
        return size + CodedOutputStream.computeUInt32Size(5, i);
    }

    private static int getThreadSize(Thread thread, StackTraceElement[] stackTraceElements, int importance, boolean isCrashedThread) {
        int size = CodedOutputStream.computeBytesSize(1, ByteString.copyFromUtf8(thread.getName()));
        int size2 = size + CodedOutputStream.computeUInt32Size(2, importance);
        for (StackTraceElement stackTraceElement : stackTraceElements) {
            int frameSize = getFrameSize(stackTraceElement, isCrashedThread);
            size2 += CodedOutputStream.computeTagSize(3) + CodedOutputStream.computeRawVarint32Size(frameSize) + frameSize;
        }
        return size2;
    }

    private static ByteString stringToByteString(String s) {
        if (s == null) {
            return null;
        }
        return ByteString.copyFromUtf8(s);
    }
}
