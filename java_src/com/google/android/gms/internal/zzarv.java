package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaru;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class zzarv<M extends zzaru<M>, T> {
    protected final Class<T> bkp;
    protected final boolean btH;
    public final int tag;
    protected final int type;

    private zzarv(int i, Class<T> cls, int i2, boolean z) {
        this.type = i;
        this.bkp = cls;
        this.tag = i2;
        this.btH = z;
    }

    public static <M extends zzaru<M>, T extends zzasa> zzarv<M, T> zza(int i, Class<T> cls, long j) {
        return new zzarv<>(i, cls, (int) j, false);
    }

    private T zzaz(List<zzasc> list) {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < list.size(); i++) {
            zzasc zzascVar = list.get(i);
            if (zzascVar.btQ.length != 0) {
                zza(zzascVar, arrayList);
            }
        }
        int size = arrayList.size();
        if (size == 0) {
            return null;
        }
        T cast = this.bkp.cast(Array.newInstance(this.bkp.getComponentType(), size));
        for (int i2 = 0; i2 < size; i2++) {
            Array.set(cast, i2, arrayList.get(i2));
        }
        return cast;
    }

    private T zzba(List<zzasc> list) {
        if (list.isEmpty()) {
            return null;
        }
        return this.bkp.cast(zzcm(zzars.zzbd(list.get(list.size() - 1).btQ)));
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zzarv)) {
            return false;
        }
        zzarv zzarvVar = (zzarv) obj;
        return this.type == zzarvVar.type && this.bkp == zzarvVar.bkp && this.tag == zzarvVar.tag && this.btH == zzarvVar.btH;
    }

    public int hashCode() {
        return (this.btH ? 1 : 0) + ((((((this.type + 1147) * 31) + this.bkp.hashCode()) * 31) + this.tag) * 31);
    }

    protected void zza(zzasc zzascVar, List<Object> list) {
        list.add(zzcm(zzars.zzbd(zzascVar.btQ)));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(Object obj, zzart zzartVar) throws IOException {
        if (this.btH) {
            zzc(obj, zzartVar);
        } else {
            zzb(obj, zzartVar);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final T zzay(List<zzasc> list) {
        if (list == null) {
            return null;
        }
        return this.btH ? zzaz(list) : zzba(list);
    }

    protected void zzb(Object obj, zzart zzartVar) {
        try {
            zzartVar.zzahd(this.tag);
            switch (this.type) {
                case 10:
                    int zzahl = zzasd.zzahl(this.tag);
                    zzartVar.zzb((zzasa) obj);
                    zzartVar.zzaj(zzahl, 4);
                    return;
                case 11:
                    zzartVar.zzc((zzasa) obj);
                    return;
                default:
                    throw new IllegalArgumentException(new StringBuilder(24).append("Unknown type ").append(this.type).toString());
            }
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    protected void zzc(Object obj, zzart zzartVar) {
        int length = Array.getLength(obj);
        for (int i = 0; i < length; i++) {
            Object obj2 = Array.get(obj, i);
            if (obj2 != null) {
                zzb(obj2, zzartVar);
            }
        }
    }

    protected Object zzcm(zzars zzarsVar) {
        Class<?> componentType = this.btH ? this.bkp.getComponentType() : this.bkp;
        try {
            switch (this.type) {
                case 10:
                    zzasa zzasaVar = (zzasa) componentType.newInstance();
                    zzarsVar.zza(zzasaVar, zzasd.zzahl(this.tag));
                    return zzasaVar;
                case 11:
                    zzasa zzasaVar2 = (zzasa) componentType.newInstance();
                    zzarsVar.zza(zzasaVar2);
                    return zzasaVar2;
                default:
                    throw new IllegalArgumentException(new StringBuilder(24).append("Unknown type ").append(this.type).toString());
            }
        } catch (IOException e) {
            throw new IllegalArgumentException("Error reading extension field", e);
        } catch (IllegalAccessException e2) {
            String valueOf = String.valueOf(componentType);
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 33).append("Error creating instance of class ").append(valueOf).toString(), e2);
        } catch (InstantiationException e3) {
            String valueOf2 = String.valueOf(componentType);
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf2).length() + 33).append("Error creating instance of class ").append(valueOf2).toString(), e3);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int zzct(Object obj) {
        return this.btH ? zzcu(obj) : zzcv(obj);
    }

    protected int zzcu(Object obj) {
        int i = 0;
        int length = Array.getLength(obj);
        for (int i2 = 0; i2 < length; i2++) {
            if (Array.get(obj, i2) != null) {
                i += zzcv(Array.get(obj, i2));
            }
        }
        return i;
    }

    protected int zzcv(Object obj) {
        int zzahl = zzasd.zzahl(this.tag);
        switch (this.type) {
            case 10:
                return zzart.zzb(zzahl, (zzasa) obj);
            case 11:
                return zzart.zzc(zzahl, (zzasa) obj);
            default:
                throw new IllegalArgumentException(new StringBuilder(24).append("Unknown type ").append(this.type).toString());
        }
    }
}
