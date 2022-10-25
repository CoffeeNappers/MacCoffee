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
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoAlbum;
import com.vkontakte.android.api.video.VideoAddAlbum;
import com.vkontakte.android.api.video.VideoEditAlbum;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.fragments.PrivacyEditFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.cardview.CardDrawable;
import java.util.Arrays;
import me.grishka.appkit.fragments.ContainerFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class AlbumEditorFragment extends ContainerFragment implements TextWatcher, View.OnClickListener {
    static final int PRIVACY_RESULT = 103;
    VideoAlbum mAlbum;
    ViewGroup mContainer;
    Drawable mDoneDrawable;
    MenuItem mDoneItem;
    int mOwnerId;
    TextView mPrivacySubtitle;
    TextView mPrivacyTitle;
    EditText mTitle;
    PrivacySetting mPrivacy = new PrivacySetting();
    boolean mDoneEnabled = false;

    /* loaded from: classes3.dex */
    public static class Builder extends Navigator {
        private Builder() {
            super(AlbumEditorFragment.class, new TabletDialogActivity.Builder().setGravity(17).setInputMode(16).setMaxWidth(V.dp(720.0f)).setPreferredHeight(V.dp(350.0f)).setMinSpacing(V.dp(32.0f)).windowBackgroundResource(17170443));
        }

        Builder setOwnerId(int ownerId) {
            this.args.putInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, ownerId);
            return this;
        }

        public Builder attachAlbum(VideoAlbum album) {
            this.args.putParcelable(ArgKeys.ALBUM, album);
            return setOwnerId(album.ownerID);
        }
    }

    public static Builder create(int ownerId) {
        return new Builder().setOwnerId(ownerId);
    }

    public static Builder edit(VideoAlbum album) {
        return new Builder().attachAlbum(album);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        this.mAlbum = (VideoAlbum) getArguments().getParcelable(ArgKeys.ALBUM);
        this.mOwnerId = getArguments().getInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID);
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.video_album_edit, container, false);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(this.mAlbum != null ? R.string.edit_album : R.string.new_album);
        getToolbar().setNavigationIcon(R.drawable.ic_temp_close);
        getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
        this.mContainer = (ViewGroup) view.findViewById(R.id.scroll_container);
        this.mTitle = (EditText) view.findViewById(R.id.title);
        this.mTitle.addTextChangedListener(this);
        this.mPrivacyTitle = (TextView) view.findViewById(R.id.privacy_title);
        this.mPrivacySubtitle = (TextView) view.findViewById(R.id.privacy_subtitle);
        View mPrivacyView = view.findViewById(R.id.privacy);
        mPrivacyView.setOnClickListener(this);
        if (this.mAlbum != null) {
            this.mTitle.setText(this.mAlbum.title);
            this.mTitle.setSelection(this.mTitle.length());
        }
        this.mPrivacy.possibleRules = Arrays.asList("all", "friends", "friends_of_friends", NativeProtocol.AUDIENCE_ME, "some");
        this.mPrivacy.title = getString(R.string.edit_video_privacy);
        this.mPrivacy.value = this.mAlbum != null ? this.mAlbum.privacy : Arrays.asList(PrivacySetting.ALL);
        this.mPrivacySubtitle.setText(this.mPrivacy.getDisplayString());
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
        enableDone(s.toString().trim().length() > 0);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateDecorator();
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        PrivacySetting setting;
        if (requestCode == 103 && resultCode == -1 && (setting = (PrivacySetting) data.getParcelableExtra("setting")) != null) {
            this.mPrivacy = setting;
            this.mPrivacySubtitle.setText(this.mPrivacy.getDisplayString());
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
        if (this.mAlbum == null) {
            new VideoAddAlbum(this.mOwnerId, title, this.mPrivacy.getApiValue()).setCallback(new SimpleCallback<Integer>(getActivity()) { // from class: com.vkontakte.android.fragments.videos.AlbumEditorFragment.1
                @Override // com.vkontakte.android.api.Callback
                public void success(Integer result) {
                    VideoAlbum album = new VideoAlbum();
                    album.count = 0;
                    album.id = result.intValue();
                    album.ownerID = AlbumEditorFragment.this.mOwnerId;
                    album.privacy = AlbumEditorFragment.this.mPrivacy.value;
                    album.title = title;
                    album.lastUpdated = TimeUtils.getCurrentTime();
                    Intent intent = new Intent();
                    intent.putExtra(ArgKeys.ALBUM, album);
                    AlbumEditorFragment.this.getActivity().setResult(-1, intent);
                    AlbumEditorFragment.this.getActivity().finish();
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        } else {
            new VideoEditAlbum(this.mOwnerId, this.mAlbum.id, title, this.mPrivacy.getApiValue()).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.videos.AlbumEditorFragment.2
                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    super.fail(error);
                }

                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    AlbumEditorFragment.this.mAlbum.title = title;
                    AlbumEditorFragment.this.mAlbum.privacy = AlbumEditorFragment.this.mPrivacy.value;
                    Intent intent = new Intent();
                    intent.putExtra(ArgKeys.ALBUM, AlbumEditorFragment.this.mAlbum);
                    AlbumEditorFragment.this.getActivity().setResult(-1, intent);
                    AlbumEditorFragment.this.getActivity().finish();
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        }
    }
}
