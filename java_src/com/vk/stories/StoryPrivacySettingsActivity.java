package com.vk.stories;

import android.content.Context;
import android.graphics.BitmapFactory;
import android.graphics.PorterDuff;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.FrameLayout;
import com.vkontakte.android.R;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.account.AccountGetPrivacySettings;
import com.vkontakte.android.api.account.AccountSetPrivacy;
import com.vkontakte.android.data.PrivacySection;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.fragments.PrivacyEditFragment;
import com.vkontakte.android.ui.FragmentHelper;
import java.util.ArrayList;
import me.grishka.appkit.api.APIRequest;
/* loaded from: classes2.dex */
public class StoryPrivacySettingsActivity extends VKActivity {
    private FrameLayout content;
    private APIRequest currentRequest;

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        setContentView(R.layout.activity_story_privacy_settings);
        this.content = (FrameLayout) findViewById(R.id.fragment_wrapper);
        loadData();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        if (this.currentRequest != null) {
            this.currentRequest.cancel();
        }
    }

    private void loadData() {
        this.currentRequest = new AccountGetPrivacySettings().setCallback(new SimpleCallback<ArrayList<PrivacySection>>(this) { // from class: com.vk.stories.StoryPrivacySettingsActivity.1
            @Override // com.vkontakte.android.api.Callback
            public void success(ArrayList<PrivacySection> result) {
                StoryPrivacySettingsActivity.this.currentRequest = null;
                if (result != null) {
                    for (int i = 0; i < result.size(); i++) {
                        if ("stories".equals(result.get(i).key) && result.get(i).settings != null && result.get(i).settings.size() > 0) {
                            StoryPrivacySettingsActivity.this.content.removeAllViews();
                            Bundle args = new Bundle();
                            args.putParcelable("setting", new PrivacySetting(result.get(i).settings.get(0)));
                            StorySettingsFragment fragment = new StorySettingsFragment();
                            fragment.setArguments(args);
                            FragmentHelper.replace(StoryPrivacySettingsActivity.this, fragment);
                            return;
                        }
                    }
                }
                StoryPrivacySettingsActivity.this.finish();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                StoryPrivacySettingsActivity.this.finish();
            }
        }).exec((Context) this);
    }

    /* loaded from: classes2.dex */
    public static class StorySettingsFragment extends PrivacyEditFragment {
        @Override // com.vkontakte.android.fragments.PrivacyEditFragment
        protected String getPrivacySettingsTitle() {
            Bundle args = getArguments();
            return (args == null || !args.containsKey("setting")) ? getString(R.string.privacy_allowed_to) : ((PrivacySetting) args.getParcelable("setting")).title;
        }

        @Override // com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
        public void onViewCreated(View view, Bundle savedInstanceState) {
            super.onViewCreated(view, savedInstanceState);
            Toolbar toolbar = getToolbar();
            if (toolbar != null) {
                toolbar.setNavigationIcon(new BitmapDrawable(getResources(), BitmapFactory.decodeResource(getResources(), R.drawable.ic_ab_back)));
                toolbar.getNavigationIcon().setColorFilter(ContextCompat.getColor(toolbar.getContext(), R.color.picker_dark_icon), PorterDuff.Mode.MULTIPLY);
                toolbar.setTitle(R.string.menu_settings);
                toolbar.setNavigationOnClickListener(StoryPrivacySettingsActivity$StorySettingsFragment$$Lambda$1.lambdaFactory$(this));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onViewCreated$0(View view1) {
            if (getActivity() != null) {
                getActivity().finish();
            }
        }

        @Override // com.vkontakte.android.fragments.PrivacyEditFragment
        protected void setResult() {
            PrivacySetting setting = getResult();
            if (setting != null) {
                new AccountSetPrivacy(setting.key, setting.getApiValue()).setBackground(true).persist(null, null).exec();
            }
        }
    }
}
