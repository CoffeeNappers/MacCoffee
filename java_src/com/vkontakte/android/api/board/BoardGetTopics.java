package com.vkontakte.android.api.board;

import android.util.SparseArray;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.util.AnimationUtils;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.BoardTopic;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class BoardGetTopics extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public boolean canCreate;
        public int order;
        public VKList<BoardTopic> topics;
    }

    public BoardGetTopics(int gid, int offset, int count) {
        super("board.getTopics");
        param("group_id", gid).param("offset", offset).param(ServerKeys.COUNT, count).param("extended", 1);
        param("preview", 2).param("preview_length", (int) AnimationUtils.DELAY_MID);
    }

    public BoardGetTopics(int gid, int tid) {
        super("board.getTopics");
        param("group_id", gid).param("topic_ids", tid).param("extended", 1);
        param("preview", 2).param("preview_length", (int) AnimationUtils.DELAY_MID);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        boolean z = true;
        try {
            final SparseArray<UserProfile> users = new SparseArray<>();
            JSONArray u = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("profiles");
            JSONArray g = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("groups");
            if (u != null) {
                for (int i = 0; i < u.length(); i++) {
                    UserProfile up = new UserProfile(u.getJSONObject(i));
                    users.put(up.uid, up);
                }
            }
            if (g != null) {
                for (int i2 = 0; i2 < g.length(); i2++) {
                    JSONObject p = g.getJSONObject(i2);
                    UserProfile up2 = new UserProfile();
                    up2.uid = -p.getInt("id");
                    up2.firstName = p.getString("name");
                    up2.lastName = "";
                    up2.fullName = up2.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + up2.lastName;
                    up2.photo = p.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                    users.put(up2.uid, up2);
                }
            }
            VKList<BoardTopic> topics = new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), new Parser<BoardTopic>() { // from class: com.vkontakte.android.api.board.BoardGetTopics.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse */
                public BoardTopic mo821parse(JSONObject jt) throws JSONException {
                    BoardTopic t = new BoardTopic(jt);
                    t.updatedBy = (UserProfile) users.get(jt.getInt("updated_by"));
                    return t;
                }
            });
            Result result = new Result();
            result.topics = topics;
            if (o.getJSONObject(ServerKeys.RESPONSE).getInt("can_add_topics") != 1) {
                z = false;
            }
            result.canCreate = z;
            result.order = o.getJSONObject(ServerKeys.RESPONSE).getInt("default_order");
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
