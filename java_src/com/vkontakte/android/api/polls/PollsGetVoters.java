package com.vkontakte.android.api.polls;

import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PollsGetVoters extends ListAPIRequest<UserProfile> {
    public PollsGetVoters(int oid, int pollID, int answerID, int offset, int count) {
        super("polls.getVoters", UserProfile.class);
        param(GraphRequest.FIELDS_PARAM, "online,first_name,last_name,online,photo_100,photo_50,photo_200");
        param("owner_id", oid);
        param("poll_id", pollID);
        param("answer_ids", answerID);
        param("offset", offset);
        param(ServerKeys.COUNT, count);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.api.ListAPIRequest
    public JSONObject getArrayObject(JSONObject r) throws JSONException {
        return r.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0).getJSONObject("users");
    }
}
