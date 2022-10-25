package com.vk.stories.view;

import android.content.Context;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.attachpicker.util.Fonts;
import com.vk.stories.model.StoriesContainer;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class StoryCirclePreview extends FrameLayout {
    private static final int TEXT_COLOR_NORMAL = -9341574;
    private static final int TEXT_COLOR_SELECTED = -11435592;
    private View clickHandler;
    private TextView firstName;
    private ImageView myStoryBackground;
    private StoriesContainer story;
    private StoryCircleImageView storyImageView;

    public StoryCirclePreview(Context context) {
        super(context);
        init();
    }

    public StoryCirclePreview(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public StoryCirclePreview(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        LayoutInflater.from(getContext()).inflate(R.layout.layout_story_circle_preview, this);
        this.storyImageView = (StoryCircleImageView) findViewById(R.id.iv_story_image);
        this.firstName = (TextView) findViewById(R.id.tv_first_name);
        this.myStoryBackground = (ImageView) findViewById(R.id.iv_my_story_bg);
        this.clickHandler = findViewById(R.id.click_handler);
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener l) {
        this.clickHandler.setOnClickListener(l);
    }

    public StoriesContainer getStory() {
        return this.story;
    }

    public StoryCircleImageView getStoryImageView() {
        return this.storyImageView;
    }

    public void setStory(StoriesContainer container) {
        this.story = container;
        boolean myStory = container.myStory();
        this.storyImageView.setStoryContainer(container);
        if (container != null) {
            if (myStory) {
                this.firstName.setTextColor(TEXT_COLOR_NORMAL);
                this.firstName.setTypeface(Typeface.DEFAULT);
                if (container.hasValidStories()) {
                    this.myStoryBackground.setVisibility(8);
                    this.storyImageView.setVisibility(0);
                } else {
                    this.myStoryBackground.setVisibility(0);
                    this.storyImageView.setVisibility(8);
                }
            } else {
                this.myStoryBackground.setVisibility(8);
                this.storyImageView.setVisibility(0);
                if (container.hasNewStories()) {
                    this.firstName.setTextColor(TEXT_COLOR_SELECTED);
                    this.firstName.setTypeface(Fonts.getRobotoMedium());
                } else {
                    this.firstName.setTextColor(TEXT_COLOR_NORMAL);
                    this.firstName.setTypeface(Typeface.DEFAULT);
                }
            }
            if (container.getAuthorFirstName() != null && !myStory) {
                this.firstName.setText(container.getAuthorFirstName());
                return;
            } else if (myStory) {
                this.firstName.setText(R.string.story);
                return;
            } else {
                this.firstName.setText("");
                return;
            }
        }
        this.firstName.setText("");
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(getResources().getDimensionPixelSize(R.dimen.story_card_width), 1073741824), View.MeasureSpec.makeMeasureSpec(getResources().getDimensionPixelSize(R.dimen.story_card_height), 1073741824));
    }
}
