package com.google.android.gms.internal;

import io.fabric.sdk.android.services.network.UrlUtils;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CodingErrorAction;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
class zzamt {

    /* loaded from: classes2.dex */
    static class zza implements zzb {
        private int bjo = 0;
        private List<byte[]> bjn = new ArrayList();

        zza() {
        }

        @Override // com.google.android.gms.internal.zzamt.zzb
        public zzamz e() {
            byte[] bArr = new byte[this.bjo];
            int i = 0;
            for (int i2 = 0; i2 < this.bjn.size(); i2++) {
                byte[] bArr2 = this.bjn.get(i2);
                System.arraycopy(bArr2, 0, bArr, i, bArr2.length);
                i += bArr2.length;
            }
            return new zzamz(bArr);
        }

        @Override // com.google.android.gms.internal.zzamt.zzb
        public boolean zzau(byte[] bArr) {
            this.bjn.add(bArr);
            this.bjo += bArr.length;
            return true;
        }
    }

    /* loaded from: classes2.dex */
    interface zzb {
        zzamz e();

        boolean zzau(byte[] bArr);
    }

    /* loaded from: classes2.dex */
    static class zzc implements zzb {
        private static ThreadLocal<CharsetDecoder> bjp = new ThreadLocal<CharsetDecoder>() { // from class: com.google.android.gms.internal.zzamt.zzc.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // java.lang.ThreadLocal
            /* renamed from: f */
            public CharsetDecoder initialValue() {
                CharsetDecoder newDecoder = Charset.forName(UrlUtils.UTF8).newDecoder();
                newDecoder.onMalformedInput(CodingErrorAction.REPORT);
                newDecoder.onUnmappableCharacter(CodingErrorAction.REPORT);
                return newDecoder;
            }
        };
        private static ThreadLocal<CharsetEncoder> bjq = new ThreadLocal<CharsetEncoder>() { // from class: com.google.android.gms.internal.zzamt.zzc.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // java.lang.ThreadLocal
            /* renamed from: g */
            public CharsetEncoder initialValue() {
                CharsetEncoder newEncoder = Charset.forName(UrlUtils.UTF8).newEncoder();
                newEncoder.onMalformedInput(CodingErrorAction.REPORT);
                newEncoder.onUnmappableCharacter(CodingErrorAction.REPORT);
                return newEncoder;
            }
        };
        private StringBuilder bjr = new StringBuilder();

        zzc() {
        }

        private String zzav(byte[] bArr) {
            try {
                return bjp.get().decode(ByteBuffer.wrap(bArr)).toString();
            } catch (CharacterCodingException e) {
                return null;
            }
        }

        @Override // com.google.android.gms.internal.zzamt.zzb
        public zzamz e() {
            return new zzamz(this.bjr.toString());
        }

        @Override // com.google.android.gms.internal.zzamt.zzb
        public boolean zzau(byte[] bArr) {
            String zzav = zzav(bArr);
            if (zzav != null) {
                this.bjr.append(zzav);
                return true;
            }
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static zzb zzb(byte b) {
        return b == 2 ? new zza() : new zzc();
    }
}
