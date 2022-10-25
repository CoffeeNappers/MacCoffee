package com.vkontakte.android.upload;

import android.annotation.TargetApi;
import android.content.ContentUris;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;
import android.provider.MediaStore;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.webkit.MimeTypeMap;
import com.facebook.common.util.UriUtil;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.core.util.CopyUtils;
import com.vk.core.util.FileUtils;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.Log;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.UserNotification;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes3.dex */
public class UploadUtils {
    public static final String UNKNOWN = "unknown";
    private static Handler handler = new Handler(Looper.getMainLooper());
    private static Resolver resolver = createPathResolver();

    /* loaded from: classes3.dex */
    public interface Resolver {
        @NonNull
        String resolveName(@NonNull Uri uri);

        @NonNull
        String resolvePath(@NonNull Uri uri);
    }

    @NonNull
    private static Resolver createPathResolver() {
        return Build.VERSION.SDK_INT >= 19 ? new KitKatPathResolver() : new BasePathResolver();
    }

    /* loaded from: classes3.dex */
    public static class CopiesListener {
        public void onStart() {
        }

        public void onComplete(@NonNull ArrayList<Uri> newUris) {
        }

        public void onError(@Nullable Exception e) {
        }
    }

    @NonNull
    public static String resolvePath(Uri uri) {
        return resolver.resolvePath(uri);
    }

    @NonNull
    public static String resolveName(Uri uri) {
        return resolver.resolveName(uri);
    }

    @Nullable
    public static String resolveExtension(@NonNull Uri uri) {
        return MimeTypeMap.getSingleton().getExtensionFromMimeType(VKApplication.context.getContentResolver().getType(uri));
    }

    public static void doCopyFromRestrictedProviderAsync(@NonNull ArrayList<Uri> uris, @NonNull CopiesListener copiesListener, @NonNull Context ctx) {
        copiesListener.onStart();
        new Thread(UploadUtils$$Lambda$1.lambdaFactory$(uris, ctx, copiesListener)).start();
    }

    public static /* synthetic */ void lambda$doCopyFromRestrictedProviderAsync$2(@NonNull ArrayList uris, @NonNull Context ctx, @NonNull CopiesListener copiesListener) {
        ArrayList<Uri> newUris = new ArrayList<>();
        try {
            Iterator it = uris.iterator();
            while (it.hasNext()) {
                Uri uri = (Uri) it.next();
                File file = createTempFile(uri);
                if ((file.exists() && !file.delete()) || !file.createNewFile()) {
                    throw new RuntimeException("Cannot create temp file");
                }
                if (CopyUtils.copy(ctx, uri, file, (CopyUtils.CopyListener) null)) {
                    newUris.add(Uri.parse("file://" + file.getAbsolutePath()));
                }
            }
            handler.post(UploadUtils$$Lambda$2.lambdaFactory$(copiesListener, newUris));
        } catch (Exception e) {
            Log.w("vk", "Error copying files from a restricted provider", e);
            handler.post(UploadUtils$$Lambda$3.lambdaFactory$(copiesListener, e));
        }
    }

    @NonNull
    private static File createTempFile(@NonNull Uri uri) {
        String fileName = resolveName(uri);
        if ("unknown".equals(fileName)) {
            return FileUtils.getTempUploadFile(resolveExtension(uri));
        }
        String[] parts = fileName.split("\\.");
        String ext = parts[1];
        if (ext == null || ext.length() == 0) {
            ext = resolveExtension(uri);
        }
        return FileUtils.getTempUploadFile(parts[0], ext);
    }

    /* loaded from: classes3.dex */
    public static class BasePathResolver implements Resolver {
        private BasePathResolver() {
        }

        @NonNull
        static String getColumnValue(@NonNull Uri uri, @NonNull String column, @Nullable String selection, @Nullable String[] selectionArgs) {
            Cursor cursor = null;
            try {
                try {
                    cursor = VKApplication.context.getContentResolver().query(uri, new String[]{column}, selection, selectionArgs, null);
                } catch (Exception e) {
                    Log.w("vk", e.getMessage(), e);
                    if (cursor != null) {
                        cursor.close();
                    }
                }
                if (cursor != null && cursor.moveToFirst()) {
                    String string = cursor.getString(cursor.getColumnIndexOrThrow(column));
                }
                if (cursor != null) {
                    cursor.close();
                }
                return "unknown";
            } finally {
                if (cursor != null) {
                    cursor.close();
                }
            }
        }

        @Override // com.vkontakte.android.upload.UploadUtils.Resolver
        @NonNull
        public String resolvePath(@NonNull Uri uri) {
            if (UriUtil.LOCAL_CONTENT_SCHEME.equalsIgnoreCase(uri.getScheme())) {
                return getColumnValue(uri, "_data", null, null);
            }
            if (UriUtil.LOCAL_FILE_SCHEME.equalsIgnoreCase(uri.getScheme())) {
                return uri.getPath();
            }
            return "unknown";
        }

