package com.vkontakte.android.api.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public abstract class Widget extends Serializer.SerializableAdapter {
    private static final int TYPE_COMPACT_LIST = 5;
    private static final int TYPE_COVER_LIST = 6;
    private static final int TYPE_LIST = 2;
    private static final int TYPE_MATCH = 7;
    private static final int TYPE_MATCHES = 8;
    private static final int TYPE_TABLE = 3;
    private static final int TYPE_TEXT = 1;
    private static final int TYPE_TILES = 4;
    private final String more;
    private final String moreUrl;
    private final String title;
    private final Integer titleCounter;
    private final String titleUrl;
    private final int type;

    @NonNull
    public abstract View createContentView(Context context);

    public static Widget create(JSONObject response) {
        Widget widgetMatches;
        try {
            int type = response.getInt(ServerKeys.TYPE);
            switch (type) {
                case 1:
                    widgetMatches = new WidgetText(response);
                    break;
                case 2:
                case 5:
                    widgetMatches = new WidgetList(response);
                    break;
                case 3:
                    widgetMatches = new WidgetTable(response);
                    break;
                case 4:
                    widgetMatches = new WidgetTiles(response);
                    break;
                case 6:
                    widgetMatches = new WidgetCoverList(response);
                    break;
                case 7:
                    widgetMatches = new WidgetMatch(response);
                    break;
                case 8:
                    widgetMatches = new WidgetMatches(response);
                    break;
                default:
                    L.e("Widget", "Widget type is not supported: type = " + type);
                    widgetMatches = null;
                    break;
            }
            return widgetMatches;
        } catch (JSONException e) {
            L.e("Widget", e);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Widget(JSONObject response) throws JSONException {
        String str = null;
        JSONObject data = response.getJSONObject("data");
        JSONObject moreAction = data.optJSONObject("more_action");
        JSONObject titleAction = data.optJSONObject("title_action");
        this.titleCounter = data.has("title_counter") ? Integer.valueOf(data.getInt("title_counter")) : null;
        this.moreUrl = moreAction == null ? null : moreAction.getString("url");
        this.titleUrl = titleAction != null ? titleAction.getString("url") : str;
        this.title = data.getString("title");
        this.more = data.optString("more");
        this.type = response.getInt(ServerKeys.TYPE);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Widget(Serializer serializer) {
        this.type = serializer.readInt();
        this.title = serializer.readString();
        this.titleUrl = serializer.readString();
        this.more = serializer.readString();
        this.moreUrl = serializer.readString();
        String value = serializer.readString();
        this.titleCounter = value == null ? null : Integer.valueOf(value);
    }

    public int getType() {
        return this.type;
    }

    public String getTitle() {
        return this.title;
    }

    @Nullable
    public Integer getTitleCounter() {
        return this.titleCounter;
    }

    @Nullable
    public String getTitleUrl() {
        return this.titleUrl;
    }

    @Nullable
    public String getMore() {
        return this.more;
    }

    @Nullable
    public String getMoreUrl() {
        return this.moreUrl;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.type);
        s.writeString(this.title);
        s.writeString(this.titleUrl);
        s.writeString(this.more);
        s.writeString(this.moreUrl);
        s.writeString(this.titleCounter == null ? null : this.titleCounter.toString());
    }
}
