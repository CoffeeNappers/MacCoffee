package com.google.android.gms.internal;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
/* loaded from: classes2.dex */
public final class zzapd {
    public zzaoy zza(Reader reader) throws zzaoz, zzaph {
        try {
            zzaqp zzaqpVar = new zzaqp(reader);
            zzaoy zzh = zzh(zzaqpVar);
            if (zzh.aY() || zzaqpVar.bq() == zzaqq.END_DOCUMENT) {
                return zzh;
            }
            throw new zzaph("Did not consume the entire document.");
        } catch (zzaqs e) {
            throw new zzaph(e);
        } catch (IOException e2) {
            throw new zzaoz(e2);
        } catch (NumberFormatException e3) {
            throw new zzaph(e3);
        }
    }

    public zzaoy zzh(zzaqp zzaqpVar) throws zzaoz, zzaph {
        boolean isLenient = zzaqpVar.isLenient();
        zzaqpVar.setLenient(true);
        try {
            try {
                try {
                    return zzapz.zzh(zzaqpVar);
                } catch (OutOfMemoryError e) {
                    String valueOf = String.valueOf(zzaqpVar);
                    throw new zzapc(new StringBuilder(String.valueOf(valueOf).length() + 36).append("Failed parsing JSON source: ").append(valueOf).append(" to Json").toString(), e);
                }
            } catch (StackOverflowError e2) {
                String valueOf2 = String.valueOf(zzaqpVar);
                throw new zzapc(new StringBuilder(String.valueOf(valueOf2).length() + 36).append("Failed parsing JSON source: ").append(valueOf2).append(" to Json").toString(), e2);
            }
        } finally {
            zzaqpVar.setLenient(isLenient);
        }
    }

    public zzaoy zzuq(String str) throws zzaph {
        return zza(new StringReader(str));
    }
}
