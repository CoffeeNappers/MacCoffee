package com.vkontakte.android.fragments;

import android.app.Activity;
import android.content.Context;
import com.vkontakte.android.R;
import com.vkontakte.android.SuggestionsActivity;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.newsfeed.NewsfeedGetSuggestedSources;
import com.vkontakte.android.fragments.ProfileFragment;
import java.util.List;
/* loaded from: classes2.dex */
public class SuggestionsRecommendationsFragment extends SuggestionsFragment {
    @Override // android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        if (!(act instanceof SuggestionsActivity)) {
            getActivity().setTitle(R.string.empty_find_groups);
        }
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment
    protected void loadData() {
        new NewsfeedGetSuggestedSources().setCallback(new Callback<List<UserProfile>>() { // from class: com.vkontakte.android.fragments.SuggestionsRecommendationsFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(List<UserProfile> _users) {
                SuggestionsRecommendationsFragment.this.users.addAll(_users);
                SuggestionsRecommendationsFragment.this.updateList();
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                SuggestionsRecommendationsFragment.this.onError(error.getCode(), error.message);
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment
    protected void onItemClick(int pos, long id, Object item) {
        new ProfileFragment.Builder((int) id).go(getActivity());
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment
    protected String getListTitle() {
        return getString(R.string.recom_groups_title);
    }
}
