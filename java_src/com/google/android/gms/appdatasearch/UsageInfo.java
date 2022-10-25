package com.google.android.gms.appdatasearch;

import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.appdatasearch.DocumentContents;
import com.google.android.gms.appdatasearch.RegisterSectionInfo;
import com.google.android.gms.appindexing.AppIndexApi;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzasa;
import com.google.android.gms.internal.zzvw;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Locale;
import java.util.zip.CRC32;
/* loaded from: classes2.dex */
public class UsageInfo extends AbstractSafeParcelable {
    public static final Parcelable.Creator<UsageInfo> CREATOR = new zzj();
    final DocumentId gR;
    final long gS;
    int gT;
    final DocumentContents gU;
    final boolean gV;
    int gW;
    int gX;
    final int mVersionCode;
    public final String zzbcj;

    /* loaded from: classes2.dex */
    public static final class zza {
        private DocumentId gR;
        private DocumentContents gU;
        private long gS = -1;
        private int gT = -1;
        private int gW = -1;
        private boolean gV = false;
        private int gX = 0;

        public zza zza(DocumentContents documentContents) {
            this.gU = documentContents;
            return this;
        }

        public zza zza(DocumentId documentId) {
            this.gR = documentId;
            return this;
        }

        public zza zzaa(long j) {
            this.gS = j;
            return this;
        }

        public UsageInfo zzahs() {
            return new UsageInfo(this.gR, this.gS, this.gT, (String) null, this.gU, this.gV, this.gW, this.gX);
        }

        public zza zzbb(boolean z) {
            this.gV = z;
            return this;
        }

        public zza zzcq(int i) {
            this.gT = i;
            return this;
        }

        public zza zzcr(int i) {
            this.gX = i;
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public UsageInfo(int i, DocumentId documentId, long j, int i2, String str, DocumentContents documentContents, boolean z, int i3, int i4) {
        this.mVersionCode = i;
        this.gR = documentId;
        this.gS = j;
        this.gT = i2;
        this.zzbcj = str;
        this.gU = documentContents;
        this.gV = z;
        this.gW = i3;
        this.gX = i4;
    }

    private UsageInfo(DocumentId documentId, long j, int i, String str, DocumentContents documentContents, boolean z, int i2, int i3) {
        this(1, documentId, j, i, str, documentContents, z, i2, i3);
    }

    public UsageInfo(String str, Intent intent, String str2, Uri uri, String str3, List<AppIndexApi.AppIndexingLink> list, int i) {
        this(1, zza(str, intent), System.currentTimeMillis(), 0, (String) null, zza(intent, str2, uri, str3, list).zzaho(), false, -1, i);
    }

    public static DocumentContents.zza zza(Intent intent, String str, Uri uri, String str2, List<AppIndexApi.AppIndexingLink> list) {
        String string;
        DocumentContents.zza zzaVar = new DocumentContents.zza();
        zzaVar.zza(zzft(str));
        if (uri != null) {
            zzaVar.zza(zzk(uri));
        }
        if (list != null) {
            zzaVar.zza(zzv(list));
        }
        String action = intent.getAction();
        if (action != null) {
            zzaVar.zza(zzt("intent_action", action));
        }
        String dataString = intent.getDataString();
        if (dataString != null) {
            zzaVar.zza(zzt("intent_data", dataString));
        }
        ComponentName component = intent.getComponent();
        if (component != null) {
            zzaVar.zza(zzt("intent_activity", component.getClassName()));
        }
        Bundle extras = intent.getExtras();
        if (extras != null && (string = extras.getString("intent_extra_data_key")) != null) {
            zzaVar.zza(zzt("intent_extra_data", string));
        }
        return zzaVar.zzfp(str2).zzay(true);
    }

    public static DocumentId zza(String str, Intent intent) {
        return zzs(str, zzg(intent));
    }

    private static DocumentSection zzft(String str) {
        return new DocumentSection(str, new RegisterSectionInfo.zza("title").zzco(1).zzba(true).zzfs("name").zzahr(), "text1");
    }

    private static String zzg(Intent intent) {
        String uri = intent.toUri(1);
        CRC32 crc32 = new CRC32();
        try {
            crc32.update(uri.getBytes("UTF-8"));
            return Long.toHexString(crc32.getValue());
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    private static DocumentSection zzk(Uri uri) {
        return new DocumentSection(uri.toString(), new RegisterSectionInfo.zza("web_url").zzco(4).zzaz(true).zzfs("url").zzahr());
    }

    private static DocumentId zzs(String str, String str2) {
        return new DocumentId(str, "", str2);
    }

    private static DocumentSection zzt(String str, String str2) {
        return new DocumentSection(str2, new RegisterSectionInfo.zza(str).zzaz(true).zzahr(), str);
    }

    private static DocumentSection zzv(List<AppIndexApi.AppIndexingLink> list) {
        zzvw.zza zzaVar = new zzvw.zza();
        zzvw.zza.C0138zza[] c0138zzaArr = new zzvw.zza.C0138zza[list.size()];
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= c0138zzaArr.length) {
                zzaVar.ahB = c0138zzaArr;
                return new DocumentSection(zzasa.zzf(zzaVar), new RegisterSectionInfo.zza("outlinks").zzaz(true).zzfs(".private:outLinks").zzfr("blob").zzahr());
            }
            c0138zzaArr[i2] = new zzvw.zza.C0138zza();
            AppIndexApi.AppIndexingLink appIndexingLink = list.get(i2);
            c0138zzaArr[i2].ahD = appIndexingLink.appIndexingUrl.toString();
            c0138zzaArr[i2].viewId = appIndexingLink.viewId;
            if (appIndexingLink.webUrl != null) {
                c0138zzaArr[i2].ahE = appIndexingLink.webUrl.toString();
            }
            i = i2 + 1;
        }
    }

    public String toString() {
        return String.format(Locale.US, "UsageInfo[documentId=%s, timestamp=%d, usageType=%d, status=%d]", this.gR, Long.valueOf(this.gS), Integer.valueOf(this.gT), Integer.valueOf(this.gX));
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzj.zza(this, parcel, i);
    }
}
