package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.wall.WallGet;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.posts.HeaderPostDisplayItem;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class PostponedPostListFragment extends PostListFragment {
    private int uid;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder(int ownerId) {
            super(PostponedPostListFragment.class);
            this.args.putInt("owner_id", ownerId);
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        this.uid = getArguments().getInt("owner_id", 0);
        setTitle(R.string.postponed_posts_title);
        super.onAttach(act);
        setEmptyText(R.string.no_postponed_posts);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getReferer() {
        return "postponed";
    }

    @Override // com.vkontakte.android.fragments.PostListFragment
    protected String getListReferrer() {
        return null;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new WallGet(this.uid, offset, count, "postponed", getListReferrer()).setCallback(new SimpleCallback<WallGet.Result>(this) { // from class: com.vkontakte.android.fragments.PostponedPostListFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(WallGet.Result res) {
                PostponedPostListFragment.this.onDataLoaded(res.news, res.news.size() > 0);
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.list.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.fragments.PostponedPostListFragment.2
            @Override // android.support.v7.widget.RecyclerView.ItemDecoration
            public void getItemOffsets(Rect outRect, View view2, RecyclerView parent, RecyclerView.State state) {
                int index = PostponedPostListFragment.this.list.getChildAdapterPosition(view2);
                if (index + 1 <= PostponedPostListFragment.this.items.size()) {
                    if (index == PostponedPostListFragment.this.items.size() - 1 || (PostponedPostListFragment.this.items.get(index + 1) instanceof HeaderPostDisplayItem)) {
                        outRect.bottom = V.dp(8.0f);
                    }
                }
            }
        });
    }
}
