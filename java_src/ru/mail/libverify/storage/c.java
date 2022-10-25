package ru.mail.libverify.storage;
/* loaded from: classes3.dex */
abstract class c {
    private final a a;

    /* loaded from: classes3.dex */
    interface a {
        o a();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public c(a aVar) {
        this.a = aVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract String a();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract String b();

    /* JADX INFO: Access modifiers changed from: protected */
    public final o c() {
        return this.a.a();
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        c cVar = (c) obj;
        if (a() == null ? cVar.a() != null : !a().equals(cVar.a())) {
            return false;
        }
        return b() != null ? b().equals(cVar.b()) : cVar.b() == null;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = (a() != null ? a().hashCode() : 0) * 31;
        if (b() != null) {
            i = b().hashCode();
        }
        return hashCode + i;
    }
}
