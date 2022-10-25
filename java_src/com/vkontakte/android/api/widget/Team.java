package com.vkontakte.android.api.widget;

import android.support.annotation.Nullable;
import com.vk.core.common.Image;
import com.vk.core.common.ImageSize;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Team extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<Team> CREATOR = new Serializer.CreatorAdapter<Team>() { // from class: com.vkontakte.android.api.widget.Team.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Team mo1087createFromSerializer(Serializer s) {
            return new Team(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Team[] mo1088newArray(int size) {
            return new Team[size];
        }
    };
    private final String description;
    private final Image image;
    private final String name;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Team(JSONObject team) throws JSONException {
        this.name = team.optString("name");
        this.description = team.optString("descr");
        JSONArray icons = team.optJSONArray(SettingsJsonConstants.APP_ICON_KEY);
        this.image = icons == null ? null : new Image(icons);
    }

    Team(Serializer s) {
        this.name = s.readString();
        this.description = s.readString();
        this.image = (Image) s.readSerializable(Image.class.getClassLoader());
    }

    public String getName() {
        return this.name;
    }

    @Nullable
    public String getDescription() {
        return this.description;
    }

    @Nullable
    public ImageSize getImage(int width) {
        if (this.image == null) {
            return null;
        }
        return this.image.getImageByWidth(width);
    }

    public boolean hasImage() {
        return this.image != null && !this.image.isEmpty();
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.name);
        s.writeString(this.description);
        s.writeSerializable(this.image);
    }
}
