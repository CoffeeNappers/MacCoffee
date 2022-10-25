package com.vkontakte.android.api.wall;

import android.text.TextUtils;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import com.facebook.GraphRequest;
import com.facebook.internal.NativeProtocol;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.api.APIException;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import com.vkontakte.android.statistics.StatisticUrl;
import com.vkontakte.android.utils.Utils;
import java.util.Iterator;
import java.util.Vector;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WallGet extends VKAPIRequest<Result> {
    private final String listRefer;
    private int uid;

    /* loaded from: classes2.dex */
    public static class Result {
        public VKList<NewsEntry> news;
        public String next_from;
        public int postponedCount;
        public Object status;
        public int suggestedCount;
    }

    public WallGet(int uid, String startFom, int count, boolean owner, String listRefer) {
        super("execute.wallGetWrapNew");
        this.listRefer = listRefer;
        param(ServerKeys.PHOTO_SIZES, 1);
        param("owner_id", uid);
        if (!TextUtils.isEmpty(startFom)) {
            param(ServerKeys.START_FROM, startFom);
        }
        param(ServerKeys.COUNT, count);
        param("extended", 1);
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_50,sex,first_name_dat,last_name_dat,video_files");
        if (owner) {
            param(MoneyTransfersFragment.FILTER_ARGUMENT, "owner");
        }
        param(ShareConstants.WEB_DIALOG_PARAM_FILTERS, Utils.getNewsFilterParams("ads_app", "ads_site", "ads_post", "ads_app_slider", "ads_post_pretty_cards"));
        param("connection_type", Utils.getConnectionType());
        param("connection_subtype", Utils.getConnectionSubtype());
        param("user_options", Utils.getUserOptions());
        param("device_info", Utils.getDeviceInfo());
        this.uid = uid;
    }

    public WallGet(int uid, int offset, int count, String filter, String listRefer) {
        super("wall.get");
        this.listRefer = listRefer;
        param("owner_id", uid).param("offset", offset).param(ServerKeys.COUNT, count).param("extended", 1).param(MoneyTransfersFragment.FILTER_ARGUMENT, filter);
        param(ServerKeys.PHOTO_SIZES, 1);
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_50,sex,first_name_dat,last_name_dat,video_files");
    }

    private Object parseStatus(JSONObject o) throws Exception {
        if (o == null) {
            return null;
        }
        if (o.has(MimeTypes.BASE_TYPE_AUDIO)) {
            MusicTrack af = new MusicTrack();
            af.aid = o.getJSONObject(MimeTypes.BASE_TYPE_AUDIO).getInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID);
            af.oid = o.getJSONObject(MimeTypes.BASE_TYPE_AUDIO).getInt("owner_id");
            af.duration = o.getJSONObject(MimeTypes.BASE_TYPE_AUDIO).getInt("duration");
            af.artist = o.getJSONObject(MimeTypes.BASE_TYPE_AUDIO).getString("artist");
            af.title = o.getJSONObject(MimeTypes.BASE_TYPE_AUDIO).getString("title");
            af.url = o.getJSONObject(MimeTypes.BASE_TYPE_AUDIO).getString("url");
            af.durationS = String.format("%d:%02d", Integer.valueOf(af.duration / 60), Integer.valueOf(af.duration % 60));
            return af;
        } else if (!o.has("text")) {
            return null;
        } else {
            return o.getString("text");
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        NewsEntry e;
        try {
            JSONObject resp = o.optJSONObject(ServerKeys.RESPONSE);
            if (resp == null) {
                JSONObject e2 = o.getJSONArray("execute_errors").getJSONObject(0);
                throw new APIException(e2.getInt(NativeProtocol.BRIDGE_ARG_ERROR_CODE), e2.getString("error_msg"));
            }
            JSONArray jItems = resp.optJSONArray(ServerKeys.ITEMS);
            JSONArray profiles1 = resp.optJSONArray("profiles");
            JSONArray profiles2 = resp.optJSONArray("groups");
            if (jItems == null) {
                Result r = new Result();
                r.news = new VKList<>();
                r.status = parseStatus(resp.optJSONObject("status"));
                return r;
            }
            SparseArray<String> names = new SparseArray<>();
            SparseArray<String> photos = new SparseArray<>();
            SparseBooleanArray fs = new SparseBooleanArray();
            if (profiles1 != null) {
                for (int i = 0; i < profiles1.length(); i++) {
                    JSONObject item = profiles1.getJSONObject(i);
                    int uid = item.getInt("id");
                    names.put(uid, item.getString("first_name") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + item.getString("last_name"));
                    photos.put(uid, item.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                    fs.put(uid, item.optInt("sex") == 1);
                }
            }
            if (profiles2 != null) {
                for (int i2 = 0; i2 < profiles2.length(); i2++) {
                    int uid2 = -profiles2.getJSONObject(i2).getInt("id");
                    names.put(uid2, profiles2.getJSONObject(i2).getString("name"));
                    photos.put(uid2, profiles2.getJSONObject(i2).optString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                }
            }
            JSONObject fixed = resp.optJSONObject("fixed");
            VKList<NewsEntry> result = new VKList<>();
            result.setTotal(resp.optInt(ServerKeys.COUNT));
            Vector<Integer> adminGroups = new Vector<>();
            for (int i3 = 0; i3 < jItems.length(); i3++) {
                JSONObject jItem = jItems.getJSONObject(i3);
                if ("ads".equals(jItem.optString(ServerKeys.TYPE))) {
                    e = NewsEntry.parseAd(jItem, names, photos, fs, adminGroups, this.listRefer);
                    if (e != null) {
                        e.time = result.size() > 0 ? ((NewsEntry) result.get(result.size() - 1)).time + 1 : TimeUtils.getCurrentTime();
                        Iterator<Attachment> it = e.attachments.iterator();
                        while (it.hasNext()) {
                            Attachment att = it.next();
                            if (att instanceof ShitAttachment) {
                                ShitAttachment ad = (ShitAttachment) att;
                                for (StatisticUrl url : ad.getStatisticByType("load")) {
                                    Analytics.trackExternal(url);
                                }
                                Iterator<ShitAttachment.Card> it2 = ad.cards.iterator();
                                while (it2.hasNext()) {
                                    ShitAttachment.Card card = it2.next();
                                    for (StatisticUrl url2 : card.getStatisticByType("load")) {
                                        Analytics.trackExternal(url2);
                                    }
                                }
                            }
                        }
                    }
                } else if ("friends_recomm".equals(jItem.optString(ServerKeys.TYPE))) {
                    e = NewsEntry.parseFriendsRecomm(jItem);
                } else {
                    e = new NewsEntry(jItem, this.listRefer, names, photos, fs);
                    if (e.ownerID < 0 && adminGroups.contains(Integer.valueOf(-e.ownerID))) {
                        e.flags |= 64;
                    }
                    if (this.uid != 0) {
                        e.ownerID = this.uid;
                    }
                }
                if (e != null) {
                    result.add(e);
                }
            }
            if (fixed != null) {
                result.add(0, new NewsEntry(fixed, null, names, photos, null));
            }
            Result res = new Result();
            res.next_from = resp.optString("next_from");
            res.news = result;
            res.status = parseStatus(resp.optJSONObject("status"));
            res.postponedCount = resp.optInt("postponed_count");
            res.suggestedCount = resp.optInt("suggested_count");
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            if (x instanceof APIException) {
                throw new APIException(((APIException) x).code, ((APIException) x).descr);
            }
            return null;
        }
    }
}
