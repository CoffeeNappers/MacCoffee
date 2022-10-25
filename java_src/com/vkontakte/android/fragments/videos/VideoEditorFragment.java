package com.vkontakte.android.fragments.videos;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.media.TransportMediator;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoEdit;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.fragments.PrivacyEditFragment;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.cardview.CardDrawable;
import java.util.Arrays;
import me.grishka.appkit.fragments.ContainerFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class VideoEditorFragment extends ContainerFragment implements TextWatcher, View.OnClickListener {
    static final int PRIVACY_COMMENT_RESULT = 104;
    static final int PRIVACY_RESULT = 103;
    ViewGroup mContainer;
    Drawable mDoneDrawable;
    MenuItem mDoneItem;
    TextView mPrivacyCommentValue;
    TextView mPrivacyValue;
    EditText mSubtitle;
    EditText mTitle;
    VideoFile mVideo;
    PrivacySetting mPrivacy = new PrivacySetting();
    PrivacySetting mPrivacyComment = new PrivacySetting();
    boolean mDoneEnabled = false;

    public static Navigator edit(VideoFile video) {
        Bundle args = new Bundle();
        args.putParcelable("video", video);
        return new Navigator(VideoEditorFragment.class, new TabletDialogActivity.Builder().setGravity(17).setInputMode(16).setMaxWidth(V.dp(720.0f)).setMinSpacing(V.dp(32.0f)).windowBackgroundResource(17170443), args);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        this.mVideo = (VideoFile) getArguments().getParcelable("video");
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.video_edit, container, false);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(R.string.edit_video);
        getToolbar().setNavigationIcon(R.drawable.ic_temp_close);
        getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
        this.mContainer = (ViewGroup) view.findViewById(R.id.scroll_container);
        this.mTitle = (EditText) view.findViewById(R.id.title);
        this.mSubtitle = (EditText) view.findViewById(R.id.subtitle);
        this.mTitle.addTextChangedListener(this);
        this.mPrivacyValue = (TextView) view.findViewById(R.id.privacy_subtitle);
        this.mPrivacyCommentValue = (TextView) view.findViewById(R.id.privacy_subtitle_comment);
        View privacy = view.findViewById(R.id.privacy);
        View privacyComment = view.findViewById(R.id.privacy_comment);
        privacy.setOnClickListener(this);
        privacyComment.setOnClickListener(this);
        if (this.mVideo != null) {
            this.mTitle.setText(this.mVideo.title);
            this.mTitle.setSelection(this.mTitle.length());
            this.mSubtitle.setText(this.mVideo.descr);
            this.mSubtitle.setSelection(this.mSubtitle.length());
            if (this.mVideo.oid < 0) {
                privacy.setVisibility(8);
                privacyComment.setVisibility(8);
            }
        }
        this.mPrivacy.possibleRules = Arrays.asList("all", "friends", "friends_of_friends", NativeProtocol.AUDIENCE_ME, "some");
        this.mPrivacy.title = getString(R.string.edit_video_privacy);
        this.mPrivacy.value = this.mVideo != null ? this.mVideo.privacy : Arrays.asList(PrivacySetting.ALL);
        this.mPrivacyValue.setText(this.mPrivacy.getDisplayString());
        this.mPrivacyComment.possibleRules = Arrays.asList("all", "friends", "friends_of_friends", NativeProtocol.AUDIENCE_ME, "some");
        this.mPrivacyComment.title = getString(R.string.edit_video_privacy_comments);
        this.mPrivacyComment.value = this.mVideo != null ? this.mVideo.privacyComment : Arrays.asList(PrivacySetting.ALL);
        this.mPrivacyCommentValue.setText(this.mPrivacyComment.getDisplayString());
        updateDecorator();
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        this.mDoneItem = menu.add(0, R.id.done, 0, R.string.done);
        MenuItem menuItem = this.mDoneItem;
        Drawable drawable = getResources().getDrawable(R.drawable.ic_check_24dp);
        this.mDoneDrawable = drawable;
        menuItem.setIcon(drawable).setShowAsAction(2);
        this.mDoneItem.setEnabled(this.mDoneEnabled);
        this.mDoneDrawable.setAlpha(this.mDoneEnabled ? 255 : TransportMediator.KEYCODE_MEDIA_PAUSE);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.done) {
            onDone();
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.privacy /* 2131755723 */:
                new PrivacyEditFragment.Builder().setSetting(this.mPrivacy).forResult(this, 103);
                return;
            case R.id.privacy_comment /* 2131756412 */:
                new PrivacyEditFragment.Builder().setSetting(this.mPrivacyComment).forResult(this, 104);
                return;
            default:
                return;
        }
    }

    @Override // android.text.TextWatcher
    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
    }

    @Override // android.text.TextWatcher
    public void onTextChanged(CharSequence s, int start, int before, int count) {
    }

    @Override // android.text.TextWatcher
    public void afterTextChanged(Editable s) {
        Global.replaceEmoji(s);
        enableDone(s.toString().trim().length() > 0);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateDecorator();
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == -1) {
            switch (requestCode) {
                case 103:
                    PrivacySetting setting = (PrivacySetting) data.getParcelableExtra("setting");
                    if (setting != null) {
                        this.mPrivacy = setting;
                        this.mPrivacyValue.setText(this.mPrivacy.getDisplayString());
                        return;
                    }
                    return;
                case 104:
                    PrivacySetting setting2 = (PrivacySetting) data.getParcelableExtra("setting");
                    if (setting2 != null) {
                        this.mPrivacyComment = setting2;
                        this.mPrivacyCommentValue.setText(this.mPrivacyComment.getDisplayString());
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    }

    void updateDecorator() {
        for (int i = 0; i < this.mContainer.getChildCount(); i++) {
            Drawable bg = new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet);
            View c = this.mContainer.getChildAt(i);
            ViewUtils.setBackgroundWithViewPadding(c, bg);
        }
        int pad = this.scrW >= 924 ? V.dp(32.0f) : 0;
        this.mContainer.setPadding(pad, 0, pad, 0);
    }

    void enableDone(boolean enable) {
        if (enable != this.mDoneEnabled) {
            this.mDoneEnabled = enable;
            if (this.mDoneDrawable != null) {
                this.mDoneDrawable.setAlpha(this.mDoneEnabled ? 255 : TransportMediator.KEYCODE_MEDIA_PAUSE);
            }
            if (this.mDoneItem != null) {
                this.mDoneItem.setEnabled(this.mDoneEnabled);
            }
        }
    }

    void onDone() {
        final String title = this.mTitle.getText().toString();
        final String description = this.mSubtitle.getText().toString();
        if (this.mVideo != null) {
            new VideoEdit(this.mVideo, title, description, this.mPrivacy.getApiValue(), this.mPrivacyComment.getApiValue()).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.videos.VideoEditorFragment.1
                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    VideoEditorFragment.this.mVideo.title = title;
                    VideoEditorFragment.this.mVideo.descr = description;
                    VideoEditorFragment.this.mVideo.privacy = VideoEditorFragment.this.mPrivacy.value;
                    VideoEditorFragment.this.mVideo.privacyComment = VideoEditorFragment.this.mPrivacyComment.value;
                    Intent intent = new Intent();
                    intent.putExtra("video", VideoEditorFragment.this.mVideo);
                    VideoEditorFragment.this.getActivity().setResult(-1, intent);
                    VideoEditorFragment.this.getActivity().finish();
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        }
    }
}
