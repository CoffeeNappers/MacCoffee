package com.google.android.gms.measurement.internal;

import android.annotation.TargetApi;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.CursorWindow;
import android.database.sqlite.SQLiteCursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;
import android.support.annotation.WorkerThread;
import android.support.v4.util.ArrayMap;
import android.text.TextUtils;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.android.gms.internal.zzars;
import com.google.android.gms.internal.zzart;
import com.google.android.gms.internal.zzwa;
import com.google.android.gms.internal.zzwc;
import io.sentry.marshaller.json.JsonMarshaller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zze extends zzaa {
    private static final Map<String, String> arj = new ArrayMap(17);
    private static final Map<String, String> ark;
    private static final Map<String, String> arl;
    private static final Map<String, String> arm;
    private final zzc arn;
    private final zzah aro;

    /* loaded from: classes2.dex */
    public static class zza {
        long arp;
        long arq;
        long arr;
        long ars;
        long art;
    }

    /* loaded from: classes2.dex */
    interface zzb {
        boolean zza(long j, zzwc.zzb zzbVar);

        void zzb(zzwc.zze zzeVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zzc extends SQLiteOpenHelper {
        zzc(Context context, String str) {
            super(context, str, (SQLiteDatabase.CursorFactory) null, 1);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        @WorkerThread
        public SQLiteDatabase getWritableDatabase() {
            if (!zze.this.aro.zzz(zze.this.zzbwd().zzbup())) {
                throw new SQLiteException("Database open failed");
            }
            try {
                return super.getWritableDatabase();
            } catch (SQLiteException e) {
                zze.this.aro.start();
                zze.this.zzbwb().zzbwy().log("Opening the database failed, dropping and recreating it");
                String zzade = zze.this.zzade();
                if (!zze.this.getContext().getDatabasePath(zzade).delete()) {
                    zze.this.zzbwb().zzbwy().zzj("Failed to delete corrupted db file", zzade);
                }
                try {
                    SQLiteDatabase writableDatabase = super.getWritableDatabase();
                    zze.this.aro.clear();
                    return writableDatabase;
                } catch (SQLiteException e2) {
                    zze.this.zzbwb().zzbwy().zzj("Failed to open freshly created database", e2);
                    throw e2;
                }
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        @WorkerThread
        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            zze.zza(zze.this.zzbwb(), sQLiteDatabase);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        @WorkerThread
        public void onOpen(SQLiteDatabase sQLiteDatabase) {
            if (Build.VERSION.SDK_INT < 15) {
                Cursor rawQuery = sQLiteDatabase.rawQuery("PRAGMA journal_mode=memory", null);
                try {
                    rawQuery.moveToFirst();
                } finally {
                    rawQuery.close();
                }
            }
            zze.zza(zze.this.zzbwb(), sQLiteDatabase, "events", "CREATE TABLE IF NOT EXISTS events ( app_id TEXT NOT NULL, name TEXT NOT NULL, lifetime_count INTEGER NOT NULL, current_bundle_count INTEGER NOT NULL, last_fire_timestamp INTEGER NOT NULL, PRIMARY KEY (app_id, name)) ;", "app_id,name,lifetime_count,current_bundle_count,last_fire_timestamp", null);
            zze.zza(zze.this.zzbwb(), sQLiteDatabase, "user_attributes", "CREATE TABLE IF NOT EXISTS user_attributes ( app_id TEXT NOT NULL, name TEXT NOT NULL, set_timestamp INTEGER NOT NULL, value BLOB NOT NULL, PRIMARY KEY (app_id, name)) ;", "app_id,name,set_timestamp,value", null);
            zze.zza(zze.this.zzbwb(), sQLiteDatabase, "apps", "CREATE TABLE IF NOT EXISTS apps ( app_id TEXT NOT NULL, app_instance_id TEXT, gmp_app_id TEXT, resettable_device_id_hash TEXT, last_bundle_index INTEGER NOT NULL, last_bundle_end_timestamp INTEGER NOT NULL, PRIMARY KEY (app_id)) ;", "app_id,app_instance_id,gmp_app_id,resettable_device_id_hash,last_bundle_index,last_bundle_end_timestamp", zze.arj);
            zze.zza(zze.this.zzbwb(), sQLiteDatabase, "queue", "CREATE TABLE IF NOT EXISTS queue ( app_id TEXT NOT NULL, bundle_end_timestamp INTEGER NOT NULL, data BLOB NOT NULL);", "app_id,bundle_end_timestamp,data", zze.arl);
            zze.zza(zze.this.zzbwb(), sQLiteDatabase, "raw_events_metadata", "CREATE TABLE IF NOT EXISTS raw_events_metadata ( app_id TEXT NOT NULL, metadata_fingerprint INTEGER NOT NULL, metadata BLOB NOT NULL, PRIMARY KEY (app_id, metadata_fingerprint));", "app_id,metadata_fingerprint,metadata", null);
            zze.zza(zze.this.zzbwb(), sQLiteDatabase, "raw_events", "CREATE TABLE IF NOT EXISTS raw_events ( app_id TEXT NOT NULL, name TEXT NOT NULL, timestamp INTEGER NOT NULL, metadata_fingerprint INTEGER NOT NULL, data BLOB NOT NULL);", "app_id,name,timestamp,metadata_fingerprint,data", zze.ark);
            zze.zza(zze.this.zzbwb(), sQLiteDatabase, "event_filters", "CREATE TABLE IF NOT EXISTS event_filters ( app_id TEXT NOT NULL, audience_id INTEGER NOT NULL, filter_id INTEGER NOT NULL, event_name TEXT NOT NULL, data BLOB NOT NULL, PRIMARY KEY (app_id, event_name, audience_id, filter_id));", "app_id,audience_id,filter_id,event_name,data", null);
            zze.zza(zze.this.zzbwb(), sQLiteDatabase, "property_filters", "CREATE TABLE IF NOT EXISTS property_filters ( app_id TEXT NOT NULL, audience_id INTEGER NOT NULL, filter_id INTEGER NOT NULL, property_name TEXT NOT NULL, data BLOB NOT NULL, PRIMARY KEY (app_id, property_name, audience_id, filter_id));", "app_id,audience_id,filter_id,property_name,data", null);
            zze.zza(zze.this.zzbwb(), sQLiteDatabase, "audience_filter_values", "CREATE TABLE IF NOT EXISTS audience_filter_values ( app_id TEXT NOT NULL, audience_id INTEGER NOT NULL, current_results BLOB, PRIMARY KEY (app_id, audience_id));", "app_id,audience_id,current_results", null);
            zze.zza(zze.this.zzbwb(), sQLiteDatabase, "app2", "CREATE TABLE IF NOT EXISTS app2 ( app_id TEXT NOT NULL, first_open_count INTEGER NOT NULL, PRIMARY KEY (app_id));", "app_id,first_open_count", zze.arm);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        @WorkerThread
        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        }
    }

    static {
        arj.put("app_version", "ALTER TABLE apps ADD COLUMN app_version TEXT;");
        arj.put("app_store", "ALTER TABLE apps ADD COLUMN app_store TEXT;");
        arj.put("gmp_version", "ALTER TABLE apps ADD COLUMN gmp_version INTEGER;");
        arj.put("dev_cert_hash", "ALTER TABLE apps ADD COLUMN dev_cert_hash INTEGER;");
        arj.put("measurement_enabled", "ALTER TABLE apps ADD COLUMN measurement_enabled INTEGER;");
        arj.put("last_bundle_start_timestamp", "ALTER TABLE apps ADD COLUMN last_bundle_start_timestamp INTEGER;");
        arj.put("day", "ALTER TABLE apps ADD COLUMN day INTEGER;");
        arj.put("daily_public_events_count", "ALTER TABLE apps ADD COLUMN daily_public_events_count INTEGER;");
        arj.put("daily_events_count", "ALTER TABLE apps ADD COLUMN daily_events_count INTEGER;");
        arj.put("daily_conversions_count", "ALTER TABLE apps ADD COLUMN daily_conversions_count INTEGER;");
        arj.put("remote_config", "ALTER TABLE apps ADD COLUMN remote_config BLOB;");
        arj.put("config_fetched_time", "ALTER TABLE apps ADD COLUMN config_fetched_time INTEGER;");
        arj.put("failed_config_fetch_time", "ALTER TABLE apps ADD COLUMN failed_config_fetch_time INTEGER;");
        arj.put("app_version_int", "ALTER TABLE apps ADD COLUMN app_version_int INTEGER;");
        arj.put("firebase_instance_id", "ALTER TABLE apps ADD COLUMN firebase_instance_id TEXT;");
        arj.put("daily_error_events_count", "ALTER TABLE apps ADD COLUMN daily_error_events_count INTEGER;");
        arj.put("daily_realtime_events_count", "ALTER TABLE apps ADD COLUMN daily_realtime_events_count INTEGER;");
        ark = new ArrayMap(1);
        ark.put("realtime", "ALTER TABLE raw_events ADD COLUMN realtime INTEGER;");
        arl = new ArrayMap(1);
        arl.put("has_realtime", "ALTER TABLE queue ADD COLUMN has_realtime INTEGER;");
        arm = new ArrayMap(1);
        arm.put("previous_install_count", "ALTER TABLE app2 ADD COLUMN previous_install_count INTEGER;");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zze(zzx zzxVar) {
        super(zzxVar);
        this.aro = new zzah(zzabz());
        this.arn = new zzc(getContext(), zzade());
    }

    @WorkerThread
    @TargetApi(11)
    static int zza(Cursor cursor, int i) {
        if (Build.VERSION.SDK_INT >= 11) {
            return cursor.getType(i);
        }
        CursorWindow window = ((SQLiteCursor) cursor).getWindow();
        int position = cursor.getPosition();
        if (window.isNull(position, i)) {
            return 0;
        }
        if (window.isLong(position, i)) {
            return 1;
        }
        if (window.isFloat(position, i)) {
            return 2;
        }
        if (window.isString(position, i)) {
            return 3;
        }
        return window.isBlob(position, i) ? 4 : -1;
    }

    @WorkerThread
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
                zzbwb().zzbwy().zze("Database error", str, e);
                throw e;
            }
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zza(zzq zzqVar, SQLiteDatabase sQLiteDatabase) {
        if (zzqVar == null) {
            throw new IllegalArgumentException("Monitor must not be null");
        }
        if (Build.VERSION.SDK_INT < 9) {
            return;
        }
        File file = new File(sQLiteDatabase.getPath());
        if (!file.setReadable(false, false)) {
            zzqVar.zzbxa().log("Failed to turn off database read permission");
        }
        if (!file.setWritable(false, false)) {
            zzqVar.zzbxa().log("Failed to turn off database write permission");
        }
        if (!file.setReadable(true, true)) {
            zzqVar.zzbxa().log("Failed to turn on database read permission for owner");
        }
        if (file.setWritable(true, true)) {
            return;
        }
        zzqVar.zzbxa().log("Failed to turn on database write permission for owner");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public static void zza(zzq zzqVar, SQLiteDatabase sQLiteDatabase, String str, String str2, String str3, Map<String, String> map) throws SQLiteException {
        if (zzqVar == null) {
            throw new IllegalArgumentException("Monitor must not be null");
        }
        if (!zza(zzqVar, sQLiteDatabase, str)) {
            sQLiteDatabase.execSQL(str2);
        }
        try {
            zza(zzqVar, sQLiteDatabase, str, str3, map);
        } catch (SQLiteException e) {
            zzqVar.zzbwy().zzj("Failed to verify columns on table that was just created", str);
            throw e;
        }
    }

    @WorkerThread
    static void zza(zzq zzqVar, SQLiteDatabase sQLiteDatabase, String str, String str2, Map<String, String> map) throws SQLiteException {
        String[] split;
        if (zzqVar == null) {
            throw new IllegalArgumentException("Monitor must not be null");
        }
        Set<String> zzb2 = zzb(sQLiteDatabase, str);
        for (String str3 : str2.split(",")) {
            if (!zzb2.remove(str3)) {
                throw new SQLiteException(new StringBuilder(String.valueOf(str).length() + 35 + String.valueOf(str3).length()).append("Table ").append(str).append(" is missing required column: ").append(str3).toString());
            }
        }
        if (map != null) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                if (!zzb2.remove(entry.getKey())) {
                    sQLiteDatabase.execSQL(entry.getValue());
                }
            }
        }
        if (zzb2.isEmpty()) {
            return;
        }
        zzqVar.zzbxa().zze("Table has extra columns. table, columns", str, TextUtils.join(", ", zzb2));
    }

    @WorkerThread
    private void zza(String str, zzwa.zza zzaVar) {
        boolean z = false;
        zzacj();
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzy(zzaVar);
        com.google.android.gms.common.internal.zzaa.zzy(zzaVar.awb);
        com.google.android.gms.common.internal.zzaa.zzy(zzaVar.awa);
        if (zzaVar.avZ == null) {
            zzbwb().zzbxa().log("Audience with no ID");
            return;
        }
        int intValue = zzaVar.avZ.intValue();
        for (zzwa.zzb zzbVar : zzaVar.awb) {
            if (zzbVar.awd == null) {
                zzbwb().zzbxa().zze("Event filter with no ID. Audience definition ignored. appId, audienceId", str, zzaVar.avZ);
                return;
            }
        }
        for (zzwa.zze zzeVar : zzaVar.awa) {
            if (zzeVar.awd == null) {
                zzbwb().zzbxa().zze("Property filter with no ID. Audience definition ignored. appId, audienceId", str, zzaVar.avZ);
                return;
            }
        }
        boolean z2 = true;
        zzwa.zzb[] zzbVarArr = zzaVar.awb;
        int length = zzbVarArr.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            } else if (!zza(str, intValue, zzbVarArr[i])) {
                z2 = false;
                break;
            } else {
                i++;
            }
        }
        if (z2) {
            for (zzwa.zze zzeVar2 : zzaVar.awa) {
                if (!zza(str, intValue, zzeVar2)) {
                    break;
                }
            }
        }
        z = z2;
        if (z) {
            return;
        }
        zzaa(str, intValue);
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x004a  */
    @android.support.annotation.WorkerThread
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static boolean zza(com.google.android.gms.measurement.internal.zzq r10, android.database.sqlite.SQLiteDatabase r11, java.lang.String r12) {
        /*
            r8 = 0
            r9 = 0
            if (r10 != 0) goto Ld
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.String r1 = "Monitor must not be null"
            r0.<init>(r1)
            throw r0
        Ld:
            java.lang.String r1 = "SQLITE_MASTER"
            r0 = 1
            java.lang.String[] r2 = new java.lang.String[r0]     // Catch: android.database.sqlite.SQLiteException -> L34 java.lang.Throwable -> L47
            r0 = 0
            java.lang.String r3 = "name"
            r2[r0] = r3     // Catch: android.database.sqlite.SQLiteException -> L34 java.lang.Throwable -> L47
            java.lang.String r3 = "name=?"
            r0 = 1
            java.lang.String[] r4 = new java.lang.String[r0]     // Catch: android.database.sqlite.SQLiteException -> L34 java.lang.Throwable -> L47
            r0 = 0
            r4[r0] = r12     // Catch: android.database.sqlite.SQLiteException -> L34 java.lang.Throwable -> L47
            r5 = 0
            r6 = 0
            r7 = 0
            r0 = r11
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: android.database.sqlite.SQLiteException -> L34 java.lang.Throwable -> L47
            boolean r0 = r1.moveToFirst()     // Catch: java.lang.Throwable -> L4e android.database.sqlite.SQLiteException -> L51
            if (r1 == 0) goto L33
            r1.close()
        L33:
            return r0
        L34:
            r0 = move-exception
            r1 = r9
        L36:
            com.google.android.gms.measurement.internal.zzq$zza r2 = r10.zzbxa()     // Catch: java.lang.Throwable -> L4e
            java.lang.String r3 = "Error querying for table"
            r2.zze(r3, r12, r0)     // Catch: java.lang.Throwable -> L4e
            if (r1 == 0) goto L45
            r1.close()
        L45:
            r0 = r8
            goto L33
        L47:
            r0 = move-exception
        L48:
            if (r9 == 0) goto L4d
            r9.close()
        L4d:
            throw r0
        L4e:
            r0 = move-exception
            r9 = r1
            goto L48
        L51:
            r0 = move-exception
            goto L36
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zza(com.google.android.gms.measurement.internal.zzq, android.database.sqlite.SQLiteDatabase, java.lang.String):boolean");
    }

    @WorkerThread
    private boolean zza(String str, int i, zzwa.zzb zzbVar) {
        zzacj();
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzy(zzbVar);
        if (TextUtils.isEmpty(zzbVar.awe)) {
            zzbwb().zzbxa().zze("Event filter had no event name. Audience definition ignored. audienceId, filterId", Integer.valueOf(i), String.valueOf(zzbVar.awd));
            return false;
        }
        try {
            byte[] bArr = new byte[zzbVar.cz()];
            zzart zzbe = zzart.zzbe(bArr);
            zzbVar.zza(zzbe);
            zzbe.cm();
            ContentValues contentValues = new ContentValues();
            contentValues.put("app_id", str);
            contentValues.put("audience_id", Integer.valueOf(i));
            contentValues.put("filter_id", zzbVar.awd);
            contentValues.put("event_name", zzbVar.awe);
            contentValues.put("data", bArr);
            try {
                if (getWritableDatabase().insertWithOnConflict("event_filters", null, contentValues, 5) == -1) {
                    zzbwb().zzbwy().log("Failed to insert event filter (got -1)");
                }
                return true;
            } catch (SQLiteException e) {
                zzbwb().zzbwy().zzj("Error storing event filter", e);
                return false;
            }
        } catch (IOException e2) {
            zzbwb().zzbwy().zzj("Configuration loss. Failed to serialize event filter", e2);
            return false;
        }
    }

    @WorkerThread
    private boolean zza(String str, int i, zzwa.zze zzeVar) {
        zzacj();
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzy(zzeVar);
        if (TextUtils.isEmpty(zzeVar.awt)) {
            zzbwb().zzbxa().zze("Property filter had no property name. Audience definition ignored. audienceId, filterId", Integer.valueOf(i), String.valueOf(zzeVar.awd));
            return false;
        }
        try {
            byte[] bArr = new byte[zzeVar.cz()];
            zzart zzbe = zzart.zzbe(bArr);
            zzeVar.zza(zzbe);
            zzbe.cm();
            ContentValues contentValues = new ContentValues();
            contentValues.put("app_id", str);
            contentValues.put("audience_id", Integer.valueOf(i));
            contentValues.put("filter_id", zzeVar.awd);
            contentValues.put("property_name", zzeVar.awt);
            contentValues.put("data", bArr);
            try {
                if (getWritableDatabase().insertWithOnConflict("property_filters", null, contentValues, 5) != -1) {
                    return true;
                }
                zzbwb().zzbwy().log("Failed to insert property filter (got -1)");
                return false;
            } catch (SQLiteException e) {
                zzbwb().zzbwy().zzj("Error storing property filter", e);
                return false;
            }
        } catch (IOException e2) {
            zzbwb().zzbwy().zzj("Configuration loss. Failed to serialize property filter", e2);
            return false;
        }
    }

    @WorkerThread
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
                zzbwb().zzbwy().zze("Database error", str, e);
                throw e;
            }
        } catch (Throwable th) {
            if (0 != 0) {
                cursor.close();
            }
            throw th;
        }
    }

    @WorkerThread
    static Set<String> zzb(SQLiteDatabase sQLiteDatabase, String str) {
        HashSet hashSet = new HashSet();
        Cursor rawQuery = sQLiteDatabase.rawQuery(new StringBuilder(String.valueOf(str).length() + 22).append("SELECT * FROM ").append(str).append(" LIMIT 0").toString(), null);
        try {
            Collections.addAll(hashSet, rawQuery.getColumnNames());
            return hashSet;
        } finally {
            rawQuery.close();
        }
    }

    private boolean zzbwn() {
        return getContext().getDatabasePath(zzade()).exists();
    }

    @WorkerThread
    public void beginTransaction() {
        zzacj();
        getWritableDatabase().beginTransaction();
    }

    @WorkerThread
    public void endTransaction() {
        zzacj();
        getWritableDatabase().endTransaction();
    }

    @WorkerThread
    SQLiteDatabase getWritableDatabase() {
        zzzx();
        try {
            return this.arn.getWritableDatabase();
        } catch (SQLiteException e) {
            zzbwb().zzbxa().zzj("Error opening database", e);
            throw e;
        }
    }

    @WorkerThread
    public void setTransactionSuccessful() {
        zzacj();
        getWritableDatabase().setTransactionSuccessful();
    }

    public long zza(zzwc.zze zzeVar) throws IOException {
        zzzx();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(zzeVar);
        com.google.android.gms.common.internal.zzaa.zzib(zzeVar.zzcs);
        try {
            byte[] bArr = new byte[zzeVar.cz()];
            zzart zzbe = zzart.zzbe(bArr);
            zzeVar.zza(zzbe);
            zzbe.cm();
            long zzz = zzbvx().zzz(bArr);
            ContentValues contentValues = new ContentValues();
            contentValues.put("app_id", zzeVar.zzcs);
            contentValues.put("metadata_fingerprint", Long.valueOf(zzz));
            contentValues.put(TtmlNode.TAG_METADATA, bArr);
            try {
                getWritableDatabase().insertWithOnConflict("raw_events_metadata", null, contentValues, 4);
                return zzz;
            } catch (SQLiteException e) {
                zzbwb().zzbwy().zzj("Error storing raw event metadata", e);
                throw e;
            }
        } catch (IOException e2) {
            zzbwb().zzbwy().zzj("Data loss. Failed to serialize event metadata", e2);
            throw e2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x013f  */
    @android.support.annotation.WorkerThread
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.android.gms.measurement.internal.zze.zza zza(long r12, java.lang.String r14, boolean r15, boolean r16, boolean r17, boolean r18, boolean r19) {
        /*
            Method dump skipped, instructions count: 327
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zza(long, java.lang.String, boolean, boolean, boolean, boolean, boolean):com.google.android.gms.measurement.internal.zze$zza");
    }

    @WorkerThread
    void zza(ContentValues contentValues, String str, Object obj) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzy(obj);
        if (obj instanceof String) {
            contentValues.put(str, (String) obj);
        } else if (obj instanceof Long) {
            contentValues.put(str, (Long) obj);
        } else if (!(obj instanceof Double)) {
            throw new IllegalArgumentException("Invalid value type");
        } else {
            contentValues.put(str, (Double) obj);
        }
    }

    @WorkerThread
    public void zza(zzwc.zze zzeVar, boolean z) {
        zzzx();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(zzeVar);
        com.google.android.gms.common.internal.zzaa.zzib(zzeVar.zzcs);
        com.google.android.gms.common.internal.zzaa.zzy(zzeVar.awZ);
        zzbwg();
        long currentTimeMillis = zzabz().currentTimeMillis();
        if (zzeVar.awZ.longValue() < currentTimeMillis - zzbwd().zzbuv() || zzeVar.awZ.longValue() > zzbwd().zzbuv() + currentTimeMillis) {
            zzbwb().zzbxa().zze("Storing bundle outside of the max uploading time span. now, timestamp", Long.valueOf(currentTimeMillis), zzeVar.awZ);
        }
        try {
            byte[] bArr = new byte[zzeVar.cz()];
            zzart zzbe = zzart.zzbe(bArr);
            zzeVar.zza(zzbe);
            zzbe.cm();
            byte[] zzk = zzbvx().zzk(bArr);
            zzbwb().zzbxe().zzj("Saving bundle, size", Integer.valueOf(zzk.length));
            ContentValues contentValues = new ContentValues();
            contentValues.put("app_id", zzeVar.zzcs);
            contentValues.put("bundle_end_timestamp", zzeVar.awZ);
            contentValues.put("data", zzk);
            contentValues.put("has_realtime", Integer.valueOf(z ? 1 : 0));
            try {
                if (getWritableDatabase().insert("queue", null, contentValues) != -1) {
                    return;
                }
                zzbwb().zzbwy().log("Failed to insert bundle (got -1)");
            } catch (SQLiteException e) {
                zzbwb().zzbwy().zzj("Error storing bundle", e);
            }
        } catch (IOException e2) {
            zzbwb().zzbwy().zzj("Data loss. Failed to serialize bundle", e2);
        }
    }

    @WorkerThread
    public void zza(com.google.android.gms.measurement.internal.zza zzaVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzaVar);
        zzzx();
        zzacj();
        ContentValues contentValues = new ContentValues();
        contentValues.put("app_id", zzaVar.zzup());
        contentValues.put("app_instance_id", zzaVar.zzazn());
        contentValues.put("gmp_app_id", zzaVar.zzbth());
        contentValues.put("resettable_device_id_hash", zzaVar.zzbti());
        contentValues.put("last_bundle_index", Long.valueOf(zzaVar.zzbtr()));
        contentValues.put("last_bundle_start_timestamp", Long.valueOf(zzaVar.zzbtk()));
        contentValues.put("last_bundle_end_timestamp", Long.valueOf(zzaVar.zzbtl()));
        contentValues.put("app_version", zzaVar.zzaaf());
        contentValues.put("app_store", zzaVar.zzbtn());
        contentValues.put("gmp_version", Long.valueOf(zzaVar.zzbto()));
        contentValues.put("dev_cert_hash", Long.valueOf(zzaVar.zzbtp()));
        contentValues.put("measurement_enabled", Boolean.valueOf(zzaVar.zzbtq()));
        contentValues.put("day", Long.valueOf(zzaVar.zzbtv()));
        contentValues.put("daily_public_events_count", Long.valueOf(zzaVar.zzbtw()));
        contentValues.put("daily_events_count", Long.valueOf(zzaVar.zzbtx()));
        contentValues.put("daily_conversions_count", Long.valueOf(zzaVar.zzbty()));
        contentValues.put("config_fetched_time", Long.valueOf(zzaVar.zzbts()));
        contentValues.put("failed_config_fetch_time", Long.valueOf(zzaVar.zzbtt()));
        contentValues.put("app_version_int", Long.valueOf(zzaVar.zzbtm()));
        contentValues.put("firebase_instance_id", zzaVar.zzbtj());
        contentValues.put("daily_error_events_count", Long.valueOf(zzaVar.zzbua()));
        contentValues.put("daily_realtime_events_count", Long.valueOf(zzaVar.zzbtz()));
        try {
            if (getWritableDatabase().insertWithOnConflict("apps", null, contentValues, 5) != -1) {
                return;
            }
            zzbwb().zzbwy().log("Failed to insert/update app (got -1)");
        } catch (SQLiteException e) {
            zzbwb().zzbwy().zzj("Error storing app", e);
        }
    }

    public void zza(zzh zzhVar, long j, boolean z) {
        int i = 0;
        zzzx();
        zzacj();
        com.google.android.gms.common.internal.zzaa.zzy(zzhVar);
        com.google.android.gms.common.internal.zzaa.zzib(zzhVar.zzctj);
        zzwc.zzb zzbVar = new zzwc.zzb();
        zzbVar.awP = Long.valueOf(zzhVar.arB);
        zzbVar.awN = new zzwc.zzc[zzhVar.arC.size()];
        Iterator<String> it = zzhVar.arC.iterator();
        int i2 = 0;
        while (it.hasNext()) {
            String next = it.next();
            zzwc.zzc zzcVar = new zzwc.zzc();
            zzbVar.awN[i2] = zzcVar;
            zzcVar.name = next;
            zzbvx().zza(zzcVar, zzhVar.arC.get(next));
            i2++;
        }
        try {
            byte[] bArr = new byte[zzbVar.cz()];
            zzart zzbe = zzart.zzbe(bArr);
            zzbVar.zza(zzbe);
            zzbe.cm();
            zzbwb().zzbxe().zze("Saving event, name, data size", zzhVar.mName, Integer.valueOf(bArr.length));
            ContentValues contentValues = new ContentValues();
            contentValues.put("app_id", zzhVar.zzctj);
            contentValues.put("name", zzhVar.mName);
            contentValues.put(JsonMarshaller.TIMESTAMP, Long.valueOf(zzhVar.vO));
            contentValues.put("metadata_fingerprint", Long.valueOf(j));
            contentValues.put("data", bArr);
            if (z) {
                i = 1;
            }
            contentValues.put("realtime", Integer.valueOf(i));
            try {
                if (getWritableDatabase().insert("raw_events", null, contentValues) != -1) {
                    return;
                }
                zzbwb().zzbwy().log("Failed to insert raw event (got -1)");
            } catch (SQLiteException e) {
                zzbwb().zzbwy().zzj("Error storing raw event", e);
            }
        } catch (IOException e2) {
            zzbwb().zzbwy().zzj("Data loss. Failed to serialize event params/data", e2);
        }
    }

    @WorkerThread
    public void zza(zzi zziVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zziVar);
        zzzx();
        zzacj();
        ContentValues contentValues = new ContentValues();
        contentValues.put("app_id", zziVar.zzctj);
        contentValues.put("name", zziVar.mName);
        contentValues.put("lifetime_count", Long.valueOf(zziVar.arD));
        contentValues.put("current_bundle_count", Long.valueOf(zziVar.arE));
        contentValues.put("last_fire_timestamp", Long.valueOf(zziVar.arF));
        try {
            if (getWritableDatabase().insertWithOnConflict("events", null, contentValues, 5) != -1) {
                return;
            }
            zzbwb().zzbwy().log("Failed to insert/update event aggregates (got -1)");
        } catch (SQLiteException e) {
            zzbwb().zzbwy().zzj("Error storing event aggregates", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(String str, int i, zzwc.zzf zzfVar) {
        zzacj();
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzy(zzfVar);
        try {
            byte[] bArr = new byte[zzfVar.cz()];
            zzart zzbe = zzart.zzbe(bArr);
            zzfVar.zza(zzbe);
            zzbe.cm();
            ContentValues contentValues = new ContentValues();
            contentValues.put("app_id", str);
            contentValues.put("audience_id", Integer.valueOf(i));
            contentValues.put("current_results", bArr);
            try {
                if (getWritableDatabase().insertWithOnConflict("audience_filter_values", null, contentValues, 5) != -1) {
                    return;
                }
                zzbwb().zzbwy().log("Failed to insert filter results (got -1)");
            } catch (SQLiteException e) {
                zzbwb().zzbwy().zzj("Error storing filter results", e);
            }
        } catch (IOException e2) {
            zzbwb().zzbwy().zzj("Configuration loss. Failed to serialize filter results", e2);
        }
    }

    public void zza(String str, long j, long j2, zzb zzbVar) {
        SQLiteDatabase writableDatabase;
        String str2;
        Cursor cursor;
        String str3;
        String[] strArr;
        com.google.android.gms.common.internal.zzaa.zzy(zzbVar);
        zzzx();
        zzacj();
        Cursor cursor2 = null;
        try {
            try {
                writableDatabase = getWritableDatabase();
                if (TextUtils.isEmpty(str)) {
                    String[] strArr2 = j2 != -1 ? new String[]{String.valueOf(j2), String.valueOf(j)} : new String[]{String.valueOf(j)};
                    String str4 = j2 != -1 ? "rowid <= ? and " : "";
                    Cursor rawQuery = writableDatabase.rawQuery(new StringBuilder(String.valueOf(str4).length() + 148).append("select app_id, metadata_fingerprint from raw_events where ").append(str4).append("app_id in (select app_id from apps where config_fetched_time >= ?) order by rowid limit 1;").toString(), strArr2);
                    if (!rawQuery.moveToFirst()) {
                        if (rawQuery == null) {
                            return;
                        }
                        rawQuery.close();
                        return;
                    }
                    str = rawQuery.getString(0);
                    String string = rawQuery.getString(1);
                    rawQuery.close();
                    str2 = string;
                    cursor = rawQuery;
                } else {
                    String[] strArr3 = j2 != -1 ? new String[]{str, String.valueOf(j2)} : new String[]{str};
                    String str5 = j2 != -1 ? " and rowid <= ?" : "";
                    Cursor rawQuery2 = writableDatabase.rawQuery(new StringBuilder(String.valueOf(str5).length() + 84).append("select metadata_fingerprint from raw_events where app_id = ?").append(str5).append(" order by rowid limit 1;").toString(), strArr3);
                    if (!rawQuery2.moveToFirst()) {
                        if (rawQuery2 == null) {
                            return;
                        }
                        rawQuery2.close();
                        return;
                    }
                    String string2 = rawQuery2.getString(0);
                    rawQuery2.close();
                    str2 = string2;
                    cursor = rawQuery2;
                }
            } catch (SQLiteException e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            Cursor query = writableDatabase.query("raw_events_metadata", new String[]{TtmlNode.TAG_METADATA}, "app_id = ? and metadata_fingerprint = ?", new String[]{str, str2}, null, null, "rowid", "2");
            if (!query.moveToFirst()) {
                zzbwb().zzbwy().log("Raw event metadata record is missing");
                if (query == null) {
                    return;
                }
                query.close();
                return;
            }
            zzars zzbd = zzars.zzbd(query.getBlob(0));
            zzwc.zze zzeVar = new zzwc.zze();
            try {
                zzwc.zze zzeVar2 = (zzwc.zze) zzeVar.zzb(zzbd);
                if (query.moveToNext()) {
                    zzbwb().zzbxa().log("Get multiple raw event metadata records, expected one");
                }
                query.close();
                zzbVar.zzb(zzeVar);
                if (j2 != -1) {
                    str3 = "app_id = ? and metadata_fingerprint = ? and rowid <= ?";
                    strArr = new String[]{str, str2, String.valueOf(j2)};
                } else {
                    str3 = "app_id = ? and metadata_fingerprint = ?";
                    strArr = new String[]{str, str2};
                }
                Cursor query2 = writableDatabase.query("raw_events", new String[]{"rowid", "name", JsonMarshaller.TIMESTAMP, "data"}, str3, strArr, null, null, "rowid", null);
                if (!query2.moveToFirst()) {
                    zzbwb().zzbxa().log("Raw event data disappeared while in transaction");
                    if (query2 == null) {
                        return;
                    }
                    query2.close();
                    return;
                }
                do {
                    long j3 = query2.getLong(0);
                    zzars zzbd2 = zzars.zzbd(query2.getBlob(3));
                    zzwc.zzb zzbVar2 = new zzwc.zzb();
                    try {
                        zzwc.zzb zzbVar3 = (zzwc.zzb) zzbVar2.zzb(zzbd2);
                        zzbVar2.name = query2.getString(1);
                        zzbVar2.awO = Long.valueOf(query2.getLong(2));
                        if (!zzbVar.zza(j3, zzbVar2)) {
                            if (query2 == null) {
                                return;
                            }
                            query2.close();
                            return;
                        }
                    } catch (IOException e2) {
                        zzbwb().zzbwy().zze("Data loss. Failed to merge raw event", str, e2);
                    }
                } while (query2.moveToNext());
                if (query2 == null) {
                    return;
                }
                query2.close();
            } catch (IOException e3) {
                zzbwb().zzbwy().zze("Data loss. Failed to merge raw event metadata", str, e3);
                if (query == null) {
                    return;
                }
                query.close();
            }
        } catch (SQLiteException e4) {
            e = e4;
            cursor2 = cursor;
            zzbwb().zzbwy().zzj("Data loss. Error selecting raw event", e);
            if (cursor2 == null) {
                return;
            }
            cursor2.close();
        } catch (Throwable th2) {
            th = th2;
            cursor2 = cursor;
            if (cursor2 != null) {
                cursor2.close();
            }
            throw th;
        }
    }

    @WorkerThread
    public boolean zza(zzak zzakVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzakVar);
        zzzx();
        zzacj();
        if (zzar(zzakVar.zzctj, zzakVar.mName) == null) {
            if (zzal.zzmu(zzakVar.mName)) {
                long zzb2 = zzb("select count(1) from user_attributes where app_id=? and name not like '!_%' escape '!'", new String[]{zzakVar.zzctj});
                zzbwd().zzbun();
                if (zzb2 >= 25) {
                    return false;
                }
            } else {
                long zzb3 = zzb("select count(1) from user_attributes where app_id=?", new String[]{zzakVar.zzctj});
                zzbwd().zzbuo();
                if (zzb3 >= 50) {
                    return false;
                }
            }
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("app_id", zzakVar.zzctj);
        contentValues.put("name", zzakVar.mName);
        contentValues.put("set_timestamp", Long.valueOf(zzakVar.avX));
        zza(contentValues, "value", zzakVar.zzcyd);
        try {
            if (getWritableDatabase().insertWithOnConflict("user_attributes", null, contentValues, 5) == -1) {
                zzbwb().zzbwy().log("Failed to insert/update user property (got -1)");
            }
        } catch (SQLiteException e) {
            zzbwb().zzbwy().zzj("Error storing user property", e);
        }
        return true;
    }

    @WorkerThread
    void zzaa(String str, int i) {
        zzacj();
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        SQLiteDatabase writableDatabase = getWritableDatabase();
        writableDatabase.delete("property_filters", "app_id=? and audience_id=?", new String[]{str, String.valueOf(i)});
        writableDatabase.delete("event_filters", "app_id=? and audience_id=?", new String[]{str, String.valueOf(i)});
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzade() {
        return zzbwd().zzafe();
    }

    public void zzaf(List<Long> list) {
        com.google.android.gms.common.internal.zzaa.zzy(list);
        zzzx();
        zzacj();
        StringBuilder sb = new StringBuilder("rowid in (");
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= list.size()) {
                break;
            }
            if (i2 != 0) {
                sb.append(",");
            }
            sb.append(list.get(i2).longValue());
            i = i2 + 1;
        }
        sb.append(")");
        int delete = getWritableDatabase().delete("raw_events", sb.toString(), null);
        if (delete != list.size()) {
            zzbwb().zzbwy().zze("Deleted fewer rows from raw events table than expected", Integer.valueOf(delete), Integer.valueOf(list.size()));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0093  */
    @android.support.annotation.WorkerThread
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.android.gms.measurement.internal.zzi zzap(java.lang.String r13, java.lang.String r14) {
        /*
            r12 = this;
            r10 = 0
            com.google.android.gms.common.internal.zzaa.zzib(r13)
            com.google.android.gms.common.internal.zzaa.zzib(r14)
            r12.zzzx()
            r12.zzacj()
            android.database.sqlite.SQLiteDatabase r0 = r12.getWritableDatabase()     // Catch: android.database.sqlite.SQLiteException -> L79 java.lang.Throwable -> L90
            java.lang.String r1 = "events"
            r2 = 3
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: android.database.sqlite.SQLiteException -> L79 java.lang.Throwable -> L90
            r3 = 0
            java.lang.String r4 = "lifetime_count"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L79 java.lang.Throwable -> L90
            r3 = 1
            java.lang.String r4 = "current_bundle_count"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L79 java.lang.Throwable -> L90
            r3 = 2
            java.lang.String r4 = "last_fire_timestamp"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L79 java.lang.Throwable -> L90
            java.lang.String r3 = "app_id=? and name=?"
            r4 = 2
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch: android.database.sqlite.SQLiteException -> L79 java.lang.Throwable -> L90
            r5 = 0
            r4[r5] = r13     // Catch: android.database.sqlite.SQLiteException -> L79 java.lang.Throwable -> L90
            r5 = 1
            r4[r5] = r14     // Catch: android.database.sqlite.SQLiteException -> L79 java.lang.Throwable -> L90
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r11 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: android.database.sqlite.SQLiteException -> L79 java.lang.Throwable -> L90
            boolean r0 = r11.moveToFirst()     // Catch: java.lang.Throwable -> L97 android.database.sqlite.SQLiteException -> L9d
            if (r0 != 0) goto L49
            if (r11 == 0) goto L47
            r11.close()
        L47:
            r1 = r10
        L48:
            return r1
        L49:
            r0 = 0
            long r4 = r11.getLong(r0)     // Catch: java.lang.Throwable -> L97 android.database.sqlite.SQLiteException -> L9d
            r0 = 1
            long r6 = r11.getLong(r0)     // Catch: java.lang.Throwable -> L97 android.database.sqlite.SQLiteException -> L9d
            r0 = 2
            long r8 = r11.getLong(r0)     // Catch: java.lang.Throwable -> L97 android.database.sqlite.SQLiteException -> L9d
            com.google.android.gms.measurement.internal.zzi r1 = new com.google.android.gms.measurement.internal.zzi     // Catch: java.lang.Throwable -> L97 android.database.sqlite.SQLiteException -> L9d
            r2 = r13
            r3 = r14
            r1.<init>(r2, r3, r4, r6, r8)     // Catch: java.lang.Throwable -> L97 android.database.sqlite.SQLiteException -> L9d
            boolean r0 = r11.moveToNext()     // Catch: java.lang.Throwable -> L97 android.database.sqlite.SQLiteException -> L9d
            if (r0 == 0) goto L73
            com.google.android.gms.measurement.internal.zzq r0 = r12.zzbwb()     // Catch: java.lang.Throwable -> L97 android.database.sqlite.SQLiteException -> L9d
            com.google.android.gms.measurement.internal.zzq$zza r0 = r0.zzbwy()     // Catch: java.lang.Throwable -> L97 android.database.sqlite.SQLiteException -> L9d
            java.lang.String r2 = "Got multiple records for event aggregates, expected one"
            r0.log(r2)     // Catch: java.lang.Throwable -> L97 android.database.sqlite.SQLiteException -> L9d
        L73:
            if (r11 == 0) goto L48
            r11.close()
            goto L48
        L79:
            r0 = move-exception
            r1 = r10
        L7b:
            com.google.android.gms.measurement.internal.zzq r2 = r12.zzbwb()     // Catch: java.lang.Throwable -> L9a
            com.google.android.gms.measurement.internal.zzq$zza r2 = r2.zzbwy()     // Catch: java.lang.Throwable -> L9a
            java.lang.String r3 = "Error querying events"
            r2.zzd(r3, r13, r14, r0)     // Catch: java.lang.Throwable -> L9a
            if (r1 == 0) goto L8e
            r1.close()
        L8e:
            r1 = r10
            goto L48
        L90:
            r0 = move-exception
        L91:
            if (r10 == 0) goto L96
            r10.close()
        L96:
            throw r0
        L97:
            r0 = move-exception
            r10 = r11
            goto L91
        L9a:
            r0 = move-exception
            r10 = r1
            goto L91
        L9d:
            r0 = move-exception
            r1 = r11
            goto L7b
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zzap(java.lang.String, java.lang.String):com.google.android.gms.measurement.internal.zzi");
    }

    @WorkerThread
    public void zzaq(String str, String str2) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzib(str2);
        zzzx();
        zzacj();
        try {
            zzbwb().zzbxe().zzj("Deleted user attribute rows:", Integer.valueOf(getWritableDatabase().delete("user_attributes", "app_id=? and name=?", new String[]{str, str2})));
        } catch (SQLiteException e) {
            zzbwb().zzbwy().zzd("Error deleting user attribute", str, str2, e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0088  */
    @android.support.annotation.WorkerThread
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.android.gms.measurement.internal.zzak zzar(java.lang.String r10, java.lang.String r11) {
        /*
            r9 = this;
            r8 = 0
            com.google.android.gms.common.internal.zzaa.zzib(r10)
            com.google.android.gms.common.internal.zzaa.zzib(r11)
            r9.zzzx()
            r9.zzacj()
            android.database.sqlite.SQLiteDatabase r0 = r9.getWritableDatabase()     // Catch: android.database.sqlite.SQLiteException -> L6e java.lang.Throwable -> L85
            java.lang.String r1 = "user_attributes"
            r2 = 2
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: android.database.sqlite.SQLiteException -> L6e java.lang.Throwable -> L85
            r3 = 0
            java.lang.String r4 = "set_timestamp"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L6e java.lang.Throwable -> L85
            r3 = 1
            java.lang.String r4 = "value"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L6e java.lang.Throwable -> L85
            java.lang.String r3 = "app_id=? and name=?"
            r4 = 2
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch: android.database.sqlite.SQLiteException -> L6e java.lang.Throwable -> L85
            r5 = 0
            r4[r5] = r10     // Catch: android.database.sqlite.SQLiteException -> L6e java.lang.Throwable -> L85
            r5 = 1
            r4[r5] = r11     // Catch: android.database.sqlite.SQLiteException -> L6e java.lang.Throwable -> L85
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r7 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: android.database.sqlite.SQLiteException -> L6e java.lang.Throwable -> L85
            boolean r0 = r7.moveToFirst()     // Catch: java.lang.Throwable -> L8c android.database.sqlite.SQLiteException -> L92
            if (r0 != 0) goto L43
            if (r7 == 0) goto L41
            r7.close()
        L41:
            r1 = r8
        L42:
            return r1
        L43:
            r0 = 0
            long r4 = r7.getLong(r0)     // Catch: java.lang.Throwable -> L8c android.database.sqlite.SQLiteException -> L92
            r0 = 1
            java.lang.Object r6 = r9.zzb(r7, r0)     // Catch: java.lang.Throwable -> L8c android.database.sqlite.SQLiteException -> L92
            com.google.android.gms.measurement.internal.zzak r1 = new com.google.android.gms.measurement.internal.zzak     // Catch: java.lang.Throwable -> L8c android.database.sqlite.SQLiteException -> L92
            r2 = r10
            r3 = r11
            r1.<init>(r2, r3, r4, r6)     // Catch: java.lang.Throwable -> L8c android.database.sqlite.SQLiteException -> L92
            boolean r0 = r7.moveToNext()     // Catch: java.lang.Throwable -> L8c android.database.sqlite.SQLiteException -> L92
            if (r0 == 0) goto L68
            com.google.android.gms.measurement.internal.zzq r0 = r9.zzbwb()     // Catch: java.lang.Throwable -> L8c android.database.sqlite.SQLiteException -> L92
            com.google.android.gms.measurement.internal.zzq$zza r0 = r0.zzbwy()     // Catch: java.lang.Throwable -> L8c android.database.sqlite.SQLiteException -> L92
            java.lang.String r2 = "Got multiple records for user property, expected one"
            r0.log(r2)     // Catch: java.lang.Throwable -> L8c android.database.sqlite.SQLiteException -> L92
        L68:
            if (r7 == 0) goto L42
            r7.close()
            goto L42
        L6e:
            r0 = move-exception
            r1 = r8
        L70:
            com.google.android.gms.measurement.internal.zzq r2 = r9.zzbwb()     // Catch: java.lang.Throwable -> L8f
            com.google.android.gms.measurement.internal.zzq$zza r2 = r2.zzbwy()     // Catch: java.lang.Throwable -> L8f
            java.lang.String r3 = "Error querying user property"
            r2.zzd(r3, r10, r11, r0)     // Catch: java.lang.Throwable -> L8f
            if (r1 == 0) goto L83
            r1.close()
        L83:
            r1 = r8
            goto L42
        L85:
            r0 = move-exception
        L86:
            if (r8 == 0) goto L8b
            r8.close()
        L8b:
            throw r0
        L8c:
            r0 = move-exception
            r8 = r7
            goto L86
        L8f:
            r0 = move-exception
            r8 = r1
            goto L86
        L92:
            r0 = move-exception
            r1 = r7
            goto L70
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zzar(java.lang.String, java.lang.String):com.google.android.gms.measurement.internal.zzak");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00b6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.Map<java.lang.Integer, java.util.List<com.google.android.gms.internal.zzwa.zzb>> zzas(java.lang.String r11, java.lang.String r12) {
        /*
            r10 = this;
            r9 = 0
            r10.zzacj()
            r10.zzzx()
            com.google.android.gms.common.internal.zzaa.zzib(r11)
            com.google.android.gms.common.internal.zzaa.zzib(r12)
            android.support.v4.util.ArrayMap r8 = new android.support.v4.util.ArrayMap
            r8.<init>()
            android.database.sqlite.SQLiteDatabase r0 = r10.getWritableDatabase()
            java.lang.String r1 = "event_filters"
            r2 = 2
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            r3 = 0
            java.lang.String r4 = "audience_id"
            r2[r3] = r4     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            r3 = 1
            java.lang.String r4 = "data"
            r2[r3] = r4     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            java.lang.String r3 = "app_id=? AND event_name=?"
            r4 = 2
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            r5 = 0
            r4[r5] = r11     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            r5 = 1
            r4[r5] = r12     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            boolean r0 = r1.moveToFirst()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            if (r0 != 0) goto L4b
            java.util.Map r0 = java.util.Collections.emptyMap()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            if (r1 == 0) goto L4a
            r1.close()
        L4a:
            return r0
        L4b:
            r0 = 1
            byte[] r0 = r1.getBlob(r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            com.google.android.gms.internal.zzars r0 = com.google.android.gms.internal.zzars.zzbd(r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            com.google.android.gms.internal.zzwa$zzb r2 = new com.google.android.gms.internal.zzwa$zzb     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            r2.<init>()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            com.google.android.gms.internal.zzasa r0 = r2.zzb(r0)     // Catch: java.io.IOException -> L8c android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            com.google.android.gms.internal.zzwa$zzb r0 = (com.google.android.gms.internal.zzwa.zzb) r0     // Catch: java.io.IOException -> L8c android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            r0 = 0
            int r3 = r1.getInt(r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            java.lang.Integer r0 = java.lang.Integer.valueOf(r3)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            java.lang.Object r0 = r8.get(r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            java.util.List r0 = (java.util.List) r0     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            if (r0 != 0) goto L7c
            java.util.ArrayList r0 = new java.util.ArrayList     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            r0.<init>()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            java.lang.Integer r3 = java.lang.Integer.valueOf(r3)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            r8.put(r3, r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
        L7c:
            r0.add(r2)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
        L7f:
            boolean r0 = r1.moveToNext()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            if (r0 != 0) goto L4b
            if (r1 == 0) goto L8a
            r1.close()
        L8a:
            r0 = r8
            goto L4a
        L8c:
            r0 = move-exception
            com.google.android.gms.measurement.internal.zzq r2 = r10.zzbwb()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            com.google.android.gms.measurement.internal.zzq$zza r2 = r2.zzbwy()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            java.lang.String r3 = "Failed to merge filter"
            r2.zze(r3, r11, r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            goto L7f
        L9c:
            r0 = move-exception
        L9d:
            com.google.android.gms.measurement.internal.zzq r2 = r10.zzbwb()     // Catch: java.lang.Throwable -> Lba
            com.google.android.gms.measurement.internal.zzq$zza r2 = r2.zzbwy()     // Catch: java.lang.Throwable -> Lba
            java.lang.String r3 = "Database error querying filters"
            r2.zzj(r3, r0)     // Catch: java.lang.Throwable -> Lba
            if (r1 == 0) goto Lb0
            r1.close()
        Lb0:
            r0 = r9
            goto L4a
        Lb2:
            r0 = move-exception
            r1 = r9
        Lb4:
            if (r1 == 0) goto Lb9
            r1.close()
        Lb9:
            throw r0
        Lba:
            r0 = move-exception
            goto Lb4
        Lbc:
            r0 = move-exception
            r1 = r9
            goto L9d
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zzas(java.lang.String, java.lang.String):java.util.Map");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00b6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.Map<java.lang.Integer, java.util.List<com.google.android.gms.internal.zzwa.zze>> zzat(java.lang.String r11, java.lang.String r12) {
        /*
            r10 = this;
            r9 = 0
            r10.zzacj()
            r10.zzzx()
            com.google.android.gms.common.internal.zzaa.zzib(r11)
            com.google.android.gms.common.internal.zzaa.zzib(r12)
            android.support.v4.util.ArrayMap r8 = new android.support.v4.util.ArrayMap
            r8.<init>()
            android.database.sqlite.SQLiteDatabase r0 = r10.getWritableDatabase()
            java.lang.String r1 = "property_filters"
            r2 = 2
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            r3 = 0
            java.lang.String r4 = "audience_id"
            r2[r3] = r4     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            r3 = 1
            java.lang.String r4 = "data"
            r2[r3] = r4     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            java.lang.String r3 = "app_id=? AND property_name=?"
            r4 = 2
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            r5 = 0
            r4[r5] = r11     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            r5 = 1
            r4[r5] = r12     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> Lb2 android.database.sqlite.SQLiteException -> Lbc
            boolean r0 = r1.moveToFirst()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            if (r0 != 0) goto L4b
            java.util.Map r0 = java.util.Collections.emptyMap()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            if (r1 == 0) goto L4a
            r1.close()
        L4a:
            return r0
        L4b:
            r0 = 1
            byte[] r0 = r1.getBlob(r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            com.google.android.gms.internal.zzars r0 = com.google.android.gms.internal.zzars.zzbd(r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            com.google.android.gms.internal.zzwa$zze r2 = new com.google.android.gms.internal.zzwa$zze     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            r2.<init>()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            com.google.android.gms.internal.zzasa r0 = r2.zzb(r0)     // Catch: java.io.IOException -> L8c android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            com.google.android.gms.internal.zzwa$zze r0 = (com.google.android.gms.internal.zzwa.zze) r0     // Catch: java.io.IOException -> L8c android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            r0 = 0
            int r3 = r1.getInt(r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            java.lang.Integer r0 = java.lang.Integer.valueOf(r3)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            java.lang.Object r0 = r8.get(r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            java.util.List r0 = (java.util.List) r0     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            if (r0 != 0) goto L7c
            java.util.ArrayList r0 = new java.util.ArrayList     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            r0.<init>()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            java.lang.Integer r3 = java.lang.Integer.valueOf(r3)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            r8.put(r3, r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
        L7c:
            r0.add(r2)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
        L7f:
            boolean r0 = r1.moveToNext()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            if (r0 != 0) goto L4b
            if (r1 == 0) goto L8a
            r1.close()
        L8a:
            r0 = r8
            goto L4a
        L8c:
            r0 = move-exception
            com.google.android.gms.measurement.internal.zzq r2 = r10.zzbwb()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            com.google.android.gms.measurement.internal.zzq$zza r2 = r2.zzbwy()     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            java.lang.String r3 = "Failed to merge filter"
            r2.zze(r3, r11, r0)     // Catch: android.database.sqlite.SQLiteException -> L9c java.lang.Throwable -> Lba
            goto L7f
        L9c:
            r0 = move-exception
        L9d:
            com.google.android.gms.measurement.internal.zzq r2 = r10.zzbwb()     // Catch: java.lang.Throwable -> Lba
            com.google.android.gms.measurement.internal.zzq$zza r2 = r2.zzbwy()     // Catch: java.lang.Throwable -> Lba
            java.lang.String r3 = "Database error querying filters"
            r2.zzj(r3, r0)     // Catch: java.lang.Throwable -> Lba
            if (r1 == 0) goto Lb0
            r1.close()
        Lb0:
            r0 = r9
            goto L4a
        Lb2:
            r0 = move-exception
            r1 = r9
        Lb4:
            if (r1 == 0) goto Lb9
            r1.close()
        Lb9:
            throw r0
        Lba:
            r0 = move-exception
            goto Lb4
        Lbc:
            r0 = move-exception
            r1 = r9
            goto L9d
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zzat(java.lang.String, java.lang.String):java.util.Map");
    }

    @WorkerThread
    protected long zzau(String str, String str2) {
        SQLiteException e;
        long j;
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzib(str2);
        zzzx();
        zzacj();
        SQLiteDatabase writableDatabase = getWritableDatabase();
        writableDatabase.beginTransaction();
        try {
            try {
                j = zza(new StringBuilder(String.valueOf(str2).length() + 32).append("select ").append(str2).append(" from app2 where app_id=?").toString(), new String[]{str}, -1L);
                if (j == -1) {
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("app_id", str);
                    contentValues.put("first_open_count", (Integer) 0);
                    contentValues.put("previous_install_count", (Integer) 0);
                    if (writableDatabase.insertWithOnConflict("app2", null, contentValues, 5) == -1) {
                        zzbwb().zzbwy().zzj("Failed to insert column (got -1)", str2);
                        return -1L;
                    }
                    j = 0;
                }
            } finally {
                writableDatabase.endTransaction();
            }
        } catch (SQLiteException e2) {
            e = e2;
            j = 0;
        }
        try {
            ContentValues contentValues2 = new ContentValues();
            contentValues2.put("app_id", str);
            contentValues2.put(str2, Long.valueOf(1 + j));
            if (writableDatabase.update("app2", contentValues2, "app_id = ?", new String[]{str}) == 0) {
                zzbwb().zzbwy().zzj("Failed to update column (got 0)", str2);
                writableDatabase.endTransaction();
                j = -1;
            } else {
                writableDatabase.setTransactionSuccessful();
                writableDatabase.endTransaction();
            }
            return j;
        } catch (SQLiteException e3) {
            e = e3;
            zzbwb().zzbwy().zze("Error inserting column", str2, e);
            return j;
        }
    }

    @WorkerThread
    Object zzb(Cursor cursor, int i) {
        int zza2 = zza(cursor, i);
        switch (zza2) {
            case 0:
                zzbwb().zzbwy().log("Loaded invalid null value from database");
                return null;
            case 1:
                return Long.valueOf(cursor.getLong(i));
            case 2:
                return Double.valueOf(cursor.getDouble(i));
            case 3:
                return cursor.getString(i);
            case 4:
                zzbwb().zzbwy().log("Loaded invalid blob type value, ignoring it");
                return null;
            default:
                zzbwb().zzbwy().zzj("Loaded invalid unknown value type, ignoring it", Integer.valueOf(zza2));
                return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzb(String str, zzwa.zza[] zzaVarArr) {
        zzacj();
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        com.google.android.gms.common.internal.zzaa.zzy(zzaVarArr);
        SQLiteDatabase writableDatabase = getWritableDatabase();
        writableDatabase.beginTransaction();
        try {
            zzmc(str);
            for (zzwa.zza zzaVar : zzaVarArr) {
                zza(str, zzaVar);
            }
            ArrayList arrayList = new ArrayList();
            for (zzwa.zza zzaVar2 : zzaVarArr) {
                arrayList.add(zzaVar2.avZ);
            }
            zzc(str, arrayList);
            writableDatabase.setTransactionSuccessful();
        } finally {
            writableDatabase.endTransaction();
        }
    }

    @WorkerThread
    public void zzbj(long j) {
        zzzx();
        zzacj();
        if (getWritableDatabase().delete("queue", "rowid=?", new String[]{String.valueOf(j)}) != 1) {
            zzbwb().zzbwy().log("Deleted fewer rows from queue than expected");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x005c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.String zzbk(long r8) {
        /*
            r7 = this;
            r0 = 0
            r7.zzzx()
            r7.zzacj()
            android.database.sqlite.SQLiteDatabase r1 = r7.getWritableDatabase()     // Catch: android.database.sqlite.SQLiteException -> L41 java.lang.Throwable -> L57
            java.lang.String r2 = "select app_id from apps where app_id in (select distinct app_id from raw_events) and config_fetched_time < ? order by failed_config_fetch_time limit 1;"
            r3 = 1
            java.lang.String[] r3 = new java.lang.String[r3]     // Catch: android.database.sqlite.SQLiteException -> L41 java.lang.Throwable -> L57
            r4 = 0
            java.lang.String r5 = java.lang.String.valueOf(r8)     // Catch: android.database.sqlite.SQLiteException -> L41 java.lang.Throwable -> L57
            r3[r4] = r5     // Catch: android.database.sqlite.SQLiteException -> L41 java.lang.Throwable -> L57
            android.database.Cursor r2 = r1.rawQuery(r2, r3)     // Catch: android.database.sqlite.SQLiteException -> L41 java.lang.Throwable -> L57
            boolean r1 = r2.moveToFirst()     // Catch: java.lang.Throwable -> L60 android.database.sqlite.SQLiteException -> L62
            if (r1 != 0) goto L36
            com.google.android.gms.measurement.internal.zzq r1 = r7.zzbwb()     // Catch: java.lang.Throwable -> L60 android.database.sqlite.SQLiteException -> L62
            com.google.android.gms.measurement.internal.zzq$zza r1 = r1.zzbxe()     // Catch: java.lang.Throwable -> L60 android.database.sqlite.SQLiteException -> L62
            java.lang.String r3 = "No expired configs for apps with pending events"
            r1.log(r3)     // Catch: java.lang.Throwable -> L60 android.database.sqlite.SQLiteException -> L62
            if (r2 == 0) goto L35
            r2.close()
        L35:
            return r0
        L36:
            r1 = 0
            java.lang.String r0 = r2.getString(r1)     // Catch: java.lang.Throwable -> L60 android.database.sqlite.SQLiteException -> L62
            if (r2 == 0) goto L35
            r2.close()
            goto L35
        L41:
            r1 = move-exception
            r2 = r0
        L43:
            com.google.android.gms.measurement.internal.zzq r3 = r7.zzbwb()     // Catch: java.lang.Throwable -> L60
            com.google.android.gms.measurement.internal.zzq$zza r3 = r3.zzbwy()     // Catch: java.lang.Throwable -> L60
            java.lang.String r4 = "Error selecting expired configs"
            r3.zzj(r4, r1)     // Catch: java.lang.Throwable -> L60
            if (r2 == 0) goto L35
            r2.close()
            goto L35
        L57:
            r1 = move-exception
            r2 = r0
            r0 = r1
        L5a:
            if (r2 == 0) goto L5f
            r2.close()
        L5f:
            throw r0
        L60:
            r0 = move-exception
            goto L5a
        L62:
            r1 = move-exception
            goto L43
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zzbk(long):java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x003f  */
    @android.support.annotation.WorkerThread
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.String zzbwe() {
        /*
            r5 = this;
            r0 = 0
            android.database.sqlite.SQLiteDatabase r1 = r5.getWritableDatabase()
            java.lang.String r2 = "select app_id from queue where app_id not in (select app_id from apps where measurement_enabled=0) order by has_realtime desc, rowid asc limit 1;"
            r3 = 0
            android.database.Cursor r2 = r1.rawQuery(r2, r3)     // Catch: android.database.sqlite.SQLiteException -> L24 java.lang.Throwable -> L3a
            boolean r1 = r2.moveToFirst()     // Catch: java.lang.Throwable -> L43 android.database.sqlite.SQLiteException -> L45
            if (r1 == 0) goto L1e
            r1 = 0
            java.lang.String r0 = r2.getString(r1)     // Catch: java.lang.Throwable -> L43 android.database.sqlite.SQLiteException -> L45
            if (r2 == 0) goto L1d
            r2.close()
        L1d:
            return r0
        L1e:
            if (r2 == 0) goto L1d
            r2.close()
            goto L1d
        L24:
            r1 = move-exception
            r2 = r0
        L26:
            com.google.android.gms.measurement.internal.zzq r3 = r5.zzbwb()     // Catch: java.lang.Throwable -> L43
            com.google.android.gms.measurement.internal.zzq$zza r3 = r3.zzbwy()     // Catch: java.lang.Throwable -> L43
            java.lang.String r4 = "Database error getting next bundle app id"
            r3.zzj(r4, r1)     // Catch: java.lang.Throwable -> L43
            if (r2 == 0) goto L1d
            r2.close()
            goto L1d
        L3a:
            r1 = move-exception
            r2 = r0
            r0 = r1
        L3d:
            if (r2 == 0) goto L42
            r2.close()
        L42:
            throw r0
        L43:
            r0 = move-exception
            goto L3d
        L45:
            r1 = move-exception
            goto L26
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zzbwe():java.lang.String");
    }

    public boolean zzbwf() {
        return zzb("select count(1) > 0 from queue where has_realtime = 1", (String[]) null) != 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzbwg() {
        zzzx();
        zzacj();
        if (!zzbwn()) {
            return;
        }
        long j = zzbwc().atc.get();
        long elapsedRealtime = zzabz().elapsedRealtime();
        if (Math.abs(elapsedRealtime - j) <= zzbwd().zzbuw()) {
            return;
        }
        zzbwc().atc.set(elapsedRealtime);
        zzbwh();
    }

    @WorkerThread
    void zzbwh() {
        int delete;
        zzzx();
        zzacj();
        if (zzbwn() && (delete = getWritableDatabase().delete("queue", "abs(bundle_end_timestamp - ?) > cast(? as integer)", new String[]{String.valueOf(zzabz().currentTimeMillis()), String.valueOf(zzbwd().zzbuv())})) > 0) {
            zzbwb().zzbxe().zzj("Deleted stale rows. rowsDeleted", Integer.valueOf(delete));
        }
    }

    @WorkerThread
    public long zzbwi() {
        return zza("select max(bundle_end_timestamp) from queue", (String[]) null, 0L);
    }

    @WorkerThread
    public long zzbwj() {
        return zza("select max(timestamp) from raw_events", (String[]) null, 0L);
    }

    public boolean zzbwk() {
        return zzb("select count(1) > 0 from raw_events", (String[]) null) != 0;
    }

    public boolean zzbwl() {
        return zzb("select count(1) > 0 from raw_events where realtime = 1", (String[]) null) != 0;
    }

    public long zzbwm() {
        long j = -1;
        Cursor cursor = null;
        try {
            try {
                cursor = getWritableDatabase().rawQuery("select rowid from raw_events order by rowid desc limit 1;", null);
                if (cursor.moveToFirst()) {
                    j = cursor.getLong(0);
                    if (cursor != null) {
                        cursor.close();
                    }
                }
            } catch (SQLiteException e) {
                zzbwb().zzbwy().zzj("Error querying raw events", e);
                if (cursor != null) {
                    cursor.close();
                }
            }
            return j;
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }

    boolean zzc(String str, List<Integer> list) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        zzacj();
        zzzx();
        SQLiteDatabase writableDatabase = getWritableDatabase();
        try {
            long zzb2 = zzb("select count(1) from audience_filter_values where app_id=?", new String[]{str});
            int zzlt = zzbwd().zzlt(str);
            if (zzb2 <= zzlt) {
                return false;
            }
            ArrayList arrayList = new ArrayList();
            if (list != null) {
                for (int i = 0; i < list.size(); i++) {
                    Integer num = list.get(i);
                    if (num == null || !(num instanceof Integer)) {
                        return false;
                    }
                    arrayList.add(Integer.toString(num.intValue()));
                }
            }
            String valueOf = String.valueOf(TextUtils.join(",", arrayList));
            String sb = new StringBuilder(String.valueOf(valueOf).length() + 2).append("(").append(valueOf).append(")").toString();
            return writableDatabase.delete("audience_filter_values", new StringBuilder(String.valueOf(sb).length() + 140).append("audience_id in (select audience_id from audience_filter_values where app_id=? and audience_id not in ").append(sb).append(" order by rowid desc limit -1 offset ?)").toString(), new String[]{str, Integer.toString(zzlt)}) > 0;
        } catch (SQLiteException e) {
            zzbwb().zzbwy().zzj("Database error querying filters", e);
            return false;
        }
    }

    @WorkerThread
    public void zzd(String str, byte[] bArr) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        zzzx();
        zzacj();
        ContentValues contentValues = new ContentValues();
        contentValues.put("remote_config", bArr);
        try {
            if (getWritableDatabase().update("apps", contentValues, "app_id = ?", new String[]{str}) != 0) {
                return;
            }
            zzbwb().zzbwy().log("Failed to update remote config (got 0)");
        } catch (SQLiteException e) {
            zzbwb().zzbwy().zzj("Error storing remote config", e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00a6  */
    @android.support.annotation.WorkerThread
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.google.android.gms.measurement.internal.zzak> zzly(java.lang.String r12) {
        /*
            r11 = this;
            r10 = 0
            com.google.android.gms.common.internal.zzaa.zzib(r12)
            r11.zzzx()
            r11.zzacj()
            java.util.ArrayList r9 = new java.util.ArrayList
            r9.<init>()
            android.database.sqlite.SQLiteDatabase r0 = r11.getWritableDatabase()     // Catch: java.lang.Throwable -> La3 android.database.sqlite.SQLiteException -> Lb0
            java.lang.String r1 = "user_attributes"
            r2 = 3
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: java.lang.Throwable -> La3 android.database.sqlite.SQLiteException -> Lb0
            r3 = 0
            java.lang.String r4 = "name"
            r2[r3] = r4     // Catch: java.lang.Throwable -> La3 android.database.sqlite.SQLiteException -> Lb0
            r3 = 1
            java.lang.String r4 = "set_timestamp"
            r2[r3] = r4     // Catch: java.lang.Throwable -> La3 android.database.sqlite.SQLiteException -> Lb0
            r3 = 2
            java.lang.String r4 = "value"
            r2[r3] = r4     // Catch: java.lang.Throwable -> La3 android.database.sqlite.SQLiteException -> Lb0
            java.lang.String r3 = "app_id=?"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch: java.lang.Throwable -> La3 android.database.sqlite.SQLiteException -> Lb0
            r5 = 0
            r4[r5] = r12     // Catch: java.lang.Throwable -> La3 android.database.sqlite.SQLiteException -> Lb0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "rowid"
            com.google.android.gms.measurement.internal.zzd r8 = r11.zzbwd()     // Catch: java.lang.Throwable -> La3 android.database.sqlite.SQLiteException -> Lb0
            int r8 = r8.zzbuo()     // Catch: java.lang.Throwable -> La3 android.database.sqlite.SQLiteException -> Lb0
            java.lang.String r8 = java.lang.String.valueOf(r8)     // Catch: java.lang.Throwable -> La3 android.database.sqlite.SQLiteException -> Lb0
            android.database.Cursor r7 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Throwable -> La3 android.database.sqlite.SQLiteException -> Lb0
            boolean r0 = r7.moveToFirst()     // Catch: android.database.sqlite.SQLiteException -> L8c java.lang.Throwable -> Laa
            if (r0 != 0) goto L56
            if (r7 == 0) goto L54
            r7.close()
        L54:
            r0 = r9
        L55:
            return r0
        L56:
            r0 = 0
            java.lang.String r3 = r7.getString(r0)     // Catch: android.database.sqlite.SQLiteException -> L8c java.lang.Throwable -> Laa
            r0 = 1
            long r4 = r7.getLong(r0)     // Catch: android.database.sqlite.SQLiteException -> L8c java.lang.Throwable -> Laa
            r0 = 2
            java.lang.Object r6 = r11.zzb(r7, r0)     // Catch: android.database.sqlite.SQLiteException -> L8c java.lang.Throwable -> Laa
            if (r6 != 0) goto L82
            com.google.android.gms.measurement.internal.zzq r0 = r11.zzbwb()     // Catch: android.database.sqlite.SQLiteException -> L8c java.lang.Throwable -> Laa
            com.google.android.gms.measurement.internal.zzq$zza r0 = r0.zzbwy()     // Catch: android.database.sqlite.SQLiteException -> L8c java.lang.Throwable -> Laa
            java.lang.String r1 = "Read invalid user property value, ignoring it"
            r0.log(r1)     // Catch: android.database.sqlite.SQLiteException -> L8c java.lang.Throwable -> Laa
        L75:
            boolean r0 = r7.moveToNext()     // Catch: android.database.sqlite.SQLiteException -> L8c java.lang.Throwable -> Laa
            if (r0 != 0) goto L56
            if (r7 == 0) goto L80
            r7.close()
        L80:
            r0 = r9
            goto L55
        L82:
            com.google.android.gms.measurement.internal.zzak r1 = new com.google.android.gms.measurement.internal.zzak     // Catch: android.database.sqlite.SQLiteException -> L8c java.lang.Throwable -> Laa
            r2 = r12
            r1.<init>(r2, r3, r4, r6)     // Catch: android.database.sqlite.SQLiteException -> L8c java.lang.Throwable -> Laa
            r9.add(r1)     // Catch: android.database.sqlite.SQLiteException -> L8c java.lang.Throwable -> Laa
            goto L75
        L8c:
            r0 = move-exception
            r1 = r7
        L8e:
            com.google.android.gms.measurement.internal.zzq r2 = r11.zzbwb()     // Catch: java.lang.Throwable -> Lad
            com.google.android.gms.measurement.internal.zzq$zza r2 = r2.zzbwy()     // Catch: java.lang.Throwable -> Lad
            java.lang.String r3 = "Error querying user properties"
            r2.zze(r3, r12, r0)     // Catch: java.lang.Throwable -> Lad
            if (r1 == 0) goto La1
            r1.close()
        La1:
            r0 = r10
            goto L55
        La3:
            r0 = move-exception
        La4:
            if (r10 == 0) goto La9
            r10.close()
        La9:
            throw r0
        Laa:
            r0 = move-exception
            r10 = r7
            goto La4
        Lad:
            r0 = move-exception
            r10 = r1
            goto La4
        Lb0:
            r0 = move-exception
            r1 = r10
            goto L8e
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zzly(java.lang.String):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x01d3  */
    @android.support.annotation.WorkerThread
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.android.gms.measurement.internal.zza zzlz(java.lang.String r12) {
        /*
            Method dump skipped, instructions count: 475
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zzlz(java.lang.String):com.google.android.gms.measurement.internal.zza");
    }

    public long zzma(String str) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        zzzx();
        zzacj();
        try {
            return getWritableDatabase().delete("raw_events", "rowid in (select rowid from raw_events where app_id=? order by rowid desc limit -1 offset ?)", new String[]{str, String.valueOf(zzbwd().zzlx(str))});
        } catch (SQLiteException e) {
            zzbwb().zzbwy().zzj("Error deleting over the limit events", e);
            return 0L;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0071  */
    @android.support.annotation.WorkerThread
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public byte[] zzmb(java.lang.String r10) {
        /*
            r9 = this;
            r8 = 0
            com.google.android.gms.common.internal.zzaa.zzib(r10)
            r9.zzzx()
            r9.zzacj()
            android.database.sqlite.SQLiteDatabase r0 = r9.getWritableDatabase()     // Catch: android.database.sqlite.SQLiteException -> L56 java.lang.Throwable -> L6d
            java.lang.String r1 = "apps"
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: android.database.sqlite.SQLiteException -> L56 java.lang.Throwable -> L6d
            r3 = 0
            java.lang.String r4 = "remote_config"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L56 java.lang.Throwable -> L6d
            java.lang.String r3 = "app_id=?"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch: android.database.sqlite.SQLiteException -> L56 java.lang.Throwable -> L6d
            r5 = 0
            r4[r5] = r10     // Catch: android.database.sqlite.SQLiteException -> L56 java.lang.Throwable -> L6d
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: android.database.sqlite.SQLiteException -> L56 java.lang.Throwable -> L6d
            boolean r0 = r1.moveToFirst()     // Catch: java.lang.Throwable -> L75 android.database.sqlite.SQLiteException -> L77
            if (r0 != 0) goto L37
            if (r1 == 0) goto L35
            r1.close()
        L35:
            r0 = r8
        L36:
            return r0
        L37:
            r0 = 0
            byte[] r0 = r1.getBlob(r0)     // Catch: java.lang.Throwable -> L75 android.database.sqlite.SQLiteException -> L77
            boolean r2 = r1.moveToNext()     // Catch: java.lang.Throwable -> L75 android.database.sqlite.SQLiteException -> L77
            if (r2 == 0) goto L50
            com.google.android.gms.measurement.internal.zzq r2 = r9.zzbwb()     // Catch: java.lang.Throwable -> L75 android.database.sqlite.SQLiteException -> L77
            com.google.android.gms.measurement.internal.zzq$zza r2 = r2.zzbwy()     // Catch: java.lang.Throwable -> L75 android.database.sqlite.SQLiteException -> L77
            java.lang.String r3 = "Got multiple records for app config, expected one"
            r2.log(r3)     // Catch: java.lang.Throwable -> L75 android.database.sqlite.SQLiteException -> L77
        L50:
            if (r1 == 0) goto L36
            r1.close()
            goto L36
        L56:
            r0 = move-exception
            r1 = r8
        L58:
            com.google.android.gms.measurement.internal.zzq r2 = r9.zzbwb()     // Catch: java.lang.Throwable -> L75
            com.google.android.gms.measurement.internal.zzq$zza r2 = r2.zzbwy()     // Catch: java.lang.Throwable -> L75
            java.lang.String r3 = "Error querying remote config"
            r2.zze(r3, r10, r0)     // Catch: java.lang.Throwable -> L75
            if (r1 == 0) goto L6b
            r1.close()
        L6b:
            r0 = r8
            goto L36
        L6d:
            r0 = move-exception
            r1 = r8
        L6f:
            if (r1 == 0) goto L74
            r1.close()
        L74:
            throw r0
        L75:
            r0 = move-exception
            goto L6f
        L77:
            r0 = move-exception
            goto L58
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zzmb(java.lang.String):byte[]");
    }

    @WorkerThread
    void zzmc(String str) {
        zzacj();
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        SQLiteDatabase writableDatabase = getWritableDatabase();
        writableDatabase.delete("property_filters", "app_id=?", new String[]{str});
        writableDatabase.delete("event_filters", "app_id=?", new String[]{str});
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:31:0x009e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.Map<java.lang.Integer, com.google.android.gms.internal.zzwc.zzf> zzmd(java.lang.String r10) {
        /*
            r9 = this;
            r8 = 0
            r9.zzacj()
            r9.zzzx()
            com.google.android.gms.common.internal.zzaa.zzib(r10)
            android.database.sqlite.SQLiteDatabase r0 = r9.getWritableDatabase()
            java.lang.String r1 = "audience_filter_values"
            r2 = 2
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: java.lang.Throwable -> L9a android.database.sqlite.SQLiteException -> La7
            r3 = 0
            java.lang.String r4 = "audience_id"
            r2[r3] = r4     // Catch: java.lang.Throwable -> L9a android.database.sqlite.SQLiteException -> La7
            r3 = 1
            java.lang.String r4 = "current_results"
            r2[r3] = r4     // Catch: java.lang.Throwable -> L9a android.database.sqlite.SQLiteException -> La7
            java.lang.String r3 = "app_id=?"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch: java.lang.Throwable -> L9a android.database.sqlite.SQLiteException -> La7
            r5 = 0
            r4[r5] = r10     // Catch: java.lang.Throwable -> L9a android.database.sqlite.SQLiteException -> La7
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r2 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L9a android.database.sqlite.SQLiteException -> La7
            boolean r0 = r2.moveToFirst()     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            if (r0 != 0) goto L3d
            if (r2 == 0) goto L3b
            r2.close()
        L3b:
            r0 = r8
        L3c:
            return r0
        L3d:
            android.support.v4.util.ArrayMap r1 = new android.support.v4.util.ArrayMap     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            r1.<init>()     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
        L42:
            r0 = 0
            int r3 = r2.getInt(r0)     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            r0 = 1
            byte[] r0 = r2.getBlob(r0)     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            com.google.android.gms.internal.zzars r0 = com.google.android.gms.internal.zzars.zzbd(r0)     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            com.google.android.gms.internal.zzwc$zzf r4 = new com.google.android.gms.internal.zzwc$zzf     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            r4.<init>()     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            com.google.android.gms.internal.zzasa r0 = r4.zzb(r0)     // Catch: java.io.IOException -> L6f android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            com.google.android.gms.internal.zzwc$zzf r0 = (com.google.android.gms.internal.zzwc.zzf) r0     // Catch: java.io.IOException -> L6f android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            java.lang.Integer r0 = java.lang.Integer.valueOf(r3)     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            r1.put(r0, r4)     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
        L62:
            boolean r0 = r2.moveToNext()     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            if (r0 != 0) goto L42
            if (r2 == 0) goto L6d
            r2.close()
        L6d:
            r0 = r1
            goto L3c
        L6f:
            r0 = move-exception
            com.google.android.gms.measurement.internal.zzq r4 = r9.zzbwb()     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            com.google.android.gms.measurement.internal.zzq$zza r4 = r4.zzbwy()     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            java.lang.String r5 = "Failed to merge filter results. appId, audienceId, error"
            java.lang.Integer r3 = java.lang.Integer.valueOf(r3)     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            r4.zzd(r5, r10, r3, r0)     // Catch: android.database.sqlite.SQLiteException -> L83 java.lang.Throwable -> La2
            goto L62
        L83:
            r0 = move-exception
            r1 = r2
        L85:
            com.google.android.gms.measurement.internal.zzq r2 = r9.zzbwb()     // Catch: java.lang.Throwable -> La4
            com.google.android.gms.measurement.internal.zzq$zza r2 = r2.zzbwy()     // Catch: java.lang.Throwable -> La4
            java.lang.String r3 = "Database error querying filter results"
            r2.zzj(r3, r0)     // Catch: java.lang.Throwable -> La4
            if (r1 == 0) goto L98
            r1.close()
        L98:
            r0 = r8
            goto L3c
        L9a:
            r0 = move-exception
            r2 = r8
        L9c:
            if (r2 == 0) goto La1
            r2.close()
        La1:
            throw r0
        La2:
            r0 = move-exception
            goto L9c
        La4:
            r0 = move-exception
            r2 = r1
            goto L9c
        La7:
            r0 = move-exception
            r1 = r8
            goto L85
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zzmd(java.lang.String):java.util.Map");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public void zzme(String str) {
        zzacj();
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzib(str);
        try {
            SQLiteDatabase writableDatabase = getWritableDatabase();
            String[] strArr = {str};
            int delete = writableDatabase.delete("audience_filter_values", "app_id=?", strArr) + writableDatabase.delete("events", "app_id=?", strArr) + 0 + writableDatabase.delete("user_attributes", "app_id=?", strArr) + writableDatabase.delete("apps", "app_id=?", strArr) + writableDatabase.delete("raw_events", "app_id=?", strArr) + writableDatabase.delete("raw_events_metadata", "app_id=?", strArr) + writableDatabase.delete("event_filters", "app_id=?", strArr) + writableDatabase.delete("property_filters", "app_id=?", strArr);
            if (delete <= 0) {
                return;
            }
            zzbwb().zzbxe().zze("Deleted application data. app, records", str, Integer.valueOf(delete));
        } catch (SQLiteException e) {
            zzbwb().zzbwy().zze("Error deleting application data. appId, error", str, e);
        }
    }

    @WorkerThread
    public long zzmf(String str) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        zzzx();
        zzacj();
        return zzau(str, "first_open_count");
    }

    public void zzmg(String str) {
        try {
            getWritableDatabase().execSQL("delete from raw_events_metadata where app_id=? and metadata_fingerprint not in (select distinct metadata_fingerprint from raw_events where app_id=?)", new String[]{str, str});
        } catch (SQLiteException e) {
            zzbwb().zzbwy().zzj("Failed to remove unused event metadata", e);
        }
    }

    public long zzmh(String str) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        return zza("select count(1) from events where app_id=? and name not like '!_%' escape '!'", new String[]{str}, 0L);
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x00e6  */
    @android.support.annotation.WorkerThread
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<android.util.Pair<com.google.android.gms.internal.zzwc.zze, java.lang.Long>> zzn(java.lang.String r12, int r13, int r14) {
        /*
            Method dump skipped, instructions count: 242
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zze.zzn(java.lang.String, int, int):java.util.List");
    }

    @WorkerThread
    public void zzz(String str, int i) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        zzzx();
        zzacj();
        try {
            getWritableDatabase().execSQL("delete from user_attributes where app_id=? and name in (select name from user_attributes where app_id=? and name like '_ltv_%' order by set_timestamp desc limit ?,10);", new String[]{str, str, String.valueOf(i)});
        } catch (SQLiteException e) {
            zzbwb().zzbwy().zze("Error pruning currencies", str, e);
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
    }
}
