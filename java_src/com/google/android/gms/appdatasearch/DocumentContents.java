package com.google.android.gms.appdatasearch;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.List;
/* loaded from: classes2.dex */
public class DocumentContents extends AbstractSafeParcelable {
    public static final Parcelable.Creator<DocumentContents> CREATOR = new zzb();
    public final Account account;
    final DocumentSection[] gd;
    public final String ge;
    public final boolean gf;
    final int mVersionCode;

    /* loaded from: classes2.dex */
    public static class zza {
        private List<DocumentSection> gg;
        private String gh;
        private boolean gi;
        private Account gj;

        public zza zza(DocumentSection documentSection) {
            if (this.gg == null && documentSection != null) {
                this.gg = new ArrayList();
            }
            if (documentSection != null) {
                this.gg.add(documentSection);
            }
            return this;
        }

        public DocumentContents zzaho() {
            return new DocumentContents(this.gh, this.gi, this.gj, this.gg != null ? (DocumentSection[]) this.gg.toArray(new DocumentSection[this.gg.size()]) : null);
        }

        public zza zzay(boolean z) {
            this.gi = z;
            return this;
        }

        public zza zzb(Account account) {
            this.gj = account;
            return this;
        }

        public zza zzfp(String str) {
            this.gh = str;
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public DocumentContents(int i, DocumentSection[] documentSectionArr, String str, boolean z, Account account) {
        this.mVersionCode = i;
        this.gd = documentSectionArr;
        this.ge = str;
        this.gf = z;
        this.account = account;
    }

    DocumentContents(String str, boolean z, Account account, DocumentSection... documentSectionArr) {
        this(1, documentSectionArr, str, z, account);
        if (documentSectionArr != null) {
            BitSet bitSet = new BitSet(zzh.zzahq());
            for (DocumentSection documentSection : documentSectionArr) {
                int i = documentSection.gq;
                if (i != -1) {
                    if (bitSet.get(i)) {
                        String valueOf = String.valueOf(zzh.zzcn(i));
                        throw new IllegalArgumentException(valueOf.length() != 0 ? "Duplicate global search section type ".concat(valueOf) : new String("Duplicate global search section type "));
                    }
                    bitSet.set(i);
                }
            }
        }
    }

    public boolean equals(Object obj) {
        if (obj instanceof DocumentContents) {
            DocumentContents documentContents = (DocumentContents) obj;
            return zzz.equal(this.ge, documentContents.ge) && zzz.equal(Boolean.valueOf(this.gf), Boolean.valueOf(documentContents.gf)) && zzz.equal(this.account, documentContents.account) && Arrays.equals(zzahn(), documentContents.zzahn());
        }
        return false;
    }

    public int hashCode() {
        return zzz.hashCode(this.ge, Boolean.valueOf(this.gf), this.account, Integer.valueOf(Arrays.hashCode(this.gd)));
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }

    public DocumentSection[] zzahn() {
        return this.gd;
    }
}
