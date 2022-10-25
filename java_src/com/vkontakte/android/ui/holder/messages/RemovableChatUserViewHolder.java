package com.vkontakte.android.ui.holder.messages;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.ChatUser;
import com.vkontakte.android.R;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.ui.CardItemDecorator;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.UserHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class RemovableChatUserViewHolder extends RecyclerHolder<ChatUser> implements UsableRecyclerView.Clickable, CardItemDecorator.Provider {
    public final View btnClose;
    public boolean isCreate;
    public final TextView name;
    public View.OnClickListener onClickListener;
    public final ImageView online;
    public final VKImageView photo;
    public final TextView subtitle;

    public RemovableChatUserViewHolder(Context context) {
        super((int) R.layout.removable_chat_user, context);
        this.isCreate = false;
        this.onClickListener = null;
        this.name = (TextView) $(16908308);
        this.subtitle = (TextView) $(16908309);
        this.photo = (VKImageView) $(R.id.photo);
        this.btnClose = $(R.id.flist_item_btn);
        this.online = (ImageView) $(R.id.online);
        this.btnClose.setOnClickListener(this.onClickListener);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(ChatUser chatUser) {
        this.photo.load(chatUser.user.photo);
        this.name.setText(chatUser.user.fullName);
        if (chatUser.inviter.uid == chatUser.user.uid || chatUser.isAdmin()) {
            this.subtitle.setText(R.string.chat_admin);
        } else {
            this.subtitle.setText(getString(chatUser.inviter.f ? R.string.invited_by_f : R.string.invited_by_m, chatUser.inviter.fullName));
        }
        this.btnClose.setVisibility((VKAccountManager.isCurrentUser(chatUser.user.uid) || (!VKAccountManager.isCurrentUser(chatUser.inviter.uid) && !VKAccountManager.isCurrentUser(chatUser.admin)) || this.isCreate) ? 4 : 0);
        this.btnClose.setTag(Integer.valueOf(chatUser.user.uid));
        UserHolder.updateOnlineImage(this.online, chatUser.user, 48);
    }

    public void setOnClickListenerAndIsCreate(View.OnClickListener onClickListener, boolean isCreate) {
        this.onClickListener = onClickListener;
        this.isCreate = isCreate;
        this.btnClose.setOnClickListener(onClickListener);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        new ProfileFragment.Builder(getItem().user.uid).go(getContext());
    }

    @Override // com.vkontakte.android.ui.CardItemDecorator.Provider
    public int getBlockType(int position) {
        int i = position % 3;
        if (i == 0) {
            return 2;
        }
        return i == 2 ? 4 : 0;
    }

    public static String getImageUrl(Object obj) {
        if (obj instanceof ChatUser) {
            return ((ChatUser) obj).user.photo;
        }
        return null;
    }
}
