package com.vkontakte.android.ui.holder.messages;

import android.content.Context;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class AddUserToChatHolder extends RecyclerHolder<AddUserToChatI> implements UsableRecyclerView.Clickable {

    /* loaded from: classes3.dex */
    public interface AddUserToChatI {
        void addUserToChat();
    }

    public AddUserToChatHolder(Context ctx) {
        super((int) R.layout.add_user_to_chat, ctx);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(AddUserToChatI item) {
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (getItem() != null) {
            getItem().addUserToChat();
        }
    }
}