        @Override // com.vkontakte.android.upload.UploadUtils.Resolver
        @NonNull
        public final String resolveName(@NonNull Uri uri) {
            String scheme = uri.getScheme();
            if (UriUtil.LOCAL_FILE_SCHEME.equalsIgnoreCase(scheme)) {
                return uri.getLastPathSegment();
            }
            if (UriUtil.LOCAL_CONTENT_SCHEME.equalsIgnoreCase(scheme)) {
                return resolveContentName(uri);
            }
            return "unknown";
        }

        @NonNull
        String resolveContentName(@NonNull Uri uri) {
            return getColumnValue(uri, "_display_name", null, null);
        }
    }

    @TargetApi(19)
    /* loaded from: classes3.dex */
    public static class KitKatPathResolver extends BasePathResolver {
        private KitKatPathResolver() {
            super();
        }

        static boolean isExternalStorageDocument(@NonNull Uri uri) {
            return "com.android.externalstorage.documents".equals(uri.getAuthority());
        }

        static boolean isDownloadsDocument(@NonNull Uri uri) {
            return "com.android.providers.downloads.documents".equals(uri.getAuthority());
        }

        static boolean isMediaDocument(@NonNull Uri uri) {
            return "com.android.providers.media.documents".equals(uri.getAuthority());
        }

        @Override // com.vkontakte.android.upload.UploadUtils.BasePathResolver, com.vkontakte.android.upload.UploadUtils.Resolver
        @NonNull
        public String resolvePath(@NonNull Uri uri) {
            Uri contentUri;
            if (DocumentsContract.isDocumentUri(VKApplication.context, uri)) {
                if (isExternalStorageDocument(uri)) {
                    String docId = DocumentsContract.getDocumentId(uri);
                    String[] split = docId.split(":");
                    if (UserNotification.BUTTON_STYLE_PRIMARY.equalsIgnoreCase(split[0])) {
                        return Environment.getExternalStorageDirectory() + CameraUtilsEffects.FILE_DELIM + split[1];
                    }
                    return "unknown";
                } else if (isDownloadsDocument(uri)) {
                    String id = DocumentsContract.getDocumentId(uri);
                    Uri contentUri2 = ContentUris.withAppendedId(Uri.parse("content://downloads/public_downloads"), Long.parseLong(id));
                    return getColumnValue(contentUri2, "_data", null, null);
                } else if (isMediaDocument(uri)) {
                    String docId2 = DocumentsContract.getDocumentId(uri);
                    String[] split2 = docId2.split(":");
                    String type = split2[0];
                    if ("image".equals(type)) {
                        contentUri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
                    } else if ("video".equals(type)) {
                        contentUri = MediaStore.Video.Media.EXTERNAL_CONTENT_URI;
                    } else if (MimeTypes.BASE_TYPE_AUDIO.equals(type)) {
                        contentUri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;
                    } else {
                        return "unknown";
                    }
                    String[] selectionArgs = {split2[1]};
                    return getColumnValue(contentUri, "_data", "_id=?", selectionArgs);
                } else {
                    return "unknown";
                }
            }
            return super.resolvePath(uri);
        }

        @Override // com.vkontakte.android.upload.UploadUtils.BasePathResolver
        @NonNull
        String resolveContentName(@NonNull Uri uri) {
            Uri contentUri;
            if (DocumentsContract.isDocumentUri(VKApplication.context, uri)) {
                if (isExternalStorageDocument(uri)) {
                    String docId = DocumentsContract.getDocumentId(uri);
                    String[] split = docId.split(":");
                    if (UserNotification.BUTTON_STYLE_PRIMARY.equalsIgnoreCase(split[0])) {
                        return split[1];
                    }
                    return "unknown";
                } else if (isDownloadsDocument(uri)) {
                    String id = DocumentsContract.getDocumentId(uri);
                    Uri contentUri2 = ContentUris.withAppendedId(Uri.parse("content://downloads/public_downloads"), Long.parseLong(id));
                    return getColumnValue(contentUri2, "_display_name", null, null);
                } else if (isMediaDocument(uri)) {
                    String docId2 = DocumentsContract.getDocumentId(uri);
                    String[] split2 = docId2.split(":");
                    String type = split2[0];
                    if ("image".equals(type)) {
                        contentUri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
                    } else if ("video".equals(type)) {
                        contentUri = MediaStore.Video.Media.EXTERNAL_CONTENT_URI;
                    } else if (MimeTypes.BASE_TYPE_AUDIO.equals(type)) {
                        contentUri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;
                    } else {
                        return "unknown";
                    }
                    String[] selectionArgs = {split2[1]};
                    return getColumnValue(contentUri, "_display_name", "_id=?", selectionArgs);
                } else {
                    return "unknown";
                }
            }
            return super.resolveContentName(uri);
        }
    }
}
