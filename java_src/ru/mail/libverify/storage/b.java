package ru.mail.libverify.storage;

import android.annotation.TargetApi;
import android.security.keystore.KeyGenParameterSpec;
import android.support.annotation.NonNull;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.KeyStore;
import java.security.spec.AlgorithmParameterSpec;
/* loaded from: classes3.dex */
final class b implements a {
    @Override // ru.mail.libverify.storage.a
    @TargetApi(23)
    public final KeyPair a(@NonNull String str, @NonNull KeyGenParameterSpec keyGenParameterSpec) {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance(str, "AndroidKeyStore");
        keyPairGenerator.initialize(keyGenParameterSpec);
        return keyPairGenerator.generateKeyPair();
    }

    @Override // ru.mail.libverify.storage.a
    public final KeyPair a(@NonNull String str, @NonNull AlgorithmParameterSpec algorithmParameterSpec) {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance(str, "AndroidKeyStore");
        keyPairGenerator.initialize(algorithmParameterSpec);
        return keyPairGenerator.generateKeyPair();
    }

    @Override // ru.mail.libverify.storage.a
    public final KeyStore.Entry a(@NonNull String str) {
        KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
        keyStore.load(null);
        return keyStore.getEntry(str, null);
    }

    @Override // ru.mail.libverify.storage.a
    public final void b(@NonNull String str) {
        KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
        keyStore.load(null);
        keyStore.deleteEntry(str);
    }
}
