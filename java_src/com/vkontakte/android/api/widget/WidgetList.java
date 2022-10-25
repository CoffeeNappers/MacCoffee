package com.vkontakte.android.api.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.view.View;
import com.vk.core.common.Image;
import com.vk.core.common.ImageSize;
import com.vk.sharing.SharingService;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.ui.widget.WidgetListView;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WidgetList extends Widget {
    public static final Serializer.Creator<WidgetList> CREATOR = new Serializer.CreatorAdapter<WidgetList>() { // from class: com.vkontakte.android.api.widget.WidgetList.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public WidgetList mo1087createFromSerializer(Serializer s) {
            return new WidgetList(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public WidgetList[] mo1088newArray(int size) {
            return new WidgetList[size];
        }
    };
    private static final int MAX_ITEMS_COUNT_WITHOUT_TEXT = 6;
    private static final int MAX_ITEMS_COUNT_WITH_TEXT = 3;
    private final List<Item> items;

    public WidgetList(JSONObject response) throws JSONException {
        super(response);
        JSONObject data = response.getJSONObject("data");
        JSONArray rows = data.getJSONArray("rows");
        this.items = new ArrayList();
        int maxSize = 6;
        for (int i = 0; i < rows.length() && i < maxSize; i++) {
            Item item = new Item(rows.getJSONObject(i));
            if (item.hasText()) {
                maxSize = 3;
            }
            this.items.add(item);
        }
        if (rows.length() > maxSize) {
            L.w("WidgetList", "Widget has more rows than expected");
        }
    }

    public WidgetList(Serializer serializer) {
        super(serializer);
        this.items = serializer.createTypedArrayList(Item.CREATOR);
    }

    @Override // com.vkontakte.android.api.widget.Widget, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer serializer) {
        super.serializeTo(serializer);
        serializer.writeTypedList(this.items);
    }

    @Override // com.vkontakte.android.api.widget.Widget
    @NonNull
    public View createContentView(Context context) {
        return new WidgetListView(context);
    }

    public List<Item> getItems() {
        return this.items;
    }

    /* loaded from: classes2.dex */
    public static class Item extends Serializer.SerializableAdapter {
        public static final Serializer.Creator<Item> CREATOR = new Serializer.CreatorAdapter<Item>() { // from class: com.vkontakte.android.api.widget.WidgetList.Item.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public Item mo1087createFromSerializer(Serializer s) {
                return new Item(s);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public Item[] mo1088newArray(int size) {
                return new Item[size];
            }
        };
        private final String address;
        private final String button;
        private final String buttonTarget;
        private final String buttonUrl;
        private final String description;
        private final Image icon;
        private final String text;
        private final String time;
        private final String title;
        private final String titleTarget;
        private final String titleUrl;

        public Item(JSONObject data) throws JSONException {
            String str = null;
            JSONObject titleAction = data.optJSONObject("title_action");
            JSONObject buttonAction = data.optJSONObject("button_action");
            JSONArray icons = data.optJSONArray(SettingsJsonConstants.APP_ICON_KEY);
            this.icon = icons == null ? null : new Image(icons);
            this.title = data.getString("title");
            this.titleUrl = titleAction == null ? null : titleAction.optString("url");
            this.titleTarget = titleAction == null ? null : titleAction.optString(SharingService.EXTRA_TARGET);
            this.button = data.optString(ServerKeys.BUTTON);
            this.buttonUrl = buttonAction == null ? null : buttonAction.optString("url");
            this.buttonTarget = buttonAction != null ? buttonAction.optString(SharingService.EXTRA_TARGET) : str;
            this.description = data.optString("descr");
            this.address = data.optString("address");
            this.time = data.optString("time");
            this.text = data.optString("text");
        }

        public Item(Serializer serializer) {
            this.icon = (Image) serializer.readSerializable(Image.class.getClassLoader());
            this.title = serializer.readString();
            this.titleUrl = serializer.readString();
            this.titleTarget = serializer.readString();
            this.button = serializer.readString();
            this.buttonUrl = serializer.readString();
            this.buttonTarget = serializer.readString();
            this.description = serializer.readString();
            this.address = serializer.readString();
            this.time = serializer.readString();
            this.text = serializer.readString();
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer serializer) {
            serializer.writeSerializable(this.icon);
            serializer.writeString(this.title);
            serializer.writeString(this.titleUrl);
            serializer.writeString(this.titleTarget);
            serializer.writeString(this.button);
            serializer.writeString(this.buttonUrl);
            serializer.writeString(this.buttonTarget);
            serializer.writeString(this.description);
            serializer.writeString(this.address);
            serializer.writeString(this.time);
            serializer.writeString(this.text);
        }

        public boolean hasIcon() {
            return this.icon != null && !this.icon.isEmpty();
        }

        public boolean hasText() {
            return !TextUtils.isEmpty(this.text);
        }

        @Nullable
        public ImageSize getIcon(int width) {
            if (this.icon == null) {
                return null;
            }
            return this.icon.getImageByWidth(width);
        }

        public String getTitle() {
            return this.title;
        }

        public String getTitleUrl() {
            return this.titleUrl;
        }

        public String getTitleTarget() {
            return this.titleTarget;
        }

        public String getButton() {
            return this.button;
        }

        public String getButtonUrl() {
            return this.buttonUrl;
        }

        public String getButtonTarget() {
            return this.buttonTarget;
        }

        public String getDescription() {
            return this.description;
        }

        public String getAddress() {
            return this.address;
        }

        public String getTime() {
            return this.time;
        }

        public String getText() {
            return this.text;
        }
    }
}
