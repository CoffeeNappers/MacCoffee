package com.google.android.gms.internal;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabaseLockedException;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.support.v4.media.session.PlaybackStateCompat;
import com.google.android.gms.internal.zzakz;
import com.google.firebase.database.DatabaseException;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.data.ServerKeys;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public class zzaif implements zzakv {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final Charset vp;
    private final SQLiteDatabase aZQ;
    private final zzalw aZR;
    private boolean aZS;
    private long aZT = 0;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zza extends SQLiteOpenHelper {
        static final /* synthetic */ boolean $assertionsDisabled;

        static {
            $assertionsDisabled = !zzaif.class.desiredAssertionStatus();
        }

        public zza(Context context, String str) {
            super(context, str, (SQLiteDatabase.CursorFactory) null, 2);
        }

        private void zzc(SQLiteDatabase sQLiteDatabase, String str) {
            String valueOf = String.valueOf(str);
            sQLiteDatabase.execSQL(valueOf.length() != 0 ? "DROP TABLE IF EXISTS ".concat(valueOf) : new String("DROP TABLE IF EXISTS "));
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase sQLiteDatabase) {
            sQLiteDatabase.execSQL("CREATE TABLE serverCache (path TEXT PRIMARY KEY, value BLOB);");
            sQLiteDatabase.execSQL("CREATE TABLE writes (id INTEGER, path TEXT, type TEXT, part INTEGER, node BLOB, UNIQUE (id, part));");
            sQLiteDatabase.execSQL("CREATE TABLE trackedQueries (id INTEGER PRIMARY KEY, path TEXT, queryParams TEXT, lastUse INTEGER, complete INTEGER, active INTEGER);");
            sQLiteDatabase.execSQL("CREATE TABLE trackedKeys (id INTEGER, key TEXT);");
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
            if ($assertionsDisabled || i2 == 2) {
                if (i > 1) {
                    throw new AssertionError(new StringBuilder(40).append("We don't handle upgrading to ").append(i2).toString());
                }
                zzc(sQLiteDatabase, "serverCache");
                sQLiteDatabase.execSQL("CREATE TABLE serverCache (path TEXT PRIMARY KEY, value BLOB);");
                zzc(sQLiteDatabase, "complete");
                sQLiteDatabase.execSQL("CREATE TABLE trackedKeys (id INTEGER, key TEXT);");
                sQLiteDatabase.execSQL("CREATE TABLE trackedQueries (id INTEGER PRIMARY KEY, path TEXT, queryParams TEXT, lastUse INTEGER, complete INTEGER, active INTEGER);");
                return;
            }
            throw new AssertionError("Why is onUpgrade() called with a different version?");
        }
    }

    static {
        $assertionsDisabled = !zzaif.class.desiredAssertionStatus();
        vp = Charset.forName("UTF-8");
    }

    public zzaif(Context context, zzajj zzajjVar, String str) {
        try {
            String encode = URLEncoder.encode(str, "utf-8");
            this.aZR = zzajjVar.zzss("Persistence");
            this.aZQ = zzai(context, encode);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private int zza(zzajq zzajqVar, List<String> list, int i) {
        int i2 = i + 1;
        String zzc = zzc(zzajqVar);
        if (!list.get(i).startsWith(zzc)) {
            throw new IllegalStateException("Extracting split nodes needs to start with path prefix");
        }
        while (i2 < list.size() && list.get(i2).equals(zza(zzajqVar, i2 - i))) {
            i2++;
        }
        if (i2 < list.size()) {
            String str = list.get(i2);
            String valueOf = String.valueOf(zzc);
            String valueOf2 = String.valueOf(".part-");
            if (str.startsWith(valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf))) {
                throw new IllegalStateException("Run did not finish with all parts");
            }
        }
        return i2 - i;
    }

    private int zza(String str, zzajq zzajqVar) {
        String zzc = zzc(zzajqVar);
        return this.aZQ.delete(str, "path >= ? AND path < ?", new String[]{zzc, zzsd(zzc)});
    }

    private Cursor zza(zzajq zzajqVar, String[] strArr) {
        String zzc = zzc(zzajqVar);
        String zzsd = zzsd(zzc);
        String[] strArr2 = new String[zzajqVar.size() + 3];
        String valueOf = String.valueOf(zzb(zzajqVar, strArr2));
        String valueOf2 = String.valueOf(" OR (path > ? AND path < ?)");
        String concat = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
        strArr2[zzajqVar.size() + 1] = zzc;
        strArr2[zzajqVar.size() + 2] = zzsd;
        return this.aZQ.query("serverCache", strArr, concat, strArr2, null, null, "path");
    }

    private String zza(zzajq zzajqVar, int i) {
        String valueOf = String.valueOf(zzc(zzajqVar));
        String valueOf2 = String.valueOf(String.format(".part-%04d", Integer.valueOf(i)));
        return valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
    }

    private void zza(zzajq zzajqVar, long j, String str, byte[] bArr) {
        int i = 0;
        zzcri();
        this.aZQ.delete("writes", "id = ?", new String[]{String.valueOf(j)});
        if (bArr.length < 262144) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("id", Long.valueOf(j));
            contentValues.put("path", zzc(zzajqVar));
            contentValues.put(ServerKeys.TYPE, str);
            contentValues.put("part", (Integer) null);
            contentValues.put("node", bArr);
            this.aZQ.insertWithOnConflict("writes", null, contentValues, 5);
            return;
        }
        List<byte[]> zzd = zzd(bArr, 262144);
        while (true) {
            int i2 = i;
            if (i2 >= zzd.size()) {
                return;
            }
            ContentValues contentValues2 = new ContentValues();
            contentValues2.put("id", Long.valueOf(j));
            contentValues2.put("path", zzc(zzajqVar));
            contentValues2.put(ServerKeys.TYPE, str);
            contentValues2.put("part", Integer.valueOf(i2));
            contentValues2.put("node", zzd.get(i2));
            this.aZQ.insertWithOnConflict("writes", null, contentValues2, 5);
            i = i2 + 1;
        }
    }

    private void zza(zzajq zzajqVar, final zzajq zzajqVar2, zzakz<Long> zzakzVar, final zzakz<Long> zzakzVar2, zzakw zzakwVar, final List<zzank<zzajq, zzaml>> list) {
        if (zzakzVar.getValue() == null) {
            Iterator<Map.Entry<zzalz, zzakz<Long>>> it = zzakzVar.zzcxf().iterator();
            while (it.hasNext()) {
                Map.Entry<zzalz, zzakz<Long>> next = it.next();
                zzalz key = next.getKey();
                zza(zzajqVar, zzajqVar2.zza(key), next.getValue(), zzakzVar2.zze(key), zzakwVar.zzd(next.getKey()), list);
            }
            return;
        }
        int intValue = ((Integer) zzakwVar.zza(0, new zzakz.zza<Void, Integer>() { // from class: com.google.android.gms.internal.zzaif.1
            @Override // com.google.android.gms.internal.zzakz.zza
            public Integer zza(zzajq zzajqVar3, Void r3, Integer num) {
                return Integer.valueOf(zzakzVar2.zzak(zzajqVar3) == null ? num.intValue() + 1 : num.intValue());
            }
        })).intValue();
        if (intValue <= 0) {
            return;
        }
        zzajq zzh = zzajqVar.zzh(zzajqVar2);
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Need to rewrite %d nodes below path %s", Integer.valueOf(intValue), zzh), new Object[0]);
        }
        final zzaml zzb = zzb(zzh);
        zzakwVar.zza(null, new zzakz.zza<Void, Void>() { // from class: com.google.android.gms.internal.zzaif.2
            @Override // com.google.android.gms.internal.zzakz.zza
            public Void zza(zzajq zzajqVar3, Void r6, Void r7) {
                if (zzakzVar2.zzak(zzajqVar3) == null) {
                    list.add(new zzank(zzajqVar2.zzh(zzajqVar3), zzb.zzao(zzajqVar3)));
                    return null;
                }
                return null;
            }
        });
    }

    private void zza(zzajq zzajqVar, zzaml zzamlVar, boolean z) {
        int i;
        int i2;
        long currentTimeMillis = System.currentTimeMillis();
        if (!z) {
            i2 = zza("serverCache", zzajqVar);
            i = zzc(zzajqVar, zzamlVar);
        } else {
            i = 0;
            i2 = 0;
            for (zzamk zzamkVar : zzamlVar) {
                i2 += zza("serverCache", zzajqVar.zza(zzamkVar.a()));
                i = zzc(zzajqVar.zza(zzamkVar.a()), zzamkVar.zzcqy()) + i;
            }
        }
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Persisted a total of %d rows and deleted %d rows for a set at %s in %dms", Integer.valueOf(i), Integer.valueOf(i2), zzajqVar.toString(), Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
    }

    private SQLiteDatabase zzai(Context context, String str) {
        try {
            SQLiteDatabase writableDatabase = new zza(context, str).getWritableDatabase();
            writableDatabase.rawQuery("PRAGMA locking_mode = EXCLUSIVE", null).close();
            writableDatabase.beginTransaction();
            writableDatabase.endTransaction();
            return writableDatabase;
        } catch (SQLiteException e) {
            if (!(e instanceof SQLiteDatabaseLockedException)) {
                throw e;
            }
            throw new DatabaseException("Failed to gain exclusive lock to Firebase Database's offline persistence. This generally means you are using Firebase Database from multiple processes in your app. Keep in mind that multi-process Android apps execute the code in your Application class in all processes, so you may need to avoid initializing FirebaseDatabase in your Application class. If you are intentionally using Firebase Database from multiple processes, you can only enable offline persistence (i.e. call setPersistenceEnabled(true)) in one of them.", e);
        }
    }

    private byte[] zzar(List<byte[]> list) {
        int i = 0;
        for (byte[] bArr : list) {
            i = bArr.length + i;
        }
        byte[] bArr2 = new byte[i];
        int i2 = 0;
        for (byte[] bArr3 : list) {
            System.arraycopy(bArr3, 0, bArr2, i2, bArr3.length);
            i2 = bArr3.length + i2;
        }
        return bArr2;
    }

    private zzaml zzat(byte[] bArr) {
        try {
            return zzamm.zzbt(zzane.zztc(new String(bArr, vp)));
        } catch (IOException e) {
            String valueOf = String.valueOf(new String(bArr, vp));
            throw new RuntimeException(valueOf.length() != 0 ? "Could not deserialize node: ".concat(valueOf) : new String("Could not deserialize node: "), e);
        }
    }

    private zzaml zzb(zzajq zzajqVar) {
        zzaml zzat;
        int i;
        zzajq zzajqVar2;
        boolean z;
        zzaml zzl;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        long currentTimeMillis = System.currentTimeMillis();
        Cursor zza2 = zza(zzajqVar, new String[]{"path", "value"});
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        long currentTimeMillis3 = System.currentTimeMillis();
        while (zza2.moveToNext()) {
            try {
                arrayList.add(zza2.getString(0));
                arrayList2.add(zza2.getBlob(1));
            } catch (Throwable th) {
                zza2.close();
                throw th;
            }
        }
        zza2.close();
        long currentTimeMillis4 = System.currentTimeMillis() - currentTimeMillis3;
        long currentTimeMillis5 = System.currentTimeMillis();
        zzaml zzczq = zzame.zzczq();
        boolean z2 = false;
        HashMap hashMap = new HashMap();
        int i2 = 0;
        while (i2 < arrayList2.size()) {
            if (arrayList.get(i2).endsWith(".part-0000")) {
                String str = arrayList.get(i2);
                zzajq zzajqVar3 = new zzajq(str.substring(0, str.length() - ".part-0000".length()));
                int zza3 = zza(zzajqVar3, arrayList, i2);
                if (this.aZR.zzcyu()) {
                    this.aZR.zzi(new StringBuilder(42).append("Loading split node with ").append(zza3).append(" parts.").toString(), new Object[0]);
                }
                i = (i2 + zza3) - 1;
                zzajqVar2 = zzajqVar3;
                zzat = zzat(zzar(arrayList2.subList(i2, i2 + zza3)));
            } else {
                zzat = zzat((byte[]) arrayList2.get(i2));
                i = i2;
                zzajqVar2 = new zzajq(arrayList.get(i2));
            }
            if (zzajqVar2.zzcvm() != null && zzajqVar2.zzcvm().zzczb()) {
                hashMap.put(zzajqVar2, zzat);
                z = z2;
                zzl = zzczq;
            } else if (zzajqVar2.zzi(zzajqVar)) {
                zzann.zzb(!z2, "Descendants of path must come after ancestors.");
                boolean z3 = z2;
                zzl = zzat.zzao(zzajq.zza(zzajqVar2, zzajqVar));
                z = z3;
            } else if (!zzajqVar.zzi(zzajqVar2)) {
                throw new IllegalStateException(String.format("Loading an unrelated row with path %s for %s", zzajqVar2, zzajqVar));
            } else {
                z = true;
                zzl = zzczq.zzl(zzajq.zza(zzajqVar, zzajqVar2), zzat);
            }
            i2 = i + 1;
            zzczq = zzl;
            z2 = z;
        }
        for (Map.Entry entry : hashMap.entrySet()) {
            zzczq = zzczq.zzl(zzajq.zza(zzajqVar, (zzajq) entry.getKey()), (zzaml) entry.getValue());
        }
        long currentTimeMillis6 = System.currentTimeMillis() - currentTimeMillis5;
        long currentTimeMillis7 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Loaded a total of %d rows for a total of %d nodes at %s in %dms (Query: %dms, Loading: %dms, Serializing: %dms)", Integer.valueOf(arrayList2.size()), Integer.valueOf(zzani.zzu(zzczq)), zzajqVar, Long.valueOf(currentTimeMillis7), Long.valueOf(currentTimeMillis2), Long.valueOf(currentTimeMillis4), Long.valueOf(currentTimeMillis6)), new Object[0]);
        }
        return zzczq;
    }

    private static String zzb(zzajq zzajqVar, String[] strArr) {
        if ($assertionsDisabled || strArr.length >= zzajqVar.size() + 1) {
            int i = 0;
            StringBuilder sb = new StringBuilder("(");
            while (!zzajqVar.isEmpty()) {
                sb.append("path");
                sb.append(" = ? OR ");
                strArr[i] = zzc(zzajqVar);
                zzajqVar = zzajqVar.zzcvl();
                i++;
            }
            sb.append("path");
            sb.append(" = ?)");
            strArr[i] = zzc(zzajq.zzcvg());
            return sb.toString();
        }
        throw new AssertionError();
    }

    private byte[] zzbf(Object obj) {
        try {
            return zzane.zzbv(obj).getBytes(vp);
        } catch (IOException e) {
            throw new RuntimeException("Could not serialize leaf node", e);
        }
    }

    private int zzc(zzajq zzajqVar, zzaml zzamlVar) {
        int i;
        int i2 = 0;
        long zzt = zzani.zzt(zzamlVar);
        if (!(zzamlVar instanceof zzama) || zzt <= PlaybackStateCompat.ACTION_PREPARE) {
            zzd(zzajqVar, zzamlVar);
            return 1;
        }
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Node estimated serialized size at path %s of %d bytes exceeds limit of %d bytes. Splitting up.", zzajqVar, Long.valueOf(zzt), 16384), new Object[0]);
        }
        Iterator<zzamk> it = zzamlVar.iterator();
        while (true) {
            i = i2;
            if (!it.hasNext()) {
                break;
            }
            zzamk next = it.next();
            i2 = zzc(zzajqVar.zza(next.a()), next.zzcqy()) + i;
        }
        if (!zzamlVar.zzczf().isEmpty()) {
            zzd(zzajqVar.zza(zzalz.zzcyz()), zzamlVar.zzczf());
            i++;
        }
        zzd(zzajqVar, zzame.zzczq());
        return i + 1;
    }

    private static String zzc(zzajq zzajqVar) {
        return zzajqVar.isEmpty() ? CameraUtilsEffects.FILE_DELIM : String.valueOf(zzajqVar.toString()).concat(CameraUtilsEffects.FILE_DELIM);
    }

    private void zzcri() {
        zzann.zzb(this.aZS, "Transaction expected to already be in progress.");
    }

    private static List<byte[]> zzd(byte[] bArr, int i) {
        int length = ((bArr.length - 1) / i) + 1;
        ArrayList arrayList = new ArrayList(length);
        for (int i2 = 0; i2 < length; i2++) {
            int min = Math.min(i, bArr.length - (i2 * i));
            byte[] bArr2 = new byte[min];
            System.arraycopy(bArr, i2 * i, bArr2, 0, min);
            arrayList.add(bArr2);
        }
        return arrayList;
    }

    private void zzd(zzajq zzajqVar, zzaml zzamlVar) {
        int i = 0;
        byte[] zzbf = zzbf(zzamlVar.getValue(true));
        if (zzbf.length < 262144) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("path", zzc(zzajqVar));
            contentValues.put("value", zzbf);
            this.aZQ.insertWithOnConflict("serverCache", null, contentValues, 5);
            return;
        }
        List<byte[]> zzd = zzd(zzbf, 262144);
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(new StringBuilder(45).append("Saving huge leaf node with ").append(zzd.size()).append(" parts.").toString(), new Object[0]);
        }
        while (true) {
            int i2 = i;
            if (i2 >= zzd.size()) {
                return;
            }
            ContentValues contentValues2 = new ContentValues();
            contentValues2.put("path", zza(zzajqVar, i2));
            contentValues2.put("value", zzd.get(i2));
            this.aZQ.insertWithOnConflict("serverCache", null, contentValues2, 5);
            i = i2 + 1;
        }
    }

    private String zzp(Collection<Long> collection) {
        StringBuilder sb = new StringBuilder();
        boolean z = true;
        Iterator<Long> it = collection.iterator();
        while (true) {
            boolean z2 = z;
            if (it.hasNext()) {
                long longValue = it.next().longValue();
                if (!z2) {
                    sb.append(",");
                }
                z = false;
                sb.append(longValue);
            } else {
                return sb.toString();
            }
        }
    }

    private static String zzsd(String str) {
        if ($assertionsDisabled || str.endsWith(CameraUtilsEffects.FILE_DELIM)) {
            String valueOf = String.valueOf(str.substring(0, str.length() - 1));
            return new StringBuilder(String.valueOf(valueOf).length() + 1).append(valueOf).append('0').toString();
        }
        throw new AssertionError("Path keys must end with a '/'");
    }

    @Override // com.google.android.gms.internal.zzakv
    public void beginTransaction() {
        zzann.zzb(!this.aZS, "runInTransaction called when an existing transaction is already in progress.");
        if (this.aZR.zzcyu()) {
            this.aZR.zzi("Starting transaction.", new Object[0]);
        }
        this.aZQ.beginTransaction();
        this.aZS = true;
        this.aZT = System.currentTimeMillis();
    }

    @Override // com.google.android.gms.internal.zzakv
    public void endTransaction() {
        this.aZQ.endTransaction();
        this.aZS = false;
        long currentTimeMillis = System.currentTimeMillis() - this.aZT;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Transaction completed. Elapsed: %dms", Long.valueOf(currentTimeMillis)), new Object[0]);
        }
    }

    @Override // com.google.android.gms.internal.zzakv
    public void setTransactionSuccessful() {
        this.aZQ.setTransactionSuccessful();
    }

    @Override // com.google.android.gms.internal.zzakv
    public zzaml zza(zzajq zzajqVar) {
        return zzb(zzajqVar);
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zza(long j, Set<zzalz> set) {
        zzcri();
        long currentTimeMillis = System.currentTimeMillis();
        this.aZQ.delete("trackedKeys", "id = ?", new String[]{String.valueOf(j)});
        for (zzalz zzalzVar : set) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("id", Long.valueOf(j));
            contentValues.put("key", zzalzVar.asString());
            this.aZQ.insertWithOnConflict("trackedKeys", null, contentValues, 5);
        }
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Set %d tracked query keys for tracked query %d in %dms", Integer.valueOf(set.size()), Long.valueOf(j), Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zza(long j, Set<zzalz> set, Set<zzalz> set2) {
        zzcri();
        long currentTimeMillis = System.currentTimeMillis();
        String valueOf = String.valueOf(j);
        Iterator<zzalz> it = set2.iterator();
        while (it.hasNext()) {
            this.aZQ.delete("trackedKeys", "id = ? AND key = ?", new String[]{valueOf, it.next().asString()});
        }
        for (zzalz zzalzVar : set) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("id", Long.valueOf(j));
            contentValues.put("key", zzalzVar.asString());
            this.aZQ.insertWithOnConflict("trackedKeys", null, contentValues, 5);
        }
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Updated tracked query keys (%d added, %d removed) for tracked query id %d in %dms", Integer.valueOf(set.size()), Integer.valueOf(set2.size()), Long.valueOf(j), Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zza(zzajq zzajqVar, zzajh zzajhVar) {
        zzcri();
        long currentTimeMillis = System.currentTimeMillis();
        Iterator<Map.Entry<zzajq, zzaml>> it = zzajhVar.iterator();
        int i = 0;
        int i2 = 0;
        while (it.hasNext()) {
            Map.Entry<zzajq, zzaml> next = it.next();
            i += zza("serverCache", zzajqVar.zzh(next.getKey()));
            i2 = zzc(zzajqVar.zzh(next.getKey()), next.getValue()) + i2;
        }
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Persisted a total of %d rows and deleted %d rows for a merge at %s in %dms", Integer.valueOf(i2), Integer.valueOf(i), zzajqVar.toString(), Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zza(zzajq zzajqVar, zzajh zzajhVar, long j) {
        zzcri();
        long currentTimeMillis = System.currentTimeMillis();
        zza(zzajqVar, j, "m", zzbf(zzajhVar.zzda(true)));
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Persisted user merge in %dms", Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zza(zzajq zzajqVar, zzakw zzakwVar) {
        if (!zzakwVar.zzcwz()) {
            return;
        }
        zzcri();
        long currentTimeMillis = System.currentTimeMillis();
        Cursor zza2 = zza(zzajqVar, new String[]{"rowid", "path"});
        zzakz<Long> zzakzVar = new zzakz<>(null);
        zzakz<Long> zzakzVar2 = new zzakz<>(null);
        while (zza2.moveToNext()) {
            long j = zza2.getLong(0);
            zzajq zzajqVar2 = new zzajq(zza2.getString(1));
            if (!zzajqVar.zzi(zzajqVar2)) {
                zzalw zzalwVar = this.aZR;
                String valueOf = String.valueOf(zzajqVar);
                String valueOf2 = String.valueOf(zzajqVar2);
                zzalwVar.warn(new StringBuilder(String.valueOf(valueOf).length() + 67 + String.valueOf(valueOf2).length()).append("We are pruning at ").append(valueOf).append(" but we have data stored higher up at ").append(valueOf2).append(". Ignoring.").toString());
            } else {
                zzajq zza3 = zzajq.zza(zzajqVar, zzajqVar2);
                if (zzakwVar.zzw(zza3)) {
                    zzakzVar = zzakzVar.zzb(zza3, (zzajq) Long.valueOf(j));
                } else if (zzakwVar.zzx(zza3)) {
                    zzakzVar2 = zzakzVar2.zzb(zza3, (zzajq) Long.valueOf(j));
                } else {
                    zzalw zzalwVar2 = this.aZR;
                    String valueOf3 = String.valueOf(zzajqVar);
                    String valueOf4 = String.valueOf(zzajqVar2);
                    zzalwVar2.warn(new StringBuilder(String.valueOf(valueOf3).length() + 88 + String.valueOf(valueOf4).length()).append("We are pruning at ").append(valueOf3).append(" and have data at ").append(valueOf4).append(" that isn't marked for pruning or keeping. Ignoring.").toString());
                }
            }
        }
        int i = 0;
        int i2 = 0;
        if (!zzakzVar.isEmpty()) {
            ArrayList arrayList = new ArrayList();
            zza(zzajqVar, zzajq.zzcvg(), zzakzVar, zzakzVar2, zzakwVar, arrayList);
            Collection<Long> values = zzakzVar.values();
            String valueOf5 = String.valueOf(zzp(values));
            this.aZQ.delete("serverCache", new StringBuilder(String.valueOf(valueOf5).length() + 11).append("rowid IN (").append(valueOf5).append(")").toString(), null);
            for (zzank<zzajq, zzaml> zzankVar : arrayList) {
                zzc(zzajqVar.zzh(zzankVar.getFirst()), zzankVar.A());
            }
            i = values.size();
            i2 = arrayList.size();
        }
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (!this.aZR.zzcyu()) {
            return;
        }
        this.aZR.zzi(String.format("Pruned %d rows with %d nodes resaved in %dms", Integer.valueOf(i), Integer.valueOf(i2), Long.valueOf(currentTimeMillis2)), new Object[0]);
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zza(zzajq zzajqVar, zzaml zzamlVar) {
        zzcri();
        zza(zzajqVar, zzamlVar, false);
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zza(zzajq zzajqVar, zzaml zzamlVar, long j) {
        zzcri();
        long currentTimeMillis = System.currentTimeMillis();
        zza(zzajqVar, j, "o", zzbf(zzamlVar.getValue(true)));
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Persisted user overwrite in %dms", Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zza(zzakx zzakxVar) {
        zzcri();
        long currentTimeMillis = System.currentTimeMillis();
        ContentValues contentValues = new ContentValues();
        contentValues.put("id", Long.valueOf(zzakxVar.id));
        contentValues.put("path", zzc(zzakxVar.bgL.zzcrc()));
        contentValues.put("queryParams", zzakxVar.bgL.zzcyh().zzcyf());
        contentValues.put("lastUse", Long.valueOf(zzakxVar.bgM));
        contentValues.put("complete", Boolean.valueOf(zzakxVar.bgN));
        contentValues.put("active", Boolean.valueOf(zzakxVar.bgO));
        this.aZQ.insertWithOnConflict("trackedQueries", null, contentValues, 5);
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Saved new tracked query in %dms", Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zzb(zzajq zzajqVar, zzaml zzamlVar) {
        zzcri();
        zza(zzajqVar, zzamlVar, true);
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zzby(long j) {
        zzcri();
        long currentTimeMillis = System.currentTimeMillis();
        int delete = this.aZQ.delete("writes", "id = ?", new String[]{String.valueOf(j)});
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Deleted %d write(s) with writeId %d in %dms", Integer.valueOf(delete), Long.valueOf(j), Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zzbz(long j) {
        zzcri();
        String valueOf = String.valueOf(j);
        this.aZQ.delete("trackedQueries", "id = ?", new String[]{valueOf});
        this.aZQ.delete("trackedKeys", "id = ?", new String[]{valueOf});
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zzca(long j) {
        zzcri();
        long currentTimeMillis = System.currentTimeMillis();
        ContentValues contentValues = new ContentValues();
        contentValues.put("active", (Boolean) false);
        contentValues.put("lastUse", Long.valueOf(j));
        this.aZQ.updateWithOnConflict("trackedQueries", contentValues, "active = 1", new String[0], 5);
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Reset active tracked queries in %dms", Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
    }

    @Override // com.google.android.gms.internal.zzakv
    public Set<zzalz> zzcb(long j) {
        return zzh(Collections.singleton(Long.valueOf(j)));
    }

    @Override // com.google.android.gms.internal.zzakv
    public List<zzake> zzcre() {
        byte[] zzar;
        zzake zzakeVar;
        String[] strArr = {"id", "path", ServerKeys.TYPE, "part", "node"};
        long currentTimeMillis = System.currentTimeMillis();
        Cursor query = this.aZQ.query("writes", strArr, null, null, null, null, "id, part");
        ArrayList arrayList = new ArrayList();
        while (query.moveToNext()) {
            try {
                try {
                    long j = query.getLong(0);
                    zzajq zzajqVar = new zzajq(query.getString(1));
                    String string = query.getString(2);
                    if (query.isNull(3)) {
                        zzar = query.getBlob(4);
                    } else {
                        ArrayList arrayList2 = new ArrayList();
                        do {
                            arrayList2.add(query.getBlob(4));
                            if (!query.moveToNext()) {
                                break;
                            }
                        } while (query.getLong(0) == j);
                        query.moveToPrevious();
                        zzar = zzar(arrayList2);
                    }
                    Object zztc = zzane.zztc(new String(zzar, vp));
                    if ("o".equals(string)) {
                        zzakeVar = new zzake(j, zzajqVar, zzamm.zzbt(zztc), true);
                    } else if (!"m".equals(string)) {
                        String valueOf = String.valueOf(string);
                        throw new IllegalStateException(valueOf.length() != 0 ? "Got invalid write type: ".concat(valueOf) : new String("Got invalid write type: "));
                    } else {
                        zzakeVar = new zzake(j, zzajqVar, zzajh.zzca((Map) zztc));
                    }
                    arrayList.add(zzakeVar);
                } catch (IOException e) {
                    throw new RuntimeException("Failed to load writes", e);
                }
            } finally {
                query.close();
            }
        }
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Loaded %d writes in %dms", Integer.valueOf(arrayList.size()), Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
        return arrayList;
    }

    @Override // com.google.android.gms.internal.zzakv
    public long zzcrf() {
        Cursor rawQuery = this.aZQ.rawQuery(String.format("SELECT sum(length(%s) + length(%s)) FROM %s", "value", "path", "serverCache"), null);
        try {
            if (!rawQuery.moveToFirst()) {
                throw new IllegalStateException("Couldn't read database result!");
            }
            return rawQuery.getLong(0);
        } finally {
            rawQuery.close();
        }
    }

    @Override // com.google.android.gms.internal.zzakv
    public List<zzakx> zzcrg() {
        long currentTimeMillis = System.currentTimeMillis();
        Cursor query = this.aZQ.query("trackedQueries", new String[]{"id", "path", "queryParams", "lastUse", "complete", "active"}, null, null, null, null, "id");
        ArrayList arrayList = new ArrayList();
        while (query.moveToNext()) {
            try {
                try {
                    arrayList.add(new zzakx(query.getLong(0), zzall.zzb(new zzajq(query.getString(1)), zzane.zztb(query.getString(2))), query.getLong(3), query.getInt(4) != 0, query.getInt(5) != 0));
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            } finally {
                query.close();
            }
        }
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Loaded %d tracked queries in %dms", Integer.valueOf(arrayList.size()), Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
        return arrayList;
    }

    @Override // com.google.android.gms.internal.zzakv
    public void zzcrh() {
        zzcri();
        long currentTimeMillis = System.currentTimeMillis();
        int delete = this.aZQ.delete("writes", null, null);
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Deleted %d (all) write(s) in %dms", Integer.valueOf(delete), Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
    }

    @Override // com.google.android.gms.internal.zzakv
    public Set<zzalz> zzh(Set<Long> set) {
        long currentTimeMillis = System.currentTimeMillis();
        String valueOf = String.valueOf("id IN (");
        String valueOf2 = String.valueOf(zzp(set));
        Cursor query = this.aZQ.query(true, "trackedKeys", new String[]{"key"}, new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(valueOf2).length()).append(valueOf).append(valueOf2).append(")").toString(), null, null, null, null, null);
        HashSet hashSet = new HashSet();
        while (query.moveToNext()) {
            try {
                hashSet.add(zzalz.zzsx(query.getString(0)));
            } finally {
                query.close();
            }
        }
        long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(String.format("Loaded %d tracked queries keys for tracked queries %s in %dms", Integer.valueOf(hashSet.size()), set.toString(), Long.valueOf(currentTimeMillis2)), new Object[0]);
        }
        return hashSet;
    }
}
