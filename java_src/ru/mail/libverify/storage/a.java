package ru.mail.libverify.storage;

import android.security.keystore.KeyGenParameterSpec;
import android.support.annotation.NonNull;
import java.security.KeyPair;
import java.security.KeyStore;
import java.security.spec.AlgorithmParameterSpec;
/* loaded from: classes3.dex */
interface a {
    KeyPair a(@NonNull String str, @NonNull KeyGenParameterSpec keyGenParameterSpec);

    KeyPair a(@NonNull String str, @NonNull AlgorithmParameterSpec algorithmParameterSpec);

    KeyStore.Entry a(@NonNull String str);

    void b(@NonNull String str);
}
