package com.vk.core.util;

import android.content.Context;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.Log;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
/* loaded from: classes2.dex */
public final class CopyUtils {

    /* loaded from: classes2.dex */
    public interface CopyListener {
        void onComplete();

        void onError();

        void onStart();
    }

    public static boolean copy(@NonNull Context context, @NonNull Uri from, @NonNull Uri to, @Nullable CopyListener listener) {
        return copy(context, from, IOUtils.openOut(context, to), listener);
    }

    public static boolean copy(@NonNull Context context, @NonNull Uri from, @NonNull File to, @Nullable CopyListener listener) {
        return copy(context, from, IOUtils.openOut(to), listener);
    }

    public static boolean copy(@NonNull Context context, @NonNull Uri from, @Nullable OutputStream out, @Nullable CopyListener listener) {
        return copyInternal(IOUtils.openIn(context, from), out, listener);
    }

    public static boolean copy(@NonNull File from, @NonNull File to, @Nullable CopyListener listener) {
        return copyInternal(IOUtils.openIn(from), IOUtils.openOut(to), listener);
    }

    private static boolean copyInternal(@Nullable InputStream in, @Nullable OutputStream out, @Nullable CopyListener listener) {
        if (in != null) {
            if (out != null) {
                return copy(in, out, listener);
            }
            if (listener == null) {
                return false;
            }
            listener.onError();
            return false;
        } else if (listener == null) {
            return false;
        } else {
            listener.onError();
            return false;
        }
    }

    private static boolean copy(@NonNull InputStream in, @NonNull OutputStream out, @Nullable CopyListener listener) {
        if (listener != null) {
            listener.onStart();
        }
        try {
            try {
                byte[] buf = new byte[8192];
                while (true) {
                    int read = in.read(buf);
                    if (read <= 0) {
                        break;
                    }
                    out.write(buf, 0, read);
                }
                if (listener != null) {
                    listener.onComplete();
                }
                IOUtils.close(in, out);
                return true;
            } catch (IOException e) {
                Log.w("vk", e.getMessage(), e);
                if (listener != null) {
                    listener.onError();
                }
                IOUtils.close(in, out);
                return false;
            }
        } catch (Throwable th) {
            IOUtils.close(in, out);
            throw th;
        }
    }

    private CopyUtils() {
    }
}
