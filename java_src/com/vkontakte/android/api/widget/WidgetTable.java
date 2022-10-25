package com.vkontakte.android.api.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.view.View;
import com.facebook.internal.NativeProtocol;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vk.core.common.Image;
import com.vkontakte.android.ui.widget.WidgetTableView;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WidgetTable extends Widget {
    public static final Serializer.Creator<WidgetTable> CREATOR = new Serializer.CreatorAdapter<WidgetTable>() { // from class: com.vkontakte.android.api.widget.WidgetTable.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public WidgetTable mo1087createFromSerializer(Serializer s) {
            return new WidgetTable(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public WidgetTable[] mo1088newArray(int size) {
            return new WidgetTable[size];
        }
    };
    private static final int MAX_COLUMNS = 6;
    private static final int MAX_ROWS = 10;
    private final List<Row> body;
    private final List<HeadRowItem> head;

    public WidgetTable(JSONObject response) throws JSONException {
        super(response);
        JSONObject data = response.getJSONObject("data");
        JSONArray head = data.optJSONArray(TtmlNode.TAG_HEAD);
        JSONArray body = data.getJSONArray(TtmlNode.TAG_BODY);
        this.head = new ArrayList();
        for (int i = 0; head != null && i < head.length() && i < 6; i++) {
            this.head.add(new HeadRowItem(head.getJSONObject(i)));
        }
        this.body = new ArrayList();
        for (int i2 = 0; i2 < body.length() && i2 < 10; i2++) {
            this.body.add(new Row(body.getJSONArray(i2)));
        }
    }

    public WidgetTable(Serializer serializer) {
        super(serializer);
        this.head = serializer.createTypedArrayList(HeadRowItem.CREATOR);
        this.body = serializer.createTypedArrayList(Row.CREATOR);
    }

    @Override // com.vkontakte.android.api.widget.Widget, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        super.serializeTo(s);
        s.writeTypedList(this.head);
        s.writeTypedList(this.body);
    }

    public List<HeadRowItem> getHead() {
        return this.head;
    }

    public List<Row> getBody() {
        return this.body;
    }

    public boolean hasHeader() {
        for (HeadRowItem item : this.head) {
            if (!TextUtils.isEmpty(item.getText())) {
                return true;
            }
        }
        return false;
    }

    public boolean hasWeights() {
        for (HeadRowItem item : this.head) {
            if (item.weight > 0.0f) {
                return true;
            }
        }
        return false;
    }

    public boolean hasIcons() {
        for (Row row : this.body) {
            if (row.hasIcon()) {
                return true;
            }
        }
        return false;
    }

    public int getColumnsCount() {
        if (this.body.isEmpty()) {
            return 0;
        }
        return this.body.get(0).getItems().size();
    }

    @Override // com.vkontakte.android.api.widget.Widget
    @NonNull
    public View createContentView(Context context) {
        return new WidgetTableView(context);
    }

    /* loaded from: classes2.dex */
    public static class HeadRowItem extends Serializer.SerializableAdapter {
        public static final String ALIGN_CENTER = "center";
        public static final String ALIGN_LEFT = "left";
        public static final String ALIGN_RIGHT = "right";
        public static final Serializer.Creator<HeadRowItem> CREATOR = new Serializer.CreatorAdapter<HeadRowItem>() { // from class: com.vkontakte.android.api.widget.WidgetTable.HeadRowItem.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public HeadRowItem mo1087createFromSerializer(Serializer s) {
                return new HeadRowItem(s);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public HeadRowItem[] mo1088newArray(int size) {
                return new HeadRowItem[size];
            }
        };
        private final String align;
        private final String text;
        private final float weight;

        public HeadRowItem(JSONObject data) {
            this.text = data.optString("text");
            this.align = data.optString("align", "left");
            this.weight = (float) data.optDouble("weight", 0.0d);
        }

        public HeadRowItem(Serializer s) {
            this.text = s.readString();
            this.align = s.readString();
            this.weight = s.readFloat();
        }

        public String getText() {
            return this.text;
        }

        public String getAlign() {
            return this.align;
        }

        public float getWeight() {
            return this.weight;
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer s) {
            s.writeString(this.text);
            s.writeString(this.align);
            s.writeFloat(this.weight);
        }
    }

    /* loaded from: classes2.dex */
    public static class RowItem extends Serializer.SerializableAdapter {
        public static final Serializer.Creator<RowItem> CREATOR = new Serializer.CreatorAdapter<RowItem>() { // from class: com.vkontakte.android.api.widget.WidgetTable.RowItem.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public RowItem mo1087createFromSerializer(Serializer s) {
                return new RowItem(s);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public RowItem[] mo1088newArray(int size) {
                return new RowItem[size];
            }
        };
        private final Image icon;
        private final String text;
        private final String url;

        public RowItem(JSONObject data) throws JSONException {
            Image image = null;
            this.text = data.optString("text");
            JSONArray icons = data.optJSONArray(SettingsJsonConstants.APP_ICON_KEY);
            JSONObject action = data.optJSONObject(NativeProtocol.WEB_DIALOG_ACTION);
            this.url = action == null ? null : action.getString("url");
            this.icon = icons != null ? new Image(icons) : image;
        }

        public RowItem(Serializer s) {
            this.text = s.readString();
            this.url = s.readString();
            this.icon = (Image) s.readSerializable(Image.class.getClassLoader());
        }

        public String getText() {
            return this.text;
        }

        public String getUrl() {
            return this.url;
        }

        public Image getIcon() {
            return this.icon;
        }

        public boolean hasIcon() {
            return this.icon != null && !this.icon.isEmpty();
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer s) {
            s.writeString(this.text);
            s.writeString(this.url);
            s.writeSerializable(this.icon);
        }
    }

    /* loaded from: classes2.dex */
    public static class Row extends Serializer.SerializableAdapter {
        public static final Serializer.Creator<Row> CREATOR = new Serializer.CreatorAdapter<Row>() { // from class: com.vkontakte.android.api.widget.WidgetTable.Row.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public Row mo1087createFromSerializer(Serializer s) {
                return new Row(s);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public Row[] mo1088newArray(int size) {
                return new Row[size];
            }
        };
        private final List<RowItem> items;

        public Row(JSONArray row) throws JSONException {
            this.items = new ArrayList();
            for (int i = 0; i < row.length(); i++) {
                this.items.add(new RowItem(row.getJSONObject(i)));
            }
        }

        public Row(Serializer s) {
            this.items = s.createTypedArrayList(RowItem.CREATOR);
        }

        public List<RowItem> getItems() {
            return this.items;
        }

        public boolean hasIcon() {
            return !this.items.isEmpty() && this.items.get(0).hasIcon();
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer s) {
            s.writeTypedList(this.items);
        }
    }
}
