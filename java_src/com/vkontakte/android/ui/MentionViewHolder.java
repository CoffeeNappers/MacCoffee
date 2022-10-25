package com.vkontakte.android.ui;

import android.view.View;
import android.view.ViewGroup;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class MentionViewHolder extends RecyclerHolder<UserProfile> implements View.OnClickListener {
    private VKImageView imageViewPhoto;
    private MentionsManager mentionsManager;
    private TextView textViewShortName;
    private TextView textViewUsername;

    public MentionViewHolder(ViewGroup parent, MentionsManager mentionsManager) {
        super((int) R.layout.mention_user_item, parent);
        this.itemView.setOnClickListener(this);
        this.mentionsManager = mentionsManager;
        this.imageViewPhoto = (VKImageView) $(R.id.photo);
        this.textViewUsername = (TextView) $(R.id.tv_username);
        this.textViewShortName = (TextView) $(R.id.tv_usershortname);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        this.mentionsManager.mentionSelected(getItem());
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(UserProfile item) {
        this.imageViewPhoto.load(item.photo);
        this.textViewUsername.setText(item.fullName == null ? "" : item.fullName);
        this.textViewShortName.setText((item.domain == null || item.domain.isEmpty() || !item.getHasRealDomain()) ? "" : "@" + item.domain);
    }
}
