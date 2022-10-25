package com.vkontakte.android.api.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import com.facebook.internal.NativeProtocol;
import com.vk.core.common.Image;
import com.vk.core.common.ImageSize;
import com.vk.sharing.SharingService;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.ui.widget.WidgetCoverListView;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WidgetCoverList extends Widget {
    public static final Serializer.Creator<WidgetCoverList> CREATOR = new Serializer.CreatorAdapter<WidgetCoverList>() { // from class: com.vkontakte.android.api.widget.WidgetCoverList.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public WidgetCoverList mo1087createFromSerializer(Serializer s) {
            return new WidgetCoverList(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public WidgetCoverList[] mo1088newArray(int size) {
            return new WidgetCoverList[size];
        }
    };
    private static final int MAX_ITEMS_COUNT = 3;
    private final List<Item> items;

    /* JADX INFO: Access modifiers changed from: package-private */
    public WidgetCoverList(JSONObject response) throws JSONException {
        super(response);
        JSONObject data = response.getJSONObject("data");
        JSONArray rows = data.getJSONArray("rows");
        this.items = new ArrayList();
        for (int i = 0; i < rows.length() && i < 3; i++) {
            this.items.add(new Item(rows.getJSONObject(i)));
        }
        if (rows.length() > 3) {
            L.w("WidgetCoverList", "Widget has more rows than expected");
        }
    }

    WidgetCoverList(Serializer serializer) {
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
        return new WidgetCoverListView(context);
    }

    public List<Item> getItems() {
        return this.items;
    }

    /* loaded from: classes2.dex */
    public static class Item extends Serializer.SerializableAdapter {
        public static final Serializer.Creator<Item> CREATOR = new Serializer.CreatorAdapter<Item>() { // from class: com.vkontakte.android.api.widget.WidgetCoverList.Item.1
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
        private final Image cover;
        private final String description;
        private final String target;
        private final String title;
        private final String url;

        public Item(JSONObject data) throws JSONException {
            String str = null;
            JSONObject action = data.optJSONObject(NativeProtocol.WEB_DIALOG_ACTION);
            JSONObject buttonAction = data.optJSONObject("button_action");
            JSONArray covers = data.optJSONArray("cover");
            this.cover = covers == null ? null : new Image(covers);
            this.title = data.getString("title");
            this.url = action == null ? null : action.optString("url");
            this.target = action == null ? null : action.optString(SharingService.EXTRA_TARGET);
            this.button = data.optString(ServerKeys.BUTTON);
            this.buttonUrl = buttonAction == null ? null : buttonAction.optString("url");
            this.buttonTarget = buttonAction != null ? buttonAction.optString(SharingService.EXTRA_TARGET) : str;
            this.description = data.optString("descr");
        }

        public Item(Serializer serializer) {
            this.cover = (Image) serializer.readSerializable(Image.class.getClassLoader());
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
            serializer.writeSerializable(this.cover);
            serializer.writeString(this.title);
            serializer.writeString(this.url);
            serializer.writeString(this.target);
            serializer.writeString(this.button);
            serializer.writeString(this.buttonUrl);
            serializer.writeString(this.buttonTarget);
            serializer.writeString(this.description);
        }

        @Nullable
        public ImageSize getCover(int width) {
            if (this.cover == null) {
                return null;
            }
            return this.cover.getImageByWidth(width);
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
