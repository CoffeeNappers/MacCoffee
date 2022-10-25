package com.vkontakte.android.api.friends;

import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.R;
import com.vkontakte.android.RequestUserProfile;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.utils.L;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;
/* loaded from: classes2.dex */
public class FriendsGetRequests extends VKAPIRequest<Result> {
    public static final String CACHE_FILE_NAME = "friends_requests";
    public static final String FILE_PREFIX_IN = "_in";
    public static final String FILE_PREFIX_SUGGEST = "_suggest";
    private final boolean fromCache;
    private boolean hasCache;
    private final int offset;
    private final boolean out;
    private final boolean suggested;

    public FriendsGetRequests(int offset, int count, boolean suggests, boolean out) {
        this(offset, count, suggests, out, false);
    }

    public FriendsGetRequests(int offset, int count, boolean suggests, boolean out, boolean fromCache) {
        super("execute.getFriendRequestsMaterial");
        param("offset", offset);
        param("func_v", 3);
        param(ServerKeys.COUNT, count);
        param(GraphRequest.FIELDS_PARAM, "online,photo_50,photo_100,photo_200");
        if (suggests) {
            param("suggested", 1);
        }
        if (out) {
            param("out", 1);
        }
        this.fromCache = fromCache;
        this.suggested = suggests;
        this.offset = offset;
        this.out = out;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) {
        try {
            if (this.offset == 0 && !this.out && (!this.fromCache || !this.hasCache)) {
                updateCache(r, this.suggested);
            }
            final ArrayList<UserProfile> myFriends = new ArrayList<>();
            Friends.getFriends(myFriends);
            JSONObject response = r.getJSONObject(ServerKeys.RESPONSE);
            JSONArray profiles = response.optJSONArray("profiles");
            JSONArray fnames = response.optJSONArray("s_from");
            final SparseArray<UserProfile> users = new SparseArray<>();
            final SparseArray<String> fromNames = new SparseArray<>();
            int count = response.optInt(ServerKeys.COUNT, 0);
            if (profiles != null) {
                for (int i = 0; i < profiles.length(); i++) {
                    JSONObject jp = profiles.getJSONObject(i);
                    UserProfile p = new UserProfile(jp);
                    p.country = jp.optInt("country", 0);
                    p.city = jp.optInt("city", 0);
                    if (jp.optString("university_name", "").length() > 0) {
                        p.university = jp.getString("university_name").replace("\r\n", "").trim();
                        if (jp.optInt("graduation", 0) > 0) {
                            p.university += String.format(" '%02d", Integer.valueOf(jp.getInt("graduation") % 100));
                        }
                    } else if (jp.has("country")) {
                        p.university = jp.getJSONObject("country").getString("title");
                        if (jp.has("city")) {
                            p.university += ", " + jp.getJSONObject("city").getString("title");
                        }
                    } else {
                        p.university = null;
                    }
                    users.put(p.uid, p);
                }
            }
            if (fnames != null) {
                for (int i2 = 0; i2 < fnames.length(); i2++) {
                    JSONObject oo = fnames.getJSONObject(i2);
                    fromNames.put(oo.getInt("id"), oo.getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + oo.getString("last_name"));
                }
            }
            return new Result(new VKList(r.getJSONObject(ServerKeys.RESPONSE), new Parser<RequestUserProfile>() { // from class: com.vkontakte.android.api.friends.FriendsGetRequests.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse */
                public RequestUserProfile mo821parse(JSONObject jreq) throws JSONException {
                    UserProfile profile = (UserProfile) users.get(jreq.getInt("user_id"));
                    RequestUserProfile req = new RequestUserProfile(profile);
                    if (FriendsGetRequests.this.suggested) {
                        req.message = VKApplication.context.getResources().getString(R.string.friends_recommend_from, fromNames.get(jreq.getInt(ServerKeys.FROM)));
                    } else {
                        req.message = jreq.optString("message");
                    }
                    req.isOutgoing = FriendsGetRequests.this.out;
                    req.isSuggesting = FriendsGetRequests.this.suggested;
                    req.info = req.university;
                    if (jreq.has("mutual")) {
                        int nMFriends = Math.min(5, jreq.getJSONObject("mutual").getJSONArray("users").length());
                        req.mutualFriends = new UserProfile[nMFriends];
                        req.numMutualFriends = jreq.getJSONObject("mutual").getInt(ServerKeys.COUNT);
                        for (int j = 0; j < nMFriends; j++) {
                            int uid = jreq.getJSONObject("mutual").getJSONArray("users").getInt(j);
                            UserProfile up = new UserProfile();
                            Iterator it = myFriends.iterator();
                            while (true) {
                                if (it.hasNext()) {
                                    UserProfile pp = (UserProfile) it.next();
                                    if (pp.uid == uid) {
                                        up = pp;
                                        break;
                                    }
                                }
                            }
                            req.mutualFriends[j] = up;
                        }
                    } else {
                        req.numMutualFriends = 0;
                    }
                    return req;
                }
            }), count);
        } catch (Exception x) {
            L.w("vk", x);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.api.VKAPIRequest
    public JSONObject doExec() {
        this.hasCache = false;
        if (this.fromCache) {
            try {
                String file = CACHE_FILE_NAME + (this.suggested ? FILE_PREFIX_SUGGEST : FILE_PREFIX_IN);
                File f = new File(VKApplication.context.getCacheDir(), file);
                if (!f.exists()) {
                    return null;
                }
                FileInputStream s = new FileInputStream(f);
                byte[] d = new byte[(int) f.length()];
                s.read(d);
                s.close();
                JSONObject o = (JSONObject) new JSONTokener(new String(d, "UTF-8")).nextValue();
                if (!this.params.get("v").equals(o.optString("v"))) {
                    return null;
                }
                this.hasCache = true;
                return o;
            } catch (Exception x) {
                L.w("vk", x);
            }
        }
        return null;
    }

    private void updateCache(JSONObject o, boolean suggested) {
        try {
            o.put("v", this.params.get("v"));
            String file = CACHE_FILE_NAME + (suggested ? FILE_PREFIX_SUGGEST : FILE_PREFIX_IN);
            File f = new File(VKApplication.context.getCacheDir(), file);
            if (f.exists()) {
                f.delete();
            }
            f.createNewFile();
            FileOutputStream os = new FileOutputStream(f);
            os.write(o.toString().getBytes("UTF-8"));
            os.close();
        } catch (Exception e) {
        }
    }

    /* loaded from: classes2.dex */
    public static class Result {
        public VKList<RequestUserProfile> list;
        public int total;

        public Result(VKList<RequestUserProfile> list, int total) {
            this.list = list;
            this.total = total;
        }
    }
}
