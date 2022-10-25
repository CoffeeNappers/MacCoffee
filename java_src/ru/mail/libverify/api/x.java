package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import ru.mail.libverify.api.VerificationApi;
import ru.mail.libverify.api.w;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class x implements w {
    private volatile ConcurrentHashMap<String, ae> a;
    private final y d;
    private final LinkedList<ae> b = new LinkedList<>();
    private final ConcurrentHashMap<String, ae> c = new ConcurrentHashMap<>();
    private final Runnable e = new Runnable() { // from class: ru.mail.libverify.api.x.1
        @Override // java.lang.Runnable
        public final void run() {
            x.this.e();
        }
    };

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: ru.mail.libverify.api.x$2  reason: invalid class name */
    /* loaded from: classes3.dex */
    public static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] a = new int[w.a.a().length];

        static {
            try {
                a[w.a.a - 1] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                a[w.a.b - 1] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                a[w.a.c - 1] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public x(@NonNull y yVar) {
        this.d = yVar;
    }

    private boolean b(@NonNull String str, int i) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        g();
        switch (AnonymousClass2.a[i - 1]) {
            case 1:
                return this.a.containsKey(str) || this.c.containsKey(str);
            case 2:
                return this.c.containsKey(str);
            case 3:
                return this.a.containsKey(str);
            default:
                throw new IllegalArgumentException();
        }
    }

    private void f() {
        this.d.a().removeCallbacks(this.e);
        this.d.a().postDelayed(this.e, 300L);
    }

    private void g() {
        if (this.a == null) {
            synchronized (this) {
                if (this.a == null) {
                    this.a = new ConcurrentHashMap<>();
                    String a = this.d.c().a("api_verification_sessions_data");
                    if (!TextUtils.isEmpty(a)) {
                        for (String str : ru.mail.libverify.utils.json.a.b(a, String.class)) {
                            if (!TextUtils.isEmpty(str)) {
                                ae a2 = this.d.b().a(str);
                                long currentTimeMillis = System.currentTimeMillis() - a2.j();
                                if (!(currentTimeMillis < 0 || currentTimeMillis > 43200000)) {
                                    this.a.put(a2.g(), a2);
                                    this.d.a(a2);
                                } else {
                                    this.d.b(a2);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @Override // ru.mail.libverify.api.w
    public final Collection<ae> a(int i) {
        g();
        switch (AnonymousClass2.a[i - 1]) {
            case 1:
                ArrayList arrayList = new ArrayList(this.a.values());
                arrayList.addAll(this.c.values());
                return arrayList;
            case 2:
                return this.c.values();
            case 3:
                return this.a.values();
            default:
                throw new IllegalArgumentException();
        }
    }

    @Override // ru.mail.libverify.api.w
    public final ae a(@NonNull String str) {
        return a(str, w.a.a);
    }

    @Override // ru.mail.libverify.api.w
    public final ae a(@NonNull String str, int i) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        g();
        switch (AnonymousClass2.a[i - 1]) {
            case 1:
                ae aeVar = this.a.get(str);
                return aeVar == null ? this.c.get(str) : aeVar;
            case 2:
                return this.c.get(str);
            case 3:
                return this.a.get(str);
            default:
                throw new IllegalArgumentException();
        }
    }

    @Override // ru.mail.libverify.api.w
    public final ae a(@NonNull String str, @NonNull ae aeVar) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        g();
        ae put = this.a.put(str, aeVar);
        if (put != null) {
            return put;
        }
        ru.mail.libverify.utils.d.c("SessionContainer", "session with id = %s added", str);
        this.d.a(aeVar);
        f();
        return put;
    }

    @Override // ru.mail.libverify.api.w
    public final boolean a() {
        g();
        return this.a.isEmpty() && this.c.isEmpty();
    }

    @Override // ru.mail.libverify.api.w
    public final int b() {
        g();
        return this.a.size() + this.c.size();
    }

    @Override // ru.mail.libverify.api.w
    public final List<String> b(int i) {
        ArrayList<ae> arrayList;
        g();
        ArrayList arrayList2 = new ArrayList();
        switch (AnonymousClass2.a[i - 1]) {
            case 1:
                arrayList = new ArrayList(this.a.values());
                arrayList.addAll(this.c.values());
                break;
            case 2:
                arrayList = new ArrayList(this.c.values());
                break;
            case 3:
                arrayList = new ArrayList(this.a.values());
                break;
            default:
                throw new IllegalArgumentException();
        }
        for (ae aeVar : arrayList) {
            arrayList2.add(aeVar.g());
        }
        return arrayList2;
    }

    @Override // ru.mail.libverify.api.w
    public final boolean b(@NonNull String str) {
        return b(str, w.a.a);
    }

    @Override // ru.mail.libverify.api.w
    public final void c() {
        if (this.a == null) {
            return;
        }
        for (ae aeVar : this.a.values()) {
            aeVar.b();
        }
        this.c.clear();
        this.b.clear();
        this.b.addAll(this.a.values());
        this.a.clear();
        e();
    }

    @Override // ru.mail.libverify.api.w
    public final boolean c(@NonNull String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        g();
        boolean containsKey = this.a.containsKey(str);
        if (containsKey) {
            ru.mail.libverify.utils.d.c("SessionContainer", "session with id = %s touched", str);
            f();
        }
        return containsKey;
    }

    @Override // ru.mail.libverify.api.w
    public final ae d(@NonNull String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        g();
        ae remove = this.a.remove(str);
        if (remove == null) {
            remove = this.c.remove(str);
        }
        if (remove == null) {
            return remove;
        }
        ru.mail.libverify.utils.d.c("SessionContainer", "session with id = %s removed", str);
        this.b.add(remove);
        f();
        return remove;
    }

    @Override // ru.mail.libverify.api.w
    public final boolean d() {
        g();
        for (ae aeVar : new ArrayList(this.a.values())) {
            if (aeVar.i().getState() != VerificationApi.VerificationState.FINAL) {
                return true;
            }
        }
        for (ae aeVar2 : new ArrayList(this.c.values())) {
            if (aeVar2.i().getState() != VerificationApi.VerificationState.FINAL) {
                return true;
            }
        }
        return false;
    }

    @Override // ru.mail.libverify.api.w
    public final ae e(@NonNull String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        g();
        ae remove = this.a.remove(str);
        if (remove == null) {
            return remove;
        }
        ru.mail.libverify.utils.d.c("SessionContainer", "session with id = %s marked as temporary", str);
        this.c.put(str, remove);
        this.b.add(remove);
        f();
        return remove;
    }

    final void e() {
        if (this.a == null) {
            return;
        }
        try {
            if (this.a.isEmpty()) {
                this.d.c().a("api_verification_sessions_data", "").a();
            } else {
                ArrayList arrayList = new ArrayList();
                for (ae aeVar : this.a.values()) {
                    arrayList.add(aeVar.h());
                }
                this.d.c().a("api_verification_sessions_data", ru.mail.libverify.utils.json.a.a(arrayList)).a();
            }
        } catch (Exception e) {
            ru.mail.libverify.utils.c.a("SessionContainer", "Failed to save sessions", e);
        }
        Iterator<ae> it = this.b.iterator();
        while (it.hasNext()) {
            ae next = it.next();
            if (!this.c.containsKey(next.g())) {
                this.d.b(next);
            }
        }
        this.b.clear();
    }
}
