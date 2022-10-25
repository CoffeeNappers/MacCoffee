package com.vkontakte.android.fragments.photos;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;
import com.facebook.internal.NativeProtocol;
import com.vkontakte.android.R;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.photos.PhotosCreateAlbum;
import com.vkontakte.android.api.photos.PhotosEditAlbum;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.fragments.PrivacyEditFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.cardview.CardDrawable;
import java.util.Arrays;
import me.grishka.appkit.fragments.ToolbarFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class EditAlbumFragment extends ToolbarFragment {
    private static final int PRIVACY_COMMENT_RESULT = 8296;
    private static final int PRIVACY_VIEW_RESULT = 8295;
    private PhotoAlbum album;
    private EditText description;
    private View groupPrivacyBtn;
    private CheckBox groupPrivacyCheck;
    private View groupPrivacyCommentBtn;
    private CheckBox groupPrivacyCommentCheck;
    private int oid;
    private View privacyBtn;
    private View privacyCommentBtn;
    private TextView privacyCommentsSpinner;
    private TextView privacySpinner;
    private EditText title;
    private View view;

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.album = (PhotoAlbum) getArguments().getParcelable(ArgKeys.ALBUM);
        this.oid = getArguments().getInt("owner_id");
        if (this.album != null) {
            this.oid = this.album.oid;
        }
        setTitle(this.album != null ? R.string.edit_album : R.string.create_album);
        setHasOptionsMenu(true);
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        MenuItem item = menu.add(R.string.save);
        item.setIcon(R.drawable.ic_check_24dp);
        item.setShowAsAction(2);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        save();
        return true;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void onToolbarNavigationClick() {
        getActivity().finish();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateConfiguration();
        updateDecorator();
    }

    private void updateDecorator() {
        ViewGroup vg = (ViewGroup) ((ViewGroup) this.view).getChildAt(0);
        for (int i = 0; i < vg.getChildCount(); i++) {
            Drawable bg = new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet);
            View c = vg.getChildAt(i);
            c.setBackgroundDrawable(bg);
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) c.getLayoutParams();
            lp.topMargin = V.dp(3.0f);
            lp.bottomMargin = V.dp(2.0f);
        }
        int pad = this.scrW >= 924 ? V.dp(32.0f) : 0;
        vg.setPadding(pad, 0, pad, 0);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (!getArguments().getBoolean("_split")) {
            getToolbar().setNavigationIcon(R.drawable.ic_ab_back);
        }
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.view = inflater.inflate(R.layout.photo_album_edit, (ViewGroup) null);
        this.title = (EditText) this.view.findViewById(R.id.title);
        this.description = (EditText) this.view.findViewById(R.id.description);
        this.privacySpinner = (TextView) this.view.findViewById(R.id.album_privacy_text);
        this.privacyCommentsSpinner = (TextView) this.view.findViewById(R.id.album_privacy_comment_text);
        PrivacySetting viewPrivacy = new PrivacySetting();
        viewPrivacy.possibleRules = Arrays.asList("all", "friends", "friends_of_friends", NativeProtocol.AUDIENCE_ME, "some");
        viewPrivacy.title = getString(R.string.create_album_privacy);
        viewPrivacy.value = this.album != null ? this.album.privacy : Arrays.asList(PrivacySetting.ALL);
        PrivacySetting commentPrivacy = new PrivacySetting();
        commentPrivacy.possibleRules = Arrays.asList("all", "friends", "friends_of_friends", NativeProtocol.AUDIENCE_ME, "some");
        commentPrivacy.title = getString(R.string.create_album_privacy_comments);
        commentPrivacy.value = this.album != null ? this.album.privacyComment : Arrays.asList(PrivacySetting.ALL);
        this.privacyBtn = this.view.findViewById(R.id.album_privacy);
        this.privacyCommentBtn = this.view.findViewById(R.id.album_privacy_comment);
        this.privacyBtn.setOnClickListener(EditAlbumFragment$$Lambda$1.lambdaFactory$(this));
        this.privacyCommentBtn.setOnClickListener(EditAlbumFragment$$Lambda$2.lambdaFactory$(this));
        this.privacyBtn.setTag(viewPrivacy);
        this.privacyCommentBtn.setTag(commentPrivacy);
        this.groupPrivacyBtn = this.view.findViewById(R.id.photo_album_community_privacy_wrap);
        this.groupPrivacyCommentBtn = this.view.findViewById(R.id.photo_album_community_privacy_comment_wrap);
        this.groupPrivacyCheck = (CheckBox) this.view.findViewById(R.id.photo_album_community_privacy);
        this.groupPrivacyCommentCheck = (CheckBox) this.view.findViewById(R.id.photo_album_community_privacy_comment);
        if (this.oid < 0) {
            this.privacyBtn.setVisibility(8);
            this.privacyCommentBtn.setVisibility(8);
        } else {
            this.groupPrivacyBtn.setVisibility(8);
            this.groupPrivacyCommentBtn.setVisibility(8);
        }
        if (this.album != null) {
            this.title.setText(this.album.title);
            this.description.setText(this.album.descr);
            this.privacySpinner.setText(viewPrivacy.getDisplayString());
            this.privacyCommentsSpinner.setText(commentPrivacy.getDisplayString());
            this.groupPrivacyCheck.setChecked(this.album.uploadByAdminsOnly);
            this.groupPrivacyCommentCheck.setChecked(this.album.commentsDisabled);
        }
        return this.view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateContentView$0(View v) {
        new PrivacyEditFragment.Builder().setSetting((PrivacySetting) v.getTag()).forResult(this, PRIVACY_VIEW_RESULT);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateContentView$1(View v) {
        new PrivacyEditFragment.Builder().setSetting((PrivacySetting) v.getTag()).forResult(this, PRIVACY_COMMENT_RESULT);
    }

    @Override // me.grishka.appkit.fragments.ToolbarFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = super.onCreateView(inflater, container, savedInstanceState);
        this.content.setScrollBarStyle(33554432);
        updateConfiguration();
        updateDecorator();
        return v;
    }

    private void save() {
        PhotosEditAlbum r;
        PhotosCreateAlbum r2;
        if (this.album == null) {
            if (this.oid > 0) {
                r2 = new PhotosCreateAlbum(this.title.getText().toString(), this.description.getText().toString(), ((PrivacySetting) this.privacyBtn.getTag()).getApiValue(), ((PrivacySetting) this.privacyCommentBtn.getTag()).getApiValue(), this.oid);
            } else {
                r2 = new PhotosCreateAlbum(this.title.getText().toString(), this.description.getText().toString(), this.groupPrivacyCheck.isChecked(), this.groupPrivacyCommentCheck.isChecked(), this.oid);
            }
            r2.setCallback(new SimpleCallback<PhotoAlbum>(getActivity()) { // from class: com.vkontakte.android.fragments.photos.EditAlbumFragment.1
                @Override // com.vkontakte.android.api.Callback
                public void success(PhotoAlbum result) {
                    Intent r3 = new Intent();
                    r3.putExtra(ArgKeys.ALBUM, result);
                    EditAlbumFragment.this.getActivity().setResult(-1, r3);
                    EditAlbumFragment.this.getActivity().finish();
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
            return;
        }
        if (this.oid > 0) {
            r = new PhotosEditAlbum(this.album.id, this.title.getText().toString(), this.description.getText().toString(), ((PrivacySetting) this.privacyBtn.getTag()).getApiValue(), ((PrivacySetting) this.privacyCommentBtn.getTag()).getApiValue(), this.oid);
        } else {
            r = new PhotosEditAlbum(this.album.id, this.title.getText().toString(), this.description.getText().toString(), this.groupPrivacyCheck.isChecked(), this.groupPrivacyCommentCheck.isChecked(), this.oid);
        }
        r.setCallback(new ResultlessCallback() { // from class: com.vkontakte.android.fragments.photos.EditAlbumFragment.2
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                EditAlbumFragment.this.album.title = EditAlbumFragment.this.title.getText().toString();
                EditAlbumFragment.this.album.descr = EditAlbumFragment.this.description.getText().toString();
                EditAlbumFragment.this.album.privacy = ((PrivacySetting) EditAlbumFragment.this.privacyBtn.getTag()).value;
                EditAlbumFragment.this.album.privacyComment = ((PrivacySetting) EditAlbumFragment.this.privacyCommentBtn.getTag()).value;
                EditAlbumFragment.this.album.canUpload = EditAlbumFragment.this.groupPrivacyCheck.isChecked();
                EditAlbumFragment.this.album.commentsDisabled = EditAlbumFragment.this.groupPrivacyCommentCheck.isChecked();
                Intent r3 = new Intent();
                r3.putExtra(ArgKeys.ALBUM, EditAlbumFragment.this.album);
                EditAlbumFragment.this.getActivity().setResult(-1, r3);
                EditAlbumFragment.this.getActivity().finish();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        PrivacySetting commentPrivacy;
        PrivacySetting viewPrivacy;
        if (reqCode == PRIVACY_VIEW_RESULT && resCode == -1 && (viewPrivacy = (PrivacySetting) data.getParcelableExtra("setting")) != null) {
            this.privacySpinner.setText(viewPrivacy.getDisplayString());
            this.privacyBtn.setTag(viewPrivacy);
        }
        if (reqCode == PRIVACY_COMMENT_RESULT && resCode == -1 && (commentPrivacy = (PrivacySetting) data.getParcelableExtra("setting")) != null) {
            this.privacyCommentsSpinner.setText(commentPrivacy.getDisplayString());
            this.privacyCommentBtn.setTag(commentPrivacy);
        }
    }
}
