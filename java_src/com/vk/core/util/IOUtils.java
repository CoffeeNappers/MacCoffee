package com.vk.core.util;

import android.content.Context;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.Log;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
/* loaded from: classes2.dex */
public final class IOUtils {
    @Nullable
    public static InputStream openIn(@NonNull File file) {
        try {
            return new FileInputStream(file);
        } catch (FileNotFoundException e) {
            Log.w("vk", e.getMessage(), e);
            return null;
        }
    }

    @Nullable
    public static InputStream openIn(@NonNull Context context, @NonNull Uri uri) {
        try {
            return context.getContentResolver().openInputStream(uri);
        } catch (IOException e) {
            Log.w("vk", e.getMessage(), e);
            return null;
        }
    }

    @Nullable
    public static OutputStream openOut(@NonNull File file) {
        try {
            return new FileOutputStream(file);
        } catch (FileNotFoundException e) {
            Log.w("vk", e.getMessage(), e);
            return null;
        }
    }

    @Nullable
    public static OutputStream openOut(@NonNull Context context, @NonNull Uri uri) {
        try {
            return context.getContentResolver().openOutputStream(uri);
        } catch (IOException e) {
            Log.w("vk", e.getMessage(), e);
            return null;
        }
    }

    public static void close(@Nullable Closeable... closeables) {
        if (closeables != null) {
            for (Closeable closeable : closeables) {
                close(closeable);
            }
        }
    }

    public static void close(@Nullable Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }

    private IOUtils() {
    }
}
