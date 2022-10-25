package com.vkontakte.android;

import android.app.FragmentTransaction;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;
import com.vkontakte.android.api.account.AccountSetInfo;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.fragments.SuggestionsFriendsFragment;
import com.vkontakte.android.fragments.SuggestionsRecommendationsFragment;
import com.vkontakte.android.ui.ActionBarHacks;
import com.vkontakte.android.ui.ActionBarProgressDrawable;
import com.vkontakte.android.ui.FragmentHelper;
@Deprecated
/* loaded from: classes.dex */
public class SuggestionsActivity extends VKFragmentActivity {
    private View doneBtn;
    private SuggestionsFriendsFragment friends;
    private int page = 0;
    private ActionBarProgressDrawable progress;
    private SuggestionsRecommendationsFragment recommendations;

    @Override // com.vkontakte.android.VKFragmentActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        setContentView(R.layout.toolbar_activity);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        this.progress = new ActionBarProgressDrawable(toolbar.getBackground()) { // from class: com.vkontakte.android.SuggestionsActivity.1
            @Override // android.graphics.drawable.Drawable
            public void invalidateSelf() {
                super.invalidateSelf();
                View abv = ActionBarHacks.getActionBar(SuggestionsActivity.this);
                if (abv != null) {
                    abv.postInvalidate();
                }
            }
        };
        setSupportActionBar(toolbar);
        this.doneBtn = View.inflate(this, R.layout.ab_done_right, null);
        ((TextView) this.doneBtn.findViewById(R.id.ab_done_text)).setText(R.string.welcome_next);
        this.doneBtn.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.SuggestionsActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (SuggestionsActivity.this.page == 0) {
                    SuggestionsActivity.this.switchScreen();
                    SuggestionsActivity.this.updateIntroFlags(1);
                    return;
                }
                SuggestionsActivity.this.sendBroadcast(new Intent(Posts.ACTION_RELOAD_FEED), "com.vkontakte.android.permission.ACCESS_DATA");
                SuggestionsActivity.this.updateIntroFlags(2);
                SuggestionsActivity.this.setResult(-1);
                SuggestionsActivity.this.finish();
            }
        });
        this.progress.setStepCount(2);
        this.progress.setStep(0);
        if (getSupportActionBar() != null) {
            getSupportActionBar().setBackgroundDrawable(this.progress);
        }
        this.page = getIntent().getBooleanExtra("groups", false) ? 0 : 1;
        switchScreen();
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuItem item = menu.add(R.string.send);
        item.setActionView(this.doneBtn);
        item.setShowAsAction(2);
        return true;
    }

    @Override // android.app.Activity
    public void finish() {
        Friends.reload(true);
        Groups.reload(true);
        super.finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void switchScreen() {
        if (this.page == 0) {
            this.page = 1;
            if (this.recommendations == null) {
                this.recommendations = new SuggestionsRecommendationsFragment();
            }
            FragmentHelper.replace(this, this.recommendations);
            setTitle(R.string.recommended_pages);
            if (getSupportActionBar() != null) {
                if (!getIntent().getBooleanExtra("groups", false)) {
                    getSupportActionBar().setDisplayHomeAsUpEnabled(true);
                    getSupportActionBar().setHomeButtonEnabled(true);
                } else {
                    getSupportActionBar().setDisplayHomeAsUpEnabled(false);
                    getSupportActionBar().setHomeButtonEnabled(false);
                }
            }
        } else if (this.page == 1) {
            this.page = 0;
            if (this.friends == null) {
                Bundle extras = new Bundle();
                extras.putBoolean("from_signup", true);
                this.friends = new SuggestionsFriendsFragment();
                this.friends.setArguments(extras);
            }
            FragmentTransaction ft = getFragmentManager().beginTransaction();
            ft.replace(R.id.fragment_wrapper, this.friends).commit();
            setTitle(R.string.find_friends);
            if (getSupportActionBar() != null) {
                getSupportActionBar().setDisplayHomeAsUpEnabled(false);
                getSupportActionBar().setHomeButtonEnabled(false);
            }
        }
        this.progress.setStepAnimated(this.page);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateIntroFlags(int remove) {
        int intro = VKAccountManager.getCurrent().getIntro() & (remove ^ (-1));
        VKAccountManager.editCurrent().setIntro(intro).commit();
        new AccountSetInfo(intro).exec();
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        if (this.page == 1 && !getIntent().getBooleanExtra("groups", false)) {
            switchScreen();
            return;
        }
        setResult(0);
        finish();
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        super.onActivityResult(reqCode, resCode, data);
        if (reqCode == 102) {
            this.friends.onActivityResult(reqCode, resCode, data);
        }
    }
}
