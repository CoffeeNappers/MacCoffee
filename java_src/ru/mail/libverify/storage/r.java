package ru.mail.libverify.storage;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.Base64;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
/* loaded from: classes3.dex */
final class r {
    private final o a;

    /* JADX INFO: Access modifiers changed from: package-private */
    public r(o oVar) {
        this.a = oVar;
    }

    private static String a(@NonNull Key key) {
        return Base64.encodeToString(key.getEncoded(), 2);
    }

    private void c() {
        this.a.d("server_key_manager_private_data").d("server_key_manager_public_data").a();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized String a() {
        String a;
        String a2 = this.a.a("server_key_manager_private_data");
        a = this.a.a("server_key_manager_public_data");
        if (TextUtils.isEmpty(a) || TextUtils.isEmpty(a2)) {
            try {
                ru.mail.libverify.utils.d.c("ServerKeyManager", "key generation started");
                ru.mail.libverify.utils.i.a();
                KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
                keyPairGenerator.initialize(2048);
                KeyPair generateKeyPair = keyPairGenerator.generateKeyPair();
                ru.mail.libverify.utils.d.c("ServerKeyManager", "key generation completed");
                String a3 = a(generateKeyPair.getPrivate());
                a = a(generateKeyPair.getPublic());
                this.a.a("server_key_manager_private_data", a3).a("server_key_manager_public_data", a).a();
            } catch (InvalidAlgorithmParameterException | NoSuchAlgorithmException e) {
                ru.mail.libverify.utils.d.a("ServerKeyManager", "failed to generate key pair", e);
                a = null;
            }
        }
        return a;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized String a(@NonNull String str, @NonNull String str2) {
        String str3;
        ru.mail.libverify.utils.d.c("ServerKeyManager", "decrypt message started");
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            throw new IllegalArgumentException();
        }
        String a = this.a.a("server_key_manager_private_data");
        if (TextUtils.isEmpty(a)) {
            throw new DecryptionError("No private key found");
        }
        try {
            byte[] e = ru.mail.libverify.utils.m.e(a);
            if (e == null) {
                throw new IllegalStateException("Failed to extract encoded key");
            }
            PrivateKey generatePrivate = KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(e));
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1PADDING");
            cipher.init(2, generatePrivate);
            byte[] e2 = ru.mail.libverify.utils.m.e(str2);
            if (e2 == null) {
                throw new DecryptionError("Wrong base64 key text");
            }
            byte[] doFinal = cipher.doFinal(e2);
            byte[] e3 = ru.mail.libverify.utils.m.e(str);
            if (e3 == null) {
                throw new DecryptionError("Wrong base64 message text");
            }
            Cipher cipher2 = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher2.init(2, new SecretKeySpec(doFinal, "AES"), new IvParameterSpec(e3, 0, 16));
            str3 = new String(cipher2.doFinal(e3, 16, e3.length - 16), "UTF-8");
            ru.mail.libverify.utils.d.c("ServerKeyManager", "decrypt message completed");
        } catch (UnsupportedEncodingException e4) {
            e = e4;
            ru.mail.libverify.utils.d.a("ServerKeyManager", "failed to decrypt server message", e);
            c();
            throw new DecryptionError(e);
        } catch (InvalidKeyException e5) {
            e = e5;
            ru.mail.libverify.utils.d.a("ServerKeyManager", "failed to decrypt server message", e);
            c();
            throw new DecryptionError(e);
        } catch (NoSuchAlgorithmException e6) {
            e = e6;
            ru.mail.libverify.utils.d.a("ServerKeyManager", "failed to decrypt server message", e);
            c();
            throw new DecryptionError(e);
        } catch (InvalidKeySpecException e7) {
            e = e7;
            ru.mail.libverify.utils.d.a("ServerKeyManager", "failed to decrypt server message", e);
            c();
            throw new DecryptionError(e);
        } catch (BadPaddingException e8) {
            e = e8;
            ru.mail.libverify.utils.d.a("ServerKeyManager", "failed to decrypt server message", e);
            c();
            throw new DecryptionError(e);
        } catch (IllegalBlockSizeException e9) {
            e = e9;
            ru.mail.libverify.utils.d.a("ServerKeyManager", "failed to decrypt server message", e);
            c();
            throw new DecryptionError(e);
        } catch (NoSuchPaddingException e10) {
            e = e10;
            ru.mail.libverify.utils.d.a("ServerKeyManager", "failed to decrypt server message", e);
            c();
            throw new DecryptionError(e);
        } catch (Exception e11) {
            ru.mail.libverify.utils.c.a("ServerKeyManager", "failed to decrypt server message", e11);
            c();
            throw new DecryptionError(e11);
        }
        return str3;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final synchronized void b() {
        c();
    }
}
