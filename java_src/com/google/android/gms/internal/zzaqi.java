package com.google.android.gms.internal;

import java.io.IOException;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public final class zzaqi extends zzapk<Object> {
    public static final zzapl bpG = new zzapl() { // from class: com.google.android.gms.internal.zzaqi.1
        @Override // com.google.android.gms.internal.zzapl
        public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
            if (zzaqoVar.bB() == Object.class) {
                return new zzaqi(zzaosVar);
            }
            return null;
        }
    };
    private final zzaos boC;

    private zzaqi(zzaos zzaosVar) {
        this.boC = zzaosVar;
    }

    @Override // com.google.android.gms.internal.zzapk
    public void zza(zzaqr zzaqrVar, Object obj) throws IOException {
        if (obj == null) {
            zzaqrVar.bA();
            return;
        }
        zzapk zzk = this.boC.zzk(obj.getClass());
        if (!(zzk instanceof zzaqi)) {
            zzk.zza(zzaqrVar, obj);
            return;
        }
        zzaqrVar.by();
        zzaqrVar.bz();
    }

    @Override // com.google.android.gms.internal.zzapk
    public Object zzb(zzaqp zzaqpVar) throws IOException {
        switch (zzaqpVar.bq()) {
            case BEGIN_ARRAY:
                ArrayList arrayList = new ArrayList();
                zzaqpVar.beginArray();
                while (zzaqpVar.hasNext()) {
                    arrayList.add(zzb(zzaqpVar));
                }
                zzaqpVar.endArray();
                return arrayList;
            case BEGIN_OBJECT:
                zzapw zzapwVar = new zzapw();
                zzaqpVar.beginObject();
                while (zzaqpVar.hasNext()) {
                    zzapwVar.put(zzaqpVar.nextName(), zzb(zzaqpVar));
                }
                zzaqpVar.endObject();
                return zzapwVar;
            case STRING:
                return zzaqpVar.nextString();
            case NUMBER:
                return Double.valueOf(zzaqpVar.nextDouble());
            case BOOLEAN:
                return Boolean.valueOf(zzaqpVar.nextBoolean());
            case NULL:
                zzaqpVar.nextNull();
                return null;
            default:
                throw new IllegalStateException();
        }
    }
}
