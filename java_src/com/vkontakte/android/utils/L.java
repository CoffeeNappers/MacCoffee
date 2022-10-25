package com.vkontakte.android.utils;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.logging.Logcat;
import com.vk.core.util.FileUtils;
import com.vkontakte.android.BuildConfig;
/* loaded from: classes.dex */
public class L {
    private static final LogReceiver DEFAULT_LOG_RECEIVER = new LogReceiver() { // from class: com.vkontakte.android.utils.L.1
        @Override // com.vkontakte.android.utils.L.LogReceiver
        public void log(@NonNull LogType type, @Nullable String tag, @Nullable String msg) {
            switch (AnonymousClass2.$SwitchMap$com$vkontakte$android$utils$L$LogType[type.ordinal()]) {
                case 1:
                    Log.v(tag, msg);
                    return;
                case 2:
                    Log.d(tag, msg);
                    return;
                case 3:
                    Log.i(tag, msg);
                    return;
                case 4:
                    Log.w(tag, msg);
                    return;
                case 5:
                    Log.e(tag, msg);
                    return;
                default:
                    return;
            }
        }

        @Override // com.vkontakte.android.utils.L.LogReceiver
        public void log(@NonNull LogType type, @Nullable String tag, @Nullable String msg, @Nullable Throwable tr) {
            switch (AnonymousClass2.$SwitchMap$com$vkontakte$android$utils$L$LogType[type.ordinal()]) {
                case 1:
                    Log.v(tag, msg, tr);
                    return;
                case 2:
                    Log.d(tag, msg, tr);
                    return;
                case 3:
                    Log.i(tag, msg, tr);
                    return;
                case 4:
                    Log.w(tag, msg, tr);
                    return;
                case 5:
                    Log.e(tag, msg, tr);
                    return;
                default:
                    return;
            }
        }
    };
    @NonNull
    private static LogReceiver logReceiver = DEFAULT_LOG_RECEIVER;
    private static L sInstance;
    private Callback callback;
    private Logcat logcat;

    /* loaded from: classes.dex */
    public interface Callback {
        boolean isLogEnable();

        void onCapture(String str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public interface LogReceiver {
        void log(@NonNull LogType logType, @Nullable String str, @Nullable String str2);

        void log(@NonNull LogType logType, @Nullable String str, @Nullable String str2, @Nullable Throwable th);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public enum LogType {
        v,
        d,
        i,
        w,
        e
    }

    /* renamed from: com.vkontakte.android.utils.L$2  reason: invalid class name */
    /* loaded from: classes3.dex */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$vkontakte$android$utils$L$LogType = new int[LogType.values().length];

        static {
            try {
                $SwitchMap$com$vkontakte$android$utils$L$LogType[LogType.v.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$vkontakte$android$utils$L$LogType[LogType.d.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$vkontakte$android$utils$L$LogType[LogType.i.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$vkontakte$android$utils$L$LogType[LogType.w.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$vkontakte$android$utils$L$LogType[LogType.e.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    public static L getInstance() {
        if (sInstance == null) {
            sInstance = new L();
        }
        return sInstance;
    }

    public void init(Callback callback) {
        this.callback = callback;
        captureStop();
    }

    public void clear() {
        FileUtils.deleteFile(com.vkontakte.android.Log.getLogDir());
    }

    public static void v(@Nullable Throwable e, @NonNull Object... o) {
        log(LogType.v, e, o);
    }

    public static void v(@NonNull Object... o) {
        log(LogType.v, o);
    }

    public static void d(@Nullable Throwable e, @NonNull Object... o) {
        log(LogType.d, e, o);
    }

    public static void d(@NonNull Object... o) {
        log(LogType.d, o);
    }

    public static void i(@Nullable Throwable e, @NonNull Object... o) {
        log(LogType.i, e, o);
    }

    public static void i(@NonNull Object... o) {
        log(LogType.i, o);
    }

    public static void w(@Nullable Throwable e, @NonNull Object... o) {
        log(LogType.w, e, o);
    }

    public static void w(@NonNull Object... o) {
        log(LogType.w, o);
    }

    public static void e(@Nullable Throwable e, @NonNull Object... o) {
        log(LogType.e, e, o);
    }

    public static void e(@NonNull Object... o) {
        log(LogType.e, o);
    }

    private static void log(@NonNull LogType logType, @Nullable Throwable e, @NonNull Object... o) {
        if (isLogEnable()) {
            StringBuilder builder = new StringBuilder();
            for (Object object : o) {
                builder.append(object).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            }
            log(logType, builder.toString(), e);
        }
    }

    public void captureStart() {
        this.logcat = new Logcat(com.vkontakte.android.Log.getLogPath());
        this.logcat.start();
    }

    public void captureStop() {
        String path;
        if (this.logcat == null) {
            this.logcat = new Logcat(com.vkontakte.android.Log.getLogPath());
        }
        if (this.logcat.stop() && this.callback != null && (path = this.logcat.getDocumentUri()) != null) {
            this.callback.onCapture(path);
        }
    }

    private static void log(@NonNull LogType logType, @NonNull Object... o) {
        log(logType, (Throwable) null, o);
    }

    private static void log(@NonNull LogType logType, @Nullable String message, @Nullable Throwable e) {
        String className;
        if (isLogEnable()) {
            StackTraceElement element = trace();
            StringBuilder builder = new StringBuilder();
            if (element != null) {
                builder.append(element.getMethodName()).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(element.getLineNumber()).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(message);
                className = element.getClassName();
            } else {
                className = L.class.getName();
            }
            String tag = className.startsWith(BuildConfig.APPLICATION_ID) ? className.substring(BuildConfig.APPLICATION_ID.length()) : className;
            String msg = builder.toString();
            if (e == null) {
                logReceiver.log(logType, tag, msg);
            } else {
                logReceiver.log(logType, tag, msg, e);
            }
        }
    }

    @Nullable
    private static StackTraceElement trace() {
        StackTraceElement[] e = Thread.currentThread().getStackTrace();
        boolean found = false;
        for (StackTraceElement s : e) {
            if (s.getClassName().equals(L.class.getName())) {
                found = true;
            }
            if (found && !s.getClassName().equals(L.class.getName())) {
                return s;
            }
        }
        return null;
    }

    private static boolean isLogEnable() {
        return getInstance().callback != null && getInstance().callback.isLogEnable();
    }
}
