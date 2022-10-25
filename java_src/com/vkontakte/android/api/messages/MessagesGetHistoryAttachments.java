package com.vkontakte.android.api.messages;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import com.facebook.GraphRequest;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.Link;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.Photo;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesGetHistoryAttachments implements ServerKeys {

    /* loaded from: classes2.dex */
    private enum Type {
        photo(Photo.class),
        video(VideoFile.class),
        doc(Document.class),
        share(Link.class),
        link(Link.class),
        audio(MusicTrack.class),
        wall(NewsEntry.class),
        wall_reply(NewsEntry.class);
        
        final Class aClass;

        Type(Class aClass) {
            this.aClass = aClass;
        }
    }

    public static <T> VKAPIRequest<VKList<T>> create(Class<T> tClass, int peerId, String startFrom, int count) {
        VKAPIRequest<VKList<T>> request;
        Type type = null;
        Type[] values = Type.values();
        int length = values.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            Type t = values[i];
            if (!t.aClass.equals(tClass)) {
                i++;
            } else {
                type = t;
                break;
            }
        }
        if (type == Type.wall) {
            request = new WallRequest<>("messages.getHistoryAttachments");
            request.param(GraphRequest.FIELDS_PARAM, "sex,photo_100,photo_50");
        } else {
            request = new ListAPIRequestImpl<>("messages.getHistoryAttachments", tClass);
            request.param(GraphRequest.FIELDS_PARAM, "sex,photo_100,photo_50");
        }
        if (type == null) {
            throw new IllegalArgumentException("Class " + tClass + " is unsupported");
        }
        request.param("peer_id", peerId).param(ServerKeys.COUNT, count).param(ServerKeys.PHOTO_SIZES, 1).param("media_type", type.name());
        if (!TextUtils.isEmpty(startFrom)) {
            request.param(ServerKeys.START_FROM, startFrom);
        }
        return request;
    }

    public static String nextFrom(List vkList) {
        if (vkList instanceof VKListImpl) {
            return ((VKListImpl) vkList).nextFrom;
        }
        return null;
    }

    /* loaded from: classes2.dex */
    public static class ListAPIRequestImpl<T> extends ListAPIRequest<T> {
        public ListAPIRequestImpl(String method, Class<T> itemType) {
            super(method, itemType);
        }

        protected String getNextFrom(JSONObject r) throws JSONException {
            return r.getJSONObject(ServerKeys.RESPONSE).optString("next_from");
        }

        @Override // com.vkontakte.android.api.ListAPIRequest, com.vkontakte.android.api.VKAPIRequest
        /* renamed from: parse */
        public VKList<T> mo1093parse(JSONObject r) throws JSONException {
            try {
                if (this.itemType != null) {
                    if (VideoFile.class.equals(this.itemType)) {
                        VKListImpl<T> list = new VKListImpl<>(getArrayObject(r), (Class<T>) this.itemType, getNextFrom(r));
                        SparseArray<UserProfile> profiles = new SparseArray<>();
                        MessagesGetHistoryAttachments.parseProfiles(r.getJSONObject(ServerKeys.RESPONSE), profiles, "profiles", false);
                        MessagesGetHistoryAttachments.parseProfiles(r.getJSONObject(ServerKeys.RESPONSE), profiles, "groups", true);
                        for (int i = 0; i < list.size(); i++) {
                            VideoFile videoFile = (VideoFile) list.get(i);
                            UserProfile profile = profiles.get(videoFile.oid);
                            if (profile != null) {
                                videoFile.ownerName = profile.fullName;
                                videoFile.ownerPhoto = profile.photo;
                            }
                        }
                        return list;
                    }
                    return new VKListImpl(getArrayObject(r), this.itemType, getNextFrom(r));
                } else if (this.parser != null) {
                    return new VKListImpl(getArrayObject(r), this.parser, getNextFrom(r));
                } else {
                    throw new IllegalStateException("Can't parse because there's no parser");
                }
            } catch (Exception x) {
                Log.w("vk", "Error parsing response", x);
                return null;
            }
        }
    }

    static void parseProfiles(@NonNull JSONObject o, @NonNull SparseArray<UserProfile> profiles, @NonNull String key, boolean isGroup) throws JSONException {
        if (o.has(key) && !o.isNull(key)) {
            JSONArray profiles1 = o.getJSONArray(key);
            for (int i = 0; i < profiles1.length(); i++) {
                JSONObject jo = profiles1.getJSONObject(i);
                UserProfile p = isGroup ? new UserProfile(new Group(jo)) : new UserProfile(jo);
                profiles.put(p.uid, p);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class VKListImpl<I> extends VKList<I> {
        public final String nextFrom;

        public VKListImpl(JSONObject obj, Class<I> cls, String nextFrom) throws JSONException {
            this(obj, new VKList.ReflectionParser(cls), nextFrom);
        }

        public VKListImpl(JSONObject obj, Parser<I> parser, String nextFrom) throws JSONException {
            I t;
            this.nextFrom = nextFrom;
            this.total = obj.optInt(ServerKeys.COUNT, 0);
            this.more = obj.optInt("more", 0);
            JSONArray items = obj.getJSONArray(ServerKeys.ITEMS);
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i).getJSONObject("attachment");
                Type type = null;
                Type[] values = Type.values();
                int length = values.length;
                int i2 = 0;
                while (true) {
                    if (i2 >= length) {
                        break;
                    }
                    Type t2 = values[i2];
                    if (!item.has(t2.name())) {
                        i2++;
                    } else {
                        item = item.getJSONObject(t2.name());
                        type = t2;
                        break;
                    }
                }
                if (type != null && (t = parser.mo821parse(item)) != null) {
                    add(t);
                }
            }
        }
    }

    /* loaded from: classes2.dex */
    static class WallRequest<T> extends VKAPIRequest<VKList<T>> {
        public WallRequest(String methodName) {
            super(methodName);
        }

        @Override // com.vkontakte.android.api.VKAPIRequest
        /* renamed from: parse */
        public VKList<T> mo1093parse(JSONObject o) {
            try {
                JSONArray profiles1 = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("profiles");
                JSONArray profiles2 = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("groups");
                final SparseArray<String> names = new SparseArray<>();
                final SparseArray<String> photos = new SparseArray<>();
                final SparseBooleanArray f = new SparseBooleanArray();
                if (profiles1 != null) {
                    for (int i = 0; i < profiles1.length(); i++) {
                        int uid = profiles1.getJSONObject(i).getInt("id");
                        names.put(uid, profiles1.getJSONObject(i).getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profiles1.getJSONObject(i).getString("last_name"));
                        photos.put(uid, profiles1.getJSONObject(i).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                        f.put(uid, profiles1.getJSONObject(i).getInt("sex") == 1);
                    }
                }
                if (profiles2 != null) {
                    for (int i2 = 0; i2 < profiles2.length(); i2++) {
                        int uid2 = -profiles2.getJSONObject(i2).getInt("id");
                        names.put(uid2, profiles2.getJSONObject(i2).getString("name"));
                        photos.put(uid2, profiles2.getJSONObject(i2).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                    }
                }
                return new VKListImpl(o.getJSONObject(ServerKeys.RESPONSE), new Parser<T>() { // from class: com.vkontakte.android.api.messages.MessagesGetHistoryAttachments.WallRequest.1
                    @Override // com.vkontakte.android.data.Parser
                    /* renamed from: parse */
                    public T mo821parse(JSONObject o2) throws JSONException {
                        return (T) new NewsEntry(o2, null, names, photos, f);
                    }
                }, o.getJSONObject(ServerKeys.RESPONSE).optString("next_from"));
            } catch (Exception x) {
                Log.w("vk", x);
                return null;
            }
        }
    }
}
