package com.facebook.common.util;

import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract;
import android.provider.MediaStore;
import java.io.File;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class UriUtil {
    public static final String DATA_SCHEME = "data";
    public static final String HTTPS_SCHEME = "https";
    public static final String HTTP_SCHEME = "http";
    public static final String LOCAL_ASSET_SCHEME = "asset";
    private static final String LOCAL_CONTACT_IMAGE_PREFIX = Uri.withAppendedPath(ContactsContract.AUTHORITY_URI, "display_photo").getPath();
    public static final String LOCAL_CONTENT_SCHEME = "content";
    public static final String LOCAL_FILE_SCHEME = "file";
    public static final String LOCAL_RESOURCE_SCHEME = "res";

    public static boolean isNetworkUri(@Nullable Uri uri) {
        String scheme = getSchemeOrNull(uri);
        return HTTPS_SCHEME.equals(scheme) || HTTP_SCHEME.equals(scheme);
    }

    public static boolean isLocalFileUri(@Nullable Uri uri) {
        String scheme = getSchemeOrNull(uri);
        return LOCAL_FILE_SCHEME.equals(scheme);
    }

    public static boolean isLocalContentUri(@Nullable Uri uri) {
        String scheme = getSchemeOrNull(uri);
        return LOCAL_CONTENT_SCHEME.equals(scheme);
    }

    public static boolean isLocalContactUri(Uri uri) {
        return isLocalContentUri(uri) && "com.android.contacts".equals(uri.getAuthority()) && !uri.getPath().startsWith(LOCAL_CONTACT_IMAGE_PREFIX);
    }

    public static boolean isLocalCameraUri(Uri uri) {
        String uriString = uri.toString();
        return uriString.startsWith(MediaStore.Images.Media.EXTERNAL_CONTENT_URI.toString()) || uriString.startsWith(MediaStore.Images.Media.INTERNAL_CONTENT_URI.toString());
    }

    public static boolean isLocalAssetUri(@Nullable Uri uri) {
        String scheme = getSchemeOrNull(uri);
        return LOCAL_ASSET_SCHEME.equals(scheme);
    }

    public static boolean isLocalResourceUri(@Nullable Uri uri) {
        String scheme = getSchemeOrNull(uri);
        return LOCAL_RESOURCE_SCHEME.equals(scheme);
    }

    public static boolean isDataUri(@Nullable Uri uri) {
        return "data".equals(getSchemeOrNull(uri));
    }

    @Nullable
    public static String getSchemeOrNull(@Nullable Uri uri) {
        if (uri == null) {
            return null;
        }
        return uri.getScheme();
    }

    public static Uri parseUriOrNull(@Nullable String uriAsString) {
        if (uriAsString != null) {
            return Uri.parse(uriAsString);
        }
        return null;
    }

    @Nullable
    public static String getRealPathFromUri(ContentResolver contentResolver, Uri srcUri) {
        int idx;
        String result = null;
        if (isLocalContentUri(srcUri)) {
            Cursor cursor = null;
            try {
                cursor = contentResolver.query(srcUri, null, null, null, null);
                if (cursor != null && cursor.moveToFirst() && (idx = cursor.getColumnIndex("_data")) != -1) {
                    result = cursor.getString(idx);
                }
            } finally {
                if (cursor != null) {
                    cursor.close();
                }
            }
        } else if (!isLocalFileUri(srcUri)) {
            return null;
        } else {
            return srcUri.getPath();
        }
    }

    public static Uri getUriForFile(File file) {
        return Uri.fromFile(file);
    }

    public static Uri getUriForResourceId(int resourceId) {
        return new Uri.Builder().scheme(LOCAL_RESOURCE_SCHEME).path(String.valueOf(resourceId)).build();
    }
}
