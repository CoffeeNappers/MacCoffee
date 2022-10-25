package com.vkontakte.android;

import android.app.Activity;
import android.app.PendingIntent;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ProviderInfo;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.widget.Toast;
import com.facebook.common.util.UriUtil;
import com.vk.sharing.Sharing;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AudioAttachment;
import com.vkontakte.android.attachments.LinkAttachment;
import com.vkontakte.android.attachments.PendingAudioAttachment;
import com.vkontakte.android.attachments.PendingDocumentAttachment;
import com.vkontakte.android.attachments.PendingPhotoAttachment;
import com.vkontakte.android.attachments.PendingVideoAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.messages.ChatFragment;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import com.vkontakte.android.fragments.news.NewPostFragment;
import com.vkontakte.android.fragments.photos.PhotoAlbumListFragment;
import com.vkontakte.android.media.video.VideoEncoderSettings;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.upload.AlbumPhotoUploadTask;
import com.vkontakte.android.upload.AudioUploadTask;
import com.vkontakte.android.upload.BatchUploadTask;
import com.vkontakte.android.upload.DocumentUploadTask;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.UploadTask;
import com.vkontakte.android.upload.UploadUtils;
import com.vkontakte.android.upload.VideoUploadTask;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.File;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public final class SendActivity extends Activity {
    private static final int AUDIO = 1;
    private static final int AUTH_RESULT = 100;
    private static final int DOCUMENT = 4;
    public static final String EXTRA_RECIPIENT_FULL_NAME = "com.vkontakte.android.EXTRA_RECIPIENT_FULL_NAME";
    public static final String EXTRA_RECIPIENT_PHOTO = "com.vkontakte.android.EXTRA_RECIPIENT_PHOTO";
    public static final String EXTRA_RECIPIENT_UID = "com.vkontakte.android.EXTRA_RECIPIENT_UID";
    private static final int FILTER_RESULT = 101;
    private static final int IMAGE = 2;
    private static final int MESSAGE_RESULT = 102;
    private static final int PHOTO_ALBUM_RESULT = 103;
    private static final int UNKNOWN = 0;
    private static final int VIDEO = 3;
    private IntentHandler intentHandler;
    private LogoutReceiver logoutReceiver = null;
    private static final String[] IMAGE_EXTENSIONS = {"jpg", "jpeg", "png"};
    private static final String[] AUDIO_EXTENSIONS = {"mp3"};
    private static final String[] VIDEO_EXTENSIONS = {"avi", "mp4", "3gp", "mpeg", "mov", "flv", "wmv"};

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public interface IntentHandler {
        boolean handle();

        void onGotPhotoAlbum(@NonNull PhotoAlbum photoAlbum);

        void onGotRecipient(@NonNull UserProfile userProfile);
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    @interface SupportedType {
    }

    @Override // android.app.Activity
    public void onCreate(Bundle b) {
        overridePendingTransition(0, 0);
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        if (VKAccountManager.getCurrent().getUid() == 0) {
            startActivityForResult(new Intent(this, AuthActivity.class), 100);
        } else {
            processIntent();
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    @Override // android.app.Activity
    public void finish() {
        super.finish();
        overridePendingTransition(0, 0);
    }

    @Override // android.app.Activity
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        if (resCode == -1) {
            switch (reqCode) {
                case 100:
                    processIntent();
                    return;
                case 101:
                    new NewPostFragment.Builder().attachPhoto(Uri.parse(data.getStringArrayListExtra("images").get(0))).attachText(getIntent().getStringExtra("android.intent.extra.TEXT")).send(true).go(this);
                    return;
                case 102:
                    this.intentHandler.onGotRecipient((UserProfile) data.getParcelableExtra("profile"));
                    return;
                case 103:
                    this.intentHandler.onGotPhotoAlbum((PhotoAlbum) data.getParcelableExtra(ArgKeys.ALBUM));
                    return;
                default:
                    finish();
                    return;
            }
        }
        finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void processIntent() {
        Intent intent = getIntent();
        if ((intent.getFlags() & 1) != 1 || !copyFromRestrictedProvider()) {
            this.intentHandler = createIntentHandler(intent);
            if (this.intentHandler.handle()) {
                finish();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openRecipientChooser() {
        new DialogsFragment.Builder().setSelectMode().forResult(this, 102);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openAlbumChooser() {
        new PhotoAlbumListFragment.Builder().setSelectMode().setSelectAlbumMode().forResult(this, 103);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writeNewPost(@Nullable String text, @Nullable List<? extends Attachment> attachments) {
        NewPostFragment.Builder builder = new NewPostFragment.Builder();
        if (text != null) {
            builder.attachText(text);
        }
        if (attachments != null) {
            builder.attachAttachments((Attachment[]) attachments.toArray(new Attachment[attachments.size()]));
        }
        builder.send(true).go(this);
        finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writeNewMessage(@NonNull UserProfile recipient, @Nullable String text, @Nullable List<? extends Attachment> attachments) {
        ChatFragment.Builder builder = new ChatFragment.Builder(recipient.uid, recipient.fullName);
        if (recipient.photo != null) {
            builder.setPhoto(recipient.photo);
        }
        if (text != null) {
            builder.setText(text);
        }
        if (attachments != null) {
            builder.setAttachments((Parcelable[]) attachments.toArray(new Attachment[attachments.size()]));
        }
        builder.go(this);
        finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void shareExternal(@NonNull String text) {
        Sharing.share(this, text);
        finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void uploadImages(@NonNull PhotoAlbum album, @NonNull List<Uri> uris) {
        int progressTitle;
        int doneTitle;
        int doneText;
        List<UploadTask> tasks = new ArrayList<>();
        for (Uri uri : uris) {
            tasks.add(new AlbumPhotoUploadTask(this, uri.toString(), album.id, album.oid, "", true));
        }
        Uri data = Uri.parse("vkontakte://vk.com/album" + album.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + album.id);
        if (tasks.size() > 1) {
            progressTitle = R.string.uploading_photo_multiple;
            doneTitle = R.string.photo_upload_ok_multiple;
            doneText = R.string.photo_upload_ok_multiple_long;
        } else {
            progressTitle = R.string.uploading_photo;
            doneTitle = R.string.photo_upload_ok;
            doneText = R.string.photo_upload_ok_long;
        }
        Upload.start(this, createBatchUploadTask(tasks, progressTitle, doneTitle, doneText, data));
        finish();
    }

    private void uploadAudios(@NonNull List<? extends AudioAttachment> attachments) {
        int progressTitle;
        int doneTitle;
        int doneText;
        int ownerId = VKAccountManager.getCurrent().getUid();
        List<UploadTask> tasks = new ArrayList<>();
        for (AudioAttachment attachment : attachments) {
            tasks.add(new AudioUploadTask(this, attachment.musicTrack.url, true));
        }
        Uri data = Uri.parse("vkontakte://vk.com/audios" + ownerId);
        if (tasks.size() > 1) {
            progressTitle = R.string.uploading_audio_multiple;
            doneTitle = R.string.audio_upload_ok_multiple;
            doneText = R.string.audio_upload_ok_multiple_long;
        } else {
            progressTitle = R.string.uploading_audio;
            doneTitle = R.string.audio_upload_ok;
            doneText = R.string.audio_upload_ok_long;
        }
        Upload.start(this, createBatchUploadTask(tasks, progressTitle, doneTitle, doneText, data));
        finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void uploadVideos(@NonNull List<? extends VideoAttachment> attachments) {
        int progressTitle;
        int doneTitle;
        int doneText;
        int ownerId = VKAccountManager.getCurrent().getUid();
        List<UploadTask> tasks = new ArrayList<>();
        for (VideoAttachment attachment : attachments) {
            tasks.add(new VideoUploadTask(this, attachment.video.urlExternal, attachment.video.title, attachment.video.descr, VideoEncoderSettings.p720, false, ownerId, true));
        }
        if (tasks.size() > 1) {
            progressTitle = R.string.uploading_video_multiple;
            doneTitle = R.string.video_upload_ok_multiple;
            doneText = R.string.video_upload_ok_multiple_long;
        } else {
            progressTitle = R.string.uploading_video;
            doneTitle = R.string.video_upload_ok;
            doneText = R.string.video_upload_ok_long;
        }
        Uri data = Uri.parse("vkontakte://vk.com/videos" + ownerId);
        Upload.start(this, createBatchUploadTask(tasks, progressTitle, doneTitle, doneText, data));
        finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void uploadDocs(@NonNull List<Uri> uris) {
        int progressTitle;
        int doneTitle;
        int doneText;
        List<UploadTask> tasks = new ArrayList<>();
        for (Uri uri : uris) {
            tasks.add(new DocumentUploadTask(this, uri.toString(), VKAccountManager.getCurrent().getUid(), false));
        }
        if (tasks.size() > 1) {
            progressTitle = R.string.uploading_document_multiple;
            doneTitle = R.string.doc_upload_ok_multiple;
            doneText = R.string.doc_upload_ok_multiple_long;
        } else {
            progressTitle = R.string.uploading_document;
            doneTitle = R.string.doc_upload_ok;
            doneText = R.string.doc_upload_ok_long;
        }
        Uri data = Uri.parse("vkontakte://vk.com/docs" + VKAccountManager.getCurrent().getUid());
        Upload.start(this, createBatchUploadTask(tasks, progressTitle, doneTitle, doneText, data));
        finish();
    }

    private UploadTask createBatchUploadTask(@NonNull List<UploadTask> tasks, @StringRes int progressTitle, @StringRes int doneTitle, @StringRes int doneText, @NonNull Uri data) {
        return new BatchUploadTask(this, tasks, getString(progressTitle), getString(doneTitle), getString(doneText), PendingIntent.getActivity(this, 0, new Intent("android.intent.action.VIEW", data), 0));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fillMetadata(@NonNull MusicTrack mt, @NonNull Uri uri) {
        MediaMetadataRetriever mdr;
        mt.title = "Untitled";
        mt.artist = "Unknown artist";
        MediaMetadataRetriever mdr2 = null;
        try {
            try {
                mdr = new MediaMetadataRetriever();
            } catch (Exception e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            mdr.setDataSource(this, uri);
            String val = mdr.extractMetadata(7);
            if (val != null) {
                mt.title = val;
            }
            String val2 = mdr.extractMetadata(2);
            if (val2 != null) {
                mt.artist = val2;
            }
            mt.duration = Integer.parseInt(mdr.extractMetadata(9)) / 1000;
            if (mdr == null) {
                return;
            }
            mdr.release();
        } catch (Exception e2) {
            e = e2;
            mdr2 = mdr;
            Log.w("vk", "Error getting duration!", e);
            if (mdr2 == null) {
                return;
            }
            mdr2.release();
        } catch (Throwable th2) {
            th = th2;
            mdr2 = mdr;
            if (mdr2 != null) {
                mdr2.release();
            }
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fillMetadata(@NonNull VideoFile vf, @NonNull Uri uri) {
        MediaMetadataRetriever mdr;
        vf.title = UploadUtils.resolveName(uri);
        MediaMetadataRetriever mdr2 = null;
        try {
            try {
                mdr = new MediaMetadataRetriever();
            } catch (Exception e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            mdr.setDataSource(this, uri);
            String val = mdr.extractMetadata(7);
            if (val != null) {
                vf.title = val;
            }
            vf.duration = Integer.parseInt(mdr.extractMetadata(9)) / 1000;
            if (mdr == null) {
                return;
            }
            mdr.release();
        } catch (Exception e2) {
            e = e2;
            mdr2 = mdr;
            Log.w("vk", "Error getting duration!", e);
            if (mdr2 == null) {
                return;
            }
            mdr2.release();
        } catch (Throwable th2) {
            th = th2;
            mdr2 = mdr;
            if (mdr2 != null) {
                mdr2.release();
            }
            throw th;
        }
    }

    private boolean copyFromRestrictedProvider() {
        boolean havePermission;
        if (!getIntent().hasExtra("android.intent.extra.STREAM")) {
            return false;
        }
        ArrayList<Uri> uris = new ArrayList<>();
        if ("android.intent.action.SEND".equals(getIntent().getAction())) {
            Uri u = (Uri) getIntent().getParcelableExtra("android.intent.extra.STREAM");
            if (u != null) {
                uris.add(u);
            }
        } else if ("android.intent.action.SEND_MULTIPLE".equals(getIntent().getAction())) {
            ArrayList<Parcelable> list = getIntent().getParcelableArrayListExtra("android.intent.extra.STREAM");
            Iterator<Parcelable> it = list.iterator();
            while (it.hasNext()) {
                Parcelable u2 = it.next();
                if (u2 != null) {
                    uris.add((Uri) u2);
                }
            }
        }
        if (uris.size() <= 0) {
            return false;
        }
        Uri uri = uris.get(0);
        if (!UriUtil.LOCAL_CONTENT_SCHEME.equalsIgnoreCase(uri.getScheme())) {
            return false;
        }
        String authority = uri.getHost();
        ProviderInfo info = getPackageManager().resolveContentProvider(authority, 0);
        if (info == null) {
            return false;
        }
        if (info.readPermission == null) {
            havePermission = true;
        } else {
            havePermission = getPackageManager().checkPermission(info.readPermission, getPackageName()) == 0;
        }
        if (info.exported && havePermission) {
            return false;
        }
        final ProgressDialog progress = new ProgressDialog(this);
        UploadUtils.doCopyFromRestrictedProviderAsync(uris, new UploadUtils.CopiesListener() { // from class: com.vkontakte.android.SendActivity.1
            @Override // com.vkontakte.android.upload.UploadUtils.CopiesListener
            public void onStart() {
                progress.setMessage(SendActivity.this.getString(R.string.loading));
                progress.show();
            }

            @Override // com.vkontakte.android.upload.UploadUtils.CopiesListener
            public void onError(@Nullable Exception e) {
                Toast.makeText(SendActivity.this, (int) R.string.error, 0).show();
                ViewUtils.dismissDialogSafety(progress);
                SendActivity.this.finish();
            }

            @Override // com.vkontakte.android.upload.UploadUtils.CopiesListener
            public void onComplete(@NonNull ArrayList<Uri> newUris) {
                boolean multiple = true;
                if (newUris.size() <= 1) {
                    multiple = false;
                }
                Intent intent = new Intent();
                intent.setType(SendActivity.this.getIntent().getType());
                intent.putExtras(SendActivity.this.getIntent().getExtras());
                if (multiple) {
                    intent.setAction("android.intent.action.SEND_MULTIPLE");
                    ArrayList<Parcelable> pl = new ArrayList<>();
                    pl.addAll(newUris);
                    intent.putParcelableArrayListExtra("android.intent.extra.STREAM", pl);
                } else {
                    intent.setAction("android.intent.action.SEND");
                    intent.putExtra("android.intent.extra.STREAM", newUris.get(0));
                }
                ViewUtils.dismissDialogSafety(progress);
                SendActivity.this.setIntent(intent);
                SendActivity.this.processIntent();
            }
        }, this);
        return true;
    }

    @NonNull
    private IntentHandler createIntentHandler(@NonNull Intent intent) {
        UserProfile recipient;
        if (intent.hasExtra(EXTRA_RECIPIENT_UID)) {
            recipient = new UserProfile();
            recipient.uid = intent.getIntExtra(EXTRA_RECIPIENT_UID, 0);
            recipient.photo = intent.getStringExtra(EXTRA_RECIPIENT_PHOTO);
            recipient.fullName = intent.getStringExtra(EXTRA_RECIPIENT_FULL_NAME);
        } else {
            recipient = null;
        }
        if (intent.hasExtra("android.intent.extra.STREAM")) {
            return createStreamIntentHandler(intent, recipient);
        }
        if (intent.hasExtra("android.intent.extra.TEXT")) {
            String text = intent.getStringExtra("android.intent.extra.TEXT");
            String subject = intent.getStringExtra("android.intent.extra.SUBJECT");
            return new TextIntentHandler(text, subject, recipient);
        }
        return new UnsupportedIntentHandler();
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [com.vkontakte.android.SendActivity$1SharedItems] */
    @NonNull
    private IntentHandler createStreamIntentHandler(@NonNull Intent intent, @Nullable UserProfile recipient) {
        String action = intent.getAction();
        ?? r1 = new ArrayList<C1SharedItem>() { // from class: com.vkontakte.android.SendActivity.1SharedItems
            /* JADX INFO: Access modifiers changed from: private */
            public int getType() {
                int type = 0;
                if (isEmpty()) {
                    return 0;
                }
                Iterator<C1SharedItem> it = iterator();
                while (it.hasNext()) {
                    C1SharedItem sharedItem = it.next();
                    if (type == 0) {
                        type = sharedItem.type;
                    } else if (type != sharedItem.type) {
                        return 4;
                    }
                }
                return type;
            }

            /* JADX INFO: Access modifiers changed from: private */
            @NonNull
            public List<Uri> getUris() {
                List<Uri> uris = new ArrayList<>();
                Iterator<C1SharedItem> it = iterator();
                while (it.hasNext()) {
                    C1SharedItem sharedItem = it.next();
                    uris.add(sharedItem.uri);
                }
                return uris;
            }
        };
        if ("android.intent.action.SEND_MULTIPLE".equals(action)) {
            List<Uri> uris = intent.getParcelableArrayListExtra("android.intent.extra.STREAM");
            for (Uri uri : uris) {
                r1.add(new C1SharedItem(resolveType(uri), uri));
            }
        } else if ("android.intent.action.SEND".equals(action)) {
            Uri uri2 = (Uri) intent.getParcelableExtra("android.intent.extra.STREAM");
            r1.add(new C1SharedItem(resolveType(uri2), uri2));
        }
        String text = intent.getStringExtra("android.intent.extra.TEXT");
        switch (r1.getType()) {
            case 1:
                return new AudioIntentHandler(text, r1.getUris(), recipient);
            case 2:
                return new ImageIntentHandler(text, r1.getUris(), recipient);
            case 3:
                return new VideoIntentHandler(text, r1.getUris(), recipient);
            case 4:
                Iterator<C1SharedItem> iterator = r1.iterator();
                while (iterator.hasNext()) {
                    if (iterator.next().type == 1) {
                        iterator.remove();
                    }
                }
                return new DocumentIntentHandler(text, r1.getUris(), recipient);
            default:
                return new UnsupportedIntentHandler();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.SendActivity$1SharedItem  reason: invalid class name */
    /* loaded from: classes2.dex */
    public final class C1SharedItem {
        final int type;
        final Uri uri;

        C1SharedItem(int type, @NonNull Uri uri) {
            this.type = type;
            this.uri = uri;
        }
    }

    private static int resolveType(@NonNull Uri stream) {
        String ext;
        String scheme = stream.getScheme();
        if (scheme == null) {
            return 0;
        }
        if (UriUtil.LOCAL_FILE_SCHEME.equalsIgnoreCase(scheme)) {
            String filename = stream.getLastPathSegment();
            if (filename == null) {
                return 0;
            }
            String[] parts = filename.split("\\.");
            ext = parts[parts.length - 1].toLowerCase();
        } else {
            ext = UploadUtils.resolveExtension(stream);
        }
        if (ext == null) {
            return 0;
        }
        if (isInArray(ext, AUDIO_EXTENSIONS)) {
            return 1;
        }
        if (isInArray(ext, IMAGE_EXTENSIONS)) {
            return 2;
        }
        if (isInArray(ext, VIDEO_EXTENSIONS)) {
            return 3;
        }
        return 4;
    }

    private static boolean isInArray(@NonNull String what, @NonNull String[] array) {
        for (String s : array) {
            if (s.equals(what)) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class UnsupportedIntentHandler implements IntentHandler {
        private UnsupportedIntentHandler() {
        }

        @Override // com.vkontakte.android.SendActivity.IntentHandler
        public boolean handle() {
            Toast.makeText(SendActivity.this, (int) R.string.share_unsupported, 0).show();
            return true;
        }

        @Override // com.vkontakte.android.SendActivity.IntentHandler
        public void onGotRecipient(@NonNull UserProfile profile) {
            throw new UnsupportedOperationException("Unsupported");
        }

        @Override // com.vkontakte.android.SendActivity.IntentHandler
        public void onGotPhotoAlbum(@NonNull PhotoAlbum album) {
            throw new UnsupportedOperationException("Unsupported");
        }
    }

    /* loaded from: classes2.dex */
    private abstract class DirectShareIntentHandler implements IntentHandler {
        @Nullable
        private UserProfile recipient;

        abstract void onHandle();

        abstract void onHandleDirectShare(@NonNull UserProfile userProfile);

        DirectShareIntentHandler(@Nullable UserProfile recipient) {
            this.recipient = recipient;
        }

        @Override // com.vkontakte.android.SendActivity.IntentHandler
        public final boolean handle() {
            if (this.recipient != null) {
                onHandleDirectShare(this.recipient);
                return true;
            }
            onHandle();
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class TextIntentHandler extends DirectShareIntentHandler {
        private final Attachment attachment;
        private final String dialogTitle;
        private final String postTitle;
        private final String text;

        private TextIntentHandler(@NonNull String text, @Nullable String subject, @Nullable UserProfile recipient) {
            super(recipient);
            this.text = text;
            if (LinkParser.isLink(text)) {
                this.dialogTitle = SendActivity.this.getString(R.string.sys_share_link);
                this.postTitle = subject == null ? "" : subject;
                this.attachment = new LinkAttachment(text, "", "");
                return;
            }
            this.dialogTitle = SendActivity.this.getString(R.string.sys_share_text);
            this.postTitle = text;
            this.attachment = null;
        }

        @Override // com.vkontakte.android.SendActivity.DirectShareIntentHandler
        void onHandleDirectShare(@NonNull UserProfile recipient) {
            SendActivity.this.writeNewMessage(recipient, this.text, null);
        }

        @Override // com.vkontakte.android.SendActivity.DirectShareIntentHandler
        void onHandle() {
            String[] items = SendActivity.this.getIntent().getBooleanExtra("_internal", false) ? new String[]{SendActivity.this.getString(R.string.share_to_wall), SendActivity.this.getString(R.string.share_to_message), SendActivity.this.getString(R.string.share_external)} : new String[]{SendActivity.this.getString(R.string.share_to_wall), SendActivity.this.getString(R.string.share_to_message)};
            new VKAlertDialog.Builder(SendActivity.this).setTitle(this.dialogTitle).setItems(items, SendActivity$TextIntentHandler$$Lambda$1.lambdaFactory$(this)).setOnCancelListener(SendActivity$TextIntentHandler$$Lambda$2.lambdaFactory$(this)).show();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onHandle$0(DialogInterface dialog, int which) {
            switch (which) {
                case 0:
                    SendActivity.this.writeNewPost(this.postTitle, Collections.singletonList(this.attachment));
                    return;
                case 1:
                    SendActivity.this.openRecipientChooser();
                    return;
                case 2:
                    SendActivity.this.shareExternal(this.text);
                    return;
                default:
                    return;
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onHandle$1(DialogInterface dialog) {
            SendActivity.this.finish();
        }

        @Override // com.vkontakte.android.SendActivity.IntentHandler
        public void onGotRecipient(@NonNull UserProfile recipient) {
            SendActivity.this.writeNewMessage(recipient, this.text, null);
        }

        @Override // com.vkontakte.android.SendActivity.IntentHandler
        public void onGotPhotoAlbum(@NonNull PhotoAlbum album) {
            throw new UnsupportedOperationException("Unsupported");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public abstract class StreamIntentHandler extends DirectShareIntentHandler {
        final boolean multiple;
        @NonNull
        final List<Uri> streams;
        @Nullable
        final String text;
        final /* synthetic */ SendActivity this$0;

        abstract String[] createDialogOptions();

        abstract String createDialogTitle();

        abstract void handleOption(int i);

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        StreamIntentHandler(@Nullable SendActivity sendActivity, @NonNull String text, @Nullable List<Uri> streams, UserProfile recipient) {
            super(recipient);
            boolean z = true;
            this.this$0 = sendActivity;
            this.text = text;
            this.streams = streams;
            this.multiple = streams.size() <= 1 ? false : z;
        }

        @Override // com.vkontakte.android.SendActivity.DirectShareIntentHandler
        void onHandle() {
            new VKAlertDialog.Builder(this.this$0).setTitle(createDialogTitle()).setItems(createDialogOptions(), SendActivity$StreamIntentHandler$$Lambda$1.lambdaFactory$(this)).setOnCancelListener(SendActivity$StreamIntentHandler$$Lambda$2.lambdaFactory$(this)).show();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onHandle$0(DialogInterface dialog, int which) {
            handleOption(which);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onHandle$1(DialogInterface dialog) {
            this.this$0.finish();
        }

        @Override // com.vkontakte.android.SendActivity.IntentHandler
        public void onGotRecipient(@NonNull UserProfile recipient) {
        }

        @Override // com.vkontakte.android.SendActivity.IntentHandler
        public void onGotPhotoAlbum(@NonNull PhotoAlbum album) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class ImageIntentHandler extends StreamIntentHandler {
        ImageIntentHandler(@Nullable String text, @NonNull List<Uri> streams, @Nullable UserProfile recipient) {
            super(SendActivity.this, text, streams, recipient);
        }

        @Override // com.vkontakte.android.SendActivity.DirectShareIntentHandler
        void onHandleDirectShare(@NonNull UserProfile recipient) {
            SendActivity.this.writeNewMessage(recipient, this.text, createAttachments());
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        String createDialogTitle() {
            return SendActivity.this.getString(this.multiple ? R.string.sys_share_image_multiple : R.string.sys_share_image);
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        String[] createDialogOptions() {
            ArrayList<String> options = new ArrayList<>();
            options.add(SendActivity.this.getString(R.string.share_to_album));
            options.add(SendActivity.this.getString(R.string.share_to_docs));
            if (this.streams.size() <= 10) {
                options.add(SendActivity.this.getString(R.string.share_to_wall));
                options.add(SendActivity.this.getString(R.string.share_to_message));
            }
            return (String[]) options.toArray(new String[options.size()]);
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        void handleOption(int option) {
            switch (option) {
                case 0:
                    SendActivity.this.openAlbumChooser();
                    return;
                case 1:
                    SendActivity.this.uploadDocs(this.streams);
                    return;
                case 2:
                    SendActivity.this.writeNewPost(this.text, createAttachments());
                    return;
                case 3:
                    SendActivity.this.openRecipientChooser();
                    return;
                default:
                    return;
            }
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler, com.vkontakte.android.SendActivity.IntentHandler
        public void onGotRecipient(@NonNull UserProfile recipient) {
            super.onGotRecipient(recipient);
            SendActivity.this.writeNewMessage(recipient, this.text, createAttachments());
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler, com.vkontakte.android.SendActivity.IntentHandler
        public void onGotPhotoAlbum(@NonNull PhotoAlbum album) {
            super.onGotPhotoAlbum(album);
            SendActivity.this.uploadImages(album, this.streams);
        }

        @NonNull
        private List<Attachment> createAttachments() {
            List<Attachment> attachments = new ArrayList<>();
            for (Uri stream : this.streams) {
                attachments.add(new PendingPhotoAttachment(stream.toString()));
            }
            return attachments;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class AudioIntentHandler extends StreamIntentHandler {
        AudioIntentHandler(@Nullable String text, @NonNull List<Uri> streams, @Nullable UserProfile recipient) {
            super(SendActivity.this, text, streams, recipient);
        }

        @Override // com.vkontakte.android.SendActivity.DirectShareIntentHandler
        void onHandleDirectShare(@NonNull UserProfile recipient) {
            SendActivity.this.writeNewMessage(recipient, this.text, createAttachments());
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        String createDialogTitle() {
            return SendActivity.this.getString(this.multiple ? R.string.sys_share_audio_multiple : R.string.sys_share_audio);
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        String[] createDialogOptions() {
            return new String[]{SendActivity.this.getString(R.string.share_to_wall), SendActivity.this.getString(R.string.share_to_message)};
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        void handleOption(int option) {
            switch (option) {
                case 0:
                    SendActivity.this.writeNewPost(this.text, createAttachments());
                    return;
                case 1:
                    SendActivity.this.openRecipientChooser();
                    return;
                default:
                    return;
            }
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler, com.vkontakte.android.SendActivity.IntentHandler
        public void onGotRecipient(@NonNull UserProfile recipient) {
            super.onGotRecipient(recipient);
            SendActivity.this.writeNewMessage(recipient, this.text, createAttachments());
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler, com.vkontakte.android.SendActivity.IntentHandler
        public void onGotPhotoAlbum(@NonNull PhotoAlbum album) {
            throw new UnsupportedOperationException("Unsupported");
        }

        @NonNull
        private List<AudioAttachment> createAttachments() {
            List<AudioAttachment> attachments = new ArrayList<>();
            for (Uri stream : this.streams) {
                MusicTrack mt = new MusicTrack();
                mt.url = stream.toString();
                mt.aid = Upload.getNewID();
                SendActivity.this.fillMetadata(mt, stream);
                attachments.add(new PendingAudioAttachment(mt));
            }
            return attachments;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class VideoIntentHandler extends StreamIntentHandler {
        VideoIntentHandler(@Nullable String text, @NonNull List<Uri> streams, @Nullable UserProfile recipient) {
            super(SendActivity.this, text, streams, recipient);
        }

        @Override // com.vkontakte.android.SendActivity.DirectShareIntentHandler
        void onHandleDirectShare(@NonNull UserProfile recipient) {
            SendActivity.this.writeNewMessage(recipient, this.text, createAttachments());
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        String createDialogTitle() {
            return SendActivity.this.getString(this.multiple ? R.string.sys_share_video_multiple : R.string.sys_share_video);
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        String[] createDialogOptions() {
            return new String[]{SendActivity.this.getString(R.string.share_to_videos), SendActivity.this.getString(R.string.share_to_message)};
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        void handleOption(int option) {
            switch (option) {
                case 0:
                    SendActivity.this.uploadVideos(createAttachments());
                    return;
                case 1:
                    SendActivity.this.openRecipientChooser();
                    return;
                default:
                    return;
            }
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler, com.vkontakte.android.SendActivity.IntentHandler
        public void onGotRecipient(@NonNull UserProfile recipient) {
            super.onGotRecipient(recipient);
            SendActivity.this.writeNewMessage(recipient, this.text, createAttachments());
        }

        @NonNull
        private List<PendingVideoAttachment> createAttachments() {
            List<PendingVideoAttachment> attachments = new ArrayList<>();
            for (Uri stream : this.streams) {
                VideoFile vf = new VideoFile();
                vf.urlExternal = stream.toString();
                vf.vid = Upload.getNewID();
                SendActivity.this.fillMetadata(vf, stream);
                attachments.add(new PendingVideoAttachment(vf));
            }
            return attachments;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class DocumentIntentHandler extends StreamIntentHandler {
        DocumentIntentHandler(@Nullable String text, @NonNull List<Uri> streams, @Nullable UserProfile recipient) {
            super(SendActivity.this, text, streams, recipient);
        }

        @Override // com.vkontakte.android.SendActivity.DirectShareIntentHandler
        void onHandleDirectShare(@NonNull UserProfile recipient) {
            SendActivity.this.writeNewMessage(recipient, this.text, createAttachments());
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        String createDialogTitle() {
            return SendActivity.this.getString(this.multiple ? R.string.sys_share_file_multiple : R.string.sys_share_file);
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        String[] createDialogOptions() {
            return new String[]{SendActivity.this.getString(R.string.share_to_docs), SendActivity.this.getString(R.string.share_to_message)};
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler
        void handleOption(int option) {
            switch (option) {
                case 0:
                    SendActivity.this.uploadDocs(this.streams);
                    return;
                case 1:
                    SendActivity.this.openRecipientChooser();
                    return;
                default:
                    return;
            }
        }

        @Override // com.vkontakte.android.SendActivity.StreamIntentHandler, com.vkontakte.android.SendActivity.IntentHandler
        public void onGotRecipient(@NonNull UserProfile recipient) {
            super.onGotRecipient(recipient);
            SendActivity.this.writeNewMessage(recipient, this.text, createAttachments());
        }

        @NonNull
        private List<PendingDocumentAttachment> createAttachments() {
            List<PendingDocumentAttachment> attachments = new ArrayList<>();
            for (Uri stream : this.streams) {
                String uri = stream.toString();
                attachments.add(new PendingDocumentAttachment(UploadUtils.resolveName(stream), uri, (int) new File(UploadUtils.resolvePath(stream)).length(), uri, 0, Upload.getNewID(), UploadUtils.resolveExtension(stream)));
            }
            return attachments;
        }
    }
}
