package com.vkontakte.android.api.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import com.facebook.internal.NativeProtocol;
import com.vk.core.common.Image;
import com.vk.core.common.ImageSize;
import com.vk.sharing.SharingService;
import com.vkontakte.android.ui.widget.WidgetTilesView;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WidgetTiles extends Widget {
    public static final Serializer.Creator<WidgetTiles> CREATOR = new Serializer.CreatorAdapter<WidgetTiles>() { // from class: com.vkontakte.android.api.widget.WidgetTiles.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public WidgetTiles mo1087createFromSerializer(Serializer s) {
            return new WidgetTiles(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public WidgetTiles[] mo1088newArray(int size) {
            return new WidgetTiles[size];
        }
    };
    private static final int MAX_ITEMS_COUNT = 10;
    private final List<Item> items;

    public WidgetTiles(JSONObject response) throws JSONException {
        super(response);
        JSONObject data = response.getJSONObject("data");
        JSONArray tiles = data.getJSONArray("tiles");
        this.items = new ArrayList();
        for (int i = 0; i < tiles.length() && i < 10; i++) {
            this.items.add(new Item(tiles.getJSONObject(i)));
        }
        if (tiles.length() > 10) {
            L.w("WidgetTiles", "Widget has more tiles than expected");
        }
    }

    public WidgetTiles(Serializer serializer) {
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
        return new WidgetTilesView(context);
    }

    public List<Item> getItems() {
        return this.items;
    }

    /* loaded from: classes2.dex */
    public static class Item extends Serializer.SerializableAdapter {
        public static final Serializer.Creator<Item> CREATOR = new Serializer.CreatorAdapter<Item>() { // from class: com.vkontakte.android.api.widget.WidgetTiles.Item.1
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
        private final String button;
        private final String buttonTarget;
        private final String buttonUrl;
        private final String description;
        private final Image icon;
        private final String target;
        private final String title;
        private final String url;

        public Item(JSONObject data) throws JSONException {
            String str = null;
            JSONObject action = data.optJSONObject(NativeProtocol.WEB_DIALOG_ACTION);
            JSONObject buttonAction = data.optJSONObject("link_action");
            JSONArray icons = data.optJSONArray(SettingsJsonConstants.APP_ICON_KEY);
            this.icon = icons == null ? null : new Image(icons);
            this.title = data.getString("title");
            this.url = action == null ? null : action.optString("url");
            this.target = action == null ? null : action.optString(SharingService.EXTRA_TARGET);
            this.button = data.optString("link");
            this.buttonUrl = buttonAction == null ? null : buttonAction.optString("url");
            this.buttonTarget = buttonAction != null ? buttonAction.optString(SharingService.EXTRA_TARGET) : str;
            this.description = data.optString("descr");
        }

        public Item(Serializer serializer) {
            this.icon = (Image) serializer.readSerializable(Image.class.getClassLoader());
            this.title = serializer.readString();
            this.url = serializer.readString();
            this.target = serializer.readString();
            this.button = serializer.readString();
            this.buttonUrl = serializer.readString();
            this.buttonTarget = serializer.readString();
            this.description = serializer.readString();
        }

        @Override // com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer serializer) {
            serializer.writeSerializable(this.icon);
            serializer.writeString(this.title);
            serializer.writeString(this.url);
            serializer.writeString(this.target);
            serializer.writeString(this.button);
            serializer.writeString(this.buttonUrl);
            serializer.writeString(this.buttonTarget);
            serializer.writeString(this.description);
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

        public String getUrl() {
            return this.url;
        }

        public String getTarget() {
            return this.target;
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
    }
}
