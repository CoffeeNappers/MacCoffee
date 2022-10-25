package com.vkontakte.android.api.board;

import android.util.SparseArray;
import com.crashlytics.android.answers.BuildConfig;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.PollAttachment;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class BoardGetComments extends VKAPIRequest<Result> implements ServerKeys {
    private final int gid;
    private int offset;

    /* loaded from: classes2.dex */
    public enum PagingKey {
        offset,
        startCommentId
    }

    /* loaded from: classes2.dex */
    public static class Result {
        public ArrayList<BoardComment> comments;
        public int offset;
        public int total;
        public int pId = 0;
        public int pOwnerId = 0;
        public int pCreated = 0;
        public String pQuestion = null;
        public int pAnsId = 0;
        public int pAnonymous = 0;
        public int pVotes = 0;
        public ArrayList<PollAttachment.Answer> pOptions = new ArrayList<>();
    }

    public BoardGetComments(int gid, int tid, int count, PagingKey pagingKey, int key) {
        super("board.getComments");
        this.offset = -1;
        this.gid = gid;
        param("group_id", gid).param("topic_id", tid);
        switch (pagingKey) {
            case offset:
                param("offset", key);
                this.offset = key;
                break;
            case startCommentId:
                param("start_comment_id", key);
                break;
        }
        param(ServerKeys.COUNT, count).param("extended", 1).param(ServerKeys.PHOTO_SIZES, 1).param("need_likes", 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            ArrayList<BoardComment> comments = new ArrayList<>();
            SparseArray<String> names = new SparseArray<>();
            SparseArray<String> photos = new SparseArray<>();
            JSONObject response = o.getJSONObject(ServerKeys.RESPONSE);
            JSONArray profiles = response.getJSONArray("profiles");
            JSONArray groups = response.getJSONArray("groups");
            for (int i = 0; i < profiles.length(); i++) {
                JSONObject u = profiles.getJSONObject(i);
                names.put(u.getInt("id"), u.getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + u.getString("last_name"));
                photos.put(u.getInt("id"), u.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
            }
            for (int i2 = 0; i2 < groups.length(); i2++) {
                JSONObject u2 = groups.getJSONObject(i2);
                names.put(-u2.getInt("id"), u2.getString("name"));
                photos.put(-u2.getInt("id"), u2.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
            }
            int offset = response.optInt("real_offset", this.offset);
            JSONArray comms = response.getJSONArray(ServerKeys.ITEMS);
            for (int i3 = 0; i3 < comms.length(); i3++) {
                comments.add(new BoardComment(comms.getJSONObject(i3), names, photos, offset + i3, -this.gid, null));
            }
            Result result = new Result();
            result.comments = comments;
            result.total = response.getInt(ServerKeys.COUNT);
            result.offset = offset;
            if (!response.has("poll")) {
                return result;
            }
            JSONObject poll = response.getJSONObject("poll");
            result.pId = poll.getInt("id");
            result.pQuestion = poll.getString("question");
            result.pAnsId = poll.getInt("answer_id");
            result.pOwnerId = poll.optInt("owner_id");
            result.pCreated = poll.optInt(ServerKeys.CREATED);
            result.pAnonymous = poll.optInt("anonymous");
            result.pVotes = poll.optInt("votes");
            if (poll.optInt(ArgKeys.IS_CLOSED) == 1) {
                result.pAnsId = 1;
            }
            JSONArray options = poll.getJSONArray(BuildConfig.ARTIFACT_ID);
            for (int i4 = 0; i4 < options.length(); i4++) {
                JSONObject jopt = options.getJSONObject(i4);
                PollAttachment.Answer answer = new PollAttachment.Answer();
                answer.id = jopt.getInt("id");
                answer.text = jopt.getString("text");
                answer.votes = jopt.getInt("votes");
                answer.rate = (float) jopt.getDouble("rate");
                result.pOptions.add(answer);
            }
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
