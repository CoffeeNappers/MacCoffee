package com.vkontakte.android.api;

import com.vk.sharing.SharingService;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ButtonAction extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<ButtonAction> CREATOR = new Serializer.CreatorAdapter<ButtonAction>() { // from class: com.vkontakte.android.api.ButtonAction.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public ButtonAction mo1087createFromSerializer(Serializer is) {
            return new ButtonAction(is);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public ButtonAction[] mo1088newArray(int size) {
            return new ButtonAction[size];
        }
    };
    public final int group_id;
    public final String target;
    public final String type;
    public final String url;

    public ButtonAction(JSONObject o) {
        this.target = o.optString(SharingService.EXTRA_TARGET);
        this.group_id = o.optInt("group_id");
        this.type = o.optString(ServerKeys.TYPE);
        this.url = o.optString("url");
    }

    public boolean isValidAction() {
        return true;
    }

    private ButtonAction(Serializer is) {
        this.target = is.readString();
        this.group_id = is.readInt();
        this.type = is.readString();
        this.url = is.readString();
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.target);
        s.writeInt(this.group_id);
        s.writeString(this.type);
        s.writeString(this.url);
    }
}
