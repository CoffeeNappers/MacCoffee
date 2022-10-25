package com.vk.stories;

import android.content.Intent;
import android.graphics.BitmapFactory;
import android.graphics.PorterDuff;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.SwitchCompat;
import android.support.v7.widget.Toolbar;
import android.view.View;
import com.vk.attachpicker.util.Prefs;
import com.vk.masks.MasksController;
import com.vk.media.camera.CameraEffects;
import com.vk.stories.StoriesFilterListFragment;
import com.vkontakte.android.R;
import com.vkontakte.android.VKActivity;
/* loaded from: classes2.dex */
public class StorySettingsActivity extends VKActivity {
    public static final String INTENT_FROM_CREATE_STORY = "from_create_story";

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        setContentView(R.layout.activity_story_settings);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        toolbar.setNavigationIcon(new BitmapDrawable(getResources(), BitmapFactory.decodeResource(getResources(), R.drawable.ic_ab_clear)));
        toolbar.getNavigationIcon().setColorFilter(ContextCompat.getColor(this, R.color.picker_dark_icon), PorterDuff.Mode.MULTIPLY);
        toolbar.setNavigationOnClickListener(StorySettingsActivity$$Lambda$1.lambdaFactory$(this));
        toolbar.setTitle(R.string.menu_settings);
        View saveStoriesView = findViewById(R.id.ll_save_stories);
        SwitchCompat switchView = (SwitchCompat) saveStoriesView.findViewById(R.id.switch_save);
        switchView.setClickable(false);
        switchView.setChecked(Prefs.storiesPrefs().getBoolean("save_stories"));
        saveStoriesView.setOnClickListener(StorySettingsActivity$$Lambda$2.lambdaFactory$(switchView));
        View hiddenFromStories = findViewById(R.id.ll_hidden_from_stories);
        hiddenFromStories.setOnClickListener(StorySettingsActivity$$Lambda$3.lambdaFactory$(this));
        View storiesPrivacy = findViewById(R.id.ll_stories_privacy);
        storiesPrivacy.setOnClickListener(StorySettingsActivity$$Lambda$4.lambdaFactory$(this));
        View masksCache = findViewById(R.id.tv_clear_masks_cache);
        if (CameraEffects.isSupported()) {
            boolean fromCreateStory = getIntent().getBooleanExtra(INTENT_FROM_CREATE_STORY, false);
            masksCache.setOnClickListener(StorySettingsActivity$$Lambda$5.lambdaFactory$(this, fromCreateStory));
            return;
        }
        masksCache.setVisibility(8);
    }

    public /* synthetic */ void lambda$onCreate$0(View view) {
        finish();
    }

    public static /* synthetic */ void lambda$onCreate$1(SwitchCompat switchView, View v) {
        switchView.setChecked(!switchView.isChecked());
        Prefs.storiesPrefs().edit().putBoolean("save_stories", switchView.isChecked()).apply();
    }

    public /* synthetic */ void lambda$onCreate$2(View v) {
        new StoriesFilterListFragment.Builder().go(this);
    }

    public /* synthetic */ void lambda$onCreate$3(View v) {
        startActivity(new Intent(this, StoryPrivacySettingsActivity.class));
    }

    public /* synthetic */ void lambda$onCreate$4(boolean fromCreateStory, View v) {
        MasksController.getInstance().clear();
        if (fromCreateStory) {
            setResult(-1);
            finish();
        }
    }
}
