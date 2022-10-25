package com.google.firebase.database;

import com.google.android.gms.internal.zzajq;
import com.google.android.gms.internal.zzamg;
import com.google.android.gms.internal.zzamk;
import com.google.android.gms.internal.zzano;
import com.google.android.gms.internal.zzanp;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class DataSnapshot {
    private final zzamg aYN;
    private final DatabaseReference aYO;

    /* JADX INFO: Access modifiers changed from: package-private */
    public DataSnapshot(DatabaseReference databaseReference, zzamg zzamgVar) {
        this.aYN = zzamgVar;
        this.aYO = databaseReference;
    }

    public DataSnapshot child(String str) {
        return new DataSnapshot(this.aYO.child(str), zzamg.zzn(this.aYN.zzcqy().zzao(new zzajq(str))));
    }

    public boolean exists() {
        return !this.aYN.zzcqy().isEmpty();
    }

    public Iterable<DataSnapshot> getChildren() {
        final Iterator<zzamk> it = this.aYN.iterator();
        return new Iterable<DataSnapshot>() { // from class: com.google.firebase.database.DataSnapshot.1
            @Override // java.lang.Iterable
            public Iterator<DataSnapshot> iterator() {
                return new Iterator<DataSnapshot>() { // from class: com.google.firebase.database.DataSnapshot.1.1
                    @Override // java.util.Iterator
                    public boolean hasNext() {
                        return it.hasNext();
                    }

                    @Override // java.util.Iterator
                    public void remove() {
                        throw new UnsupportedOperationException("remove called on immutable collection");
                    }

                    @Override // java.util.Iterator
                    /* renamed from: zzcqv */
                    public DataSnapshot next() {
                        zzamk zzamkVar = (zzamk) it.next();
                        return new DataSnapshot(DataSnapshot.this.aYO.child(zzamkVar.a().asString()), zzamg.zzn(zzamkVar.zzcqy()));
                    }
                };
            }
        };
    }

    public long getChildrenCount() {
        return this.aYN.zzcqy().getChildCount();
    }

    public String getKey() {
        return this.aYO.getKey();
    }

    public Object getPriority() {
        Object value = this.aYN.zzcqy().zzczf().getValue();
        return value instanceof Long ? Double.valueOf(((Long) value).longValue()) : value;
    }

    public DatabaseReference getRef() {
        return this.aYO;
    }

    public Object getValue() {
        return this.aYN.zzcqy().getValue();
    }

    public <T> T getValue(GenericTypeIndicator<T> genericTypeIndicator) {
        return (T) zzanp.zza(this.aYN.zzcqy().getValue(), genericTypeIndicator);
    }

    public <T> T getValue(Class<T> cls) {
        return (T) zzanp.zza(this.aYN.zzcqy().getValue(), (Class<Object>) cls);
    }

    public Object getValue(boolean z) {
        return this.aYN.zzcqy().getValue(z);
    }

    public boolean hasChild(String str) {
        if (this.aYO.getParent() == null) {
            zzano.zztj(str);
        } else {
            zzano.zzti(str);
        }
        return !this.aYN.zzcqy().zzao(new zzajq(str)).isEmpty();
    }

    public boolean hasChildren() {
        return this.aYN.zzcqy().getChildCount() > 0;
    }

    public String toString() {
        String valueOf = String.valueOf(this.aYO.getKey());
        String valueOf2 = String.valueOf(this.aYN.zzcqy().getValue(true));
        return new StringBuilder(String.valueOf(valueOf).length() + 33 + String.valueOf(valueOf2).length()).append("DataSnapshot { key = ").append(valueOf).append(", value = ").append(valueOf2).append(" }").toString();
    }
}
