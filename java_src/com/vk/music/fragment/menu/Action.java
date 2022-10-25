package com.vk.music.fragment.menu;

import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;
import com.vkontakte.android.utils.Serializer;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class Action extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<Action> CREATOR = new Serializer.CreatorAdapter<Action>() { // from class: com.vk.music.fragment.menu.Action.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Action mo1087createFromSerializer(Serializer s) {
            return new Action(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Action[] mo1088newArray(int size) {
            return new Action[size];
        }
    };
    final int iconRes;
    public final int id;
    final int stringRes;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Action(int id, @DrawableRes int iconRes) {
        this(id, iconRes, -1);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Action(int id, @DrawableRes int iconRes, @StringRes int stringRes) {
        this.id = id;
        this.iconRes = iconRes;
        this.stringRes = stringRes;
    }

    private Action(Serializer s) {
        this.id = s.readInt();
        this.iconRes = s.readInt();
        this.stringRes = s.readInt();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean hasTitle() {
        return this.stringRes != -1;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.id);
        s.writeInt(this.iconRes);
        s.writeInt(this.stringRes);
    }
}
