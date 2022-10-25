package com.vkontakte.android.fragments.feedback;

import android.view.View;
import com.vkontakte.android.api.models.Notification;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.views.UsableRecyclerView;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class TempPostHolder extends RecyclerHolder<Notification> implements UsableRecyclerView.Clickable {
    public TempPostHolder(View itemView) {
        super(itemView);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Notification item) {
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        new PostViewFragment.Builder(getItem().parentPost).go(this.itemView.getContext());
    }
}
