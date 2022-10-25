package io.fabric.sdk.android.services.persistence;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.os.Environment;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Kit;
import java.io.File;
/* loaded from: classes3.dex */
public class FileStoreImpl implements FileStore {
    private final String contentPath;
    private final Context context;
    private final String legacySupport;

    public FileStoreImpl(Kit kit) {
        if (kit.getContext() == null) {
            throw new IllegalStateException("Cannot get directory before context has been set. Call Fabric.with() first");
        }
        this.context = kit.getContext();
        this.contentPath = kit.getPath();
        this.legacySupport = "Android/" + this.context.getPackageName();
    }

    @Override // io.fabric.sdk.android.services.persistence.FileStore
    public File getCacheDir() {
        return prepare(this.context.getCacheDir());
    }

    @Override // io.fabric.sdk.android.services.persistence.FileStore
    public File getExternalCacheDir() {
        File file = null;
        if (isExternalStorageAvailable()) {
            if (Build.VERSION.SDK_INT >= 8) {
                file = this.context.getExternalCacheDir();
            } else {
                file = new File(Environment.getExternalStorageDirectory(), this.legacySupport + "/cache/" + this.contentPath);
            }
        }
        return prepare(file);
    }

    @Override // io.fabric.sdk.android.services.persistence.FileStore
    public File getFilesDir() {
        return prepare(this.context.getFilesDir());
    }

    @Override // io.fabric.sdk.android.services.persistence.FileStore
    @TargetApi(8)
    public File getExternalFilesDir() {
        File file = null;
        if (isExternalStorageAvailable()) {
            if (Build.VERSION.SDK_INT >= 8) {
                file = this.context.getExternalFilesDir(null);
            } else {
                file = new File(Environment.getExternalStorageDirectory(), this.legacySupport + "/files/" + this.contentPath);
            }
        }
        return prepare(file);
    }

    File prepare(File file) {
        if (file != null) {
            if (!file.exists() && !file.mkdirs()) {
                Fabric.getLogger().w(Fabric.TAG, "Couldn't create file");
            } else {
                return file;
            }
        } else {
            Fabric.getLogger().d(Fabric.TAG, "Null File");
        }
        return null;
    }

    boolean isExternalStorageAvailable() {
        String state = Environment.getExternalStorageState();
        if (!"mounted".equals(state)) {
            Fabric.getLogger().w(Fabric.TAG, "External Storage is not mounted and/or writable\nHave you declared android.permission.WRITE_EXTERNAL_STORAGE in the manifest?");
            return false;
        }
        return true;
    }
}
