package com.google.android.gms.tagmanager;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;
import android.text.TextUtils;
import com.google.android.gms.tagmanager.DataLayer;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzx implements DataLayer.zzc {
    private static final String aEP = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' STRING NOT NULL, '%s' BLOB NOT NULL, '%s' INTEGER NOT NULL);", "datalayer", "ID", "key", "value", "expires");
    private final Executor aEQ;
    private zza aER;
    private int aES;
    private final Context mContext;
    private com.google.android.gms.common.util.zze zzaql;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class zza extends SQLiteOpenHelper {
        zza(Context context, String str) {
            super(context, str, (SQLiteDatabase.CursorFactory) null, 1);
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
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.zzx.zza.zza(java.lang.String, android.database.sqlite.SQLiteDatabase):boolean");
        }

        private void zzc(SQLiteDatabase sQLiteDatabase) {
            Cursor rawQuery = sQLiteDatabase.rawQuery("SELECT * FROM datalayer WHERE 0", null);
            HashSet hashSet = new HashSet();
            try {
                for (String str : rawQuery.getColumnNames()) {
                    hashSet.add(str);
                }
                rawQuery.close();
                if (!hashSet.remove("key") || !hashSet.remove("value") || !hashSet.remove("ID") || !hashSet.remove("expires")) {
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
            SQLiteDatabase sQLiteDatabase = null;
            try {
                sQLiteDatabase = super.getWritableDatabase();
            } catch (SQLiteException e) {
                zzx.this.mContext.getDatabasePath("google_tagmanager.db").delete();
            }
            return sQLiteDatabase == null ? super.getWritableDatabase() : sQLiteDatabase;
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
            if (!zza("datalayer", sQLiteDatabase)) {
                sQLiteDatabase.execSQL(zzx.aEP);
            } else {
                zzc(sQLiteDatabase);
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zzb {
        final byte[] aEY;
        final String zzbcn;

        zzb(String str, byte[] bArr) {
            this.zzbcn = str;
            this.aEY = bArr;
        }

        public String toString() {
            String str = this.zzbcn;
            return new StringBuilder(String.valueOf(str).length() + 54).append("KeyAndSerialized: key = ").append(str).append(" serialized hash = ").append(Arrays.hashCode(this.aEY)).toString();
        }
    }

    public zzx(Context context) {
        this(context, com.google.android.gms.common.util.zzh.zzayl(), "google_tagmanager.db", 2000, Executors.newSingleThreadExecutor());
    }

    zzx(Context context, com.google.android.gms.common.util.zze zzeVar, String str, int i, Executor executor) {
        this.mContext = context;
        this.zzaql = zzeVar;
        this.aES = i;
        this.aEQ = executor;
        this.aER = new zza(this.mContext, str);
    }

    private void zzaaa(int i) {
        int zzcew = (zzcew() - this.aES) + i;
        if (zzcew > 0) {
            List<String> zzaab = zzaab(zzcew);
            zzbo.zzdh(new StringBuilder(64).append("DataLayer store full, deleting ").append(zzaab.size()).append(" entries to make room.").toString());
            zzg((String[]) zzaab.toArray(new String[0]));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x005d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.util.List<java.lang.String> zzaab(int r14) {
        /*
            r13 = this;
            r10 = 0
            java.util.ArrayList r9 = new java.util.ArrayList
            r9.<init>()
            if (r14 > 0) goto L10
            java.lang.String r0 = "Invalid maxEntries specified. Skipping."
            com.google.android.gms.tagmanager.zzbo.zzdi(r0)
            r0 = r9
        Lf:
            return r0
        L10:
            java.lang.String r0 = "Error opening database for peekEntryIds."
            android.database.sqlite.SQLiteDatabase r0 = r13.zzpf(r0)
            if (r0 != 0) goto L1b
            r0 = r9
            goto Lf
        L1b:
            java.lang.String r1 = "datalayer"
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L8f
            r3 = 0
            java.lang.String r4 = "ID"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L8f
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "%s ASC"
            r8 = 1
            java.lang.Object[] r8 = new java.lang.Object[r8]     // Catch: android.database.sqlite.SQLiteException -> L62 java.lang.Throwable -> L8f
            r11 = 0
            java.lang.String r12 = "ID"
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
            java.lang.String r2 = "Error in peekEntries fetching entryIds: "
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
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.zzx.zzaab(int):java.util.List");
    }

    private List<DataLayer.zza> zzaj(List<zzb> list) {
        ArrayList arrayList = new ArrayList();
        for (zzb zzbVar : list) {
            arrayList.add(new DataLayer.zza(zzbVar.zzbcn, zzak(zzbVar.aEY)));
        }
        return arrayList;
    }

    private Object zzak(byte[] bArr) {
        ObjectInputStream objectInputStream;
        Throwable th;
        Object obj = null;
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        try {
            objectInputStream = new ObjectInputStream(byteArrayInputStream);
            try {
                obj = objectInputStream.readObject();
                if (objectInputStream != null) {
                    try {
                        objectInputStream.close();
                    } catch (IOException e) {
                    }
                }
                byteArrayInputStream.close();
            } catch (IOException e2) {
                if (objectInputStream != null) {
                    try {
                        objectInputStream.close();
                    } catch (IOException e3) {
                    }
                }
                byteArrayInputStream.close();
                return obj;
            } catch (ClassNotFoundException e4) {
                if (objectInputStream != null) {
                    try {
                        objectInputStream.close();
                    } catch (IOException e5) {
                    }
                }
                byteArrayInputStream.close();
                return obj;
            } catch (Throwable th2) {
                th = th2;
                if (objectInputStream != null) {
                    try {
                        objectInputStream.close();
                    } catch (IOException e6) {
                        throw th;
                    }
                }
                byteArrayInputStream.close();
                throw th;
            }
        } catch (IOException e7) {
            objectInputStream = null;
        } catch (ClassNotFoundException e8) {
            objectInputStream = null;
        } catch (Throwable th3) {
            objectInputStream = null;
            th = th3;
        }
        return obj;
    }

    private List<zzb> zzak(List<DataLayer.zza> list) {
        ArrayList arrayList = new ArrayList();
        for (DataLayer.zza zzaVar : list) {
            arrayList.add(new zzb(zzaVar.zzbcn, zzal(zzaVar.zzcyd)));
        }
        return arrayList;
    }

    private byte[] zzal(Object obj) {
        ObjectOutputStream objectOutputStream;
        Throwable th;
        byte[] bArr = null;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            try {
                objectOutputStream.writeObject(obj);
                bArr = byteArrayOutputStream.toByteArray();
                if (objectOutputStream != null) {
                    try {
                        objectOutputStream.close();
                    } catch (IOException e) {
                    }
                }
                byteArrayOutputStream.close();
            } catch (IOException e2) {
                if (objectOutputStream != null) {
                    try {
                        objectOutputStream.close();
                    } catch (IOException e3) {
                    }
                }
                byteArrayOutputStream.close();
                return bArr;
            } catch (Throwable th2) {
                th = th2;
                if (objectOutputStream != null) {
                    try {
                        objectOutputStream.close();
                    } catch (IOException e4) {
                        throw th;
                    }
                }
                byteArrayOutputStream.close();
                throw th;
            }
        } catch (IOException e5) {
            objectOutputStream = null;
        } catch (Throwable th3) {
            objectOutputStream = null;
            th = th3;
        }
        return bArr;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void zzb(List<zzb> list, long j) {
        long currentTimeMillis = this.zzaql.currentTimeMillis();
        zzbu(currentTimeMillis);
        zzaaa(list.size());
        zzc(list, currentTimeMillis + j);
        zzcex();
    }

    private void zzbu(long j) {
        SQLiteDatabase zzpf = zzpf("Error opening database for deleteOlderThan.");
        if (zzpf == null) {
            return;
        }
        try {
            zzbo.v(new StringBuilder(33).append("Deleted ").append(zzpf.delete("datalayer", "expires <= ?", new String[]{Long.toString(j)})).append(" expired items").toString());
        } catch (SQLiteException e) {
            zzbo.zzdi("Error deleting old entries.");
        }
    }

    private void zzc(List<zzb> list, long j) {
        SQLiteDatabase zzpf = zzpf("Error opening database for writeEntryToDatabase.");
        if (zzpf == null) {
            return;
        }
        for (zzb zzbVar : list) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("expires", Long.valueOf(j));
            contentValues.put("key", zzbVar.zzbcn);
            contentValues.put("value", zzbVar.aEY);
            zzpf.insert("datalayer", null, contentValues);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<DataLayer.zza> zzceu() {
        try {
            zzbu(this.zzaql.currentTimeMillis());
            return zzaj(zzcev());
        } finally {
            zzcex();
        }
    }

    private List<zzb> zzcev() {
        SQLiteDatabase zzpf = zzpf("Error opening database for loadSerialized.");
        ArrayList arrayList = new ArrayList();
        if (zzpf == null) {
            return arrayList;
        }
        Cursor query = zzpf.query("datalayer", new String[]{"key", "value"}, null, null, null, null, "ID", null);
        while (query.moveToNext()) {
            try {
                arrayList.add(new zzb(query.getString(0), query.getBlob(1)));
            } finally {
                query.close();
            }
        }
        return arrayList;
    }

    private int zzcew() {
        Cursor cursor = null;
        int i = 0;
        SQLiteDatabase zzpf = zzpf("Error opening database for getNumStoredEntries.");
        try {
            if (zzpf != null) {
                try {
                    cursor = zzpf.rawQuery("SELECT COUNT(*) from datalayer", null);
                    if (cursor.moveToFirst()) {
                        i = (int) cursor.getLong(0);
                    }
                    if (cursor != null) {
                        cursor.close();
                    }
                } catch (SQLiteException e) {
                    zzbo.zzdi("Error getting numStoredEntries");
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

    private void zzcex() {
        try {
            this.aER.close();
        } catch (SQLiteException e) {
        }
    }

    private void zzg(String[] strArr) {
        SQLiteDatabase zzpf;
        if (strArr == null || strArr.length == 0 || (zzpf = zzpf("Error opening database for deleteEntries.")) == null) {
            return;
        }
        try {
            zzpf.delete("datalayer", String.format("%s in (%s)", "ID", TextUtils.join(",", Collections.nCopies(strArr.length, "?"))), strArr);
        } catch (SQLiteException e) {
            String valueOf = String.valueOf(Arrays.toString(strArr));
            zzbo.zzdi(valueOf.length() != 0 ? "Error deleting entries ".concat(valueOf) : new String("Error deleting entries "));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzpe(String str) {
        SQLiteDatabase zzpf = zzpf("Error opening database for clearKeysWithPrefix.");
        try {
        } catch (SQLiteException e) {
            String valueOf = String.valueOf(e);
            zzbo.zzdi(new StringBuilder(String.valueOf(str).length() + 44 + String.valueOf(valueOf).length()).append("Error deleting entries with key prefix: ").append(str).append(" (").append(valueOf).append(").").toString());
        } finally {
            zzcex();
        }
        if (zzpf == null) {
            return;
        }
        zzbo.v(new StringBuilder(25).append("Cleared ").append(zzpf.delete("datalayer", "key = ? OR key LIKE ?", new String[]{str, String.valueOf(str).concat(".%")})).append(" items").toString());
    }

    private SQLiteDatabase zzpf(String str) {
        try {
            return this.aER.getWritableDatabase();
        } catch (SQLiteException e) {
            zzbo.zzdi(str);
            return null;
        }
    }

    @Override // com.google.android.gms.tagmanager.DataLayer.zzc
    public void zza(final DataLayer.zzc.zza zzaVar) {
        this.aEQ.execute(new Runnable() { // from class: com.google.android.gms.tagmanager.zzx.2
            @Override // java.lang.Runnable
            public void run() {
                zzaVar.zzai(zzx.this.zzceu());
            }
        });
    }

    @Override // com.google.android.gms.tagmanager.DataLayer.zzc
    public void zza(List<DataLayer.zza> list, final long j) {
        final List<zzb> zzak = zzak(list);
        this.aEQ.execute(new Runnable() { // from class: com.google.android.gms.tagmanager.zzx.1
            @Override // java.lang.Runnable
            public void run() {
                zzx.this.zzb(zzak, j);
            }
        });
    }

    @Override // com.google.android.gms.tagmanager.DataLayer.zzc
    public void zzpd(final String str) {
        this.aEQ.execute(new Runnable() { // from class: com.google.android.gms.tagmanager.zzx.3
            @Override // java.lang.Runnable
            public void run() {
                zzx.this.zzpe(str);
            }
        });
    }
}
