package com.vkontakte.android.api.messages;

import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.vkontakte.android.ChatUser;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Messages;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MessagesGetChat extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public int adminID;
        public int dnd;
        public boolean mute;
        public String photo;
        public String title;
        public ArrayList<ChatUser> users;
    }

    public MessagesGetChat(int chatID) {
        super("messages.getChat");
        param("chat_id", chatID).param(GraphRequest.FIELDS_PARAM, "photo_50,photo_100,sex,domain");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            JSONObject r = o.getJSONObject(ServerKeys.RESPONSE);
            JSONArray arr = r.getJSONArray("users");
            ArrayList<ChatUser> profiles = new ArrayList<>();
            SparseArray<UserProfile> users = new SparseArray<>();
            ArrayList<Integer> missingUsers = new ArrayList<>();
            for (int i = 0; i < arr.length(); i++) {
                UserProfile p = new UserProfile(arr.getJSONObject(i));
                users.put(p.uid, p);
            }
            for (int i2 = 0; i2 < arr.length(); i2++) {
                JSONObject jp = arr.getJSONObject(i2);
                jp.getInt("id");
                int invID = jp.getInt("invited_by");
                if (!Utils.containsKey(users, invID) && !missingUsers.contains(Integer.valueOf(invID))) {
                    missingUsers.add(Integer.valueOf(invID));
                }
            }
            if (missingUsers.size() > 0) {
                ArrayList<UserProfile> uu = Friends.getUsersBlocking(missingUsers);
                Iterator<UserProfile> it = uu.iterator();
                while (it.hasNext()) {
                    UserProfile u = it.next();
                    users.put(u.uid, u);
                }
            }
            for (int i3 = 0; i3 < arr.length(); i3++) {
                JSONObject jp2 = arr.getJSONObject(i3);
                int userID = jp2.getInt("id");
                int invID2 = jp2.getInt("invited_by");
                ChatUser cu = new ChatUser();
                cu.user = users.get(userID);
                cu.inviter = users.get(invID2);
                profiles.add(cu);
            }
            int dnd = 0;
            boolean mute = false;
            if (r.has("push_settings")) {
                JSONObject jps = r.getJSONObject("push_settings");
                dnd = jps.getInt("disabled_until");
                if (dnd == -1) {
                    dnd = Integer.MAX_VALUE;
                }
                mute = jps.getInt("sound") != 1;
            }
            Result result = new Result();
            result.users = profiles;
            result.title = r.getString("title");
            result.photo = r.optString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50", Messages.createChatPhoto(profiles));
            result.adminID = r.getInt("admin_id");
            result.dnd = dnd;
            result.mute = mute;
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
