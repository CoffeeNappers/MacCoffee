package com.google.android.gms.appindexing;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import com.google.android.gms.common.internal.zzaa;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class Thing {
    final Bundle he;

    /* loaded from: classes2.dex */
    public static class Builder {
        final Bundle hf = new Bundle();

        /* renamed from: build */
        public Thing mo383build() {
            return new Thing(this.hf);
        }

        /* renamed from: put */
        public Builder mo384put(String str, Thing thing) {
            zzaa.zzy(str);
            if (thing != null) {
                this.hf.putParcelable(str, thing.he);
            }
            return this;
        }

        /* renamed from: put */
        public Builder mo385put(String str, String str2) {
            zzaa.zzy(str);
            if (str2 != null) {
                this.hf.putString(str, str2);
            }
            return this;
        }

        /* renamed from: put */
        public Builder mo386put(String str, boolean z) {
            zzaa.zzy(str);
            this.hf.putBoolean(str, z);
            return this;
        }

        /* renamed from: put */
        public Builder mo387put(String str, Thing[] thingArr) {
            zzaa.zzy(str);
            if (thingArr != null) {
                ArrayList arrayList = new ArrayList();
                for (Thing thing : thingArr) {
                    if (thing != null) {
                        arrayList.add(thing.he);
                    }
                }
                this.hf.putParcelableArray(str, (Parcelable[]) arrayList.toArray(new Bundle[arrayList.size()]));
            }
            return this;
        }

        /* renamed from: put */
        public Builder mo388put(String str, String[] strArr) {
            zzaa.zzy(str);
            if (strArr != null) {
                this.hf.putStringArray(str, strArr);
            }
            return this;
        }

        public Builder setDescription(String str) {
            mo385put("description", str);
            return this;
        }

        public Builder setId(String str) {
            if (str != null) {
                mo385put("id", str);
            }
            return this;
        }

        /* renamed from: setName */
        public Builder mo389setName(String str) {
            zzaa.zzy(str);
            mo385put("name", str);
            return this;
        }

        public Builder setType(String str) {
            mo385put(ServerKeys.TYPE, str);
            return this;
        }

        /* renamed from: setUrl */
        public Builder mo390setUrl(Uri uri) {
            zzaa.zzy(uri);
            mo385put("url", uri.toString());
            return this;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Thing(Bundle bundle) {
        this.he = bundle;
    }

    public Bundle zzahu() {
        return this.he;
    }
}
