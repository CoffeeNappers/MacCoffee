package com.vkontakte.android.fragments.news;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.provider.Settings;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.v4.media.TransportMediator;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.inputmethod.InputMethodManager;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.common.util.UriUtil;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.attachpicker.AttachIntent;
import com.vk.attachpicker.PhotoVideoAttachActivity;
import com.vkontakte.android.Global;
import com.vkontakte.android.ImagePickerActivity;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.board.BoardComment;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AudioAttachment;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.LinkAttachment;
import com.vkontakte.android.attachments.PendingPhotoAttachment;
import com.vkontakte.android.attachments.PendingVideoAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.PollAttachment;
import com.vkontakte.android.attachments.SignatureLinkAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.AudioListFragment;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.fragments.DateTimePickerDialogFragment;
import com.vkontakte.android.fragments.documents.DocumentsFragmentBuilder;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import com.vkontakte.android.fragments.location.CheckInFragment;
import com.vkontakte.android.fragments.location.SelectGeoPointFragment;
import com.vkontakte.android.fragments.videos.VideosFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.AttachmentsEditorView;
import com.vkontakte.android.ui.WriteBar;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.UploadUtils;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import me.grishka.appkit.fragments.ContainerFragment;
import me.grishka.appkit.utils.V;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class NewPostFragment extends ContainerFragment implements BackListener {
    public static final int POLL_EDIT_RESULT = 9;
    AttachmentsEditorView attachView;
    View bottomBar;
    View divider;
    View locationBar;
    Parcelable[] mAttachments;
    boolean mCamera;
    ClipboardManager mClipboardManager;
    NewsEntry mEdit;
    View mFbIcon;
    boolean mForbidAttachmentsEdit;
    View mFriendsOnlyIcon;
    String mGroupPhoto;
    String mGroupTitle;
    ImageView mLocation;
    TextView mLocationAddress;
    ArrayList<String> mPhotos;
    boolean mPublic;
    boolean mSendAction;
    boolean mSendEnabled;
    Drawable mSendIcon;
    MenuItem mSendItem;
    View mSettings;
    TextView mSignatureText;
    EditText mStatusEdit;
    boolean mSuggest;
    View mTwitterIcon;
    ListView optionsAlertView;
    Uri photoURI;
    String text;
    final Presenter mPresenter = new Presenter();
    int mSendText = R.string.send;
    int uid = 0;

    /* loaded from: classes3.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(NewPostFragment.class, new TabletDialogActivity.Builder().setGravity(17).setPreferredHeight(V.dp(450.0f)).setInputMode(16).setMaxWidth(V.dp(720.0f)).setMinSpacing(V.dp(32.0f)).windowBackgroundResource(17170443));
        }

        public Builder setBoardComment(BoardComment boardComment, int topicId, int groupId) {
            NewsEntry ce = new NewsEntry();
            ce.extra.putInt("topic_id", topicId);
            ce.extra.putInt("group_id", groupId);
            ce.extra.putParcelable("comment", boardComment);
            ce.text = boardComment.text;
            ce.attachments = boardComment.attachments;
            ce.type = 14;
            attachPost(ce);
            return this;
        }

        public Builder setMarketComment(BoardComment boardComment, int groupId) {
            NewsEntry ce = new NewsEntry();
            ce.extra.putInt("group_id", groupId);
            ce.extra.putParcelable("comment", boardComment);
            ce.text = boardComment.text;
            ce.attachments = boardComment.attachments;
            ce.type = 17;
            attachPost(ce);
            return this;
        }

        public Builder attachPhotos(ArrayList<String> photos) {
            this.args.putStringArrayList("photos", photos);
            return this;
        }

        public Builder attachAttachments(Attachment[] attachments) {
            this.args.putParcelableArray("attachments", attachments);
            return this;
        }

        public Builder attachPost(NewsEntry post) {
            this.args.putParcelable("edit", post);
            return this;
        }

        public Builder attachPhoto(Uri photo) {
            this.args.putParcelable("photoURI", photo);
            return this;
        }

        public Builder attachText(@Nullable String text) {
            this.args.putString("text", text);
            return this;
        }

        public Builder attachCamera(boolean camera) {
            this.args.putBoolean("camera", camera);
            return this;
        }

        public Builder attachGroup(@Nullable Group group) {
            if (group != null) {
                return attachGroup(group.name, group.photo);
            }
            return this;
        }

        public Builder attachGroup(@NonNull String name, @NonNull String photo) {
            this.args.putString("group_title", name);
            this.args.putString("group_photo", photo);
            return this;
        }

        public Builder isPublic(boolean isPublic) {
            this.args.putBoolean("public", isPublic);
            return this;
        }

        public Builder uid(int uid) {
            this.args.putInt(ArgKeys.UID, uid);
            return this;
        }

        public Builder suggest(boolean suggest) {
            this.args.putBoolean("suggest", suggest);
            return this;
        }

        public Builder send(boolean send) {
            this.args.putBoolean("send_action", send);
            return this;
        }

        public Builder forbidAttachmentsEdit(boolean forbid) {
            this.args.putBoolean("forbid_attach_edit", forbid);
            return this;
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        this.mClipboardManager = (ClipboardManager) getActivity().getSystemService("clipboard");
        this.mEdit = (NewsEntry) getArguments().getParcelable("edit");
        this.mSuggest = getArguments().getBoolean("suggest", this.mSuggest);
        this.mPublic = getArguments().getBoolean("public", this.mPublic);
        this.mSendAction = getArguments().getBoolean("send_action", this.mSendAction);
        this.mGroupTitle = getArguments().getString("group_title");
        this.mGroupPhoto = getArguments().getString("group_photo");
        this.mCamera = getArguments().getBoolean("camera");
        this.uid = getArguments().getInt(ArgKeys.UID, VKAccountManager.getCurrent().getUid());
        this.text = getArguments().getString("text");
        this.photoURI = (Uri) getArguments().getParcelable("photoURI");
        this.mPhotos = getArguments().getStringArrayList("photos");
        this.mAttachments = getArguments().getParcelableArray("attachments");
        this.mForbidAttachmentsEdit = getArguments().getBoolean("forbid_attach_edit");
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.update_status, container, false);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (this.mSuggest) {
            setTitle(R.string.profile_suggest_post);
        } else if (this.mEdit != null) {
            setTitle(R.string.post_edit_title);
        } else {
            setTitle(R.string.new_status);
        }
        getToolbar().setNavigationIcon(R.drawable.ic_temp_close);
        getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
        this.mStatusEdit = (EditText) view.findViewById(R.id.status_text_edit);
        this.mFbIcon = view.findViewById(R.id.newpost_fb_icon);
        this.mTwitterIcon = view.findViewById(R.id.newpost_twitter_icon);
        this.mFriendsOnlyIcon = view.findViewById(R.id.newpost_friends_only);
        this.mLocation = (ImageView) view.findViewById(R.id.newpost_btn_location);
        this.mLocationAddress = (TextView) view.findViewById(R.id.newpost_location_address);
        this.mSettings = view.findViewById(R.id.newpost_btn_settings);
        this.mSignatureText = (TextView) view.findViewById(R.id.attach_title);
        this.mStatusEdit.addTextChangedListener(this.mPresenter);
        view.findViewById(R.id.newpost_btn_photo).setOnClickListener(this.mPresenter);
        view.findViewById(R.id.newpost_btn_location).setOnClickListener(this.mPresenter);
        view.findViewById(R.id.newpost_btn_settings).setOnClickListener(this.mPresenter);
        view.findViewById(R.id.newpost_btn_mention).setOnClickListener(this.mPresenter);
        view.findViewById(R.id.newpost_btn_attach).setOnClickListener(this.mPresenter);
        this.mLocation.setImageDrawable(new RecoloredDrawable(this.mLocation.getDrawable(), getResources().getColorStateList(R.color.newpost_button)));
        this.attachView = (AttachmentsEditorView) view.findViewById(R.id.newpost_attachments);
        this.attachView.forbidAttachmentsEdit = this.mForbidAttachmentsEdit;
        this.attachView.isWallPhoto = true;
        this.attachView.uploadOwnerId = this.uid;
        this.attachView.setCallback(this.mPresenter);
        this.locationBar = view.findViewById(R.id.location_bar);
        this.divider = view.findViewById(R.id.divider);
        this.bottomBar = view.findViewById(R.id.bottom_bar);
        ViewUtils.setNoClipRecursive(view.findViewById(R.id.newpost_scroll));
        this.mLocationAddress.setVisibility(8);
        showKeyboard();
        this.mPresenter.setupInitialData();
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        this.mSendItem = menu.add(0, R.id.done, 0, this.mSendText);
        this.mSendIcon = getResources().getDrawable(R.drawable.ic_check_24dp);
        this.mSendItem.setShowAsAction(2);
        this.mSendItem.setIcon(this.mSendIcon);
        this.mSendItem.setEnabled(this.mSendEnabled);
        this.mSendIcon.setAlpha(this.mSendEnabled ? 255 : TransportMediator.KEYCODE_MEDIA_PAUSE);
        this.mSendItem.setTitle(this.mSendText);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.done) {
            this.mPresenter.send();
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        showKeyboard();
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        return this.mPresenter.onBackPressed();
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent intent) {
        super.onActivityResult(requestCode, resultCode, intent);
        this.mPresenter.onActivityResult(requestCode, resultCode, intent);
    }

    void showKeyboard() {
        InputMethodManager imm = (InputMethodManager) getActivity().getSystemService("input_method");
        if (imm.isAcceptingText()) {
            this.mStatusEdit.postDelayed(NewPostFragment$$Lambda$1.lambdaFactory$(this, imm), 200L);
        }
    }

    public /* synthetic */ void lambda$showKeyboard$0(InputMethodManager imm) {
        imm.showSoftInput(this.mStatusEdit, 1);
    }

    /* loaded from: classes3.dex */
    public class Presenter implements View.OnClickListener, TextWatcher, AttachmentsEditorView.Callback {
        static final int AUDIO_RESULT = 4;
        static final int DOCUMENT_RESULT = 6;
        static final int LOCATION_RESULT = 3;
        static final int MENTION_RESULT = 7;
        static final int PHOTO_RESULT = 1;
        public static final int POLL_RESULT = 8;
        static final int VIDEO_EXISTING_RESULT = 11;
        static final int VIDEO_NEW_RESULT = 10;
        static final int VIDEO_RESULT = 5;
        boolean changed;
        boolean exportToFacebook;
        boolean exportToTwitter;
        boolean friendsOnly;
        boolean fromGroup;
        GeoAttachment geoAttach;
        boolean isComment;
        boolean isSuggest;
        Calendar postponeTo;
        boolean publishing;
        Attachment sigAttach;
        boolean signedFromGroup;

        private Presenter() {
            NewPostFragment.this = r2;
            this.publishing = false;
            this.fromGroup = false;
            this.signedFromGroup = false;
            this.isComment = false;
            this.changed = false;
            this.friendsOnly = false;
            this.exportToTwitter = false;
            this.exportToFacebook = false;
        }

        @Override // com.vkontakte.android.ui.AttachmentsEditorView.Callback
        public void onUploadFailed() {
            updateSendButton();
        }

        @Override // com.vkontakte.android.ui.AttachmentsEditorView.Callback
        public void onAttachmentRemoved(Attachment att) {
            updateSendButton();
            if (NewPostFragment.this.attachView.getCount() == 0) {
                showAttachView(false);
            }
            this.changed = true;
        }

        @Override // com.vkontakte.android.ui.AttachmentsEditorView.Callback
        public void onAllUploadsDone() {
            updateSendButton();
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
            ClipData data;
            String link;
            if (count > 1 && NewPostFragment.this.mClipboardManager.hasPrimaryClip()) {
                boolean hasLinkAttachment = false;
                Iterator<Attachment> it = NewPostFragment.this.attachView.getAll().iterator();
                while (it.hasNext()) {
                    Attachment attachment = it.next();
                    if (attachment instanceof LinkAttachment) {
                        hasLinkAttachment = true;
                    }
                }
                if (!hasLinkAttachment && (data = NewPostFragment.this.mClipboardManager.getPrimaryClip()) != null && data.getItemCount() > 0) {
                    ClipData.Item item = data.getItemAt(data.getItemCount() - 1);
                    if (item != null && item.getText() != null) {
                        String clipLink = item.getText().toString();
                        if (!TextUtils.isEmpty(clipLink) && (link = LinkParser.tryExtractLink(s.toString())) != null && link.equals(clipLink)) {
                            Log.d("vk", "LINK " + link);
                            NewPostFragment.this.attachView.add(new LinkAttachment(link, "", ""));
                            showAttachView(true);
                        }
                    } else {
                        return;
                    }
                }
            }
            updateSendButton();
            showAttachView(NewPostFragment.this.attachView.getVisibility() == 0);
            this.changed = true;
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
            Global.replaceEmoji(s);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.newpost_btn_location /* 2131756402 */:
                    if (this.geoAttach == null) {
                        startLocationChooser();
                        return;
                    } else {
                        new VKAlertDialog.Builder(NewPostFragment.this.getActivity()).setTitle(R.string.place).setItems(new String[]{NewPostFragment.this.getString(R.string.edit), NewPostFragment.this.getString(R.string.delete)}, NewPostFragment$Presenter$$Lambda$1.lambdaFactory$(this)).show();
                        return;
                    }
                case R.id.newpost_btn_mention /* 2131756403 */:
                    startMentionChooser();
                    return;
                case R.id.newpost_btn_photo /* 2131756404 */:
                    if (checkAttachLimit()) {
                        startPhotoChooser();
                        return;
                    }
                    return;
                case R.id.newpost_btn_attach /* 2131756405 */:
                    showExtendedAttachMenu();
                    return;
                case R.id.newpost_btn_settings /* 2131756406 */:
                    showOptions();
                    return;
                default:
                    return;
            }
        }

        public /* synthetic */ void lambda$onClick$0(DialogInterface dialog, int which) {
            switch (which) {
                case 0:
                    startLocationChooser();
                    return;
                case 1:
                    removeLocation();
                    return;
                default:
                    return;
            }
        }

        void send() {
            this.publishing = true;
            if (NewPostFragment.this.mEdit != null && (NewPostFragment.this.mEdit.type == 14 || NewPostFragment.this.mEdit.type == 17)) {
                saveComment(NewPostFragment.this.mEdit.type);
            } else {
                post();
            }
        }

        void sendEnabled(boolean enabled) {
            if (enabled != NewPostFragment.this.mSendEnabled) {
                NewPostFragment.this.mSendEnabled = enabled;
                NewPostFragment.this.invalidateOptionsMenu();
                if (NewPostFragment.this.mSendItem != null) {
                    NewPostFragment.this.mSendItem.setEnabled(enabled);
                }
                if (NewPostFragment.this.mSendIcon != null) {
                    NewPostFragment.this.mSendIcon.setAlpha(enabled ? 255 : TransportMediator.KEYCODE_MEDIA_PAUSE);
                }
            }
        }

        void sendText(@StringRes int text) {
            NewPostFragment.this.mSendText = text;
            NewPostFragment.this.invalidateOptionsMenu();
            if (NewPostFragment.this.mSendItem != null) {
                NewPostFragment.this.mSendItem.setTitle(NewPostFragment.this.mSendText);
            }
        }

        void startPhotoChooser() {
            Intent intent = new Intent(NewPostFragment.this.getActivity(), ImagePickerActivity.class);
            intent.putExtra(ArgKeys.LIMIT, (this.isComment ? 2 : 10) - NewPostFragment.this.attachView.getCount());
            NewPostFragment.this.startActivityForResult(intent, 1);
        }

        void startCamera() {
            Intent intent = new Intent(NewPostFragment.this.getActivity(), ImagePickerActivity.class);
            intent.putExtra(ServerKeys.TYPE, 0);
            NewPostFragment.this.startActivityForResult(intent, 1);
        }

        void setupInitialData() {
            if (NewPostFragment.this.mSendAction) {
                try {
                    String txt = NewPostFragment.this.text;
                    String link = null;
                    if (txt != null) {
                        Matcher m = LinkParser.URL_PATTERN.matcher(txt);
                        if (m.find()) {
                            link = m.group();
                            txt = m.replaceFirst("").trim();
                        }
                    } else {
                        txt = "";
                    }
                    Log.d("vk", "LINK " + link);
                    if (NewPostFragment.this.mAttachments != null) {
                        for (int i = 0; i < NewPostFragment.this.mAttachments.length; i++) {
                            NewPostFragment.this.attachView.add((Attachment) NewPostFragment.this.mAttachments[i]);
                        }
                        if (NewPostFragment.this.mAttachments.length > 0) {
                            showAttachView(true);
                        }
                    }
                    boolean hasLinkAttachment = false;
                    Iterator<Attachment> it = NewPostFragment.this.attachView.getAll().iterator();
                    while (it.hasNext()) {
                        Attachment attachment = it.next();
                        if (attachment instanceof LinkAttachment) {
                            hasLinkAttachment = true;
                        }
                    }
                    if (!hasLinkAttachment && link != null) {
                        NewPostFragment.this.attachView.add(new LinkAttachment(link, "", ""));
                        showAttachView(true);
                    }
                    NewPostFragment.this.mStatusEdit.setText(txt);
                    NewPostFragment.this.mStatusEdit.setSelection(txt.length());
                    sendEnabled(true);
                    forbidAttachmentEditIfRequired();
                } catch (Exception e) {
                    Log.w("vk", "WTF you just did?!");
                }
            }
            if (NewPostFragment.this.photoURI != null) {
                NewPostFragment.this.attachView.add(new PendingPhotoAttachment(NewPostFragment.this.photoURI.toString()));
                sendEnabled(true);
                showAttachView(true);
            }
            if (NewPostFragment.this.mPhotos != null) {
                for (int i2 = 0; i2 < NewPostFragment.this.mPhotos.size(); i2++) {
                    String photo = NewPostFragment.this.mPhotos.get(i2);
                    NewPostFragment.this.attachView.add(new PendingPhotoAttachment(photo));
                }
                sendEnabled(true);
                showAttachView(true);
            }
            VKAccount account = VKAccountManager.getCurrent();
            if (NewPostFragment.this.uid == VKAccountManager.getCurrent().getUid() && NewPostFragment.this.mEdit == null) {
                if (account.isExportTwitterAvail()) {
                    this.exportToTwitter = true;
                }
                if (account.isExportFacebookAvail()) {
                    this.exportToFacebook = true;
                }
                updateExportIcons();
            } else {
                NewPostFragment.this.mFbIcon.setVisibility(8);
                NewPostFragment.this.mTwitterIcon.setVisibility(8);
                NewPostFragment.this.mFriendsOnlyIcon.setVisibility(8);
            }
            if (NewPostFragment.this.mPublic) {
                this.fromGroup = true;
            }
            if (NewPostFragment.this.mEdit != null) {
                String text = NewPostFragment.this.mEdit.text.replaceAll("<a href='vkontakte://profile/([0-9]+)'>([^<]+)</a>", "*id$1 ($2)").replaceAll("<a href='vkontakte://profile/-([0-9]+)'>([^<]+)</a>", "*club$1 ($2)").replaceAll("<a href='vklink://view/[^']+'>([^<]+)</a>", "$1").replaceAll("<a href='vkontakte://search/[^']+'>([^<]+)</a>", "$1");
                NewPostFragment.this.mStatusEdit.setText(text);
                NewPostFragment.this.mStatusEdit.setSelection(text.length());
                NewPostFragment.this.uid = NewPostFragment.this.mEdit.ownerID;
                boolean showAttachView = false;
                Iterator<Attachment> it2 = NewPostFragment.this.mEdit.attachments.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    Attachment att = it2.next();
                    if (att instanceof SignatureLinkAttachment) {
                        this.signedFromGroup = true;
                        this.sigAttach = att;
                        NewPostFragment.this.mEdit.attachments.remove(att);
                        NewPostFragment.this.mSignatureText.setText(((LinkAttachment) this.sigAttach).title);
                        NewPostFragment.this.mSignatureText.setVisibility(0);
                        break;
                    }
                }
                ArrayList<Attachment> attachments = NewPostFragment.this.mEdit.attachments;
                for (int i3 = 0; i3 < attachments.size(); i3++) {
                    Attachment att2 = attachments.get(i3);
                    if (!(att2 instanceof GeoAttachment)) {
                        NewPostFragment.this.attachView.add(att2);
                        showAttachView = true;
                    } else {
                        attachLocation((GeoAttachment) att2);
                    }
                }
                showAttachView(showAttachView);
                if (NewPostFragment.this.mEdit.ownerID < 0 && NewPostFragment.this.mEdit.userID != VKAccountManager.getCurrent().getUid()) {
                    this.fromGroup = true;
                }
                if (NewPostFragment.this.mEdit.type == 5) {
                    NewPostFragment.this.mSettings.setVisibility(8);
                    NewPostFragment.this.mLocation.setVisibility(8);
                    NewPostFragment.this.setTitle((int) R.string.edit);
                    this.isComment = true;
                }
                this.isSuggest = NewPostFragment.this.mEdit.flag(4096) && Groups.getAdminLevel(-NewPostFragment.this.mEdit.ownerID) >= 2;
                if (NewPostFragment.this.mEdit.flag(2048)) {
                    this.postponeTo = Calendar.getInstance();
                    this.postponeTo.setTimeInMillis(NewPostFragment.this.mEdit.time * 1000);
                    updateTimer();
                    sendText(R.string.timer_post_btn);
                    this.friendsOnly = NewPostFragment.this.mEdit.flag(512);
                    this.exportToTwitter = NewPostFragment.this.mEdit.flag(8192);
                    this.exportToFacebook = NewPostFragment.this.mEdit.flag(16384);
                    updateExportIcons();
                }
                if (this.isSuggest) {
                    NewPostFragment.this.mSignatureText.setText(NewPostFragment.this.mEdit.userName);
                    this.signedFromGroup = true;
                    NewPostFragment.this.mSignatureText.setVisibility(0);
                    updateFieldSize();
                }
                if (NewPostFragment.this.mEdit.createdBy > 0 && this.sigAttach == null) {
                    NewPostFragment.this.mSignatureText.setText("...");
                    ArrayList<Integer> uids = new ArrayList<>();
                    uids.add(Integer.valueOf(NewPostFragment.this.mEdit.createdBy));
                    Friends.getUsers(uids, NewPostFragment$Presenter$$Lambda$2.lambdaFactory$(this));
                }
            }
            if (((NewPostFragment.this.uid < 0 && Groups.getAdminLevel(-NewPostFragment.this.uid) < 2) || ((NewPostFragment.this.mEdit != null && !this.isSuggest && !NewPostFragment.this.mEdit.flag(2048)) || (NewPostFragment.this.uid > 0 && NewPostFragment.this.uid != VKAccountManager.getCurrent().getUid()))) && NewPostFragment.this.mSettings.getVisibility() == 0) {
                NewPostFragment.this.mSettings.setEnabled(false);
                AlphaAnimation aa = new AlphaAnimation(0.4f, 0.4f);
                aa.setFillAfter(true);
                NewPostFragment.this.mSettings.startAnimation(aa);
            }
            updateSendButton();
            if (NewPostFragment.this.attachView.getCount() == 0) {
                showAttachView(false);
            }
            NewPostFragment.this.attachView.postDelayed(NewPostFragment$Presenter$$Lambda$3.lambdaFactory$(this), 100L);
            if (!this.isSuggest && this.sigAttach == null) {
                NewPostFragment.this.mSignatureText.setText(account.getName());
            }
            if (NewPostFragment.this.mCamera) {
                startCamera();
            }
        }

        public /* synthetic */ void lambda$setupInitialData$2(ArrayList users) {
            if (users.size() > 0) {
                UserProfile signer = (UserProfile) users.get(0);
                NewPostFragment.this.mSignatureText.post(NewPostFragment$Presenter$$Lambda$17.lambdaFactory$(this, signer));
            }
        }

        public /* synthetic */ void lambda$null$1(UserProfile signer) {
            NewPostFragment.this.mSignatureText.setText(signer.fullName);
            this.sigAttach = new SignatureLinkAttachment("https://vkontakte.ru/id" + signer.uid, signer.fullName);
        }

        public /* synthetic */ void lambda$setupInitialData$3() {
            this.changed = false;
        }

        private void forbidAttachmentEditIfRequired() {
            if (NewPostFragment.this.mForbidAttachmentsEdit) {
                NewPostFragment.this.divider.setVisibility(8);
                NewPostFragment.this.bottomBar.setVisibility(8);
            }
        }

        void onActivityResult(int requestCode, int resultCode, Intent intent) {
            if (resultCode == -1) {
                this.changed = true;
                if (requestCode == 3) {
                    attachLocation((GeoAttachment) intent.getParcelableExtra("point"));
                } else {
                    NewPostFragment.this.attachView.postDelayed(NewPostFragment$Presenter$$Lambda$4.lambdaFactory$(this, requestCode, intent), 300L);
                }
            }
        }

        public /* synthetic */ void lambda$onActivityResult$4(int requestCode, Intent intent) {
            if (requestCode == 10 || requestCode == 11) {
                int duration = 0;
                try {
                    MediaMetadataRetriever mdr = new MediaMetadataRetriever();
                    mdr.setDataSource(NewPostFragment.this.getActivity(), intent.getData());
                    duration = Integer.parseInt(mdr.extractMetadata(9)) / 1000;
                    mdr.release();
                } catch (Exception x) {
                    android.util.Log.w("vk", "Error getting video duration!", x);
                }
                VideoFile vf = new VideoFile();
                Uri uri = intent.getData();
                if (uri.getScheme().equals(UriUtil.LOCAL_CONTENT_SCHEME)) {
                    vf.urlExternal = UploadUtils.resolvePath(uri);
                } else {
                    vf.urlExternal = uri.toString();
                }
                vf.urlBigThumb = "file://" + WriteBar.getRealPathFromURI(uri);
                if (TextUtils.isEmpty(vf.urlExternal)) {
                    Toast.makeText(NewPostFragment.this.getActivity(), (int) R.string.error, 0).show();
                    return;
                }
                vf.duration = duration;
                vf.title = UriUtil.LOCAL_FILE_SCHEME.equals(intent.getData().getScheme()) ? intent.getData().getLastPathSegment() : Uri.parse("file://" + UploadUtils.resolvePath(intent.getData())).getLastPathSegment();
                vf.vid = Upload.getNewID();
                PendingVideoAttachment pva = new PendingVideoAttachment(vf);
                NewPostFragment.this.attachView.add(pva);
                showAttachView(true);
            }
            if (requestCode == 1) {
                if (intent.hasExtra("attachment")) {
                    NewPostFragment.this.attachView.add((PhotoAttachment) intent.getParcelableExtra("attachment"));
                } else if (intent.hasExtra("files")) {
                    ArrayList<String> files = intent.getStringArrayListExtra("files");
                    Iterator<String> it = files.iterator();
                    while (it.hasNext()) {
                        String file = it.next();
                        NewPostFragment.this.attachView.add(new PendingPhotoAttachment(file));
                    }
                } else {
                    NewPostFragment.this.attachView.add(new PendingPhotoAttachment(intent.getStringExtra(UriUtil.LOCAL_FILE_SCHEME)));
                }
                showAttachView(true);
            }
            if (requestCode == 4) {
                MusicTrack af = (MusicTrack) intent.getParcelableExtra(MimeTypes.BASE_TYPE_AUDIO);
                NewPostFragment.this.attachView.add(new AudioAttachment(af));
                showAttachView(true);
            }
            if (requestCode == 5) {
                NewPostFragment.this.attachView.add(new VideoAttachment((VideoFile) intent.getParcelableExtra("video")));
                showAttachView(true);
            }
            if (requestCode == 6) {
                ArrayList<Parcelable> docs = intent.getParcelableArrayListExtra("documents");
                Iterator<Parcelable> it2 = docs.iterator();
                while (it2.hasNext()) {
                    NewPostFragment.this.attachView.add((Attachment) it2.next());
                }
                showAttachView(true);
            }
            if (requestCode == 7) {
                UserProfile p = (UserProfile) intent.getParcelableExtra(ProfileGiftsFragment.Extra.User);
                if (NewPostFragment.this.mEdit != null && (NewPostFragment.this.mEdit.type == 14 || NewPostFragment.this.mEdit.type == 17)) {
                    if (NewPostFragment.this.mStatusEdit.getSelectionEnd() != NewPostFragment.this.mStatusEdit.getSelectionStart()) {
                        NewPostFragment.this.mStatusEdit.getText().replace(NewPostFragment.this.mStatusEdit.getSelectionStart(), NewPostFragment.this.mStatusEdit.getSelectionEnd(), "[id" + p.uid + "|" + NewPostFragment.this.mStatusEdit + "]");
                    } else {
                        NewPostFragment.this.mStatusEdit.getText().insert(NewPostFragment.this.mStatusEdit.getSelectionEnd(), (NewPostFragment.this.mStatusEdit.getSelectionStart() == 0 ? "" : MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR) + "[id" + p.uid + "|" + p.fullName + "] ");
                    }
                } else if (NewPostFragment.this.mStatusEdit.getSelectionEnd() != NewPostFragment.this.mStatusEdit.getSelectionStart()) {
                    NewPostFragment.this.mStatusEdit.getText().replace(NewPostFragment.this.mStatusEdit.getSelectionStart(), NewPostFragment.this.mStatusEdit.getSelectionEnd(), "*id" + p.uid + " (" + NewPostFragment.this.mStatusEdit + ")");
                } else {
                    NewPostFragment.this.mStatusEdit.getText().insert(NewPostFragment.this.mStatusEdit.getSelectionEnd(), (NewPostFragment.this.mStatusEdit.getSelectionStart() == 0 ? "" : MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR) + "*id" + p.uid + " (" + p.fullName + ") ");
                }
            }
            if (requestCode == 8) {
                NewPostFragment.this.attachView.add((PollAttachment) intent.getParcelableExtra("poll"));
                showAttachView(true);
            }
            if (requestCode == 9) {
                PollAttachment poll = (PollAttachment) intent.getParcelableExtra("poll");
                NewPostFragment.this.attachView.add(poll);
                ArrayList<Attachment> atts = NewPostFragment.this.attachView.getAll();
                Iterator<Attachment> it3 = atts.iterator();
                while (true) {
                    if (!it3.hasNext()) {
                        break;
                    }
                    Attachment att = it3.next();
                    if ((att instanceof PollAttachment) && att != poll) {
                        NewPostFragment.this.attachView.remove(att);
                        break;
                    }
                }
            }
            updateSendButton();
        }

        boolean onBackPressed() {
            if ((NewPostFragment.this.mEdit != null && this.changed) || (NewPostFragment.this.mEdit == null && (NewPostFragment.this.mStatusEdit.length() > 0 || NewPostFragment.this.attachView.getCount() > 0 || this.geoAttach != null))) {
                new VKAlertDialog.Builder(NewPostFragment.this.getActivity()).setTitle(R.string.confirm).setMessage(NewPostFragment.this.mEdit != null ? R.string.confirm_close_post_edit : R.string.confirm_close_post).setPositiveButton(NewPostFragment.this.mEdit != null ? R.string.reg_continue : R.string.delete, NewPostFragment$Presenter$$Lambda$5.lambdaFactory$(this)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
                return true;
            }
            return false;
        }

        public /* synthetic */ void lambda$onBackPressed$5(DialogInterface dialog, int which) {
            NewPostFragment.this.getActivity().finish();
        }

        void showAttachView(boolean show) {
            NewPostFragment.this.attachView.setVisibility(show ? 0 : 8);
            updateFieldSize();
        }

        void updateFieldSize() {
            NewPostFragment.this.mStatusEdit.setLayoutParams(new LinearLayout.LayoutParams(-1, (NewPostFragment.this.attachView.getVisibility() == 0 || this.signedFromGroup) ? -2 : -1));
        }

        boolean checkAttachLimit() {
            int i = 2;
            if (NewPostFragment.this.attachView.getCount() >= (this.isComment ? 2 : 10)) {
                Activity activity = NewPostFragment.this.getActivity();
                Resources resources = NewPostFragment.this.getResources();
                Object[] objArr = new Object[1];
                if (!this.isComment) {
                    i = 10;
                }
                objArr[0] = Integer.valueOf(i);
                Toast.makeText(activity, resources.getString(R.string.attachments_limit, objArr), 0).show();
                return false;
            }
            return true;
        }

        void updateExportIcons() {
            int i = 0;
            NewPostFragment.this.mFbIcon.setVisibility(this.exportToFacebook ? 0 : 8);
            NewPostFragment.this.mTwitterIcon.setVisibility(this.exportToTwitter ? 0 : 8);
            View view = NewPostFragment.this.mFriendsOnlyIcon;
            if (!this.friendsOnly) {
                i = 8;
            }
            view.setVisibility(i);
        }

        void showExtendedAttachMenu() {
            ArrayList<String> opts = new ArrayList<>();
            opts.add(NewPostFragment.this.getString(R.string.audio));
            opts.add(NewPostFragment.this.getString(R.string.video));
            opts.add(NewPostFragment.this.getString(R.string.doc));
            if (NewPostFragment.this.uid == VKAccountManager.getCurrent().getUid() || NewPostFragment.this.uid < 0) {
                boolean hasPoll = false;
                ArrayList<Attachment> atts = NewPostFragment.this.attachView.getAll();
                Iterator<Attachment> it = atts.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    Attachment att = it.next();
                    if (att instanceof PollAttachment) {
                        hasPoll = true;
                        break;
                    }
                }
                if (!hasPoll) {
                    opts.add(NewPostFragment.this.getString(R.string.attach_poll));
                }
            }
            AlertDialog dlg = new VKAlertDialog.Builder(NewPostFragment.this.getActivity()).setItems((CharSequence[]) opts.toArray(new String[opts.size()]), NewPostFragment$Presenter$$Lambda$6.lambdaFactory$(this)).setTitle(R.string.attach).show();
            dlg.setCanceledOnTouchOutside(true);
        }

        public /* synthetic */ void lambda$showExtendedAttachMenu$6(DialogInterface dialog, int which) {
            switch (which) {
                case 0:
                    if (checkAttachLimit()) {
                        startAudioSelector();
                        return;
                    }
                    return;
                case 1:
                    if (checkAttachLimit()) {
                        startVideoSelector();
                        return;
                    }
                    return;
                case 2:
                    if (checkAttachLimit()) {
                        startDocumentSelector();
                        return;
                    }
                    return;
                case 3:
                    if (checkAttachLimit()) {
                        startPollSelector();
                        return;
                    }
                    return;
                default:
                    return;
            }
        }

        void showTimerDlg() {
            DateTimePickerDialogFragment p = new DateTimePickerDialogFragment();
            if (this.postponeTo != null) {
                Bundle args = new Bundle();
                args.putLong(ServerKeys.DATE, this.postponeTo.getTimeInMillis());
                p.setArguments(args);
            }
            p.setOnSelectedListener(NewPostFragment$Presenter$$Lambda$7.lambdaFactory$(this));
            p.show(NewPostFragment.this.getFragmentManager(), "picker");
        }

        public /* synthetic */ void lambda$showTimerDlg$7(Calendar date) {
            this.postponeTo = date;
            updateTimer();
        }

        void updateTimer() {
            boolean z = true;
            if (NewPostFragment.this.optionsAlertView != null) {
                NewPostFragment.this.optionsAlertView.setItemChecked(NewPostFragment.this.optionsAlertView.getCount() - 1, this.postponeTo != null);
                boolean[] opts = (boolean[]) NewPostFragment.this.optionsAlertView.getTag();
                int count = NewPostFragment.this.optionsAlertView.getCount() - 1;
                if (this.postponeTo == null) {
                    z = false;
                }
                opts[count] = z;
            }
            sendText(this.postponeTo == null ? R.string.send : R.string.timer_post_btn);
            updateBottomLine();
        }

        void startAudioSelector() {
            new AudioListFragment.Builder().forResult(NewPostFragment.this, 4);
        }

        void startVideoSelector() {
            new VKAlertDialog.Builder(NewPostFragment.this.getActivity()).setItems(new String[]{NewPostFragment.this.getResources().getString(R.string.add_video_new), NewPostFragment.this.getResources().getString(R.string.add_video_existing), NewPostFragment.this.getResources().getString(R.string.my_videos)}, NewPostFragment$Presenter$$Lambda$8.lambdaFactory$(this)).setTitle(R.string.video).show();
        }

        public /* synthetic */ void lambda$startVideoSelector$8(DialogInterface dialog, int which) {
            switch (which) {
                case 0:
                    Intent intent = new Intent("android.media.action.VIDEO_CAPTURE");
                    intent.putExtra("android.intent.extra.sizeLimit", 2147483648L);
                    NewPostFragment.this.startActivityForResult(intent, 10);
                    return;
                case 1:
                    Intent intent2 = new Intent(NewPostFragment.this.getActivity(), PhotoVideoAttachActivity.class);
                    intent2.putExtra("media_type", 333);
                    intent2.putExtra(AttachIntent.INTENT_SINGLE_MODE, true);
                    NewPostFragment.this.startActivityForResult(intent2, 11);
                    return;
                case 2:
                    chooseVideo();
                    return;
                default:
                    return;
            }
        }

        void chooseVideo() {
            Bundle args = new Bundle();
            args.putBoolean(ArgKeys.SELECT, true);
            new Navigator(VideosFragment.class, args).forResult(NewPostFragment.this, 5);
        }

        void startDocumentSelector() {
            new DocumentsFragmentBuilder(true).setLimit((this.isComment ? 2 : 10) - NewPostFragment.this.attachView.getCount()).forResult(NewPostFragment.this, 6);
        }

        void startPollSelector() {
            PollEditorFragment.create(NewPostFragment.this.uid).forResult(NewPostFragment.this, 8);
        }

        void startLocationChooser() {
            String locationProviders = Settings.Secure.getString(NewPostFragment.this.getActivity().getContentResolver(), "location_providers_allowed");
            if (locationProviders == null || locationProviders.length() == 0) {
                new VKAlertDialog.Builder(NewPostFragment.this.getActivity()).setTitle(R.string.location_disabled_title).setMessage(R.string.location_disabled).setPositiveButton(R.string.open_settings, NewPostFragment$Presenter$$Lambda$9.lambdaFactory$(this)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
            } else if (VKAccountManager.isCurrentUser(NewPostFragment.this.uid)) {
                CheckInFragment.start().forResult(NewPostFragment.this, 3);
            } else {
                new SelectGeoPointFragment.Builder().forResult(NewPostFragment.this, 3);
            }
        }

        public /* synthetic */ void lambda$startLocationChooser$9(DialogInterface dialog, int which) {
            NewPostFragment.this.startActivity(new Intent("android.settings.LOCATION_SOURCE_SETTINGS"));
        }

        void startMentionChooser() {
            new FriendsFragment.Builder().setSelect().forResult(NewPostFragment.this, 7);
        }

        void showOptions() {
            boolean[] opts;
            final boolean[] enabled;
            AlertDialog dlg;
            boolean z = true;
            if (NewPostFragment.this.uid > 0) {
                ArrayList<String> items = new ArrayList<>();
                ArrayList<String> acts = new ArrayList<>();
                opts = new boolean[4];
                opts[0] = this.friendsOnly;
                opts[1] = false;
                opts[2] = false;
                opts[3] = false;
                enabled = new boolean[]{true, true, true, true};
                int o = 1;
                items.add(NewPostFragment.this.getResources().getString(R.string.newpost_friends_only));
                acts.add("friendsonly");
                if (VKAccountManager.getCurrent().isExportTwitterAvail()) {
                    items.add(NewPostFragment.this.getResources().getString(R.string.newpost_export_twitter));
                    acts.add("twitter");
                    opts[1] = this.exportToTwitter;
                    if (this.friendsOnly) {
                        enabled[1] = false;
                    }
                    o = 1 + 1;
                }
                if (VKAccountManager.getCurrent().isExportFacebookAvail()) {
                    items.add(NewPostFragment.this.getResources().getString(R.string.newpost_export_fb));
                    acts.add("fb");
                    opts[o] = this.exportToFacebook;
                    if (this.friendsOnly) {
                        enabled[o] = false;
                    }
                    o++;
                }
                if ((NewPostFragment.this.mEdit == null || NewPostFragment.this.mEdit.flag(2048)) && (NewPostFragment.this.uid == VKAccountManager.getCurrent().getUid() || NewPostFragment.this.uid == 0 || (NewPostFragment.this.uid < 0 && this.fromGroup))) {
                    items.add(NewPostFragment.this.getString(R.string.timer));
                    acts.add("timer");
                    if (this.postponeTo == null) {
                        z = false;
                    }
                    opts[o] = z;
                    int i = o + 1;
                }
                dlg = new VKAlertDialog.Builder(NewPostFragment.this.getActivity()).setMultiChoiceItems((CharSequence[]) items.toArray(new String[items.size()]), opts, NewPostFragment$Presenter$$Lambda$10.lambdaFactory$(this, acts, enabled, opts)).setPositiveButton(R.string.ok, NewPostFragment$Presenter$$Lambda$11.lambdaFactory$(this, opts)).setTitle(R.string.post_options).show();
                NewPostFragment.this.optionsAlertView = dlg.getListView();
                NewPostFragment.this.optionsAlertView.setTag(opts);
                dlg.setOnDismissListener(NewPostFragment$Presenter$$Lambda$12.lambdaFactory$(this));
            } else if (Groups.isGroupAdmin(-NewPostFragment.this.uid)) {
                opts = new boolean[3];
                opts[0] = this.fromGroup;
                opts[1] = this.signedFromGroup;
                opts[2] = this.postponeTo != null;
                enabled = new boolean[3];
                enabled[0] = !NewPostFragment.this.mPublic;
                enabled[1] = NewPostFragment.this.mPublic || this.fromGroup;
                enabled[2] = NewPostFragment.this.mPublic || this.fromGroup;
                ArrayList<String> items2 = new ArrayList<>();
                ArrayList<String> acts2 = new ArrayList<>();
                items2.add(NewPostFragment.this.getString(R.string.post_from_group));
                items2.add(NewPostFragment.this.getString(R.string.post_from_group_signed));
                acts2.add("from_group");
                acts2.add("signed");
                if ((NewPostFragment.this.mEdit == null || NewPostFragment.this.mEdit.flag(2048) || this.isSuggest) && (NewPostFragment.this.uid == VKAccountManager.getCurrent().getUid() || NewPostFragment.this.uid <= 0)) {
                    items2.add(NewPostFragment.this.getString(R.string.timer));
                    acts2.add("timer");
                    if (this.postponeTo == null) {
                        z = false;
                    }
                    opts[2] = z;
                }
                dlg = new VKAlertDialog.Builder(NewPostFragment.this.getActivity()).setMultiChoiceItems((CharSequence[]) items2.toArray(new String[items2.size()]), opts, NewPostFragment$Presenter$$Lambda$13.lambdaFactory$(this, enabled, opts)).setPositiveButton(R.string.ok, NewPostFragment$Presenter$$Lambda$14.lambdaFactory$(this, opts)).setTitle(R.string.post_options).show();
            } else {
                return;
            }
            dlg.getListView().setOnTouchListener(NewPostFragment$Presenter$$Lambda$15.lambdaFactory$(dlg, enabled));
            NewPostFragment.this.optionsAlertView = dlg.getListView();
            NewPostFragment.this.optionsAlertView.setTag(opts);
            dlg.setOnDismissListener(NewPostFragment$Presenter$$Lambda$16.lambdaFactory$(this));
            final ArrayAdapter<String> wrapped = (ArrayAdapter) dlg.getListView().getAdapter();
            BaseAdapter a = new BaseAdapter() { // from class: com.vkontakte.android.fragments.news.NewPostFragment.Presenter.1
                {
                    Presenter.this = this;
                }

                @Override // android.widget.Adapter
                public int getCount() {
                    return wrapped.getCount();
                }

                @Override // android.widget.Adapter
                public Object getItem(int position) {
                    return wrapped.getItem(position);
                }

                @Override // android.widget.Adapter
                public long getItemId(int position) {
                    return wrapped.getItemId(position);
                }

                @Override // android.widget.Adapter
                public View getView(int position, View convertView, ViewGroup parent) {
                    View view = wrapped.getView(position, convertView, parent);
                    if (!enabled[position]) {
                        view.setAlpha(0.3f);
                    } else {
                        view.setAlpha(1.0f);
                    }
                    return view;
                }
            };
            dlg.getListView().setAdapter((ListAdapter) a);
        }

        public /* synthetic */ void lambda$showOptions$10(ArrayList acts, boolean[] enabled, boolean[] opts, DialogInterface dialog, int which, boolean isChecked) {
            boolean z = true;
            int w = -1;
            String s = (String) acts.get(which);
            if ("friendsonly".equals(s)) {
                w = 0;
                if (acts.contains("twitter")) {
                    enabled[acts.indexOf("twitter")] = !isChecked;
                    opts[acts.indexOf("twitter")] = !isChecked;
                    ((AlertDialog) dialog).getListView().setItemChecked(acts.indexOf("twitter"), !isChecked);
                }
                if (acts.contains("fb")) {
                    enabled[acts.indexOf("fb")] = !isChecked;
                    opts[acts.indexOf("fb")] = !isChecked;
                    ListView listView = ((AlertDialog) dialog).getListView();
                    int indexOf = acts.indexOf("fb");
                    if (isChecked) {
                        z = false;
                    }
                    listView.setItemChecked(indexOf, z);
                }
                ((BaseAdapter) ((AlertDialog) dialog).getListView().getAdapter()).notifyDataSetChanged();
            } else if ("twitter".equals(s)) {
                w = 1;
            } else if ("fb".equals(s)) {
                w = 2;
            } else if ("timer".equals(s)) {
                showTimerDlg();
                NewPostFragment.this.optionsAlertView.setItemChecked(which, this.postponeTo != null);
                if (this.postponeTo == null) {
                    z = false;
                }
                opts[which] = z;
            }
            if (w != -1) {
                opts[w] = isChecked;
            }
        }

        public /* synthetic */ void lambda$showOptions$11(boolean[] opts, DialogInterface dialog, int which) {
            this.friendsOnly = opts[0];
            this.exportToTwitter = opts[1];
            this.exportToFacebook = opts[2];
            VKAccountManager.editCurrent().setExportTwitterAvail(opts[1]).setExportFacebookAvail(opts[2]).commit();
            updateExportIcons();
        }

        public /* synthetic */ void lambda$showOptions$12(DialogInterface dialog) {
            NewPostFragment.this.optionsAlertView = null;
        }

        public /* synthetic */ void lambda$showOptions$13(boolean[] enabled, boolean[] opts, DialogInterface dialog, int which, boolean isChecked) {
            boolean z = true;
            if (which == 0) {
                enabled[2] = isChecked;
                enabled[1] = isChecked;
                ((BaseAdapter) ((AlertDialog) dialog).getListView().getAdapter()).notifyDataSetChanged();
                if (!isChecked) {
                    opts[1] = false;
                    ((AlertDialog) dialog).getListView().setItemChecked(1, false);
                    ((AlertDialog) dialog).getListView().setItemChecked(2, false);
                    this.postponeTo = null;
                    updateTimer();
                }
            }
            if (which == 2) {
                showTimerDlg();
                NewPostFragment.this.optionsAlertView.setItemChecked(which, this.postponeTo != null);
                if (this.postponeTo == null) {
                    z = false;
                }
                opts[which] = z;
                return;
            }
            opts[which] = isChecked;
        }

        public /* synthetic */ void lambda$showOptions$14(boolean[] opts, DialogInterface dialog, int which) {
            int i = 0;
            this.fromGroup = opts[0];
            this.signedFromGroup = opts[1];
            updateExportIcons();
            TextView textView = NewPostFragment.this.mSignatureText;
            if (!this.signedFromGroup) {
                i = 8;
            }
            textView.setVisibility(i);
            updateFieldSize();
        }

        public /* synthetic */ void lambda$showOptions$16(DialogInterface dialog) {
            NewPostFragment.this.optionsAlertView = null;
        }

        void attachLocation(GeoAttachment att) {
            this.geoAttach = att;
            NewPostFragment.this.mLocation.setSelected(true);
            updateBottomLine();
            updateSendButton();
        }

        void removeLocation() {
            this.geoAttach = null;
            NewPostFragment.this.mLocation.setSelected(false);
            updateBottomLine();
            updateSendButton();
            this.changed = true;
        }

        void updateBottomLine() {
            List<String> lines = new ArrayList<>();
            if (this.postponeTo != null) {
                int date = (int) (this.postponeTo.getTimeInMillis() / 1000);
                lines.add(NewPostFragment.this.getString(R.string.timer_attach_text) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + TimeUtils.langDate(date));
            }
            if (this.geoAttach != null) {
                lines.add(this.geoAttach.title != null ? this.geoAttach.title : this.geoAttach.address);
            }
            if (lines.size() > 0) {
                NewPostFragment.this.mLocationAddress.setVisibility(0);
                NewPostFragment.this.mLocationAddress.setText(TextUtils.join("\n", lines));
                return;
            }
            NewPostFragment.this.mLocationAddress.setVisibility(8);
        }

        void updateSendButton() {
            boolean enable = (NewPostFragment.this.mStatusEdit.getText().toString().trim().length() > 0 || NewPostFragment.this.attachView.getCount() > 0 || this.geoAttach != null) && !NewPostFragment.this.attachView.isUploading();
            sendEnabled(enable);
        }

        void saveComment(int type) {
            VKAPIRequest<JSONObject> req;
            if (!NewPostFragment.this.attachView.isUploading()) {
                List<Attachment> atts = NewPostFragment.this.attachView.getAll();
                for (int i = 0; i < atts.size(); i++) {
                    Attachment a = atts.get(i);
                    if (a instanceof PendingPhotoAttachment) {
                        return;
                    }
                }
                if (type == 17) {
                    req = new VKAPIRequest<>("market.editComment");
                } else {
                    req = new VKAPIRequest<>("board.editComment");
                }
                Attachment.sort(atts);
                if (atts.size() > 0) {
                    req.param("attachments", TextUtils.join(",", atts));
                } else {
                    req.param("attachments", MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                }
                NewPostFragment.this.mEdit.extra.setClassLoader(BoardComment.class.getClassLoader());
                final BoardComment comment = (BoardComment) NewPostFragment.this.mEdit.extra.getParcelable("comment");
                comment.attachments.clear();
                comment.attachments.addAll(atts);
                comment.text = NewPostFragment.this.mStatusEdit.getText().toString();
                if (type == 17) {
                    req.param("message", comment.text);
                    req.param("comment_id", comment.id);
                    req.param("owner_id", NewPostFragment.this.mEdit.extra.getInt("group_id"));
                } else {
                    req.param("text", comment.text);
                    req.param("comment_id", comment.id);
                    req.param("topic_id", NewPostFragment.this.mEdit.extra.getInt("topic_id"));
                    req.param("group_id", NewPostFragment.this.mEdit.extra.getInt("group_id"));
                }
                req.setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.fragments.news.NewPostFragment.Presenter.2
                    {
                        Presenter.this = this;
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void success(JSONObject result) {
                        Activity act = NewPostFragment.this.getActivity();
                        if (act != null) {
                            Intent intent = new Intent();
                            intent.putExtra("comment", comment);
                            act.setResult(-1, intent);
                            act.finish();
                        }
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                    }
                }).wrapProgress(NewPostFragment.this.getActivity()).exec((Context) NewPostFragment.this.getActivity());
            }
        }

        void post() {
            String str;
            if (!NewPostFragment.this.attachView.isUploading()) {
                List<Attachment> atts = NewPostFragment.this.attachView.getAll();
                for (int i = 0; i < atts.size(); i++) {
                    Attachment a = atts.get(i);
                    if (a instanceof PendingPhotoAttachment) {
                        return;
                    }
                }
                String exportParam = null;
                if (this.exportToFacebook && this.exportToTwitter) {
                    exportParam = "twitter,facebook";
                } else if (this.exportToTwitter) {
                    exportParam = "twitter";
                } else if (this.exportToFacebook) {
                    exportParam = "facebook";
                }
                String ptext = NewPostFragment.this.mStatusEdit.getText().toString();
                if (NewPostFragment.this.mEdit == null || this.isSuggest) {
                    str = "execute.wallPost";
                } else {
                    str = this.isComment ? "" : "execute.wallEdit";
                }
                VKAPIRequest<JSONObject> req = new VKAPIRequest<>(str);
                req.param("device", Build.BRAND + ":" + Build.MANUFACTURER + ":" + Build.MODEL + ":" + Build.PRODUCT);
                req.param("owner_id", NewPostFragment.this.uid);
                if (this.postponeTo != null) {
                    req.param("publish_date", (int) (this.postponeTo.getTimeInMillis() / 1000));
                }
                final NewsEntry edit = NewPostFragment.this.mEdit;
                if (NewPostFragment.this.mEdit != null) {
                    req.param(this.isComment ? "comment_id" : ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, edit.postID);
                    if (this.isComment) {
                        req.param("method", "execute.editComment");
                        req.param(ServerKeys.TYPE, edit.retweetText);
                        req.param("parent_object_id", edit.retweetOrigId);
                    }
                }
                if (this.fromGroup) {
                    req.param("from_group", 1);
                }
                if (this.signedFromGroup) {
                    req.param("signed", 1);
                } else if (this.fromGroup) {
                    req.param("signed", AppEventsConstants.EVENT_PARAM_VALUE_NO);
                }
                if (this.geoAttach != null) {
                    if (this.geoAttach.id <= 0) {
                        req.param("lat", this.geoAttach.lat + "").param("long", this.geoAttach.lon + "");
                    } else {
                        req.param("place_id", this.geoAttach.id);
                    }
                }
                Attachment.sort(atts);
                if (atts.size() > 0) {
                    req.param("attachments", TextUtils.join(",", atts));
                } else {
                    req.param("attachments", MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                }
                req.param("message", ptext);
                req.param("friends_only", this.friendsOnly ? AppEventsConstants.EVENT_PARAM_VALUE_YES : null);
                req.param("services", exportParam).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.fragments.news.NewPostFragment.Presenter.3
                    {
                        Presenter.this = this;
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void success(JSONObject r) {
                        try {
                            SparseArray<String> names = new SparseArray<>();
                            SparseArray<String> photos = new SparseArray<>();
                            VKAccount account = VKAccountManager.getCurrent();
                            names.put(Presenter.this.fromGroup ? NewPostFragment.this.uid : account.getUid(), Presenter.this.fromGroup ? NewPostFragment.this.mGroupTitle : account.getName());
                            photos.put(Presenter.this.fromGroup ? NewPostFragment.this.uid : account.getUid(), Presenter.this.fromGroup ? NewPostFragment.this.mGroupPhoto : account.getPhoto());
                            NewsEntry e = new NewsEntry(r.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0), null, names, photos);
                            if (edit != null) {
                                if (TextUtils.isEmpty(e.userName)) {
                                    e.userName = edit.userName;
                                }
                                if (TextUtils.isEmpty(e.userPhotoURL)) {
                                    e.userPhotoURL = edit.userPhotoURL;
                                }
                            }
                            if (edit != null && !Presenter.this.isSuggest) {
                                Toast.makeText(NewPostFragment.this.getActivity(), (int) R.string.post_edit_saved, 0).show();
                                if (edit.flag(2048) && Presenter.this.postponeTo == null) {
                                    Intent intent = new Intent("com.vkontakte.android.POST_DELETED");
                                    intent.putExtra("owner_id", edit.ownerID);
                                    intent.putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, edit.postID);
                                    intent.putExtra(ArgKeys.POST, e);
                                    NewPostFragment.this.getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                                    edit.time = TimeUtils.getCurrentTime();
                                    edit.flag(2048, false);
                                }
                                NewPostFragment.this.attachView.clear();
                                if (Presenter.this.isComment) {
                                    Intent intent2 = new Intent();
                                    intent2.putExtra("comment", e);
                                    NewPostFragment.this.getActivity().setResult(-1, intent2);
                                    NewPostFragment.this.getActivity().finish();
                                    return;
                                }
                                Intent intent3 = new Intent(Posts.ACTION_POST_REPLACED_BROADCAST);
                                intent3.putExtra("entry", e);
                                NewPostFragment.this.getActivity().sendBroadcast(intent3, "com.vkontakte.android.permission.ACCESS_DATA");
                                NewPostFragment.this.getActivity().setResult(-1);
                                NewPostFragment.this.getActivity().finish();
                                if (edit.ownerID == edit.userID && Presenter.this.postponeTo == null) {
                                    NewsfeedCache.replaceOne(edit, false);
                                    return;
                                }
                                return;
                            }
                            if (Presenter.this.postponeTo != null) {
                                Toast.makeText(NewPostFragment.this.getActivity(), NewPostFragment.this.getResources().getString(R.string.wall_postponed, TimeUtils.langDate((int) (Presenter.this.postponeTo.getTimeInMillis() / 1000))), 0).show();
                            } else {
                                Toast.makeText(NewPostFragment.this.getActivity(), NewPostFragment.this.getResources().getString(NewPostFragment.this.mSuggest ? R.string.post_edit_saved : R.string.wall_ok), 0).show();
                            }
                            if (Presenter.this.isSuggest && edit != null) {
                                Intent intent4 = new Intent("com.vkontakte.android.POST_DELETED");
                                intent4.putExtra("owner_id", edit.ownerID);
                                intent4.putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, edit.postID);
                                intent4.putExtra(ArgKeys.POST, e);
                                if (NewPostFragment.this.getActivity() != null) {
                                    NewPostFragment.this.getActivity().sendBroadcast(intent4, "com.vkontakte.android.permission.ACCESS_DATA");
                                }
                            }
                            if ((NewPostFragment.this.uid == VKAccountManager.getCurrent().getUid() || (NewPostFragment.this.uid < 0 && Presenter.this.fromGroup)) && Presenter.this.postponeTo == null && !NewPostFragment.this.mSuggest) {
                                Intent intent5 = new Intent(Posts.ACTION_NEW_POST_BROADCAST);
                                intent5.putExtra("entry", e);
                                NewPostFragment.this.getActivity().sendBroadcast(intent5, "com.vkontakte.android.permission.ACCESS_DATA");
                                if (NewsfeedCache.hasEntries()) {
                                    NewsfeedCache.addToTop(e);
                                }
                            }
                            NewPostFragment.this.getActivity().setResult(-1);
                            NewPostFragment.this.getActivity().finish();
                        } catch (JSONException x) {
                            Log.w("vk", x);
                            fail(new VKAPIRequest.VKErrorResponse(-2, x.getMessage()));
                        }
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                        if (Presenter.this.postponeTo != null && error.getCodeValue() == 214) {
                            String err = null;
                            if (error.message.contains("already scheduled for this time")) {
                                err = NewPostFragment.this.getString(R.string.postpone_error_already_exists);
                            }
                            if (error.message.contains("posts on a day")) {
                                err = NewPostFragment.this.getString(R.string.postpone_error_per_day);
                            }
                            if (error.message.contains("schedule more than")) {
                                err = NewPostFragment.this.getString(R.string.postpone_error_too_many);
                            }
                            if (err != null) {
                                Toast.makeText(NewPostFragment.this.getActivity(), err, 0).show();
                            }
                        } else if (Presenter.this.postponeTo != null && error.getCodeValue() == 100 && error.message.contains("publish_date")) {
                            Toast.makeText(NewPostFragment.this.getActivity(), NewPostFragment.this.getResources().getString(R.string.invalid_date), 0).show();
                        } else {
                            APIUtils.showErrorToast(NewPostFragment.this.getActivity(), error.getCode(), error.message);
                        }
                    }
                }).wrapProgress(NewPostFragment.this.getActivity()).exec((Context) NewPostFragment.this.getActivity());
            }
        }
    }
}
