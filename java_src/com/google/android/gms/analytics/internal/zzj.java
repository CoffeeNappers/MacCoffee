package com.google.android.gms.analytics.internal;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.TimeUtils;
import java.io.Closeable;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class zzj extends zzd implements Closeable {
    private static final String dw = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' INTEGER NOT NULL, '%s' TEXT NOT NULL, '%s' TEXT NOT NULL, '%s' INTEGER);", "hits2", "hit_id", "hit_time", "hit_url", "hit_string", "hit_app_id");
    private static final String dx = String.format("SELECT MAX(%s) FROM %s WHERE 1;", "hit_time", "hits2");
    private final zzal dA;
    private final zza dy;
    private final zzal dz;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class zza extends SQLiteOpenHelper {
        zza(Context context, String str) {
            super(context, str, (SQLiteDatabase.CursorFactory) null, 1);
        }

        private void zza(SQLiteDatabase sQLiteDatabase) {
            boolean z = true;
            Set<String> zzb = zzb(sQLiteDatabase, "hits2");
            String[] strArr = {"hit_id", "hit_string", "hit_time", "hit_url"};
            for (int i = 0; i < 4; i++) {
                String str = strArr[i];
                if (!zzb.remove(str)) {
                    String valueOf = String.valueOf(str);
                    throw new SQLiteException(valueOf.length() != 0 ? "Database hits2 is missing required column: ".concat(valueOf) : new String("Database hits2 is missing required column: "));
                }
            }
            if (zzb.remove("hit_app_id")) {
                z = false;
            }
            if (!zzb.isEmpty()) {
                throw new SQLiteException("Database hits2 has extra columns");
            }
            if (!z) {
                return;
            }
            sQLiteDatabase.execSQL("ALTER TABLE hits2 ADD COLUMN hit_app_id INTEGER");
        }

        /* JADX WARN: Removed duplicated region for block: B:16:0x003d  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private boolean zza(android.database.sqlite.SQLiteDatabase r11, java.lang.String r12) {
            /*
                r10 = this;
                r8 = 0
                r9 = 0
                java.lang.String r1 = "SQLITE_MASTER"
                r0 = 1
                java.lang.String[] r2 = new java.lang.String[r0]     // Catch: android.database.sqlite.SQLiteException -> L29 java.lang.Throwable -> L3a
                r0 = 0
                java.lang.String r3 = "name"
                r2[r0] = r3     // Catch: android.database.sqlite.SQLiteException -> L29 java.lang.Throwable -> L3a
                java.lang.String r3 = "name=?"
                r0 = 1
                java.lang.String[] r4 = new java.lang.String[r0]     // Catch: android.database.sqlite.SQLiteException -> L29 java.lang.Throwable -> L3a
                r0 = 0
                r4[r0] = r12     // Catch: android.database.sqlite.SQLiteException -> L29 java.lang.Throwable -> L3a
                r5 = 0
                r6 = 0
                r7 = 0
                r0 = r11
                android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: android.database.sqlite.SQLiteException -> L29 java.lang.Throwable -> L3a
                boolean r0 = r1.moveToFirst()     // Catch: java.lang.Throwable -> L41 android.database.sqlite.SQLiteException -> L44
                if (r1 == 0) goto L28
                r1.close()
            L28:
                return r0
            L29:
                r0 = move-exception
                r1 = r9
            L2b:
                com.google.android.gms.analytics.internal.zzj r2 = com.google.android.gms.analytics.internal.zzj.this     // Catch: java.lang.Throwable -> L41
                java.lang.String r3 = "Error querying for table"
                r2.zzc(r3, r12, r0)     // Catch: java.lang.Throwable -> L41
                if (r1 == 0) goto L38
                r1.close()
            L38:
                r0 = r8
                goto L28
            L3a:
                r0 = move-exception
            L3b:
                if (r9 == 0) goto L40
                r9.close()
            L40:
                throw r0
            L41:
                r0 = move-exception
                r9 = r1
                goto L3b
            L44:
                r0 = move-exception
                goto L2b
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.internal.zzj.zza.zza(android.database.sqlite.SQLiteDatabase, java.lang.String):boolean");
        }

        private Set<String> zzb(SQLiteDatabase sQLiteDatabase, String str) {
            HashSet hashSet = new HashSet();
            Cursor rawQuery = sQLiteDatabase.rawQuery(new StringBuilder(String.valueOf(str).length() + 22).append("SELECT * FROM ").append(str).append(" LIMIT 0").toString(), null);
            try {
                for (String str2 : rawQuery.getColumnNames()) {
                    hashSet.add(str2);
                }
                return hashSet;
            } finally {
                rawQuery.close();
            }
        }

        private void zzb(SQLiteDatabase sQLiteDatabase) {
            Set<String> zzb = zzb(sQLiteDatabase, "properties");
            String[] strArr = {"app_uid", "cid", "tid", NativeProtocol.WEB_DIALOG_PARAMS, "adid", "hits_count"};
            for (int i = 0; i < 6; i++) {
                String str = strArr[i];
                if (!zzb.remove(str)) {
                    String valueOf = String.valueOf(str);
                    throw new SQLiteException(valueOf.length() != 0 ? "Database properties is missing required column: ".concat(valueOf) : new String("Database properties is missing required column: "));
                }
            }
            if (!zzb.isEmpty()) {
                throw new SQLiteException("Database properties table has extra columns");
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public SQLiteDatabase getWritableDatabase() {
            if (!zzj.this.dA.zzz(TimeUtils.HOUR)) {
                throw new SQLiteException("Database open failed");
            }
            try {
                return super.getWritableDatabase();
            } catch (SQLiteException e) {
                zzj.this.dA.start();
                zzj.this.zzew("Opening the database failed, dropping the table and recreating it");
                zzj.this.getContext().getDatabasePath(zzj.this.zzade()).delete();
                try {
                    SQLiteDatabase writableDatabase = super.getWritableDatabase();
                    zzj.this.dA.clear();
                    return writableDatabase;
                } catch (SQLiteException e2) {
                    zzj.this.zze("Failed to open freshly created database", e2);
                    throw e2;
                }
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            zzx.zzfd(sQLiteDatabase.getPath());
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
            if (!zza(sQLiteDatabase, "hits2")) {
                sQLiteDatabase.execSQL(zzj.dw);
            } else {
                zza(sQLiteDatabase);
            }
            if (!zza(sQLiteDatabase, "properties")) {
                sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS properties ( app_uid INTEGER NOT NULL, cid TEXT NOT NULL, tid TEXT NOT NULL, params TEXT NOT NULL, adid INTEGER NOT NULL, hits_count INTEGER NOT NULL, PRIMARY KEY (app_uid, cid, tid)) ;");
            } else {
                zzb(sQLiteDatabase);
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzj(zzf zzfVar) {
        super(zzfVar);
        this.dz = new zzal(zzabz());
        this.dA = new zzal(zzabz());
        this.dy = new zza(zzfVar.getContext(), zzade());
    }

    private long zza(String str, String[] strArr, long j) {
        Cursor cursor = null;
        try {
            try {
                cursor = getWritableDatabase().rawQuery(str, strArr);
                if (cursor.moveToFirst()) {
                    j = cursor.getLong(0);
                } else if (cursor != null) {
                    cursor.close();
                }
                return j;
            } catch (SQLiteException e) {
                zzd("Database error", str, e);
                throw e;
            }
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }

    private void zzadd() {
        int zzafc = zzacb().zzafc();
        long zzacu = zzacu();
        if (zzacu > zzafc - 1) {
            List<Long> zzs = zzs((zzacu - zzafc) + 1);
            zzd("Store full, deleting hits to make room, count", Integer.valueOf(zzs.size()));
            zzr(zzs);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String zzade() {
        zzacb();
        return zzacb().zzafe();
    }

    private static String zzas(Map<String, String> map) {
        com.google.android.gms.common.internal.zzaa.zzy(map);
        Uri.Builder builder = new Uri.Builder();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            builder.appendQueryParameter(entry.getKey(), entry.getValue());
        }
        String encodedQuery = builder.build().getEncodedQuery();
        return encodedQuery == null ? "" : encodedQuery;
    }

    private long zzb(String str, String[] strArr) {
        Cursor cursor = null;
        try {
            try {
                Cursor rawQuery = getWritableDatabase().rawQuery(str, strArr);
                if (!rawQuery.moveToFirst()) {
                    throw new SQLiteException("Database returned empty set");
                }
                long j = rawQuery.getLong(0);
                if (rawQuery != null) {
                    rawQuery.close();
                }
                return j;
            } catch (SQLiteException e) {
                zzd("Database error", str, e);
                throw e;
            }
        } catch (Throwable th) {
            if (0 != 0) {
                cursor.close();
            }
            throw th;
        }
    }

    private String zzd(zzab zzabVar) {
        return zzabVar.zzagc() ? zzacb().zzaes() : zzacb().zzaet();
    }

    private static String zze(zzab zzabVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzabVar);
        Uri.Builder builder = new Uri.Builder();
        for (Map.Entry<String, String> entry : zzabVar.zzmc().entrySet()) {
            String key = entry.getKey();
            if (!"ht".equals(key) && !"qt".equals(key) && !"AppUID".equals(key)) {
                builder.appendQueryParameter(key, entry.getValue());
            }
        }
        String encodedQuery = builder.build().getEncodedQuery();
        return encodedQuery == null ? "" : encodedQuery;
    }

    public void beginTransaction() {
        zzacj();
        getWritableDatabase().beginTransaction();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        try {
            this.dy.close();
        } catch (SQLiteException e) {
            zze("Sql error closing database", e);
        } catch (IllegalStateException e2) {
            zze("Error closing database", e2);
        }
    }

    public void endTransaction() {
        zzacj();
        getWritableDatabase().endTransaction();
    }

    SQLiteDatabase getWritableDatabase() {
        try {
            return this.dy.getWritableDatabase();
        } catch (SQLiteException e) {
            zzd("Error opening database", e);
            throw e;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isEmpty() {
        return zzacu() == 0;
    }

    public void setTransactionSuccessful() {
        zzacj();
        getWritableDatabase().setTransactionSuccessful();
    }

    public long zza(long j, String str, String str2) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzib(str2);
        zzacj();
        zzzx();
        return zza("SELECT hits_count FROM properties WHERE app_uid=? AND cid=? AND tid=?", new String[]{String.valueOf(j), str, str2}, 0L);
    }

    public void zza(long j, String str) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        zzacj();
        zzzx();
        int delete = getWritableDatabase().delete("properties", "app_uid=? AND cid<>?", new String[]{String.valueOf(j), str});
        if (delete > 0) {
            zza("Deleted property records", Integer.valueOf(delete));
        }
    }

    public long zzacu() {
        zzzx();
        zzacj();
        return zzb("SELECT COUNT(*) FROM hits2", (String[]) null);
    }

    public void zzacz() {
        zzzx();
        zzacj();
        getWritableDatabase().delete("hits2", null, null);
    }

    public void zzada() {
        zzzx();
        zzacj();
        getWritableDatabase().delete("properties", null, null);
    }

    public int zzadb() {
        zzzx();
        zzacj();
        if (!this.dz.zzz(TimeUtils.DAY)) {
            return 0;
        }
        this.dz.start();
        zzes("Deleting stale hits (if any)");
        int delete = getWritableDatabase().delete("hits2", "hit_time < ?", new String[]{Long.toString(zzabz().currentTimeMillis() - TimeUtils.MONTH)});
        zza("Deleted stale hits, count", Integer.valueOf(delete));
        return delete;
    }

    public long zzadc() {
        zzzx();
        zzacj();
        return zza(dx, (String[]) null, 0L);
    }

    public void zzb(zzh zzhVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzhVar);
        zzacj();
        zzzx();
        SQLiteDatabase writableDatabase = getWritableDatabase();
        String zzas = zzas(zzhVar.zzmc());
        ContentValues contentValues = new ContentValues();
        contentValues.put("app_uid", Long.valueOf(zzhVar.zzacr()));
        contentValues.put("cid", zzhVar.zzze());
        contentValues.put("tid", zzhVar.zzacs());
        contentValues.put("adid", Integer.valueOf(zzhVar.zzact() ? 1 : 0));
        contentValues.put("hits_count", Long.valueOf(zzhVar.zzacu()));
        contentValues.put(NativeProtocol.WEB_DIALOG_PARAMS, zzas);
        try {
            if (writableDatabase.insertWithOnConflict("properties", null, contentValues, 5) != -1) {
                return;
            }
            zzew("Failed to insert/update a property (got -1)");
        } catch (SQLiteException e) {
            zze("Error storing a property", e);
        }
    }

    public void zzc(zzab zzabVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzabVar);
        zzzx();
        zzacj();
        String zze = zze(zzabVar);
        if (zze.length() > 8192) {
            zzaca().zza(zzabVar, "Hit length exceeds the maximum allowed size");
            return;
        }
        zzadd();
        SQLiteDatabase writableDatabase = getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("hit_string", zze);
        contentValues.put("hit_time", Long.valueOf(zzabVar.zzaga()));
        contentValues.put("hit_app_id", Integer.valueOf(zzabVar.zzafy()));
        contentValues.put("hit_url", zzd(zzabVar));
        try {
            long insert = writableDatabase.insert("hits2", null, contentValues);
            if (insert == -1) {
                zzew("Failed to insert a hit (got -1)");
            } else {
                zzb("Hit saved to database. db-id, hit", Long.valueOf(insert), zzabVar);
            }
        } catch (SQLiteException e) {
            zze("Error storing a hit", e);
        }
    }

    Map<String, String> zzex(String str) {
        if (TextUtils.isEmpty(str)) {
            return new HashMap(0);
        }
        try {
            if (!str.startsWith("?")) {
                String valueOf = String.valueOf(str);
                str = valueOf.length() != 0 ? "?".concat(valueOf) : new String("?");
            }
            return com.google.android.gms.common.util.zzn.zza(new URI(str), "UTF-8");
        } catch (URISyntaxException e) {
            zze("Error parsing hit parameters", e);
            return new HashMap(0);
        }
    }

    Map<String, String> zzey(String str) {
        if (TextUtils.isEmpty(str)) {
            return new HashMap(0);
        }
        try {
            String valueOf = String.valueOf(str);
            return com.google.android.gms.common.util.zzn.zza(new URI(valueOf.length() != 0 ? "?".concat(valueOf) : new String("?")), "UTF-8");
        } catch (URISyntaxException e) {
            zze("Error parsing property parameters", e);
            return new HashMap(0);
        }
    }

    public void zzr(List<Long> list) {
        com.google.android.gms.common.internal.zzaa.zzy(list);
        zzzx();
        zzacj();
        if (list.isEmpty()) {
            return;
        }
        StringBuilder sb = new StringBuilder("hit_id");
        sb.append(" in (");
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= list.size()) {
                sb.append(")");
                String sb2 = sb.toString();
                try {
                    SQLiteDatabase writableDatabase = getWritableDatabase();
                    zza("Deleting dispatched hits. count", Integer.valueOf(list.size()));
                    int delete = writableDatabase.delete("hits2", sb2, null);
                    if (delete == list.size()) {
                        return;
                    }
                    zzb("Deleted fewer hits then expected", Integer.valueOf(list.size()), Integer.valueOf(delete), sb2);
                    return;
                } catch (SQLiteException e) {
                    zze("Error deleting hits", e);
                    throw e;
                }
            }
            Long l = list.get(i2);
            if (l == null || l.longValue() == 0) {
                break;
            }
            if (i2 > 0) {
                sb.append(",");
            }
            sb.append(l);
            i = i2 + 1;
        }
        throw new SQLiteException("Invalid hit id");
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0073  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<java.lang.Long> zzs(long r14) {
        /*
            r13 = this;
            r10 = 0
            r13.zzzx()
            r13.zzacj()
            r0 = 0
            int r0 = (r14 > r0 ? 1 : (r14 == r0 ? 0 : -1))
            if (r0 > 0) goto L12
            java.util.List r0 = java.util.Collections.emptyList()
        L11:
            return r0
        L12:
            android.database.sqlite.SQLiteDatabase r0 = r13.getWritableDatabase()
            java.util.ArrayList r9 = new java.util.ArrayList
            r9.<init>()
            java.lang.String r1 = "hits2"
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L70
            r3 = 0
            java.lang.String r4 = "hit_id"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L70
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "%s ASC"
            r8 = 1
            java.lang.Object[] r8 = new java.lang.Object[r8]     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L70
            r11 = 0
            java.lang.String r12 = "hit_id"
            r8[r11] = r12     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L70
            java.lang.String r7 = java.lang.String.format(r7, r8)     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L70
            java.lang.String r8 = java.lang.Long.toString(r14)     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L70
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L70
            boolean r0 = r1.moveToFirst()     // Catch: java.lang.Throwable -> L77 android.database.sqlite.SQLiteException -> L7a
            if (r0 == 0) goto L5b
        L49:
            r0 = 0
            long r2 = r1.getLong(r0)     // Catch: java.lang.Throwable -> L77 android.database.sqlite.SQLiteException -> L7a
            java.lang.Long r0 = java.lang.Long.valueOf(r2)     // Catch: java.lang.Throwable -> L77 android.database.sqlite.SQLiteException -> L7a
            r9.add(r0)     // Catch: java.lang.Throwable -> L77 android.database.sqlite.SQLiteException -> L7a
            boolean r0 = r1.moveToNext()     // Catch: java.lang.Throwable -> L77 android.database.sqlite.SQLiteException -> L7a
            if (r0 != 0) goto L49
        L5b:
            if (r1 == 0) goto L60
            r1.close()
        L60:
            r0 = r9
            goto L11
        L62:
            r0 = move-exception
            r1 = r10
        L64:
            java.lang.String r2 = "Error selecting hit ids"
            r13.zzd(r2, r0)     // Catch: java.lang.Throwable -> L77
            if (r1 == 0) goto L60
            r1.close()
            goto L60
        L70:
            r0 = move-exception
        L71:
            if (r10 == 0) goto L76
            r10.close()
        L76:
            throw r0
        L77:
            r0 = move-exception
            r10 = r1
            goto L71
        L7a:
            r0 = move-exception
            goto L64
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.internal.zzj.zzs(long):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x00a7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.google.android.gms.analytics.internal.zzab> zzt(long r14) {
        /*
            r13 = this;
            r0 = 1
            r1 = 0
            r9 = 0
            r2 = 0
            int r2 = (r14 > r2 ? 1 : (r14 == r2 ? 0 : -1))
            if (r2 < 0) goto L97
        L9:
            com.google.android.gms.common.internal.zzaa.zzbt(r0)
            r13.zzzx()
            r13.zzacj()
            android.database.sqlite.SQLiteDatabase r0 = r13.getWritableDatabase()
            java.lang.String r1 = "hits2"
            r2 = 5
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: android.database.sqlite.SQLiteException -> L9a java.lang.Throwable -> Lab
            r3 = 0
            java.lang.String r4 = "hit_id"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L9a java.lang.Throwable -> Lab
            r3 = 1
            java.lang.String r4 = "hit_time"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L9a java.lang.Throwable -> Lab
            r3 = 2
            java.lang.String r4 = "hit_string"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L9a java.lang.Throwable -> Lab
            r3 = 3
            java.lang.String r4 = "hit_url"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L9a java.lang.Throwable -> Lab
            r3 = 4
            java.lang.String r4 = "hit_app_id"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L9a java.lang.Throwable -> Lab
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "%s ASC"
            r8 = 1
            java.lang.Object[] r8 = new java.lang.Object[r8]     // Catch: android.database.sqlite.SQLiteException -> L9a java.lang.Throwable -> Lab
            r10 = 0
            java.lang.String r11 = "hit_id"
            r8[r10] = r11     // Catch: android.database.sqlite.SQLiteException -> L9a java.lang.Throwable -> Lab
            java.lang.String r7 = java.lang.String.format(r7, r8)     // Catch: android.database.sqlite.SQLiteException -> L9a java.lang.Throwable -> Lab
            java.lang.String r8 = java.lang.Long.toString(r14)     // Catch: android.database.sqlite.SQLiteException -> L9a java.lang.Throwable -> Lab
            android.database.Cursor r9 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: android.database.sqlite.SQLiteException -> L9a java.lang.Throwable -> Lab
            java.util.ArrayList r10 = new java.util.ArrayList     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            r10.<init>()     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            boolean r0 = r9.moveToFirst()     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            if (r0 == 0) goto L91
        L61:
            r0 = 0
            long r6 = r9.getLong(r0)     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            r0 = 1
            long r3 = r9.getLong(r0)     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            r0 = 2
            java.lang.String r0 = r9.getString(r0)     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            r1 = 3
            java.lang.String r1 = r9.getString(r1)     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            r2 = 4
            int r8 = r9.getInt(r2)     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            java.util.Map r2 = r13.zzex(r0)     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            boolean r5 = com.google.android.gms.analytics.internal.zzao.zzfn(r1)     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            com.google.android.gms.analytics.internal.zzab r0 = new com.google.android.gms.analytics.internal.zzab     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            r1 = r13
            r0.<init>(r1, r2, r3, r5, r6, r8)     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            r10.add(r0)     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            boolean r0 = r9.moveToNext()     // Catch: java.lang.Throwable -> Lab android.database.sqlite.SQLiteException -> Lad
            if (r0 != 0) goto L61
        L91:
            if (r9 == 0) goto L96
            r9.close()
        L96:
            return r10
        L97:
            r0 = r1
            goto L9
        L9a:
            r0 = move-exception
            r1 = r9
        L9c:
            java.lang.String r2 = "Error loading hits from the database"
            r13.zze(r2, r0)     // Catch: java.lang.Throwable -> La3
            throw r0     // Catch: java.lang.Throwable -> La3
        La3:
            r0 = move-exception
            r9 = r1
        La5:
            if (r9 == 0) goto Laa
            r9.close()
        Laa:
            throw r0
        Lab:
            r0 = move-exception
            goto La5
        Lad:
            r0 = move-exception
            r1 = r9
            goto L9c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.internal.zzj.zzt(long):java.util.List");
    }

    public void zzu(long j) {
        zzzx();
        zzacj();
        ArrayList arrayList = new ArrayList(1);
        arrayList.add(Long.valueOf(j));
        zza("Deleting hit, id", Long.valueOf(j));
        zzr(arrayList);
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0099 A[Catch: SQLiteException -> 0x00b1, all -> 0x00c2, TRY_LEAVE, TryCatch #0 {all -> 0x00c2, blocks: (B:3:0x000c, B:4:0x004f, B:6:0x005a, B:9:0x006c, B:11:0x0081, B:23:0x00a7, B:14:0x008d, B:13:0x0087, B:16:0x0093, B:18:0x0099), top: B:38:0x000c }] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00be  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.google.android.gms.analytics.internal.zzh> zzv(long r14) {
        /*
            r13 = this;
            r13.zzacj()
            r13.zzzx()
            android.database.sqlite.SQLiteDatabase r0 = r13.getWritableDatabase()
            r9 = 0
            r1 = 5
            java.lang.String[] r2 = new java.lang.String[r1]     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            r1 = 0
            java.lang.String r3 = "cid"
            r2[r1] = r3     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            r1 = 1
            java.lang.String r3 = "tid"
            r2[r1] = r3     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            r1 = 2
            java.lang.String r3 = "adid"
            r2[r1] = r3     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            r1 = 3
            java.lang.String r3 = "hits_count"
            r2[r1] = r3     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            r1 = 4
            java.lang.String r3 = "params"
            r2[r1] = r3     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            com.google.android.gms.analytics.internal.zzr r1 = r13.zzacb()     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            int r10 = r1.zzafd()     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            java.lang.String r8 = java.lang.String.valueOf(r10)     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            java.lang.String r3 = "app_uid=?"
            r1 = 1
            java.lang.String[] r4 = new java.lang.String[r1]     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            r1 = 0
            java.lang.String r5 = java.lang.String.valueOf(r14)     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            r4[r1] = r5     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            java.lang.String r1 = "properties"
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r9 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Throwable -> Lc2 android.database.sqlite.SQLiteException -> Lc4
            java.util.ArrayList r11 = new java.util.ArrayList     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            r11.<init>()     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            boolean r0 = r9.moveToFirst()     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            if (r0 == 0) goto L93
        L5a:
            r0 = 0
            java.lang.String r3 = r9.getString(r0)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            r0 = 1
            java.lang.String r4 = r9.getString(r0)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            r0 = 2
            int r0 = r9.getInt(r0)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            if (r0 == 0) goto La5
            r5 = 1
        L6c:
            r0 = 3
            int r0 = r9.getInt(r0)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            long r6 = (long) r0     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            r0 = 4
            java.lang.String r0 = r9.getString(r0)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            java.util.Map r8 = r13.zzey(r0)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            boolean r0 = android.text.TextUtils.isEmpty(r3)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            if (r0 != 0) goto L87
            boolean r0 = android.text.TextUtils.isEmpty(r4)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            if (r0 == 0) goto La7
        L87:
            java.lang.String r0 = "Read property with empty client id or tracker id"
            r13.zzc(r0, r3, r4)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
        L8d:
            boolean r0 = r9.moveToNext()     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            if (r0 != 0) goto L5a
        L93:
            int r0 = r11.size()     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            if (r0 < r10) goto L9f
            java.lang.String r0 = "Sending hits to too many properties. Campaign report might be incorrect"
            r13.zzev(r0)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
        L9f:
            if (r9 == 0) goto La4
            r9.close()
        La4:
            return r11
        La5:
            r5 = 0
            goto L6c
        La7:
            com.google.android.gms.analytics.internal.zzh r0 = new com.google.android.gms.analytics.internal.zzh     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            r1 = r14
            r0.<init>(r1, r3, r4, r5, r6, r8)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            r11.add(r0)     // Catch: android.database.sqlite.SQLiteException -> Lb1 java.lang.Throwable -> Lc2
            goto L8d
        Lb1:
            r0 = move-exception
            r1 = r9
        Lb3:
            java.lang.String r2 = "Error loading hits from the database"
            r13.zze(r2, r0)     // Catch: java.lang.Throwable -> Lba
            throw r0     // Catch: java.lang.Throwable -> Lba
        Lba:
            r0 = move-exception
            r9 = r1
        Lbc:
            if (r9 == 0) goto Lc1
            r9.close()
        Lc1:
            throw r0
        Lc2:
            r0 = move-exception
            goto Lbc
        Lc4:
            r0 = move-exception
            r1 = r9
            goto Lb3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.analytics.internal.zzj.zzv(long):java.util.List");
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
    }
}
