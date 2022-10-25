package com.vkontakte.android.api;

import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class BoardTopic {
    public static final int TOPIC_CLOSED = 1;
    public static final int TOPIC_FIXED = 2;
    public int created;
    public int creator;
    public int flags;
    public int gid;
    public int id;
    public CharSequence lastComment;
    public int lastCommentUid;
    public int numComments;
    public String title;
    public int updated;
    public UserProfile updatedBy;

    public BoardTopic() {
    }

    public BoardTopic(JSONObject jt) throws JSONException {
        this.id = jt.getInt("id");
        this.title = Global.replaceHTML(jt.getString("title"));
        this.created = jt.getInt(ServerKeys.CREATED);
        this.creator = jt.getInt("created_by");
        this.updated = jt.getInt(ServerKeys.UPDATED);
        if (jt.getInt(ArgKeys.IS_CLOSED) != 0) {
            this.flags |= 1;
        }
        if (jt.getInt("is_fixed") != 0) {
            this.flags |= 2;
        }
        this.numComments = jt.getInt("comments");
        if (jt.has("last_comment")) {
            this.lastComment = Global.replaceEmoji(jt.getString("last_comment").replaceAll("\\[(id|club)[0-9]+(?::bp[-_0-9]+)?\\|([^\\]]+)\\]", "$2"));
            if (this.lastComment.length() == 0) {
                this.lastComment = VKApplication.context.getResources().getString(R.string.attachment);
            }
        }
    }
}
