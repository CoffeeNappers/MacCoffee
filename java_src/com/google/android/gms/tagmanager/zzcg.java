package com.google.android.gms.tagmanager;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;
import android.text.TextUtils;
import com.google.android.gms.tagmanager.zzdf;
import com.vkontakte.android.TimeUtils;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzcg implements zzaw {
    private static final String dw = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' INTEGER NOT NULL, '%s' TEXT NOT NULL,'%s' INTEGER NOT NULL);", "gtm_hits", "hit_id", "hit_time", "hit_url", "hit_first_send_time");
    private final zzb aFZ;
    private volatile zzad aGa;
    private final zzax aGb;
    private final String aGc;
    private long aGd;
    private final int aGe;
    private final Context mContext;
    private com.google.android.gms.common.util.zze zzaql;

    /* loaded from: classes2.dex */
    class zza implements zzdf.zza {
        zza() {
        }

        @Override // com.google.android.gms.tagmanager.zzdf.zza
        public void zza(zzas zzasVar) {
            zzcg.this.zzu(zzasVar.zzcfi());
        }

        @Override // com.google.android.gms.tagmanager.zzdf.zza
        public void zzb(zzas zzasVar) {
            zzcg.this.zzu(zzasVar.zzcfi());
            zzbo.v(new StringBuilder(57).append("Permanent failure dispatching hitId: ").append(zzasVar.zzcfi()).toString());
        }

        @Override // com.google.android.gms.tagmanager.zzdf.zza
        public void zzc(zzas zzasVar) {
            long zzcfj = zzasVar.zzcfj();
            if (zzcfj == 0) {
                zzcg.this.zzh(zzasVar.zzcfi(), zzcg.this.zzaql.currentTimeMillis());
            } else if (zzcfj + 14400000 >= zzcg.this.zzaql.currentTimeMillis()) {
            } else {
                zzcg.this.zzu(zzasVar.zzcfi());
                zzbo.v(new StringBuilder(47).append("Giving up on failed hitId: ").append(zzasVar.zzcfi()).toString());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class zzb extends SQLiteOpenHelper {
        private boolean aGg;
        private long aGh;

        zzb(Context context, String str) {
            super(context, str, (SQLiteDatabase.CursorFactory) null, 1);
            this.aGh = 0L;
        }

        /* JADX WARN: Removed duplicated region for block: B:22:0x0051  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private boolean zza(java.lang.String r11, android.database.sqlite.SQLiteDatabase r12) {
            /*
                r10 = this;
                r8 = 0
                r9 = 0
                java.lang.String r1 = "SQLITE_MASTER"
                r0 = 1
                java.lang.String[] r2 = new java.lang.String[r0]     // Catch: android.database.sqlite.SQLiteException -> L29 java.lang.Throwable -> L55
                r0 = 0
                java.lang.String r3 = "name"
                r2[r0] = r3     // Catch: android.database.sqlite.SQLiteException -> L29 java.lang.Throwable -> L55
                java.lang.String r3 = "name=?"
                r0 = 1
                java.lang.String[] r4 = new java.lang.String[r0]     // Catch: android.database.sqlite.SQLiteException -> L29 java.lang.Throwable -> L55
                r0 = 0
                r4[r0] = r11     // Catch: android.database.sqlite.SQLiteException -> L29 java.lang.Throwable -> L55
                r5 = 0
                r6 = 0
                r7 = 0
                r0 = r12
                android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: android.database.sqlite.SQLiteException -> L29 java.lang.Throwable -> L55
                boolean r0 = r1.moveToFirst()     // Catch: java.lang.Throwable -> L57 android.database.sqlite.SQLiteException -> L5a
                if (r1 == 0) goto L28
                r1.close()
            L28:
                return r0
            L29:
                r0 = move-exception
                r0 = r9
            L2b:
                java.lang.String r2 = "Error querying for table "
                java.lang.String r1 = java.lang.String.valueOf(r11)     // Catch: java.lang.Throwable -> L4c
                int r3 = r1.length()     // Catch: java.lang.Throwable -> L4c
                if (r3 == 0) goto L46
                java.lang.String r1 = r2.concat(r1)     // Catch: java.lang.Throwable -> L4c
            L3c:
                com.google.android.gms.tagmanager.zzbo.zzdi(r1)     // Catch: java.lang.Throwable -> L4c
                if (r0 == 0) goto L44
                r0.close()
            L44:
                r0 = r8
                goto L28
            L46:
                java.lang.String r1 = new java.lang.String     // Catch: java.lang.Throwable -> L4c
                r1.<init>(r2)     // Catch: java.lang.Throwable -> L4c
                goto L3c
            L4c:
                r1 = move-exception
                r9 = r0
                r0 = r1
            L4f:
                if (r9 == 0) goto L54
                r9.close()
            L54:
                throw r0
            L55:
                r0 = move-exception
                goto L4f
            L57:
                r0 = move-exception
                r9 = r1
                goto L4f
            L5a:
                r0 = move-exception
                r0 = r1
                goto L2b
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.zzcg.zzb.zza(java.lang.String, android.database.sqlite.SQLiteDatabase):boolean");
        }

        private void zzc(SQLiteDatabase sQLiteDatabase) {
            Cursor rawQuery = sQLiteDatabase.rawQuery("SELECT * FROM gtm_hits WHERE 0", null);
            HashSet hashSet = new HashSet();
            try {
                for (String str : rawQuery.getColumnNames()) {
                    hashSet.add(str);
                }
                rawQuery.close();
                if (!hashSet.remove("hit_id") || !hashSet.remove("hit_url") || !hashSet.remove("hit_time") || !hashSet.remove("hit_first_send_time")) {
                    throw new SQLiteException("Database column missing");
                }
                if (hashSet.isEmpty()) {
                    return;
                }
                throw new SQLiteException("Database has extra columns");
            } catch (Throwable th) {
                rawQuery.close();
                throw th;
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public SQLiteDatabase getWritableDatabase() {
            if (!this.aGg || this.aGh + TimeUtils.HOUR <= zzcg.this.zzaql.currentTimeMillis()) {
                SQLiteDatabase sQLiteDatabase = null;
                this.aGg = true;
                this.aGh = zzcg.this.zzaql.currentTimeMillis();
                try {
                    sQLiteDatabase = super.getWritableDatabase();
                } catch (SQLiteException e) {
                    zzcg.this.mContext.getDatabasePath(zzcg.this.aGc).delete();
                }
                if (sQLiteDatabase == null) {
                    sQLiteDatabase = super.getWritableDatabase();
                }
                this.aGg = false;
                return sQLiteDatabase;
            }
            throw new SQLiteException("Database creation failed");
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            zzan.zzfd(sQLiteDatabase.getPath());
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onOpen(SQLiteDatabase sQLiteDatabase) {
            if (Build.VERSION.SDK_INT < 15) {
                Cursor rawQuery = sQLiteDatabase.rawQuery("PRAGMA journal_mode=memory", null);
                try {
                    rawQuery.moveToFirst();
                } finally {
                    rawQuery.close();
                }
            }
            if (!zza("gtm_hits", sQLiteDatabase)) {
                sQLiteDatabase.execSQL(zzcg.dw);
            } else {
                zzc(sQLiteDatabase);
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzcg(zzax zzaxVar, Context context) {
        this(zzaxVar, context, "gtm_urls.db", 2000);
    }

    zzcg(zzax zzaxVar, Context context, String str, int i) {
        this.mContext = context.getApplicationContext();
        this.aGc = str;
        this.aGb = zzaxVar;
        this.zzaql = com.google.android.gms.common.util.zzh.zzayl();
        this.aFZ = new zzb(this.mContext, this.aGc);
        this.aGa = new zzdf(this.mContext, new zza());
        this.aGd = 0L;
        this.aGe = i;
    }

    private void zzcfv() {
        int zzcfw = (zzcfw() - this.aGe) + 1;
        if (zzcfw > 0) {
            List<String> zzaag = zzaag(zzcfw);
            zzbo.v(new StringBuilder(51).append("Store full, deleting ").append(zzaag.size()).append(" hits to make room.").toString());
            zzh((String[]) zzaag.toArray(new String[0]));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzh(long j, long j2) {
        SQLiteDatabase zzpf = zzpf("Error opening database for getNumStoredHits.");
        if (zzpf == null) {
            return;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("hit_first_send_time", Long.valueOf(j2));
        try {
            zzpf.update("gtm_hits", contentValues, "hit_id=?", new String[]{String.valueOf(j)});
        } catch (SQLiteException e) {
            zzbo.zzdi(new StringBuilder(69).append("Error setting HIT_FIRST_DISPATCH_TIME for hitId: ").append(j).toString());
            zzu(j);
        }
    }

    private void zzh(long j, String str) {
        SQLiteDatabase zzpf = zzpf("Error opening database for putHit");
        if (zzpf == null) {
            return;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("hit_time", Long.valueOf(j));
        contentValues.put("hit_url", str);
        contentValues.put("hit_first_send_time", (Integer) 0);
        try {
            zzpf.insert("gtm_hits", null, contentValues);
            this.aGb.zzcn(false);
        } catch (SQLiteException e) {
            zzbo.zzdi("Error storing hit");
        }
    }

    private SQLiteDatabase zzpf(String str) {
        try {
            return this.aFZ.getWritableDatabase();
        } catch (SQLiteException e) {
            zzbo.zzdi(str);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzu(long j) {
        zzh(new String[]{String.valueOf(j)});
    }

    @Override // com.google.android.gms.tagmanager.zzaw
    public void dispatch() {
        zzbo.v("GTM Dispatch running...");
        if (!this.aGa.zzcez()) {
            return;
        }
        List<zzas> zzaah = zzaah(40);
        if (zzaah.isEmpty()) {
            zzbo.v("...nothing to dispatch");
            this.aGb.zzcn(true);
            return;
        }
        this.aGa.zzal(zzaah);
        if (zzcfx() <= 0) {
            return;
        }
        zzdc.zzcgt().dispatch();
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x005d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    java.util.List<java.lang.String> zzaag(int r14) {
        /*
            r13 = this;
            r10 = 0
            java.util.ArrayList r9 = new java.util.ArrayList
            r9.<init>()
            if (r14 > 0) goto L10
            java.lang.String r0 = "Invalid maxHits specified. Skipping"
            com.google.android.gms.tagmanager.zzbo.zzdi(r0)
            r0 = r9
        Lf:
            return r0
        L10:
            java.lang.String r0 = "Error opening database for peekHitIds."
            android.database.sqlite.SQLiteDatabase r0 = r13.zzpf(r0)
            if (r0 != 0) goto L1b
            r0 = r9
            goto Lf
        L1b:
            java.lang.String r1 = "gtm_hits"
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L8f
            r3 = 0
            java.lang.String r4 = "hit_id"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L8f
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "%s ASC"
            r8 = 1
            java.lang.Object[] r8 = new java.lang.Object[r8]     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L8f
            r11 = 0
            java.lang.String r12 = "hit_id"
            r8[r11] = r12     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L8f
            java.lang.String r7 = java.lang.String.format(r7, r8)     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L8f
            java.lang.String r8 = java.lang.Integer.toString(r14)     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L8f
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L8f
            boolean r0 = r1.moveToFirst()     // Catch: java.lang.Throwable -> L88 android.database.sqlite.SQLiteException -> L92
            if (r0 == 0) goto L5b
        L49:
            r0 = 0
            long r2 = r1.getLong(r0)     // Catch: java.lang.Throwable -> L88 android.database.sqlite.SQLiteException -> L92
            java.lang.String r0 = java.lang.String.valueOf(r2)     // Catch: java.lang.Throwable -> L88 android.database.sqlite.SQLiteException -> L92
            r9.add(r0)     // Catch: java.lang.Throwable -> L88 android.database.sqlite.SQLiteException -> L92
            boolean r0 = r1.moveToNext()     // Catch: java.lang.Throwable -> L88 android.database.sqlite.SQLiteException -> L92
            if (r0 != 0) goto L49
        L5b:
            if (r1 == 0) goto L60
            r1.close()
        L60:
            r0 = r9
            goto Lf
        L62:
            r0 = move-exception
            r1 = r10
        L64:
            java.lang.String r2 = "Error in peekHits fetching hitIds: "
            java.lang.String r0 = r0.getMessage()     // Catch: java.lang.Throwable -> L88
            java.lang.String r0 = java.lang.String.valueOf(r0)     // Catch: java.lang.Throwable -> L88
            int r3 = r0.length()     // Catch: java.lang.Throwable -> L88
            if (r3 == 0) goto L82
            java.lang.String r0 = r2.concat(r0)     // Catch: java.lang.Throwable -> L88
        L79:
            com.google.android.gms.tagmanager.zzbo.zzdi(r0)     // Catch: java.lang.Throwable -> L88
            if (r1 == 0) goto L60
            r1.close()
            goto L60
        L82:
            java.lang.String r0 = new java.lang.String     // Catch: java.lang.Throwable -> L88
            r0.<init>(r2)     // Catch: java.lang.Throwable -> L88
            goto L79
        L88:
            r0 = move-exception
        L89:
            if (r1 == 0) goto L8e
            r1.close()
        L8e:
            throw r0
        L8f:
            r0 = move-exception
            r1 = r10
            goto L89
        L92:
            r0 = move-exception
            goto L64
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.zzcg.zzaag(int):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00d0  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0103  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.google.android.gms.tagmanager.zzas> zzaah(int r17) {
        /*
            Method dump skipped, instructions count: 407
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.zzcg.zzaah(int):java.util.List");
    }

    int zzadb() {
        boolean z = true;
        long currentTimeMillis = this.zzaql.currentTimeMillis();
        if (currentTimeMillis <= this.aGd + TimeUtils.DAY) {
            return 0;
        }
        this.aGd = currentTimeMillis;
        SQLiteDatabase zzpf = zzpf("Error opening database for deleteStaleHits.");
        if (zzpf == null) {
            return 0;
        }
        int delete = zzpf.delete("gtm_hits", "HIT_TIME < ?", new String[]{Long.toString(this.zzaql.currentTimeMillis() - TimeUtils.MONTH)});
        zzax zzaxVar = this.aGb;
        if (zzcfw() != 0) {
            z = false;
        }
        zzaxVar.zzcn(z);
        return delete;
    }

    int zzcfw() {
        Cursor cursor = null;
        int i = 0;
        SQLiteDatabase zzpf = zzpf("Error opening database for getNumStoredHits.");
        try {
            if (zzpf != null) {
                try {
                    cursor = zzpf.rawQuery("SELECT COUNT(*) from gtm_hits", null);
                    if (cursor.moveToFirst()) {
                        i = (int) cursor.getLong(0);
                    }
                    if (cursor != null) {
                        cursor.close();
                    }
                } catch (SQLiteException e) {
                    zzbo.zzdi("Error getting numStoredHits");
                    if (cursor != null) {
                        cursor.close();
                    }
                }
            }
            return i;
        } catch (Throwable th) {
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0046  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    int zzcfx() {
        /*
            r10 = this;
            r8 = 0
            r9 = 0
            java.lang.String r0 = "Error opening database for getNumStoredHits."
            android.database.sqlite.SQLiteDatabase r0 = r10.zzpf(r0)
            if (r0 != 0) goto Lc
        Lb:
            return r8
        Lc:
            java.lang.String r1 = "gtm_hits"
            r2 = 2
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: android.database.sqlite.SQLiteException -> L34 java.lang.Throwable -> L43
            r3 = 0
            java.lang.String r4 = "hit_id"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L34 java.lang.Throwable -> L43
            r3 = 1
            java.lang.String r4 = "hit_first_send_time"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L34 java.lang.Throwable -> L43
            java.lang.String r3 = "hit_first_send_time=0"
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: android.database.sqlite.SQLiteException -> L34 java.lang.Throwable -> L43
            int r0 = r1.getCount()     // Catch: java.lang.Throwable -> L4a android.database.sqlite.SQLiteException -> L51
            if (r1 == 0) goto L32
            r1.close()
        L32:
            r8 = r0
            goto Lb
        L34:
            r0 = move-exception
            r0 = r9
        L36:
            java.lang.String r1 = "Error getting num untried hits"
            com.google.android.gms.tagmanager.zzbo.zzdi(r1)     // Catch: java.lang.Throwable -> L4d
            if (r0 == 0) goto L54
            r0.close()
            r0 = r8
            goto L32
        L43:
            r0 = move-exception
        L44:
            if (r9 == 0) goto L49
            r9.close()
        L49:
            throw r0
        L4a:
            r0 = move-exception
            r9 = r1
            goto L44
        L4d:
            r1 = move-exception
            r9 = r0
            r0 = r1
            goto L44
        L51:
            r0 = move-exception
            r0 = r1
            goto L36
        L54:
            r0 = r8
            goto L32
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.zzcg.zzcfx():int");
    }

    @Override // com.google.android.gms.tagmanager.zzaw
    public void zzg(long j, String str) {
        zzadb();
        zzcfv();
        zzh(j, str);
    }

    void zzh(String[] strArr) {
        SQLiteDatabase zzpf;
        boolean z = true;
        if (strArr == null || strArr.length == 0 || (zzpf = zzpf("Error opening database for deleteHits.")) == null) {
            return;
        }
        try {
            zzpf.delete("gtm_hits", String.format("HIT_ID in (%s)", TextUtils.join(",", Collections.nCopies(strArr.length, "?"))), strArr);
            zzax zzaxVar = this.aGb;
            if (zzcfw() != 0) {
                z = false;
            }
            zzaxVar.zzcn(z);
        } catch (SQLiteException e) {
            zzbo.zzdi("Error deleting hits");
        }
    }
}
