package com.vkontakte.android.audio.contentprovider;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.UriMatcher;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Binder;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vkontakte.android.audio.player.SavedTrack;
import com.vkontakte.android.data.db.Database;
import java.math.BigInteger;
import java.security.MessageDigest;
/* loaded from: classes2.dex */
public class AudioContentProvider extends ContentProvider implements AudioContentProviderConstants {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final String CACHE_CONTENT_ITEM_TYPE = "vnd.android.cursor.item/vnd.com.vkontakte.android.providers.audio.cache";
    private static final String CACHE_CONTENT_TYPE = "vnd.android.cursor.dir/vnd.com.vkontakte.android.providers.audio.cache";
    private static final int URI_CACHE = 1;
    private static final int URI_CACHE_ID = 2;
    private static final UriMatcher uriMatcher;
    private Database database;

    static {
        $assertionsDisabled = !AudioContentProvider.class.desiredAssertionStatus();
        uriMatcher = new UriMatcher(-1);
        uriMatcher.addURI(AudioContentProviderConstants.AUTHORITY, AudioContentProviderConstants.CACHE_PATH, 1);
        uriMatcher.addURI(AudioContentProviderConstants.AUTHORITY, "cache/#", 2);
    }

    @Override // android.content.ContentProvider
    public boolean onCreate() {
        this.database = Database.getInst(getContext());
        return true;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public Cursor query(@NonNull Uri uri, @Nullable String[] projection, @Nullable String selection, @Nullable String[] selectionArgs, @Nullable String sortOrder) {
        assertCaller(getContext());
        switch (uriMatcher.match(uri)) {
            case 1:
                break;
            default:
                throw new IllegalArgumentException("Wrong URI: " + uri);
            case 2:
                String id = uri.getLastPathSegment();
                if (TextUtils.isEmpty(selection)) {
                    selection = "_id = " + id;
                    break;
                } else {
                    selection = selection + " AND _id = " + id;
                    break;
                }
        }
        return this.database.getReadableDatabase().query(true, SavedTrack.TABLE, MUSIC_TRACK_DEFAULT_PROJECTION, selection, selectionArgs, null, null, null, null);
    }

    @Override // android.content.ContentProvider
    @Nullable
    public String getType(@NonNull Uri uri) {
        assertCaller(getContext());
        switch (uriMatcher.match(uri)) {
            case 1:
                return CACHE_CONTENT_TYPE;
            case 2:
                return CACHE_CONTENT_ITEM_TYPE;
            default:
                return null;
        }
    }

    @Override // android.content.ContentProvider
    @Nullable
    public Uri insert(@NonNull Uri uri, @Nullable ContentValues values) {
        assertCaller(getContext());
        throw new UnsupportedOperationException("Operation insert does not support URI: " + uri);
    }

    @Override // android.content.ContentProvider
    public int delete(@NonNull Uri uri, @Nullable String selection, @Nullable String[] selectionArgs) {
        assertCaller(getContext());
        throw new UnsupportedOperationException("Operation delete does not support URI: " + uri);
    }

    @Override // android.content.ContentProvider
    public int update(@NonNull Uri uri, @Nullable ContentValues values, @Nullable String selection, @Nullable String[] selectionArgs) {
        assertCaller(getContext());
        throw new UnsupportedOperationException("Operation update does not support URI: " + uri);
    }

    private static void assertCaller(Context ctx) {
        String[] strArr;
        PackageManager pm = ctx.getPackageManager();
        String callingPackageName = pm.getNameForUid(Binder.getCallingUid());
        for (String fpr : VALID_APP_FINGERPRINTS) {
            if (TextUtils.equals(fpr, getCertificateFingerprint(pm, callingPackageName))) {
                return;
            }
        }
        throw new SecurityException("Wrong caller");
    }

    private static String getCertificateFingerprint(PackageManager pm, String packageName) {
        String[] f = getCertificateFingerprints(pm, packageName);
        if (f == null || f.length <= 0) {
            return null;
        }
        return f[0];
    }

    private static String[] getCertificateFingerprints(PackageManager pm, String packageName) {
        try {
            PackageInfo info = pm.getPackageInfo(packageName, 64);
            if (!$assertionsDisabled && info.signatures == null) {
                throw new AssertionError();
            }
            String[] result = new String[info.signatures.length];
            for (int i = 0; i < info.signatures.length; i++) {
                MessageDigest md = MessageDigest.getInstance("SHA");
                md.update(info.signatures[i].toByteArray());
                result[i] = toHex(md.digest());
            }
            return result;
        } catch (Exception e) {
            return null;
        }
    }

    private static String toHex(byte[] bytes) {
        BigInteger bi = new BigInteger(1, bytes);
        return String.format("%0" + (bytes.length << 1) + "X", bi);
    }
}
