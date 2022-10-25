package com.google.android.gms.appindexing;

import android.net.Uri;
import android.os.Bundle;
import com.google.android.gms.appindexing.Thing;
import com.google.android.gms.common.internal.zzaa;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public final class Action extends Thing {
    public static final String STATUS_TYPE_ACTIVE = "http://schema.org/ActiveActionStatus";
    public static final String STATUS_TYPE_COMPLETED = "http://schema.org/CompletedActionStatus";
    public static final String STATUS_TYPE_FAILED = "http://schema.org/FailedActionStatus";
    public static final String TYPE_ACTIVATE = "http://schema.org/ActivateAction";
    public static final String TYPE_ADD = "http://schema.org/AddAction";
    public static final String TYPE_BOOKMARK = "http://schema.org/BookmarkAction";
    public static final String TYPE_COMMUNICATE = "http://schema.org/CommunicateAction";
    public static final String TYPE_FILM = "http://schema.org/FilmAction";
    public static final String TYPE_LIKE = "http://schema.org/LikeAction";
    public static final String TYPE_LISTEN = "http://schema.org/ListenAction";
    public static final String TYPE_PHOTOGRAPH = "http://schema.org/PhotographAction";
    public static final String TYPE_RESERVE = "http://schema.org/ReserveAction";
    public static final String TYPE_SEARCH = "http://schema.org/SearchAction";
    public static final String TYPE_VIEW = "http://schema.org/ViewAction";
    public static final String TYPE_WANT = "http://schema.org/WantAction";
    public static final String TYPE_WATCH = "http://schema.org/WatchAction";

    /* loaded from: classes2.dex */
    public static final class Builder extends Thing.Builder {
        public Builder(String str) {
            zzaa.zzy(str);
            super.mo385put(ServerKeys.TYPE, str);
        }

        @Override // com.google.android.gms.appindexing.Thing.Builder
        /* renamed from: build */
        public Action mo383build() {
            zzaa.zzb(this.hf.get("object"), "setObject is required before calling build().");
            zzaa.zzb(this.hf.get(ServerKeys.TYPE), "setType is required before calling build().");
            Bundle bundle = (Bundle) this.hf.getParcelable("object");
            zzaa.zzb(bundle.get("name"), "Must call setObject() with a valid name. Example: setObject(new Thing.Builder().setName(name).setUrl(url))");
            zzaa.zzb(bundle.get("url"), "Must call setObject() with a valid app URI. Example: setObject(new Thing.Builder().setName(name).setUrl(url))");
            return new Action(this.hf);
        }

        @Override // com.google.android.gms.appindexing.Thing.Builder
        /* renamed from: put */
        public Builder mo384put(String str, Thing thing) {
            return (Builder) super.mo384put(str, thing);
        }

        @Override // com.google.android.gms.appindexing.Thing.Builder
        /* renamed from: put */
        public Builder mo385put(String str, String str2) {
            return (Builder) super.mo385put(str, str2);
        }

        @Override // com.google.android.gms.appindexing.Thing.Builder
        /* renamed from: put */
        public Builder mo386put(String str, boolean z) {
            return (Builder) super.mo386put(str, z);
        }

        @Override // com.google.android.gms.appindexing.Thing.Builder
        /* renamed from: put */
        public Builder mo387put(String str, Thing[] thingArr) {
            return (Builder) super.mo387put(str, thingArr);
        }

        @Override // com.google.android.gms.appindexing.Thing.Builder
        /* renamed from: put */
        public Builder mo388put(String str, String[] strArr) {
            return (Builder) super.mo388put(str, strArr);
        }

        public Builder setActionStatus(String str) {
            zzaa.zzy(str);
            return (Builder) super.mo385put("actionStatus", str);
        }

        @Override // com.google.android.gms.appindexing.Thing.Builder
        /* renamed from: setName */
        public Builder mo389setName(String str) {
            return (Builder) super.mo385put("name", str);
        }

        public Builder setObject(Thing thing) {
            zzaa.zzy(thing);
            return (Builder) super.mo384put("object", thing);
        }

        @Override // com.google.android.gms.appindexing.Thing.Builder
        /* renamed from: setUrl */
        public Builder mo390setUrl(Uri uri) {
            if (uri != null) {
                super.mo385put("url", uri.toString());
            }
            return this;
        }
    }

    private Action(Bundle bundle) {
        super(bundle);
    }

    public static Action newAction(String str, String str2, Uri uri) {
        return newAction(str, str2, null, uri);
    }

    public static Action newAction(String str, String str2, Uri uri, Uri uri2) {
        return (Action) new Builder(str).setObject(new Thing.Builder().mo389setName(str2).setId(uri == null ? null : uri.toString()).mo390setUrl(uri2).mo383build()).mo383build();
    }
}
