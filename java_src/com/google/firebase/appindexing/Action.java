package com.google.firebase.appindexing;

import android.support.annotation.NonNull;
import com.google.android.gms.common.internal.zzaa;
import com.google.firebase.appindexing.internal.ActionImpl;
import com.google.firebase.appindexing.internal.zzl;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
/* loaded from: classes.dex */
public interface Action {

    /* loaded from: classes.dex */
    public static class Builder {
        public static final String ACTIVATE_ACTION = "ActivateAction";
        public static final String ADD_ACTION = "AddAction";
        public static final String BOOKMARK_ACTION = "BookmarkAction";
        public static final String COMMENT_ACTION = "CommentAction";
        public static final String LIKE_ACTION = "LikeAction";
        public static final String LISTEN_ACTION = "ListenAction";
        public static final String SEND_ACTION = "SendAction";
        public static final String SHARE_ACTION = "ShareAction";
        public static final String STATUS_TYPE_ACTIVE = "http://schema.org/ActiveActionStatus";
        public static final String STATUS_TYPE_COMPLETED = "http://schema.org/CompletedActionStatus";
        public static final String STATUS_TYPE_FAILED = "http://schema.org/FailedActionStatus";
        public static final String VIEW_ACTION = "ViewAction";
        public static final String WATCH_ACTION = "WatchAction";
        private final String aWl;
        private String aWm;
        private String aWn;
        private String aWo;
        private ActionImpl.MetadataImpl aWp = Metadata.aWr;
        private String aWq;

        @Retention(RetentionPolicy.CLASS)
        /* loaded from: classes.dex */
        public @interface StatusType {
        }

        public Builder(String str) {
            this.aWl = str;
        }

        public Action build() {
            zzaa.zzb(this.aWm, "setObject is required before calling build().");
            zzaa.zzb(this.aWn, "setObject is required before calling build().");
            return new ActionImpl(this.aWl, this.aWm, this.aWn, this.aWo, this.aWp, this.aWq);
        }

        public Builder setActionStatus(@StatusType String str) {
            zzaa.zzy(str);
            this.aWq = str;
            return this;
        }

        public Builder setMetadata(@NonNull Metadata.Builder builder) {
            zzaa.zzy(builder);
            this.aWp = builder.zzcny();
            return this;
        }

        public Builder setObject(@NonNull String str, @NonNull String str2) throws FirebaseAppIndexingInvalidArgumentException {
            zzaa.zzy(str);
            zzl.zzrs(str2);
            this.aWm = str;
            this.aWn = str2;
            return this;
        }

        public Builder setObject(@NonNull String str, @NonNull String str2, @NonNull String str3) throws FirebaseAppIndexingInvalidArgumentException {
            zzaa.zzy(str);
            zzl.zzrs(str2);
            zzl.zzrt(str3);
            this.aWm = str;
            this.aWn = str2;
            this.aWo = str3;
            return this;
        }
    }

    /* loaded from: classes.dex */
    public interface Metadata {
        public static final ActionImpl.MetadataImpl aWr = new Builder().zzcny();

        /* loaded from: classes.dex */
        public static class Builder {
            private boolean aWs = true;
            private boolean aWt = false;

            public Builder setUpload(boolean z) {
                this.aWs = z;
                return this;
            }

            public ActionImpl.MetadataImpl zzcny() {
                return new ActionImpl.MetadataImpl(this.aWs, null, null, null, false);
            }
        }
    }
}
