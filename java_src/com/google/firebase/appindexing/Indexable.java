package com.google.firebase.appindexing;

import android.support.annotation.NonNull;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzase;
import com.google.firebase.appindexing.builders.IndexableBuilder;
import com.google.firebase.appindexing.internal.Thing;
/* loaded from: classes2.dex */
public interface Indexable {
    public static final int MAX_BYTE_SIZE = 30000;
    public static final int MAX_INDEXABLES_TO_BE_UPDATED_IN_ONE_CALL = 1000;
    public static final int MAX_NESTING_DEPTH = 5;
    public static final int MAX_NUMBER_OF_FIELDS = 20;
    public static final int MAX_REPEATED_SIZE = 100;
    public static final int MAX_STRING_LENGTH = 20000;
    public static final int MAX_URL_LENGTH = 256;

    /* loaded from: classes2.dex */
    public static class Builder extends IndexableBuilder<Builder> {
        public Builder() {
            this("Thing");
        }

        public Builder(@NonNull String str) {
            super(str);
        }
    }

    /* loaded from: classes2.dex */
    public interface Metadata {
        public static final Thing.Metadata aWv = new Builder().zzcnz();

        /* loaded from: classes2.dex */
        public static final class Builder {
            private static final zzase.zza aWw = new zzase.zza();
            private boolean aWx = aWw.btZ;
            private int zzavt = aWw.score;
            private String aWy = aWw.bua;

            public Builder setScore(int i) {
                zzaa.zzb(i >= 0, new StringBuilder(53).append("Negative score values are invalid. Value: ").append(i).toString());
                this.zzavt = i;
                return this;
            }

            public Builder setWorksOffline(boolean z) {
                this.aWx = z;
                return this;
            }

            public Thing.Metadata zzcnz() {
                return new Thing.Metadata(this.aWx, this.zzavt, this.aWy);
            }
        }
    }
}
