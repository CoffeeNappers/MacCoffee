package com.vk.stories;

import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import com.vk.stories.StoriesController;
import com.vk.stories.model.StoriesContainer;
import com.vk.stories.view.StoryViewContainer;
import com.vkontakte.android.VKActivity;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class StoryViewActivity extends VKActivity implements StoryViewContainer.ControlCallback {
    public static final String INTENT_GET_STORIES_RESPONSE = "get_stories_response";
    public static final String INTENT_OPEN_STORY = "open_story";
    public static final String INTENT_OPEN_STORY_OWNER_ID = "open_story_uid";
    public static final String INTENT_SOURCE_TYPE = "source_type";
    private StoryViewContainer storyViewContainer;

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        ArrayList<StoriesContainer> storiesContainers = getIntent().getParcelableArrayListExtra(INTENT_GET_STORIES_RESPONSE);
        int openStoryUid = getIntent().getIntExtra(INTENT_OPEN_STORY_OWNER_ID, 0);
        String openStory = getIntent().getStringExtra(INTENT_OPEN_STORY);
        StoriesController.SourceType sourceType = (StoriesController.SourceType) getIntent().getSerializableExtra(INTENT_SOURCE_TYPE);
        this.storyViewContainer = new StoryViewContainer(this, sourceType == null ? StoriesController.SourceType.SNIPPET : sourceType, true, this, storiesContainers, openStoryUid, openStory);
        setContentView(this.storyViewContainer);
    }

    @Override // android.support.v7.app.AppCompatActivity, android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (this.storyViewContainer.doDispatchKeyEvent(event)) {
            return true;
        }
        return super.dispatchKeyEvent(event);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        this.storyViewContainer.onActivityResult(reqCode, resCode, data);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        this.storyViewContainer.onResume();
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        this.storyViewContainer.onPause();
        super.onPause();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        this.storyViewContainer.onDestroy();
        super.onDestroy();
    }

    @Override // com.vk.stories.view.StoryViewContainer.ControlCallback
    public void startForResult(Intent intent, int requestCode) {
        startActivityForResult(intent, requestCode);
    }

    @Override // com.vk.stories.view.StoryViewContainer.ControlCallback
    public void scrollStoriesListToAuthorId(int uid) {
    }

    @Override // com.vk.stories.view.StoryViewContainer.ControlCallback
    public boolean noDragGestureInProgress() {
        return false;
    }
}
