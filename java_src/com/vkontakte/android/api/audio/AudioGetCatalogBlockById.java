package com.vkontakte.android.api.audio;

import com.vk.music.dto.ExtendedPlaylist;
import com.vk.music.dto.Playlist;
import com.vk.music.dto.Section;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.utils.L;
import java.util.Iterator;
import java.util.Random;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class AudioGetCatalogBlockById {

    /* loaded from: classes2.dex */
    public static class Builder {
        final int blockId;
        final int count;
        final int offset;
        boolean shuffle = false;

        public Builder(int blockId, int offset, int count) {
            this.blockId = blockId;
            this.offset = offset;
            this.count = count;
        }

        public Builder shuffle() {
            this.shuffle = true;
            return this;
        }

        public VKAPIRequest<Section> buildSection() {
            VKAPIRequest<Section> request = new VKAPIRequest<Section>("audio.getCatalogBlockById") { // from class: com.vkontakte.android.api.audio.AudioGetCatalogBlockById.Builder.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.api.VKAPIRequest
                /* renamed from: parse */
                public Section mo1093parse(JSONObject r) throws Exception {
                    try {
                        return Builder.this.parseSection(r);
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                        return null;
                    }
                }
            };
            fillParams(request);
            return request;
        }

        public VKAPIRequest<VKList<Playlist>> buildPlaylists() {
            VKAPIRequest<VKList<Playlist>> request = new VKAPIRequest<VKList<Playlist>>("audio.getCatalogBlockById") { // from class: com.vkontakte.android.api.audio.AudioGetCatalogBlockById.Builder.2
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.api.VKAPIRequest
                /* renamed from: parse */
                public VKList<Playlist> mo1093parse(JSONObject r) throws Exception {
                    try {
                        Section section = Builder.this.parseSection(r);
                        VKList<Playlist> vkList = new VKList<>();
                        vkList.setTotal(section.count);
                        if (section.playlists != null) {
                            vkList.addAll(section.playlists);
                            return vkList;
                        } else if (section.extendedPlaylists != null) {
                            Iterator<ExtendedPlaylist> it = section.extendedPlaylists.iterator();
                            while (it.hasNext()) {
                                ExtendedPlaylist extendedPlaylist = it.next();
                                vkList.add(extendedPlaylist.playlist);
                            }
                            return vkList;
                        } else {
                            return vkList;
                        }
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                        return null;
                    }
                }
            };
            fillParams(request);
            return request;
        }

        public VKAPIRequest<VKList<UserProfile>> buildProfiles() {
            VKAPIRequest<VKList<UserProfile>> request = new VKAPIRequest<VKList<UserProfile>>("audio.getCatalogBlockById") { // from class: com.vkontakte.android.api.audio.AudioGetCatalogBlockById.Builder.3
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.api.VKAPIRequest
                /* renamed from: parse */
                public VKList<UserProfile> mo1093parse(JSONObject r) throws Exception {
                    try {
                        Section section = Builder.this.parseSection(r);
                        VKList<UserProfile> vkList = new VKList<>();
                        vkList.setTotal(section.count);
                        if (section.profiles != null) {
                            vkList.addAll(section.profiles);
                            return vkList;
                        }
                        return vkList;
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                        return null;
                    }
                }
            };
            fillParams(request);
            return request;
        }

        public VKAPIRequest<VKList<MusicTrack>> buildAudios() {
            VKAPIRequest<VKList<MusicTrack>> request = new VKAPIRequest<VKList<MusicTrack>>("audio.getCatalogBlockById") { // from class: com.vkontakte.android.api.audio.AudioGetCatalogBlockById.Builder.4
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.api.VKAPIRequest
                /* renamed from: parse */
                public VKList<MusicTrack> mo1093parse(JSONObject r) throws Exception {
                    try {
                        Section section = Builder.this.parseSection(r);
                        VKList<MusicTrack> vkList = new VKList<>();
                        vkList.setTotal(section.count);
                        if (section.audios != null) {
                            vkList.addAll(section.audios);
                            return vkList;
                        }
                        return vkList;
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                        return null;
                    }
                }
            };
            fillParams(request);
            return request;
        }

        private void fillParams(VKAPIRequest request) {
            request.param("block_id", this.blockId);
            request.param("offset", this.offset);
            request.param(ServerKeys.COUNT, this.count);
            request.param("extended", 1);
            if (this.shuffle) {
                request.param("shuffle", 1);
                int shuffleSeed = new Random().nextInt();
                if (shuffleSeed == 0) {
                    shuffleSeed = 1;
                }
                request.param("shuffle_seed", shuffleSeed);
                return;
            }
            request.param("shuffle", 0);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Section parseSection(JSONObject r) throws JSONException {
            return new Section(r.getJSONObject(ServerKeys.RESPONSE).getJSONObject("block"));
        }
    }

    private AudioGetCatalogBlockById() {
    }
}
