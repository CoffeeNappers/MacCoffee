package com.google.firebase.database;

import com.google.android.gms.internal.zzajq;
import com.google.android.gms.internal.zzajx;
import com.google.android.gms.internal.zzakf;
import com.google.android.gms.internal.zzalz;
import com.google.android.gms.internal.zzamg;
import com.google.android.gms.internal.zzamk;
import com.google.android.gms.internal.zzaml;
import com.google.android.gms.internal.zzamm;
import com.google.android.gms.internal.zzamp;
import com.google.android.gms.internal.zzano;
import com.google.android.gms.internal.zzanp;
import java.util.Iterator;
import java.util.NoSuchElementException;
/* loaded from: classes2.dex */
public class MutableData {
    private final zzajx aZm;
    private final zzajq aZn;

    private MutableData(zzajx zzajxVar, zzajq zzajqVar) {
        this.aZm = zzajxVar;
        this.aZn = zzajqVar;
        zzakf.zza(this.aZn, getValue());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MutableData(zzaml zzamlVar) {
        this(new zzajx(zzamlVar), new zzajq(""));
    }

    public MutableData child(String str) {
        zzano.zzti(str);
        return new MutableData(this.aZm, this.aZn.zzh(new zzajq(str)));
    }

    public boolean equals(Object obj) {
        return (obj instanceof MutableData) && this.aZm.equals(((MutableData) obj).aZm) && this.aZn.equals(((MutableData) obj).aZn);
    }

    public Iterable<MutableData> getChildren() {
        zzaml zzcqy = zzcqy();
        if (zzcqy.isEmpty() || zzcqy.zzcze()) {
            return new Iterable<MutableData>() { // from class: com.google.firebase.database.MutableData.1
                @Override // java.lang.Iterable
                public Iterator<MutableData> iterator() {
                    return new Iterator<MutableData>() { // from class: com.google.firebase.database.MutableData.1.1
                        @Override // java.util.Iterator
                        public boolean hasNext() {
                            return false;
                        }

                        @Override // java.util.Iterator
                        public void remove() {
                            throw new UnsupportedOperationException("remove called on immutable collection");
                        }

                        @Override // java.util.Iterator
                        /* renamed from: zzcqz */
                        public MutableData next() {
                            throw new NoSuchElementException();
                        }
                    };
                }
            };
        }
        final Iterator<zzamk> it = zzamg.zzn(zzcqy).iterator();
        return new Iterable<MutableData>() { // from class: com.google.firebase.database.MutableData.2
            @Override // java.lang.Iterable
            public Iterator<MutableData> iterator() {
                return new Iterator<MutableData>() { // from class: com.google.firebase.database.MutableData.2.1
                    @Override // java.util.Iterator
                    public boolean hasNext() {
                        return it.hasNext();
                    }

                    @Override // java.util.Iterator
                    public void remove() {
                        throw new UnsupportedOperationException("remove called on immutable collection");
                    }

                    @Override // java.util.Iterator
                    /* renamed from: zzcqz */
                    public MutableData next() {
                        return new MutableData(MutableData.this.aZm, MutableData.this.aZn.zza(((zzamk) it.next()).a()));
                    }
                };
            }
        };
    }

    public long getChildrenCount() {
        return zzcqy().getChildCount();
    }

    public String getKey() {
        if (this.aZn.zzcvm() != null) {
            return this.aZn.zzcvm().asString();
        }
        return null;
    }

    public Object getPriority() {
        return zzcqy().zzczf().getValue();
    }

    public Object getValue() {
        return zzcqy().getValue();
    }

    public <T> T getValue(GenericTypeIndicator<T> genericTypeIndicator) {
        return (T) zzanp.zza(zzcqy().getValue(), genericTypeIndicator);
    }

    public <T> T getValue(Class<T> cls) {
        return (T) zzanp.zza(zzcqy().getValue(), (Class<Object>) cls);
    }

    public boolean hasChild(String str) {
        return !zzcqy().zzao(new zzajq(str)).isEmpty();
    }

    public boolean hasChildren() {
        zzaml zzcqy = zzcqy();
        return !zzcqy.zzcze() && !zzcqy.isEmpty();
    }

    public void setPriority(Object obj) {
        this.aZm.zzg(this.aZn, zzcqy().zzg(zzamp.zzbu(obj)));
    }

    public void setValue(Object obj) throws DatabaseException {
        zzakf.zza(this.aZn, obj);
        Object zzby = zzanp.zzby(obj);
        zzano.zzbx(zzby);
        this.aZm.zzg(this.aZn, zzamm.zzbt(zzby));
    }

    public String toString() {
        zzalz zzcvj = this.aZn.zzcvj();
        String asString = zzcvj != null ? zzcvj.asString() : "<none>";
        String valueOf = String.valueOf(this.aZm.zzcvw().getValue(true));
        return new StringBuilder(String.valueOf(asString).length() + 32 + String.valueOf(valueOf).length()).append("MutableData { key = ").append(asString).append(", value = ").append(valueOf).append(" }").toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzaml zzcqy() {
        return this.aZm.zzq(this.aZn);
    }
}
