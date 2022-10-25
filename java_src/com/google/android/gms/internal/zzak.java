package com.google.android.gms.internal;

import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
/* loaded from: classes2.dex */
public abstract class zzak<K, V> {
    private static final String TAG = zzak.class.getSimpleName();

    /* JADX INFO: Access modifiers changed from: protected */
    public static <K, V> HashMap<K, V> zzl(String str) {
        try {
            if (!TextUtils.isEmpty(str)) {
                return (HashMap) new ObjectInputStream(new ByteArrayInputStream(Base64.decode(str.getBytes(), 0))).readObject();
            }
        } catch (IOException | ClassNotFoundException e) {
            Log.d(TAG, "decode object failure");
        }
        return null;
    }

    public String toString() {
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            objectOutputStream.writeObject(zzat());
            objectOutputStream.close();
            return Base64.encodeToString(byteArrayOutputStream.toByteArray(), 0);
        } catch (IOException e) {
            return null;
        }
    }

    protected abstract HashMap<K, V> zzat();

    protected abstract void zzk(String str);
}
