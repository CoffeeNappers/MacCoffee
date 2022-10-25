package com.vkontakte.android.api.pages;

import android.os.Bundle;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.api.APIException;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.AuthCheckFragment;
import java.util.Locale;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PagesGetHTML extends VKAPIRequest<Result> {
    Callback callback;
    private boolean needMeta;

    /* loaded from: classes2.dex */
    public static class Result {
        public Bundle meta;
        public String title;
        public String url;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PagesGetHTML(int oid, int pid, boolean isSite) {
        super("execute");
        int i = 1;
        this.needMeta = false;
        this.needMeta = isSite;
        Locale locale = Locale.US;
        Object[] objArr = new Object[3];
        objArr[0] = Integer.valueOf(oid);
        objArr[1] = Integer.valueOf(pid);
        objArr[2] = Integer.valueOf(!isSite ? 0 : i);
        param(AuthCheckFragment.KEY_CODE, String.format(locale, "var p=API.pages.get({owner_id:%1$d,page_id:%2$d,need_html:1,site_preview:%3$d}); p=p+{source: \"\"}; if(%3$d==1){if(p.group_id>0){var g=API.groups.getById({group_id: p.group_id})[0]; p=p+{group_photo: g.photo_100, group_name: g.name};}if(p.group_id<0){var g=API.users.get({user_ids: -p.group_id, fields:\"photo_100,photo_50,first_name_gen,last_name_gen\"})[0]; p=p+{group_photo: g.photo_100, group_name: g.first_name+\" \"+g.last_name, name_gen: g.first_name_gen+\" \"+g.last_name_gen};}} return p;", objArr));
    }

    public PagesGetHTML(String title) {
        super("execute");
        this.needMeta = false;
        param(AuthCheckFragment.KEY_CODE, "var p=API.pages.get({title:Args.title,global:1,need_html:1}); p=p+{source: \"\"}; return p;");
        param("title", title);
    }

    public PagesGetHTML(int oid, String title) {
        super("execute");
        this.needMeta = false;
        param(AuthCheckFragment.KEY_CODE, "var p=API.pages.get({title:Args.title,owner_id:Args.oid,need_html:1}); p=p+{source: \"\"}; return p;");
        param("title", title);
        param(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, oid);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) throws JSONException, APIException {
        if (o.has("execute_errors")) {
            JSONObject je = o.getJSONArray("execute_errors").getJSONObject(0);
            throw new APIException(je.getInt(NativeProtocol.BRIDGE_ARG_ERROR_CODE), je.getString("error_msg"));
        }
        Bundle meta = new Bundle();
        JSONObject r = o.getJSONObject(ServerKeys.RESPONSE);
        if (this.needMeta) {
            meta.putString("title", r.getString("title"));
            meta.putString("url", r.getString("url"));
            meta.putInt(ServerKeys.DATE, r.getInt(ServerKeys.CREATED));
            meta.putInt(ServerKeys.VIEWS, r.getInt(ServerKeys.VIEWS));
            meta.putInt("group_id", r.getInt("group_id"));
            meta.putString("group_name", r.optString("group_name", ""));
            meta.putString("group_photo", r.optString("group_photo", ""));
            if (r.has("name_gen")) {
                meta.putString("name_gen", r.getString("name_gen"));
            }
        }
        Result res = new Result();
        res.url = r.getString(ServerKeys.VIEW_URL);
        res.title = r.getString("title");
        res.meta = meta;
        return res;
    }
}
