package ru.mail.libverify.sms;

import android.content.ContentResolver;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.v4.util.LongSparseArray;
import android.text.TextUtils;
import android.util.SparseArray;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import ru.mail.libverify.sms.k;
/* loaded from: classes3.dex */
public final class m implements k {
    static final Pattern a = Pattern.compile(".*", 32);
    static final Pattern b = Pattern.compile("content://sms/[0-9]+");
    private final ContentResolver d;
    private final l e;
    private long f;
    private Map<c, List<k.f>> c = new LinkedHashMap();
    private String[] g = {"_id", ServerKeys.TYPE, "address", TtmlNode.TAG_BODY};
    private String h = "_id ASC";
    private LongSparseArray<b> i = new a();

    /* loaded from: classes3.dex */
    private static class a<T> extends LongSparseArray<T> {
        private final int a = 128;

        @Override // android.support.v4.util.LongSparseArray
        public final void put(long j, T t) {
            if (size() == this.a && get(j) == null) {
                removeAt(0);
            }
            super.put(j, t);
        }

        @Override // android.support.v4.util.LongSparseArray
        public final String toString() {
            String str = "{";
            int i = 0;
            while (i < size()) {
                if (i > 0) {
                    str = str + ", ";
                }
                String str2 = str + (keyAt(i) + ":" + valueAt(i));
                i++;
                str = str2;
            }
            return str + "}";
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public enum b {
        INBOX { // from class: ru.mail.libverify.sms.m.b.1
            @Override // ru.mail.libverify.sms.m.b
            public final void a(m mVar, ru.mail.libverify.sms.b bVar) {
                ru.mail.libverify.utils.d.c("SmsManager", ">>> onReceived(%s)", bVar);
                m.a(mVar, bVar);
            }
        },
        SENT { // from class: ru.mail.libverify.sms.m.b.2
            @Override // ru.mail.libverify.sms.m.b
            public final void a(m mVar, ru.mail.libverify.sms.b bVar) {
                ru.mail.libverify.utils.d.c("SmsManager", ">>> onSent(%s)", bVar);
                m.b(mVar, bVar);
            }
        },
        DRAFT(3),
        OUTBOX { // from class: ru.mail.libverify.sms.m.b.3
            @Override // ru.mail.libverify.sms.m.b
            public final void a(m mVar, ru.mail.libverify.sms.b bVar) {
                ru.mail.libverify.utils.d.c("SmsManager", ">>> onSending(%s)", bVar);
                m.c(mVar, bVar);
            }
        },
        FAILED { // from class: ru.mail.libverify.sms.m.b.4
            @Override // ru.mail.libverify.sms.m.b
            public final void a(m mVar, ru.mail.libverify.sms.b bVar) {
                ru.mail.libverify.utils.d.c("SmsManager", ">>> onSendingFailed(%s)", bVar);
                m.d(mVar, bVar);
            }
        },
        QUEUED(6),
        UNKNOWN(-1);
        
        private static final SparseArray<b> values = new SparseArray<b>() { // from class: ru.mail.libverify.sms.m.b.5
            {
                b[] values2;
                for (b bVar : b.values()) {
                    put(bVar.mCode, bVar);
                }
            }
        };
        private final int mCode;

        b(int i) {
            this.mCode = i;
        }

        /* synthetic */ b(int i, byte b) {
            this(i);
        }

        public static b a(int i) {
            b bVar = values.get(i);
            return bVar == null ? UNKNOWN : bVar;
        }

        public void a(m mVar, ru.mail.libverify.sms.b bVar) {
            ru.mail.libverify.utils.d.c("SmsManager", ">>> Unprocessable message type: %s", bVar.b);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class c {
        final Pattern a;
        final Pattern b;
        final String c;
        final String d;

        private c(Pattern pattern, Pattern pattern2) {
            this.b = pattern;
            this.a = pattern2;
            this.c = this.a.pattern();
            this.d = this.b.pattern();
        }

        /* synthetic */ c(Pattern pattern, Pattern pattern2, byte b) {
            this(pattern, pattern2);
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            c cVar = (c) obj;
            return this.d.equals(cVar.d) && this.c.equals(cVar.c);
        }

        public final int hashCode() {
            return (this.c.hashCode() * 31) + this.d.hashCode();
        }
    }

    /* loaded from: classes3.dex */
    private class d extends ContentObserver {
        public d(Handler handler) {
            super(handler);
        }

        @Override // android.database.ContentObserver
        public final void onChange(boolean z) {
            onChange(z, null);
        }

        @Override // android.database.ContentObserver
        public final void onChange(boolean z, Uri uri) {
            m.a(m.this, uri);
        }
    }

    public m(@NonNull l lVar) {
        boolean z = true;
        this.e = lVar;
        this.d = lVar.b().getContentResolver();
        if (!ru.mail.libverify.utils.m.b(this.e.b(), "android.permission.READ_SMS")) {
            ru.mail.libverify.utils.d.a("SmsManager", "can't init SmsManager without %s", "android.permission.READ_SMS");
        } else {
            z = false;
        }
        if (z) {
            return;
        }
        d();
        b();
        try {
            this.d.registerContentObserver(ru.mail.libverify.sms.a.a, true, new d(new Handler()));
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("SmsManager", "start error", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<ru.mail.libverify.sms.b> a(long j) {
        Cursor cursor;
        if (this.i.size() > 0) {
            j = this.i.keyAt(0) - 1;
        }
        try {
            cursor = this.d.query(ru.mail.libverify.sms.a.a, this.g, "_id > " + j, null, this.h);
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("SmsManager", "getLastMessages error", e);
            cursor = null;
        }
        if (cursor == null) {
            return Collections.emptyList();
        }
        try {
            ArrayList arrayList = new ArrayList();
            f fVar = new f(cursor);
            while (fVar.a()) {
                ru.mail.libverify.sms.b b2 = fVar.b();
                if (this.i.get(b2.a) != b2.b) {
                    arrayList.add(b2);
                    a(b2);
                }
            }
            return arrayList;
        } finally {
            cursor.close();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public e a(Pattern pattern, Pattern pattern2, final k.f fVar) {
        final c cVar = new c(pattern, pattern2, (byte) 0);
        synchronized (this) {
            List<k.f> list = this.c.get(cVar);
            if (list == null) {
                list = new ArrayList<>();
                this.c.put(cVar, list);
            }
            list.add(fVar);
        }
        return new e() { // from class: ru.mail.libverify.sms.m.2
            boolean a = false;

            @Override // ru.mail.libverify.sms.e
            public final void a() {
                if (this.a) {
                    ru.mail.libverify.utils.c.a("SmsManager", "listener unregister", new IllegalStateException("This cord is already unregistered"));
                    return;
                }
                synchronized (m.this) {
                    List list2 = (List) m.this.c.get(cVar);
                    list2.remove(fVar);
                    if (list2.isEmpty()) {
                        m.this.c.remove(cVar);
                    }
                }
            }
        };
    }

    private void a(Uri uri) {
        String uri2 = uri.toString();
        try {
            this.i.remove(Long.parseLong(uri2.substring(uri2.lastIndexOf(47) + 1)));
        } catch (IndexOutOfBoundsException e) {
            ru.mail.libverify.utils.c.a("SmsManager", "untrackMessage", e);
        } catch (NumberFormatException e2) {
            ru.mail.libverify.utils.c.a("SmsManager", "untrackMessage", new Exception(uri.toString(), e2));
        }
    }

    private void a(ru.mail.libverify.sms.b bVar) {
        this.i.put(bVar.a, bVar.b);
    }

    static /* synthetic */ void a(m mVar, long j) {
        while (mVar.i.size() > 0 && mVar.i.keyAt(mVar.i.size() - 1) > j) {
            mVar.i.removeAt(mVar.i.size() - 1);
        }
    }

    static /* synthetic */ void a(m mVar, final Uri uri) {
        ru.mail.libverify.utils.d.c("SmsManager", "Got some message folder change: uri=%s", uri);
        mVar.e.a().post(new Runnable() { // from class: ru.mail.libverify.sms.m.3
            @Override // java.lang.Runnable
            public final void run() {
                long j = m.this.f;
                m.this.d();
                ru.mail.libverify.utils.d.c("SmsManager", "last id: %s -> %s", Long.valueOf(j), Long.valueOf(m.this.f));
                if (m.this.f < j) {
                    ru.mail.libverify.utils.d.c("SmsManager", "last message ID was decreased (SMS deleted)");
                    m.a(m.this, m.this.f);
                } else if (!m.this.c.isEmpty()) {
                    if (uri == null) {
                        List<ru.mail.libverify.sms.b> a2 = m.this.a(j);
                        ru.mail.libverify.utils.d.c("SmsManager", "Got %s message(s), have some listeners.", Integer.valueOf(a2.size()));
                        for (ru.mail.libverify.sms.b bVar : a2) {
                            bVar.b.a(m.this, bVar);
                        }
                    } else if (!m.b.matcher(uri.toString()).matches()) {
                        ru.mail.libverify.utils.d.c("SmsManager", "Skip unwanted URI: " + uri.toString());
                    } else {
                        ru.mail.libverify.sms.b b2 = m.this.b(uri);
                        if (b2 == null) {
                            ru.mail.libverify.utils.d.c("SmsManager", "There is no message for %s (deleted?)", uri);
                            return;
                        }
                        ru.mail.libverify.utils.d.c("SmsManager", "Got message, have some listeners.");
                        b2.b.a(m.this, b2);
                    }
                }
            }
        });
    }

    static /* synthetic */ void a(m mVar, ru.mail.libverify.sms.b bVar) {
        for (k.f fVar : mVar.b(bVar)) {
            fVar.a(bVar);
        }
    }

    private List<k.f> b(ru.mail.libverify.sms.b bVar) {
        ArrayList arrayList = new ArrayList();
        if (!TextUtils.isEmpty(bVar.c) && !TextUtils.isEmpty(bVar.d)) {
            synchronized (this) {
                for (Map.Entry<c, List<k.f>> entry : this.c.entrySet()) {
                    c key = entry.getKey();
                    if (key.b.matcher(bVar.c).matches() && key.a.matcher(bVar.d).matches()) {
                        arrayList.addAll(entry.getValue());
                    }
                }
            }
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ru.mail.libverify.sms.b b(Uri uri) {
        Cursor cursor;
        try {
            cursor = this.d.query(uri, this.g, null, null, this.h);
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("SmsManager", "getLastMessages error", e);
            cursor = null;
        }
        try {
        } catch (Exception e2) {
            ru.mail.libverify.utils.d.a("SmsManager", "getMessage error", e2);
        } finally {
            cursor.close();
        }
        if (cursor == null) {
            a(uri);
            return null;
        }
        f fVar = new f(cursor);
        if (fVar.a.moveToFirst()) {
            ru.mail.libverify.sms.b b2 = fVar.b();
            if (this.i.get(b2.a) != b2.b) {
                a(b2);
                return b2;
            }
        } else {
            a(uri);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0045  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void b() {
        /*
            r7 = this;
            r6 = 0
            java.lang.String r5 = "_id DESC LIMIT 128"
            android.content.ContentResolver r0 = r7.d     // Catch: java.lang.Throwable -> L41 java.lang.Exception -> L4b
            android.net.Uri r1 = ru.mail.libverify.sms.a.a     // Catch: java.lang.Throwable -> L41 java.lang.Exception -> L4b
            java.lang.String[] r2 = r7.g     // Catch: java.lang.Throwable -> L41 java.lang.Exception -> L4b
            r3 = 0
            r4 = 0
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5)     // Catch: java.lang.Throwable -> L41 java.lang.Exception -> L4b
            if (r1 != 0) goto L18
            if (r1 == 0) goto L17
            r1.close()
        L17:
            return
        L18:
            ru.mail.libverify.sms.f r0 = new ru.mail.libverify.sms.f     // Catch: java.lang.Exception -> L2b java.lang.Throwable -> L49
            r0.<init>(r1)     // Catch: java.lang.Exception -> L2b java.lang.Throwable -> L49
        L1d:
            boolean r2 = r0.a()     // Catch: java.lang.Exception -> L2b java.lang.Throwable -> L49
            if (r2 == 0) goto L3b
            ru.mail.libverify.sms.b r2 = r0.b()     // Catch: java.lang.Exception -> L2b java.lang.Throwable -> L49
            r7.a(r2)     // Catch: java.lang.Exception -> L2b java.lang.Throwable -> L49
            goto L1d
        L2b:
            r0 = move-exception
        L2c:
            java.lang.String r2 = "SmsManager"
            java.lang.String r3 = "prefillKnownMessages error"
            ru.mail.libverify.utils.d.a(r2, r3, r0)     // Catch: java.lang.Throwable -> L49
            if (r1 == 0) goto L17
            r1.close()
            goto L17
        L3b:
            if (r1 == 0) goto L17
            r1.close()
            goto L17
        L41:
            r0 = move-exception
            r1 = r6
        L43:
            if (r1 == 0) goto L48
            r1.close()
        L48:
            throw r0
        L49:
            r0 = move-exception
            goto L43
        L4b:
            r0 = move-exception
            r1 = r6
            goto L2c
        */
        throw new UnsupportedOperationException("Method not decompiled: ru.mail.libverify.sms.m.b():void");
    }

    static /* synthetic */ void b(m mVar, ru.mail.libverify.sms.b bVar) {
        Iterator<k.f> it = mVar.b(bVar).iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private long c() {
        Cursor query;
        try {
            query = this.d.query(ru.mail.libverify.sms.a.a, new String[]{"_id"}, null, null, "_id DESC LIMIT 1");
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("SmsManager", "obtainLastSmsId error", e);
        }
        if (query == null || !query.moveToFirst()) {
            if (query != null) {
                query.close();
            }
            return -1L;
        }
        long j = query.getLong(query.getColumnIndex("_id"));
        if (query == null) {
            return j;
        }
        query.close();
        return j;
    }

    static /* synthetic */ void c(m mVar, ru.mail.libverify.sms.b bVar) {
        Iterator<k.f> it = mVar.b(bVar).iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void d() {
        this.f = c();
    }

    static /* synthetic */ void d(m mVar, ru.mail.libverify.sms.b bVar) {
        Iterator<k.f> it = mVar.b(bVar).iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    @Override // ru.mail.libverify.sms.k
    public final i a() {
        return new i(new j() { // from class: ru.mail.libverify.sms.m.1
            @Override // ru.mail.libverify.sms.j
            public final e a(Pattern pattern, Pattern pattern2, k.f fVar) {
                return m.this.a(pattern, pattern2, fVar);
            }
        });
    }
}
