package com.vkontakte.android.api.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.View;
import com.vkontakte.android.ui.widget.WidgetTextView;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WidgetText extends Widget {
    public static final Serializer.Creator<WidgetText> CREATOR = new Serializer.CreatorAdapter<WidgetText>() { // from class: com.vkontakte.android.api.widget.WidgetText.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public WidgetText mo1087createFromSerializer(Serializer s) {
            return new WidgetText(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public WidgetText[] mo1088newArray(int size) {
            return new WidgetText[size];
        }
    };
    private final String description;
    private final String text;

    public WidgetText(JSONObject response) throws JSONException {
        super(response);
        JSONObject data = response.getJSONObject("data");
        this.text = data.optString("text");
        this.description = data.optString("descr");
    }

    public WidgetText(Serializer serializer) {
        super(serializer);
        this.text = serializer.readString();
        this.description = serializer.readString();
    }

    @Override // com.vkontakte.android.api.widget.Widget, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        super.serializeTo(s);
        s.writeString(this.text);
        s.writeString(this.description);
    }

    public String getText() {
        return this.text;
    }

    public String getDescription() {
        return this.description;
    }

    @Override // com.vkontakte.android.api.widget.Widget
    @NonNull
    public View createContentView(Context context) {
        return new WidgetTextView(context);
    }
}
