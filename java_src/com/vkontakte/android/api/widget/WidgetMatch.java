package com.vkontakte.android.api.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.View;
import com.vkontakte.android.ui.widget.WidgetMatchView;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WidgetMatch extends Widget {
    public static final Serializer.Creator<WidgetMatch> CREATOR = new Serializer.CreatorAdapter<WidgetMatch>() { // from class: com.vkontakte.android.api.widget.WidgetMatch.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public WidgetMatch mo1087createFromSerializer(Serializer s) {
            return new WidgetMatch(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public WidgetMatch[] mo1088newArray(int size) {
            return new WidgetMatch[size];
        }
    };
    private final Match match;

    /* JADX INFO: Access modifiers changed from: package-private */
    public WidgetMatch(JSONObject response) throws JSONException {
        super(response);
        JSONObject data = response.getJSONObject("data");
        this.match = new Match(data.getJSONObject("match"));
    }

    WidgetMatch(Serializer serializer) {
        super(serializer);
        this.match = (Match) serializer.readSerializable(Match.class.getClassLoader());
    }

    @Override // com.vkontakte.android.api.widget.Widget, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        super.serializeTo(s);
        s.writeSerializable(this.match);
    }

    public Match getMatch() {
        return this.match;
    }

    @Override // com.vkontakte.android.api.widget.Widget
    @NonNull
    public View createContentView(Context context) {
        return new WidgetMatchView(context);
    }
}
