package com.google.firebase.database;

import com.google.android.gms.internal.zzajg;
import com.google.android.gms.internal.zzajl;
import com.google.android.gms.internal.zzajq;
import com.google.android.gms.internal.zzajs;
import com.google.android.gms.internal.zzakg;
import com.google.android.gms.internal.zzakj;
import com.google.android.gms.internal.zzalk;
import com.google.android.gms.internal.zzall;
import com.google.android.gms.internal.zzaly;
import com.google.android.gms.internal.zzalz;
import com.google.android.gms.internal.zzamd;
import com.google.android.gms.internal.zzame;
import com.google.android.gms.internal.zzamh;
import com.google.android.gms.internal.zzaml;
import com.google.android.gms.internal.zzamn;
import com.google.android.gms.internal.zzamo;
import com.google.android.gms.internal.zzamp;
import com.google.android.gms.internal.zzamr;
import com.google.android.gms.internal.zzams;
import com.google.android.gms.internal.zzann;
import com.google.android.gms.internal.zzano;
/* loaded from: classes2.dex */
public class Query {
    static final /* synthetic */ boolean $assertionsDisabled;
    protected final zzajs aZj;
    protected final zzajq aZr;
    protected final zzalk aZv;
    private final boolean aZw;

    static {
        $assertionsDisabled = !Query.class.desiredAssertionStatus();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Query(zzajs zzajsVar, zzajq zzajqVar) {
        this.aZj = zzajsVar;
        this.aZr = zzajqVar;
        this.aZv = zzalk.bhG;
        this.aZw = false;
    }

    Query(zzajs zzajsVar, zzajq zzajqVar, zzalk zzalkVar, boolean z) throws DatabaseException {
        this.aZj = zzajsVar;
        this.aZr = zzajqVar;
        this.aZv = zzalkVar;
        this.aZw = z;
        zzann.zzb(zzalkVar.isValid(), "Validation of queries failed.");
    }

    private Query zza(zzaml zzamlVar, String str) {
        zzano.zztm(str);
        if (zzamlVar.zzcze() || zzamlVar.isEmpty()) {
            if (this.aZv.zzcxs()) {
                throw new IllegalArgumentException("Can't call startAt() or equalTo() multiple times");
            }
            zzalk zza = this.aZv.zza(zzamlVar, str != null ? zzalz.zzsx(str) : null);
            zzb(zza);
            zza(zza);
            if (!$assertionsDisabled && !zza.isValid()) {
                throw new AssertionError();
            }
            return new Query(this.aZj, this.aZr, zza, this.aZw);
        }
        throw new IllegalArgumentException("Can only use simple values for startAt()");
    }

    private void zza(final zzajl zzajlVar) {
        zzakj.zzcwl().zzk(zzajlVar);
        this.aZj.zzs(new Runnable() { // from class: com.google.firebase.database.Query.2
            @Override // java.lang.Runnable
            public void run() {
                Query.this.aZj.zze(zzajlVar);
            }
        });
    }

    private void zza(zzalk zzalkVar) {
        if (!zzalkVar.zzcya().equals(zzamh.zzczx())) {
            if (!zzalkVar.zzcya().equals(zzamo.b())) {
                return;
            }
            if ((zzalkVar.zzcxs() && !zzamp.zzq(zzalkVar.zzcxt())) || (zzalkVar.zzcxv() && !zzamp.zzq(zzalkVar.zzcxw()))) {
                throw new IllegalArgumentException("When using orderByPriority(), values provided to startAt(), endAt(), or equalTo() must be valid priorities.");
            }
            return;
        }
        if (zzalkVar.zzcxs()) {
            zzaml zzcxt = zzalkVar.zzcxt();
            if (zzalkVar.zzcxu() != zzalz.zzcyx() || !(zzcxt instanceof zzamr)) {
                throw new IllegalArgumentException("You must use startAt(String value), endAt(String value) or equalTo(String value) in combination with orderByKey(). Other type of values or using the version with 2 parameters is not supported");
            }
        }
        if (!zzalkVar.zzcxv()) {
            return;
        }
        zzaml zzcxw = zzalkVar.zzcxw();
        if (zzalkVar.zzcxx() == zzalz.zzcyy() && (zzcxw instanceof zzamr)) {
            return;
        }
        throw new IllegalArgumentException("You must use startAt(String value), endAt(String value) or equalTo(String value) in combination with orderByKey(). Other type of values or using the version with 2 parameters is not supported");
    }

    private Query zzb(zzaml zzamlVar, String str) {
        zzano.zztm(str);
        if (zzamlVar.zzcze() || zzamlVar.isEmpty()) {
            zzalz zzsx = str != null ? zzalz.zzsx(str) : null;
            if (this.aZv.zzcxv()) {
                throw new IllegalArgumentException("Can't call endAt() or equalTo() multiple times");
            }
            zzalk zzb = this.aZv.zzb(zzamlVar, zzsx);
            zzb(zzb);
            zza(zzb);
            if (!$assertionsDisabled && !zzb.isValid()) {
                throw new AssertionError();
            }
            return new Query(this.aZj, this.aZr, zzb, this.aZw);
        }
        throw new IllegalArgumentException("Can only use simple values for endAt()");
    }

    private void zzb(final zzajl zzajlVar) {
        zzakj.zzcwl().zzi(zzajlVar);
        this.aZj.zzs(new Runnable() { // from class: com.google.firebase.database.Query.3
            @Override // java.lang.Runnable
            public void run() {
                Query.this.aZj.zzf(zzajlVar);
            }
        });
    }

    private void zzb(zzalk zzalkVar) {
        if (!zzalkVar.zzcxs() || !zzalkVar.zzcxv() || !zzalkVar.zzcxy() || zzalkVar.zzcxz()) {
            return;
        }
        throw new IllegalArgumentException("Can't combine startAt(), endAt() and limit(). Use limitToFirst() or limitToLast() instead");
    }

    private void zzcra() {
        if (this.aZv.zzcxs()) {
            throw new IllegalArgumentException("Can't call equalTo() and startAt() combined");
        }
        if (!this.aZv.zzcxv()) {
            return;
        }
        throw new IllegalArgumentException("Can't call equalTo() and endAt() combined");
    }

    private void zzcrb() {
        if (this.aZw) {
            throw new IllegalArgumentException("You can't combine multiple orderBy calls!");
        }
    }

    public ChildEventListener addChildEventListener(ChildEventListener childEventListener) {
        zzb(new zzajg(this.aZj, childEventListener, zzcrd()));
        return childEventListener;
    }

    public void addListenerForSingleValueEvent(final ValueEventListener valueEventListener) {
        zzb(new zzakg(this.aZj, new ValueEventListener() { // from class: com.google.firebase.database.Query.1
            @Override // com.google.firebase.database.ValueEventListener
            public void onCancelled(DatabaseError databaseError) {
                valueEventListener.onCancelled(databaseError);
            }

            @Override // com.google.firebase.database.ValueEventListener
            public void onDataChange(DataSnapshot dataSnapshot) {
                Query.this.removeEventListener(this);
                valueEventListener.onDataChange(dataSnapshot);
            }
        }, zzcrd()));
    }

    public ValueEventListener addValueEventListener(ValueEventListener valueEventListener) {
        zzb(new zzakg(this.aZj, valueEventListener, zzcrd()));
        return valueEventListener;
    }

    public Query endAt(double d) {
        return endAt(d, (String) null);
    }

    public Query endAt(double d, String str) {
        return zzb(new zzamd(Double.valueOf(d), zzamp.c()), str);
    }

    public Query endAt(String str) {
        return endAt(str, (String) null);
    }

    public Query endAt(String str, String str2) {
        return zzb(str != null ? new zzamr(str, zzamp.c()) : zzame.zzczq(), str2);
    }

    public Query endAt(boolean z) {
        return endAt(z, (String) null);
    }

    public Query endAt(boolean z, String str) {
        return zzb(new zzaly(Boolean.valueOf(z), zzamp.c()), str);
    }

    public Query equalTo(double d) {
        zzcra();
        return startAt(d).endAt(d);
    }

    public Query equalTo(double d, String str) {
        zzcra();
        return startAt(d, str).endAt(d, str);
    }

    public Query equalTo(String str) {
        zzcra();
        return startAt(str).endAt(str);
    }

    public Query equalTo(String str, String str2) {
        zzcra();
        return startAt(str, str2).endAt(str, str2);
    }

    public Query equalTo(boolean z) {
        zzcra();
        return startAt(z).endAt(z);
    }

    public Query equalTo(boolean z, String str) {
        zzcra();
        return startAt(z, str).endAt(z, str);
    }

    public DatabaseReference getRef() {
        return new DatabaseReference(this.aZj, zzcrc());
    }

    public void keepSynced(final boolean z) {
        if (this.aZr.isEmpty() || !this.aZr.zzcvj().equals(zzalz.zzcza())) {
            this.aZj.zzs(new Runnable() { // from class: com.google.firebase.database.Query.4
                @Override // java.lang.Runnable
                public void run() {
                    Query.this.aZj.zza(Query.this.zzcrd(), z);
                }
            });
            return;
        }
        throw new DatabaseException("Can't call keepSynced() on .info paths.");
    }

    public Query limitToFirst(int i) {
        if (i <= 0) {
            throw new IllegalArgumentException("Limit must be a positive integer!");
        }
        if (!this.aZv.zzcxy()) {
            return new Query(this.aZj, this.aZr, this.aZv.zzafy(i), this.aZw);
        }
        throw new IllegalArgumentException("Can't call limitToLast on query with previously set limit!");
    }

    public Query limitToLast(int i) {
        if (i <= 0) {
            throw new IllegalArgumentException("Limit must be a positive integer!");
        }
        if (!this.aZv.zzcxy()) {
            return new Query(this.aZj, this.aZr, this.aZv.zzafz(i), this.aZw);
        }
        throw new IllegalArgumentException("Can't call limitToLast on query with previously set limit!");
    }

    public Query orderByChild(String str) {
        if (str == null) {
            throw new NullPointerException("Key can't be null");
        }
        if (str.equals("$key") || str.equals(".key")) {
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(str).length() + 54).append("Can't use '").append(str).append("' as path, please use orderByKey() instead!").toString());
        }
        if (str.equals("$priority") || str.equals(".priority")) {
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(str).length() + 59).append("Can't use '").append(str).append("' as path, please use orderByPriority() instead!").toString());
        }
        if (str.equals("$value") || str.equals(".value")) {
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(str).length() + 56).append("Can't use '").append(str).append("' as path, please use orderByValue() instead!").toString());
        }
        zzano.zzti(str);
        zzcrb();
        zzajq zzajqVar = new zzajq(str);
        if (zzajqVar.size() == 0) {
            throw new IllegalArgumentException("Can't use empty path, use orderByValue() instead!");
        }
        return new Query(this.aZj, this.aZr, this.aZv.zza(new zzamn(zzajqVar)), true);
    }

    public Query orderByKey() {
        zzcrb();
        zzalk zza = this.aZv.zza(zzamh.zzczx());
        zza(zza);
        return new Query(this.aZj, this.aZr, zza, true);
    }

    public Query orderByPriority() {
        zzcrb();
        zzalk zza = this.aZv.zza(zzamo.b());
        zza(zza);
        return new Query(this.aZj, this.aZr, zza, true);
    }

    public Query orderByValue() {
        zzcrb();
        return new Query(this.aZj, this.aZr, this.aZv.zza(zzams.d()), true);
    }

    public void removeEventListener(ChildEventListener childEventListener) {
        if (childEventListener == null) {
            throw new NullPointerException("listener must not be null");
        }
        zza(new zzajg(this.aZj, childEventListener, zzcrd()));
    }

    public void removeEventListener(ValueEventListener valueEventListener) {
        if (valueEventListener == null) {
            throw new NullPointerException("listener must not be null");
        }
        zza(new zzakg(this.aZj, valueEventListener, zzcrd()));
    }

    public Query startAt(double d) {
        return startAt(d, (String) null);
    }

    public Query startAt(double d, String str) {
        return zza(new zzamd(Double.valueOf(d), zzamp.c()), str);
    }

    public Query startAt(String str) {
        return startAt(str, (String) null);
    }

    public Query startAt(String str, String str2) {
        return zza(str != null ? new zzamr(str, zzamp.c()) : zzame.zzczq(), str2);
    }

    public Query startAt(boolean z) {
        return startAt(z, (String) null);
    }

    public Query startAt(boolean z, String str) {
        return zza(new zzaly(Boolean.valueOf(z), zzamp.c()), str);
    }

    public zzajq zzcrc() {
        return this.aZr;
    }

    public zzall zzcrd() {
        return new zzall(this.aZr, this.aZv);
    }
}
