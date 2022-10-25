package com.vkontakte.android.api.messages;

import android.net.Uri;
import android.os.Bundle;
import android.util.SparseArray;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vk.imageloader.AvatarDataSource;
import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.Message;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.JSONArrayWithCount;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesGetDialogs extends VKAPIRequest<VKList<DialogEntry>> {
    public MessagesGetDialogs(int offset, int count) {
        super("execute.getDialogsWithProfilesNewFixGroups");
        param("offset", offset).param(ServerKeys.COUNT, count);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<DialogEntry> mo1093parse(JSONObject o) {
        try {
            final SparseArray<UserProfile> profiles = new SparseArray<>();
            JSONArray p = o.optJSONObject(ServerKeys.RESPONSE).optJSONArray(TtmlNode.TAG_P);
            if (p != null) {
                for (int i = 0; i < p.length(); i++) {
                    UserProfile up = new UserProfile(p.optJSONObject(i));
                    profiles.put(up.uid, up);
                }
            }
            profiles.put(0, new UserProfile());
            JSONArrayWithCount aa = APIUtils.unwrapArray(o.optJSONObject(ServerKeys.RESPONSE), "a");
            if (aa == null) {
                return new VKList<>();
            }
            return new VKList<>(o.optJSONObject(ServerKeys.RESPONSE).getJSONObject("a"), new Parser<DialogEntry>() { // from class: com.vkontakte.android.api.messages.MessagesGetDialogs.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse */
                public DialogEntry mo821parse(JSONObject msgWrap) throws JSONException {
                    DialogEntry entry = new DialogEntry();
                    JSONObject msg = msgWrap.getJSONObject("message");
                    entry.unreadCount = msgWrap.optInt(ServerKeys.UNREAD);
                    entry.profile = (UserProfile) profiles.get(msg.getInt("user_id"), UserProfile.EMPTY_USER);
                    if (entry.profile == null) {
                        entry.profile = new UserProfile();
                        entry.profile.uid = msg.getInt("user_id");
                    }
                    Message m = new Message(msg);
                    entry.lastMessage = m;
                    if (Utils.containsKey(profiles, m.sender)) {
                        entry.lastMessagePhoto = ((UserProfile) profiles.get(m.sender)).photo;
                    } else {
                        Log.e("vk", "Profile for " + m.sender + " not found!!!");
                    }
                    if (m.peer > 2000000000) {
                        entry.profile = new UserProfile();
                        entry.profile.uid = m.peer;
                        entry.profile.fullName = msg.getString("title");
                        entry.profile.online = msg.getInt("admin_id");
                        int dnd = 0;
                        boolean mute = false;
                        if (msg.has("push_settings")) {
                            JSONObject jps = msg.getJSONObject("push_settings");
                            dnd = jps.getInt("disabled_until");
                            if (dnd == -1) {
                                dnd = Integer.MAX_VALUE;
                            }
                            mute = jps.getInt("sound") != 1;
                        }
                        Bundle x = new Bundle();
                        x.putInt("dnd", dnd);
                        x.putBoolean("mute", mute);
                        entry.profile.extra = x;
                        if (msg.has("photo_50")) {
                            entry.profile.photo = msg.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                        } else {
                            Uri.Builder bldr = new Uri.Builder();
                            bldr.scheme(AvatarDataSource.CHAT_AVATAR_SCHEME).authority("c");
                            ArrayList<String> ph = new ArrayList<>();
                            JSONArray act = msg.getJSONArray("chat_active");
                            for (int j = 0; j < act.length(); j++) {
                                if (!VKAccountManager.isCurrentUser(act.getInt(j))) {
                                    if (Utils.containsKey(profiles, act.getInt(j))) {
                                        ph.add(((UserProfile) profiles.get(act.getInt(j))).photo);
                                    }
                                    if (ph.size() == 4) {
                                        break;
                                    }
                                }
                            }
                            int i2 = 0;
                            Iterator<String> it = ph.iterator();
                            while (it.hasNext()) {
                                String photo = it.next();
                                bldr.appendQueryParameter("photo" + i2, photo);
                                i2++;
                            }
                            entry.profile.photo = bldr.build().toString();
                            Log.i("vk", "Set photo " + entry.profile.photo);
                        }
                    }
                    return entry;
                }
            });
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
