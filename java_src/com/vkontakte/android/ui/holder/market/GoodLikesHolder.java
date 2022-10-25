package com.vkontakte.android.ui.holder.market;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.sharing.Sharing;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.wall.WallLike;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.fragments.LikesListFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.binder.LikeBarBinder;
import com.vkontakte.android.ui.holder.RecyclerHolder;
/* loaded from: classes3.dex */
public class GoodLikesHolder extends RecyclerHolder<Good> implements View.OnClickListener {
    final LikeBarBinder likeBarBinder;

    public GoodLikesHolder(ViewGroup parent) {
        super((int) R.layout.post_view_likes, parent);
        this.likeBarBinder = new LikeBarBinder(this.itemView);
        this.likeBarBinder.likesContainer.setOnClickListener(this);
        this.likeBarBinder.likesCounterView.setOnClickListener(this);
        this.likeBarBinder.repostsCounterView.setOnClickListener(this);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(Good item) {
        boolean z = true;
        this.likeBarBinder.bind(item.user_likes != 0, false, item.likes_count, 0, 0, item.likes);
        ViewUtils.setEnabled(this.likeBarBinder.likesCounterView, item.availability == 0);
        TextView textView = this.likeBarBinder.repostsCounterView;
        if (item.availability != 0) {
            z = false;
        }
        ViewUtils.setEnabled(textView, z);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        final Good lastGood = getItem();
        switch (v.getId()) {
            case R.id.wall_view_like_container /* 2131756232 */:
                Bundle args = new Bundle();
                args.putCharSequence("title", getString(R.string.liked));
                args.putInt("ltype", 6);
                args.putInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, lastGood.owner_id);
                args.putInt(FirebaseAnalytics.Param.ITEM_ID, lastGood.id);
                Navigate.to(LikesListFragment.class, args, getContext());
                return;
            case R.id.wall_view_like_photos /* 2131756233 */:
            case R.id.wall_view_like_label /* 2131756234 */:
            default:
                return;
            case R.id.wall_view_like /* 2131756235 */:
                final boolean isAdd = lastGood.user_likes == 0;
                if (!isAdd) {
                    lastGood.user_likes = 0;
                    lastGood.likes_count--;
                } else {
                    lastGood.user_likes = 1;
                    lastGood.likes_count++;
                }
                bind(lastGood);
                WallLike.market(lastGood).setCallback(new Callback<WallLike.Result>() { // from class: com.vkontakte.android.ui.holder.market.GoodLikesHolder.1
                    @Override // com.vkontakte.android.api.Callback
                    public void success(WallLike.Result result) {
                        lastGood.user_likes = isAdd ? 1 : 0;
                        lastGood.likes_count = result.likes;
                        GoodLikesHolder.this.bind(lastGood);
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                        lastGood.user_likes = isAdd ? 0 : 1;
                        GoodLikesHolder.this.bind(lastGood);
                    }
                }).exec(this.itemView);
                return;
            case R.id.wall_view_repost /* 2131756236 */:
                if (VKAuth.ensureLoggedIn(v.getContext())) {
                    Sharing.from(v.getContext()).withAttachment(Attachments.createInfo(lastGood, "goods")).withActions(Actions.createInfo(lastGood)).share();
                    return;
                }
                return;
        }
    }
}
