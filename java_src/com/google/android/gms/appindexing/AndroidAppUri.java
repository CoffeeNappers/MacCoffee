package com.google.android.gms.appindexing;

import android.net.Uri;
import android.text.TextUtils;
import com.google.android.gms.common.internal.zzz;
import java.util.List;
/* loaded from: classes2.dex */
public final class AndroidAppUri {
    private final Uri mUri;

    private AndroidAppUri(Uri uri) {
        this.mUri = uri;
    }

    public static AndroidAppUri newAndroidAppUri(Uri uri) {
        AndroidAppUri androidAppUri = new AndroidAppUri(uri);
        if (zza(androidAppUri)) {
            return androidAppUri;
        }
        throw new IllegalArgumentException("AndroidAppUri validation failed.");
    }

    public static AndroidAppUri newAndroidAppUri(String str, Uri uri) {
        Uri.Builder authority = new Uri.Builder().scheme("android-app").authority(str);
        if (uri != null) {
            authority.appendPath(uri.getScheme());
            if (uri.getAuthority() != null) {
                authority.appendPath(uri.getAuthority());
            }
            for (String str2 : uri.getPathSegments()) {
                authority.appendPath(str2);
            }
            authority.encodedQuery(uri.getEncodedQuery()).encodedFragment(uri.getEncodedFragment());
        }
        return new AndroidAppUri(authority.build());
    }

    private static boolean zza(AndroidAppUri androidAppUri) {
        if (!"android-app".equals(androidAppUri.mUri.getScheme())) {
            throw new IllegalArgumentException("android-app scheme is required.");
        }
        if (TextUtils.isEmpty(androidAppUri.getPackageName())) {
            throw new IllegalArgumentException("Package name is empty.");
        }
        if (androidAppUri.mUri.equals(newAndroidAppUri(androidAppUri.getPackageName(), androidAppUri.getDeepLinkUri()).toUri())) {
            return true;
        }
        throw new IllegalArgumentException("URI is not canonical.");
    }

    public boolean equals(Object obj) {
        if (obj instanceof AndroidAppUri) {
            return this.mUri.equals(((AndroidAppUri) obj).mUri);
        }
        return false;
    }

    public Uri getDeepLinkUri() {
        List<String> pathSegments = this.mUri.getPathSegments();
        if (pathSegments.size() > 0) {
            Uri.Builder builder = new Uri.Builder();
            builder.scheme(pathSegments.get(0));
            if (pathSegments.size() > 1) {
                builder.authority(pathSegments.get(1));
                int i = 2;
                while (true) {
                    int i2 = i;
                    if (i2 >= pathSegments.size()) {
                        break;
                    }
                    builder.appendPath(pathSegments.get(i2));
                    i = i2 + 1;
                }
            }
            builder.encodedQuery(this.mUri.getEncodedQuery());
            builder.encodedFragment(this.mUri.getEncodedFragment());
            return builder.build();
        }
        return null;
    }

    public String getPackageName() {
        return this.mUri.getAuthority();
    }

    public int hashCode() {
        return zzz.hashCode(this.mUri);
    }

    public String toString() {
        return this.mUri.toString();
    }

    public Uri toUri() {
        return this.mUri;
    }
}
