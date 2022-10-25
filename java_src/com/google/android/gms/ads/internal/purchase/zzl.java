package com.google.android.gms.ads.internal.purchase;

import android.text.TextUtils;
import android.util.Base64;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.Signature;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
@zzji
/* loaded from: classes.dex */
public class zzl {
    public static boolean zza(PublicKey publicKey, String str, String str2) {
        try {
            Signature signature = Signature.getInstance("SHA1withRSA");
            signature.initVerify(publicKey);
            signature.update(str.getBytes());
            if (signature.verify(Base64.decode(str2, 0))) {
                return true;
            }
            zzkx.e("Signature verification failed.");
            return false;
        } catch (InvalidKeyException e) {
            zzkx.e("Invalid key specification.");
            return false;
        } catch (NoSuchAlgorithmException e2) {
            zzkx.e("NoSuchAlgorithmException.");
            return false;
        } catch (SignatureException e3) {
            zzkx.e("Signature exception.");
            return false;
        }
    }

    public static boolean zzc(String str, String str2, String str3) {
        if (TextUtils.isEmpty(str2) || TextUtils.isEmpty(str) || TextUtils.isEmpty(str3)) {
            zzkx.e("Purchase verification failed: missing data.");
            return false;
        }
        return zza(zzci(str), str2, str3);
    }

    public static PublicKey zzci(String str) {
        try {
            return KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(Base64.decode(str, 0)));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeySpecException e2) {
            zzkx.e("Invalid key specification.");
            throw new IllegalArgumentException(e2);
        }
    }
}
