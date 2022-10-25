package com.vkontakte.android.api.money;

import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.vkontakte.android.MoneyTransfer;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GetMoneyTransferList extends ListAPIRequest<MoneyTransfer> {
    public GetMoneyTransferList(int type, int peerId, int offset, int count) {
        super("money.getTransferList");
        init(type, peerId, offset, count);
    }

    public GetMoneyTransferList(int type, int offset, int count) {
        super("money.getTransferList");
        init(type, 0, offset, count);
    }

    private void init(int type, int peerId, int offset, int count) {
        param(ServerKeys.TYPE, type);
        if (peerId != 0) {
            param("receiver_id", peerId);
        }
        param("offset", offset);
        param(ServerKeys.COUNT, count);
        param("extended", 1);
        param(GraphRequest.FIELDS_PARAM, "first_name_gen, last_name_gen, first_name_dat, last_name_dat, photo_50, photo_100, photo_200");
    }

    @Override // com.vkontakte.android.api.ListAPIRequest, com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<MoneyTransfer> mo1093parse(JSONObject o) throws JSONException {
        JSONArray users = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("profiles");
        JSONArray groups = o.getJSONObject(ServerKeys.RESPONSE).optJSONArray("groups");
        final SparseArray<UserProfile> profiles = new SparseArray<>();
        if (users != null) {
            for (int i = 0; i < users.length(); i++) {
                JSONObject ju = users.getJSONObject(i);
                UserProfile p = new UserProfile(ju);
                profiles.put(p.uid, p);
            }
        }
        if (groups != null) {
            for (int i2 = 0; i2 < groups.length(); i2++) {
                JSONObject jg = groups.getJSONObject(i2);
                UserProfile g = new UserProfile(new Group(jg));
                profiles.put(g.uid, g);
            }
        }
        return new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), new Parser<MoneyTransfer>() { // from class: com.vkontakte.android.api.money.GetMoneyTransferList.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.vkontakte.android.data.Parser
            /* renamed from: parse */
            public MoneyTransfer mo821parse(JSONObject o2) throws JSONException {
                MoneyTransfer mt = new MoneyTransfer(o2);
                mt.fromUser = (UserProfile) profiles.get(mt.from_id);
                if (mt.fromUser == null) {
                    mt.fromUser = new UserProfile();
                }
                mt.toUser = (UserProfile) profiles.get(mt.to_id);
                if (mt.toUser == null) {
                    mt.toUser = new UserProfile();
                }
                return mt;
            }
        });
    }
}
