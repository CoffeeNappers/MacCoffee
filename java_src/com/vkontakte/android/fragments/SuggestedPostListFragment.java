package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.wall.WallGet;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.utils.L;
/* loaded from: classes2.dex */
public class SuggestedPostListFragment extends PostListFragment {
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.SuggestedPostListFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if ("com.vkontakte.android.POST_DELETED".equals(intent.getAction())) {
                SuggestedPostListFragment.this.remove(intent.getIntExtra("owner_id", 0), intent.getIntExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, 0));
            }
        }
    };
    private int uid;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder(int ownerId) {
            super(SuggestedPostListFragment.class);
            this.args.putInt("owner_id", ownerId);
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle state) {
        super.onCreate(state);
        IntentFilter filter = new IntentFilter();
        filter.addAction("com.vkontakte.android.POST_DELETED");
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    @Override // com.vkontakte.android.fragments.PostListFragment, com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        this.uid = getArguments().getInt("owner_id", 0);
        setTitle(R.string.suggested_posts_title);
        super.onAttach(act);
        setEmptyText(R.string.no_suggested_posts);
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
        this.currentRequest = new WallGet(this.uid, offset, count, "suggests", getListReferrer()).setCallback(new SimpleCallback<WallGet.Result>(this) { // from class: com.vkontakte.android.fragments.SuggestedPostListFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(WallGet.Result res) {
                SuggestedPostListFragment.this.onDataLoaded(res.news, res.news.size() > 0);
            }
        }).exec((Context) getActivity());
    }
}
