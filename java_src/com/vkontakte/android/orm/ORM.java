package com.vkontakte.android.orm;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
/* loaded from: classes3.dex */
public final class ORM {
    static final boolean DEBUG = false;
    static final String META_DATABASE_NAME = "vk.orm.db_name";
    static final String META_PACKAGE = "vk.orm.package";
    static final String META_VERSION = "vk.orm.version";
    static final String TAG = "VK-ORM";

    public static void loadClasses(Class... classes) {
        ClassLoader.loadClasses(classes);
    }

    public static void loadClasses(Context context, String subpackageName) {
        ClassLoader.loadClasses(context, subpackageName);
    }

    public static void loadManifestClasses(Context context) {
        ClassLoader.loadClasses(context);
    }

    private ORM() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void logE(String message) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void logE(Throwable exception) {
        logE(exception.getMessage(), exception);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void logE(String message, Throwable exception) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void logD(String message) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void logI(String message) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void copy(File from, File to) {
        try {
            InputStream in = new BufferedInputStream(new FileInputStream(from));
            OutputStream out = new BufferedOutputStream(new FileOutputStream(to));
            byte[] buffer = new byte[2048];
            while (true) {
                int read = in.read(buffer);
                if (read > 0) {
                    out.write(buffer, 0, read);
                } else {
                    in.close();
                    out.close();
                    return;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /* loaded from: classes3.dex */
    static class Config {
        private static Config sInstance;
        final String mDbName;
        final int mDbVersion;
        final String mSubpackage;

        private Config(Context context) throws PackageManager.NameNotFoundException {
            ApplicationInfo info = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            this.mSubpackage = info.metaData.getString(ORM.META_PACKAGE);
            this.mDbName = info.metaData.getString(ORM.META_DATABASE_NAME, context.getPackageName() + ".db");
            this.mDbVersion = info.metaData.getInt(ORM.META_VERSION, 1);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static Config getInstance(Context context) {
            if (sInstance == null) {
                try {
                    sInstance = new Config(context);
                } catch (PackageManager.NameNotFoundException e) {
                    e.printStackTrace();
                }
            }
            return sInstance;
        }
    }
}
