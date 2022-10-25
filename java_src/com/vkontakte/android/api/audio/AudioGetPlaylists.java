package com.vkontakte.android.api.audio;

import com.vk.music.dto.Playlist;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import java.lang.ref.WeakReference;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class AudioGetPlaylists extends VKAPIRequest<VKList<Playlist>> {
    private static WeakReference<Parser<Playlist>> parserRef;

    /* loaded from: classes2.dex */
    public enum Filter {
        all,
        owned,
        followed
    }

    private AudioGetPlaylists(Builder builder) {
        super("audio.getPlaylists");
        param("owner_id", builder.ownerId);
        param(MoneyTransfersFragment.FILTER_ARGUMENT, builder.filter.name());
        param("offset", builder.offset);
        param(ServerKeys.COUNT, builder.count);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<Playlist> mo1093parse(JSONObject r) throws Exception {
        Parser<Playlist> parser = parserRef != null ? parserRef.get() : null;
        if (parser == null) {
            parser = new Parser<Playlist>() { // from class: com.vkontakte.android.api.audio.AudioGetPlaylists.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse */
                public Playlist mo821parse(JSONObject o) throws JSONException {
                    return new Playlist(o);
                }
            };
            parserRef = new WeakReference<>(parser);
        }
        return new VKList<>(r.getJSONObject(ServerKeys.RESPONSE), parser);
    }

    /* loaded from: classes2.dex */
    public static final class Builder {
        int count;
        Filter filter;
        int offset;
        final int ownerId;

        public Builder(int ownerId) {
            this.ownerId = ownerId;
        }

        public Builder filter(Filter val) {
            this.filter = val;
            return this;
        }

        public Builder offset(int val) {
            this.offset = val;
            return this;
        }

        public Builder count(int val) {
            this.count = val;
            return this;
        }

        public AudioGetPlaylists build() {
            if (this.filter == null) {
                this.filter = Filter.all;
            }
            return new AudioGetPlaylists(this);
        }
    }
}
