package com.vkontakte.android.api.widget;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.View;
import com.vkontakte.android.ui.widget.WidgetMatchesView;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WidgetMatches extends Widget {
    public static final Serializer.Creator<WidgetMatches> CREATOR = new Serializer.CreatorAdapter<WidgetMatches>() { // from class: com.vkontakte.android.api.widget.WidgetMatches.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public WidgetMatches mo1087createFromSerializer(Serializer s) {
            return new WidgetMatches(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public WidgetMatches[] mo1088newArray(int size) {
            return new WidgetMatches[size];
        }
    };
    private static final int MAX_ITEMS_COUNT = 5;
    private final List<Match> matches;

    /* JADX INFO: Access modifiers changed from: package-private */
    public WidgetMatches(JSONObject response) throws JSONException {
        super(response);
        JSONObject data = response.getJSONObject("data");
        JSONArray matches = data.getJSONArray("matches");
        this.matches = new ArrayList();
        for (int i = 0; i < matches.length() && i < 5; i++) {
            this.matches.add(new Match(matches.getJSONObject(i)));
        }
        if (matches.length() > 5) {
            L.w("WidgetMatches", "Widget has more matches than expected");
        }
    }

    public WidgetMatches(Serializer serializer) {
        super(serializer);
        this.matches = serializer.createTypedArrayList(Match.CREATOR);
    }

    @Override // com.vkontakte.android.api.widget.Widget, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        super.serializeTo(s);
        s.writeTypedList(this.matches);
    }

    public List<Match> getMatches() {
        return this.matches;
    }

    @Override // com.vkontakte.android.api.widget.Widget
    @NonNull
    public View createContentView(Context context) {
        return new WidgetMatchesView(context);
    }
}
