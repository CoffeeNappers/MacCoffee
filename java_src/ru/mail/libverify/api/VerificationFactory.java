package ru.mail.libverify.api;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Executors;
import ru.mail.libverify.gcm.GcmMessageDeliverService;
import ru.mail.libverify.gcm.GcmRegisterService;
import ru.mail.libverify.utils.AlarmReceiver;
import ru.mail.libverify.utils.LogReceiver;
/* loaded from: classes.dex */
public final class VerificationFactory {
    public static final String LIBVERIFY_RESOURCE_APPLICATION_KEY = "libverify_application_key";
    public static final String LIBVERIFY_RESOURCE_APPLICATION_NAME = "libverify_application_name";

    public static void deliverGcmMessageIntent(@NonNull Context context, String str, Bundle bundle) {
        if (!TextUtils.equals(str, ru.mail.libverify.storage.m.N()) || !hasInstallation(context)) {
            return;
        }
        GcmMessageDeliverService.a(context, str, bundle);
    }

    @NonNull
    public static String getGcmServerId() {
        return ru.mail.libverify.storage.m.N();
    }

    @NonNull
    public static VerificationApi getInstance(@NonNull Context context, @NonNull String str, @NonNull String str2, @Nullable LogReceiver logReceiver, @Nullable UncaughtExceptionListener uncaughtExceptionListener) {
        return k.a(context, str, str2, logReceiver, uncaughtExceptionListener);
    }

    @NonNull
    public static VerificationApi getInstance(@NonNull Context context, @Nullable LogReceiver logReceiver, @Nullable UncaughtExceptionListener uncaughtExceptionListener) {
        return k.a(context, logReceiver, uncaughtExceptionListener);
    }

    @NonNull
    public static String[] getRequiredPermissions() {
        return ad.h();
    }

    public static boolean hasInstallation(@NonNull Context context) {
        return ru.mail.libverify.storage.m.a(context);
    }

    public static void onAppCreated(@NonNull final Context context) {
        Executors.newCachedThreadPool().submit(new Runnable() { // from class: ru.mail.libverify.api.VerificationFactory.1
            @Override // java.lang.Runnable
            public final void run() {
                if (!VerificationFactory.hasInstallation(context)) {
                    return;
                }
                AlarmReceiver.c(context);
            }
        });
    }

    public static void refreshGcmToken(@NonNull Context context) {
        if (!hasInstallation(context)) {
            return;
        }
        GcmRegisterService.a(context);
    }

    public static void release() {
        k.a();
    }

    public static void setApiEndpoints(@NonNull Context context, @NonNull Map<String, String> map) {
        if (!hasInstallation(context)) {
            return;
        }
        k.i(context).setApiEndpoints(map);
    }

    public static void setCustomLocale(@NonNull Context context, @NonNull Locale locale) {
        if (!hasInstallation(context)) {
            return;
        }
        k.i(context).setCustomLocale(locale);
    }

    public static void setLocationUsage(@NonNull Context context, boolean z) {
        if (!hasInstallation(context)) {
            return;
        }
        k.i(context).setLocationUsage(z);
    }

    public static void signOut(@NonNull Context context, boolean z) {
        if (!hasInstallation(context)) {
            return;
        }
        k.i(context).signOut(z);
    }

    public static void softSignOut(@NonNull Context context) {
        if (!hasInstallation(context)) {
            return;
        }
        k.i(context).softSignOut();
    }
}
