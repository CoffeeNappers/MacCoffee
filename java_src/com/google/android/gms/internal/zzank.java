package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzank<T, U> {
    private final T first;
    private final U second;

    public zzank(T t, U u) {
        this.first = t;
        this.second = u;
    }

    public U A() {
        return this.second;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        zzank zzankVar = (zzank) obj;
        if (this.first == null ? zzankVar.first != null : !this.first.equals(zzankVar.first)) {
            return false;
        }
        if (this.second != null) {
            if (this.second.equals(zzankVar.second)) {
                return true;
            }
        } else if (zzankVar.second == null) {
            return true;
        }
        return false;
    }

    public T getFirst() {
        return this.first;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = (this.first != null ? this.first.hashCode() : 0) * 31;
        if (this.second != null) {
            i = this.second.hashCode();
        }
        return hashCode + i;
    }

    public String toString() {
        String valueOf = String.valueOf(this.first);
        String valueOf2 = String.valueOf(this.second);
        return new StringBuilder(String.valueOf(valueOf).length() + 7 + String.valueOf(valueOf2).length()).append("Pair(").append(valueOf).append(",").append(valueOf2).append(")").toString();
    }
}
