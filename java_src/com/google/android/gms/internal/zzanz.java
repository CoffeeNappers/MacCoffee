package com.google.android.gms.internal;

import com.google.firebase.remoteconfig.FirebaseRemoteConfig;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigValue;
import java.nio.charset.Charset;
import java.util.regex.Pattern;
/* loaded from: classes2.dex */
public class zzanz implements FirebaseRemoteConfigValue {
    private final byte[] blz;
    private final int zzbcm;
    public static final Charset UTF_8 = Charset.forName("UTF-8");
    public static final Pattern GW = Pattern.compile("^(1|true|t|yes|y|on)$", 2);
    public static final Pattern GX = Pattern.compile("^(0|false|f|no|n|off|)$", 2);

    public zzanz(byte[] bArr, int i) {
        this.blz = bArr;
        this.zzbcm = i;
    }

    private void X() {
        if (this.blz == null) {
            throw new IllegalArgumentException("Value is null, and cannot be converted to the desired type.");
        }
    }

    @Override // com.google.firebase.remoteconfig.FirebaseRemoteConfigValue
    public boolean asBoolean() throws IllegalArgumentException {
        if (this.zzbcm == 0) {
            return false;
        }
        String asString = asString();
        if (GW.matcher(asString).matches()) {
            return true;
        }
        if (GX.matcher(asString).matches()) {
            return false;
        }
        throw new IllegalArgumentException(new StringBuilder(String.valueOf(asString).length() + 45).append("[Value: ").append(asString).append("] cannot be interpreted as a boolean.").toString());
    }

    @Override // com.google.firebase.remoteconfig.FirebaseRemoteConfigValue
    public byte[] asByteArray() {
        return this.zzbcm == 0 ? FirebaseRemoteConfig.DEFAULT_VALUE_FOR_BYTE_ARRAY : this.blz;
    }

    @Override // com.google.firebase.remoteconfig.FirebaseRemoteConfigValue
    public double asDouble() {
        if (this.zzbcm == 0) {
            return 0.0d;
        }
        String asString = asString();
        try {
            return Double.valueOf(asString).doubleValue();
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(asString).length() + 42).append("[Value: ").append(asString).append("] cannot be converted to a double.").toString(), e);
        }
    }

    @Override // com.google.firebase.remoteconfig.FirebaseRemoteConfigValue
    public long asLong() {
        if (this.zzbcm == 0) {
            return 0L;
        }
        String asString = asString();
        try {
            return Long.valueOf(asString).longValue();
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(asString).length() + 40).append("[Value: ").append(asString).append("] cannot be converted to a long.").toString(), e);
        }
    }

    @Override // com.google.firebase.remoteconfig.FirebaseRemoteConfigValue
    public String asString() {
        if (this.zzbcm == 0) {
            return "";
        }
        X();
        return new String(this.blz, UTF_8);
    }

    @Override // com.google.firebase.remoteconfig.FirebaseRemoteConfigValue
    public int getSource() {
        return this.zzbcm;
    }
}
