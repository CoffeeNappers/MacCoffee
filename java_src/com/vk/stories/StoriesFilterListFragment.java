package com.vk.stories;

import android.graphics.BitmapFactory;
import android.graphics.PorterDuff;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.Toolbar;
import android.view.View;
import com.vk.stories.model.GetStoriesResponse;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.common.GetUsersGroupRequest;
import com.vkontakte.android.fragments.FilterListFragment;
import com.vkontakte.android.navigation.Navigator;
/* loaded from: classes2.dex */
public class StoriesFilterListFragment extends FilterListFragment {

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(StoriesFilterListFragment.class);
            this.args.putInt("theme", R.style.WhiteTheme);
        }
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        Toolbar toolbar = getToolbar();
        if (toolbar != null) {
            toolbar.setNavigationIcon(new BitmapDrawable(getResources(), BitmapFactory.decodeResource(getResources(), R.drawable.ic_ab_back)));
            toolbar.getNavigationIcon().setColorFilter(ContextCompat.getColor(toolbar.getContext(), R.color.picker_dark_icon), PorterDuff.Mode.MULTIPLY);
            toolbar.setTitle(R.string.hidden_from_stories);
            toolbar.setNavigationOnClickListener(new View.OnClickListener() { // from class: com.vk.stories.StoriesFilterListFragment.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    if (StoriesFilterListFragment.this.getActivity() != null) {
                        StoriesFilterListFragment.this.getActivity().finish();
                    }
                }
            });
        }
    }

    @Override // com.vkontakte.android.fragments.FilterListFragment
    protected GetUsersGroupRequest getUsersGroupRequest() {
        return GetUsersGroupRequest.getStoriesBanned();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.FilterListFragment
    public void onActionClick(final UserProfile userProfile) {
        StoriesController.unbanUser(userProfile.uid, getActivity(), new Callback<GetStoriesResponse>() { // from class: com.vk.stories.StoriesFilterListFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(GetStoriesResponse result) {
                StoriesFilterListFragment.this.onActionSuccess(userProfile);
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
            }
        });
    }

    @Override // com.vkontakte.android.fragments.FilterListFragment
    protected int getUserActionSuccessText() {
        return 0;
    }

    @Override // com.vkontakte.android.fragments.FilterListFragment
    protected int getGroupActionSuccessText() {
        return 0;
    }
}
