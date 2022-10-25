package android.support.v4.provider;

import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.support.annotation.RequiresApi;
import android.text.TextUtils;
import android.util.Log;
@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.dex */
class DocumentsContractApi19 {
    private static final int FLAG_VIRTUAL_DOCUMENT = 512;
    private static final String TAG = "DocumentFile";

    DocumentsContractApi19() {
    }

    public static boolean isDocumentUri(Context context, Uri self) {
        return DocumentsContract.isDocumentUri(context, self);
    }

    public static boolean isVirtual(Context context, Uri self) {
        return isDocumentUri(context, self) && (getFlags(context, self) & 512) != 0;
    }

    public static String getName(Context context, Uri self) {
        return queryForString(context, self, "_display_name", null);
    }

    private static String getRawType(Context context, Uri self) {
        return queryForString(context, self, "mime_type", null);
    }

    public static String getType(Context context, Uri self) {
        String rawType = getRawType(context, self);
        if ("vnd.android.document/directory".equals(rawType)) {
            return null;
        }
        return rawType;
    }

    public static long getFlags(Context context, Uri self) {
        return queryForLong(context, self, "flags", 0L);
    }

    public static boolean isDirectory(Context context, Uri self) {
        return "vnd.android.document/directory".equals(getRawType(context, self));
    }

    public static boolean isFile(Context context, Uri self) {
        String type = getRawType(context, self);
        return !"vnd.android.document/directory".equals(type) && !TextUtils.isEmpty(type);
    }

    public static long lastModified(Context context, Uri self) {
        return queryForLong(context, self, "last_modified", 0L);
    }

    public static long length(Context context, Uri self) {
        return queryForLong(context, self, "_size", 0L);
    }

    public static boolean canRead(Context context, Uri self) {
        return context.checkCallingOrSelfUriPermission(self, 1) == 0 && !TextUtils.isEmpty(getRawType(context, self));
    }

    public static boolean canWrite(Context context, Uri self) {
        if (context.checkCallingOrSelfUriPermission(self, 2) != 0) {
            return false;
        }
        String type = getRawType(context, self);
        int flags = queryForInt(context, self, "flags", 0);
        if (TextUtils.isEmpty(type)) {
            return false;
        }
        if ((flags & 4) != 0) {
            return true;
        }
        if ("vnd.android.document/directory".equals(type) && (flags & 8) != 0) {
            return true;
        }
        return !TextUtils.isEmpty(type) && (flags & 2) != 0;
    }

    public static boolean delete(Context context, Uri self) {
        return DocumentsContract.deleteDocument(context.getContentResolver(), self);
    }

    public static boolean exists(Context context, Uri self) {
        ContentResolver resolver = context.getContentResolver();
        Cursor c = null;
        try {
            try {
                c = resolver.query(self, new String[]{"document_id"}, null, null, null);
                boolean z = c.getCount() > 0;
                closeQuietly(c);
                return z;
            } catch (Exception e) {
                Log.w(TAG, "Failed query: " + e);
                closeQuietly(c);
                return false;
            }
        } catch (Throwable th) {
            closeQuietly(c);
            throw th;
        }
    }

    private static String queryForString(Context context, Uri self, String column, String defaultValue) {
        ContentResolver resolver = context.getContentResolver();
        Cursor c = null;
        try {
            c = resolver.query(self, new String[]{column}, null, null, null);
            if (c.moveToFirst() && !c.isNull(0)) {
                defaultValue = c.getString(0);
            }
        } catch (Exception e) {
            Log.w(TAG, "Failed query: " + e);
        } finally {
            closeQuietly(c);
        }
        return defaultValue;
    }

    private static int queryForInt(Context context, Uri self, String column, int defaultValue) {
        return (int) queryForLong(context, self, column, defaultValue);
    }

    private static long queryForLong(Context context, Uri self, String column, long defaultValue) {
        ContentResolver resolver = context.getContentResolver();
        Cursor c = null;
        try {
            c = resolver.query(self, new String[]{column}, null, null, null);
            if (c.moveToFirst() && !c.isNull(0)) {
                defaultValue = c.getLong(0);
            }
        } catch (Exception e) {
            Log.w(TAG, "Failed query: " + e);
        } finally {
            closeQuietly(c);
        }
        return defaultValue;
    }

    private static void closeQuietly(AutoCloseable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (RuntimeException rethrown) {
                throw rethrown;
            } catch (Exception e) {
            }
        }
    }
}
