package com.google.android.gms.measurement.internal;

import android.annotation.TargetApi;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabaseLockedException;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteFullException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;
import android.os.Parcel;
import android.os.SystemClock;
import android.support.annotation.WorkerThread;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class zzo extends zzaa {
    private final zza asx;
    private boolean asy;

    /* JADX INFO: Access modifiers changed from: private */
    @TargetApi(11)
    /* loaded from: classes2.dex */
    public class zza extends SQLiteOpenHelper {
        zza(Context context, String str) {
            super(context, str, (SQLiteDatabase.CursorFactory) null, 1);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        @WorkerThread
        public SQLiteDatabase getWritableDatabase() {
            try {
                return super.getWritableDatabase();
            } catch (SQLiteException e) {
                if (Build.VERSION.SDK_INT >= 11 && (e instanceof SQLiteDatabaseLockedException)) {
                    throw e;
                }
                zzo.this.zzbwb().zzbwy().log("Opening the local database failed, dropping and recreating it");
                String zzade = zzo.this.zzade();
                if (!zzo.this.getContext().getDatabasePath(zzade).delete()) {
                    zzo.this.zzbwb().zzbwy().zzj("Failed to delete corrupted local db file", zzade);
                }
                try {
                    return super.getWritableDatabase();
                } catch (SQLiteException e2) {
                    zzo.this.zzbwb().zzbwy().zzj("Failed to open local database. Events will bypass local storage", e2);
                    return null;
                }
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        @WorkerThread
        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            zze.zza(zzo.this.zzbwb(), sQLiteDatabase);
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
            zze.zza(zzo.this.zzbwb(), sQLiteDatabase, "messages", "create table if not exists messages ( type INTEGER NOT NULL, entry BLOB NOT NULL)", "type,entry", null);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        @WorkerThread
        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzo(zzx zzxVar) {
        super(zzxVar);
        this.asx = new zza(getContext(), zzade());
    }

    @WorkerThread
    @TargetApi(11)
    private boolean zza(int i, byte[] bArr) {
        zzaby();
        zzzx();
        if (this.asy) {
            return false;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put(ServerKeys.TYPE, Integer.valueOf(i));
        contentValues.put("entry", bArr);
        zzbwd().zzbvb();
        int i2 = 5;
        for (int i3 = 0; i3 < 5; i3++) {
            SQLiteDatabase sQLiteDatabase = null;
            try {
                try {
                    SQLiteDatabase writableDatabase = getWritableDatabase();
                    if (writableDatabase == null) {
                        this.asy = true;
                        if (writableDatabase != null) {
                            writableDatabase.close();
                        }
                        return false;
                    }
                    writableDatabase.beginTransaction();
                    long j = 0;
                    Cursor rawQuery = writableDatabase.rawQuery("select count(1) from messages", null);
                    if (rawQuery != null && rawQuery.moveToFirst()) {
                        j = rawQuery.getLong(0);
                    }
                    if (j >= 100000) {
                        zzbwb().zzbwy().log("Data loss, local db full");
                        long j2 = (100000 - j) + 1;
                        long delete = writableDatabase.delete("messages", "rowid in (select rowid from messages order by rowid asc limit ?)", new String[]{Long.toString(j2)});
                        if (delete != j2) {
                            zzbwb().zzbwy().zzd("Different delete count than expected in local db. expected, received, difference", Long.valueOf(j2), Long.valueOf(delete), Long.valueOf(j2 - delete));
                        }
                    }
                    writableDatabase.insertOrThrow("messages", null, contentValues);
                    writableDatabase.setTransactionSuccessful();
                    writableDatabase.endTransaction();
                    if (writableDatabase != null) {
                        writableDatabase.close();
                    }
                    return true;
                } catch (SQLiteFullException e) {
                    try {
                        zzbwb().zzbwy().zzj("Error writing entry to local database", e);
                        this.asy = true;
                        if (0 != 0) {
                            sQLiteDatabase.close();
                        }
                    } catch (Throwable th) {
                        if (0 != 0) {
                            sQLiteDatabase.close();
                        }
                        throw th;
                    }
                }
            } catch (SQLiteException e2) {
                if (Build.VERSION.SDK_INT < 11 || !(e2 instanceof SQLiteDatabaseLockedException)) {
                    if (0 != 0 && sQLiteDatabase.inTransaction()) {
                        sQLiteDatabase.endTransaction();
                    }
                    zzbwb().zzbwy().zzj("Error writing entry to local database", e2);
                    this.asy = true;
                } else {
                    SystemClock.sleep(i2);
                    i2 += 20;
                }
                if (0 != 0) {
                    sQLiteDatabase.close();
                }
            }
        }
        zzbwb().zzbxa().log("Failed to write entry to local database");
        return false;
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
    }

    @WorkerThread
    SQLiteDatabase getWritableDatabase() {
        if (this.asy) {
            return null;
        }
        SQLiteDatabase writableDatabase = this.asx.getWritableDatabase();
        if (writableDatabase != null) {
            return writableDatabase;
        }
        this.asy = true;
        return null;
    }

    public boolean zza(EventParcel eventParcel) {
        Parcel obtain = Parcel.obtain();
        eventParcel.writeToParcel(obtain, 0);
        byte[] marshall = obtain.marshall();
        obtain.recycle();
        if (marshall.length > 131072) {
            zzbwb().zzbxa().log("Event is too long for local database. Sending event directly to service");
            return false;
        }
        return zza(0, marshall);
    }

    public boolean zza(UserAttributeParcel userAttributeParcel) {
        Parcel obtain = Parcel.obtain();
        userAttributeParcel.writeToParcel(obtain, 0);
        byte[] marshall = obtain.marshall();
        obtain.recycle();
        if (marshall.length > 131072) {
            zzbwb().zzbxa().log("User property too long for local database. Sending directly to service");
            return false;
        }
        return zza(1, marshall);
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzaby() {
        super.zzaby();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.common.util.zze zzabz() {
        return super.zzabz();
    }

    String zzade() {
        return zzbwd().zzbus();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzbvo() {
        super.zzbvo();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzc zzbvp() {
        return super.zzbvp();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzac zzbvq() {
        return super.zzbvq();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzn zzbvr() {
        return super.zzbvr();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzg zzbvs() {
        return super.zzbvs();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzae zzbvt() {
        return super.zzbvt();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzad zzbvu() {
        return super.zzbvu();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzo zzbvv() {
        return super.zzbvv();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zze zzbvw() {
        return super.zzbvw();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzal zzbvx() {
        return super.zzbvx();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzv zzbvy() {
        return super.zzbvy();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzag zzbvz() {
        return super.zzbvz();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzw zzbwa() {
        return super.zzbwa();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzq zzbwb() {
        return super.zzbwb();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzt zzbwc() {
        return super.zzbwc();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzd zzbwd() {
        return super.zzbwd();
    }

    boolean zzbwn() {
        return getContext().getDatabasePath(zzade()).exists();
    }

    /* JADX WARN: Removed duplicated region for block: B:72:0x0127  */
    @android.annotation.TargetApi(11)
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable> zzxe(int r14) {
        /*
            Method dump skipped, instructions count: 431
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.measurement.internal.zzo.zzxe(int):java.util.List");
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }

    @Override // com.google.android.gms.measurement.internal.zzaa
    protected void zzzy() {
    }
}
