package com.vkontakte.android.fragments.videos;

import android.app.Fragment;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.widget.PopupMenu;
import android.text.ClipboardManager;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.vk.imageloader.view.VKImageView;
import com.vk.sharing.Sharing;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoAdd;
import com.vkontakte.android.api.video.VideoDelete;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public abstract class AbsVideoListFragment extends GridFragment<VideoFile> {
    static final int VIDEO_EDIT = 8296;
    private int mOffset;
    private int mOwnerId;
    private BroadcastReceiver mReceiver;
    protected boolean mSelectMode;

    @NonNull
    protected abstract VKAPIRequest<VKList<VideoFile>> getRequest(int i, int i2);

    public AbsVideoListFragment() {
        super(50);
        this.mOwnerId = VKAccountManager.getCurrent().getUid();
        this.mOffset = 0;
        this.mReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.videos.AbsVideoListFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if ("com.vkontakte.android.POST_DELETED".equals(intent.getAction()) && intent.getIntExtra(ServerKeys.TYPE, 0) == 2) {
                    AbsVideoListFragment.this.removeItem(intent.getIntExtra("owner_id", 0), intent.getIntExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, 0));
                }
            }
        };
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mSelectMode = getArguments().getBoolean(ArgKeys.SELECT, this.mSelectMode);
        this.mOwnerId = getArguments().getInt(ArgKeys.UID, this.mOwnerId);
        VKApplication.context.registerReceiver(this.mReceiver, new IntentFilter("com.vkontakte.android.POST_DELETED"), "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        updateLayoutManager(true);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<VideoFile>.GridAdapter<?> createAdapter() {
        return new VideoAdapter();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        if (!this.loaded) {
            loadData();
        } else {
            dataLoaded();
        }
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        int listWidth = (this.list.getWidth() - this.list.getPaddingLeft()) - this.list.getPaddingRight();
        int columnWidth = this.scrW >= 600 ? V.dp(256.0f) : listWidth;
        return listWidth / columnWidth;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        VKApplication.context.unregisterReceiver(this.mReceiver);
        super.onDestroy();
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == -1) {
            switch (requestCode) {
                case VIDEO_EDIT /* 8296 */:
                    if (this.loaded) {
                        VideoFile video = (VideoFile) data.getParcelableExtra("video");
                        for (int i = 0; i < this.data.size(); i++) {
                            if (((VideoFile) this.data.get(i)).equals(video)) {
                                this.data.set(i, video);
                                mo1066getAdapter().notifyItemChanged(i);
                                return;
                            }
                        }
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (offset == 0) {
            this.mOffset = 0;
        }
        this.currentRequest = getRequest(this.mOffset, count).setCallback(new AnonymousClass2(this, count)).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.videos.AbsVideoListFragment$2  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass2 extends SimpleCallback<VKList<VideoFile>> {
        final /* synthetic */ int val$count;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass2(Fragment fragment, int i) {
            super(fragment);
            this.val$count = i;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(VKList<VideoFile> result) {
            AbsVideoListFragment.this.onDataLoaded(result, result.size() > 0 && (AbsVideoListFragment.this.data.size() + result.size()) + AbsVideoListFragment.this.preloadedData.size() < result.total());
            if (AbsVideoListFragment.this.mOffset == 0 && AbsVideoListFragment.this.list != null) {
                AbsVideoListFragment.this.list.post(AbsVideoListFragment$2$$Lambda$1.lambdaFactory$(this));
            }
            AbsVideoListFragment.this.mOffset += this.val$count;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0() {
            if (AbsVideoListFragment.this.list != null) {
                AbsVideoListFragment.this.list.scrollToPosition(0);
            }
        }
    }

    protected String getReferer() {
        return this.mOwnerId >= 0 ? "videos_user" : "videos_group";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getOwnerID() {
        return this.mOwnerId;
    }

    protected void onItemClick(VideoFile file) {
        if (this.mSelectMode) {
            Intent intent = new Intent();
            intent.putExtra("video", file);
            getActivity().setResult(-1, intent);
            getActivity().finish();
            return;
        }
        openVideo(file);
    }

    protected boolean onPopupItemSelected(VideoFile video, MenuItem item) {
        switch (item.getItemId()) {
            case R.id.add_to_album /* 2131755012 */:
                showAddToAlbumDialog(video);
                return true;
            case R.id.copy_link /* 2131755023 */:
                copyLink(video);
                return true;
            case R.id.add /* 2131755184 */:
                addVideo(video);
                return true;
            case R.id.share /* 2131755721 */:
                share(video);
                return true;
            case R.id.delete /* 2131756520 */:
                showDeleteDialog(video);
                return true;
            case R.id.edit /* 2131756528 */:
                showEditDialog(video);
                return true;
            default:
                return true;
        }
    }

    protected void onCreatePopupMenu(VideoFile video, Menu menu) {
        if (video.canEdit) {
            menu.add(0, R.id.edit, 0, R.string.edit);
        }
        if (VKAccountManager.isCurrentUser(getOwnerID()) || (video.oid < 0 && Groups.getAdminLevel(-video.oid) >= 2)) {
            menu.add(0, R.id.delete, 0, R.string.delete);
        }
        if (!VKAccountManager.isCurrentUser(video.oid) && !VKAccountManager.isCurrentUser(getOwnerID()) && VKAccountManager.getCurrent().isReal() && video.canAdd) {
            menu.add(0, R.id.add, 0, R.string.add);
        }
        if (VKAccountManager.getCurrent().isReal() && video.canAdd) {
            menu.add(0, R.id.add_to_album, 0, R.string.video_add_to_album);
        }
        menu.add(0, R.id.copy_link, 0, R.string.copy_link);
        if (VKAccountManager.getCurrent().isReal()) {
            menu.add(0, R.id.share, 0, R.string.repost);
        }
    }

    void openVideo(VideoFile video) {
        new PostViewFragment.Builder(video.convertToPost()).setRefer(getReferer()).resetScroll(true).go(getActivity());
    }

    void share(VideoFile video) {
        if (VKAuth.ensureLoggedIn(getActivity())) {
            Sharing.from(getActivity()).withAttachment(Attachments.createInfo(video, "videos")).withActions(Actions.createInfo(video)).share();
        }
    }

    void showDeleteDialog(VideoFile video) {
        showVideoFileDeleteDialog(video);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void showVideoFileDeleteDialog(VideoFile video) {
        new VKAlertDialog.Builder(getActivity()).setMessage(R.string.delete_video_confirm).setTitle(R.string.delete_video).setPositiveButton(R.string.yes, AbsVideoListFragment$$Lambda$1.lambdaFactory$(this, video)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$showVideoFileDeleteDialog$0(VideoFile video, DialogInterface dialog, int which) {
        deleteVideo(video);
    }

    void deleteVideo(VideoFile video) {
        deleteVideoFile(video);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void deleteVideoFile(final VideoFile video) {
        new VideoDelete(video.oid, video.vid, this.mOwnerId).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.videos.AbsVideoListFragment.3
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                AbsVideoListFragment.this.removeItem(video.oid, video.vid);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    void copyLink(VideoFile video) {
        ClipboardManager cm = (ClipboardManager) getActivity().getSystemService("clipboard");
        cm.setText("https://vk.com/video" + video.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + video.vid);
        Toast.makeText(getActivity(), (int) R.string.link_copied, 0).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void removeItem(int oid, int vid) {
        for (int i = 0; i < this.data.size(); i++) {
            VideoFile item = (VideoFile) this.data.get(i);
            if (item.oid == oid && item.vid == vid) {
                this.data.remove(item);
                mo1066getAdapter().notifyItemRemoved(i);
                this.mOffset--;
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void prepend(VideoFile video) {
        this.data.add(0, video);
        mo1066getAdapter().notifyItemInserted(0);
    }

    void addVideo(final VideoFile video) {
        new VideoAdd(video.oid, video.vid).setCallback(new SimpleCallback<Integer>(getActivity()) { // from class: com.vkontakte.android.fragments.videos.AbsVideoListFragment.4
            @Override // com.vkontakte.android.api.Callback
            public void success(Integer vid) {
                Toast.makeText(AbsVideoListFragment.this.getActivity(), AbsVideoListFragment.this.getResources().getString(R.string.video_added, video.title), 0).show();
                Videos.notifyVideoAdded(AbsVideoListFragment.this.getActivity(), video);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    void showAddToAlbumDialog(VideoFile video) {
        new VideoAddHelper(getActivity()).showAlbumsDialog(VKAccountManager.getCurrent().getUid(), video);
    }

    void showEditDialog(VideoFile video) {
        VideoEditorFragment.edit(video).forResult(this, VIDEO_EDIT);
    }

    /* loaded from: classes3.dex */
    private class VideoAdapter extends GridFragment<VideoFile>.GridAdapter<VideoHolder> {
        private VideoAdapter() {
            super();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public VideoHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new VideoHolder(parent);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return ((VideoFile) AbsVideoListFragment.this.data.get(position)).urlBigThumb;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class VideoHolder extends RecyclerHolder<VideoFile> implements View.OnClickListener, PopupMenu.OnMenuItemClickListener {
        private final TextView mDuration;
        private final TextView mInfo;
        private final View mOptions;
        private final VKImageView mPhoto;
        private final TextView mSubtitle;
        private final TextView mTitle;

        public VideoHolder(@NonNull ViewGroup parent) {
            super((int) R.layout.video_item, parent);
            this.mTitle = (TextView) $(R.id.title);
            this.mSubtitle = (TextView) $(R.id.subtitle);
            this.mInfo = (TextView) $(R.id.info);
            this.mDuration = (TextView) $(R.id.duration);
            this.mPhoto = (VKImageView) $(R.id.photo);
            this.mOptions = $(R.id.options);
            this.mOptions.setOnClickListener(this);
            this.itemView.setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(VideoFile item) {
            String formatDuration;
            int i = 0;
            this.mPhoto.load(item.urlBigThumb);
            this.mTitle.setText(item.getTitle());
            this.mSubtitle.setText(item.ownerName);
            this.mInfo.setText(item.views > 0 ? getResources().getQuantityString(R.plurals.video_views, item.views, Integer.valueOf(item.views)) : getResources().getString(R.string.no_views));
            TextView textView = this.mDuration;
            if (item.isLiveUpcoming()) {
                formatDuration = getString(R.string.video_live_upcoming);
            } else if (item.isLive()) {
                formatDuration = getString(R.string.video_live).toUpperCase();
            } else {
                formatDuration = item.duration > 0 ? com.vkontakte.android.cache.Videos.formatDuration(item.duration) : "";
            }
            textView.setText(formatDuration);
            this.mDuration.setVisibility(TextUtils.isEmpty(this.mDuration.getText()) ? 8 : 0);
            View view = this.mOptions;
            if (AbsVideoListFragment.this.mSelectMode) {
                i = 8;
            }
            view.setVisibility(i);
            this.mDuration.setBackgroundResource((!item.isLive() || item.isLiveUpcoming()) ? R.drawable.bg_doc_label : R.drawable.bg_video_live);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (v == this.itemView) {
                AbsVideoListFragment.this.onItemClick(getItem());
            } else if (v == this.mOptions) {
                PopupMenu pm = new PopupMenu(AbsVideoListFragment.this.getActivity(), v);
                AbsVideoListFragment.this.onCreatePopupMenu(getItem(), pm.getMenu());
                pm.setOnMenuItemClickListener(this);
                pm.show();
            }
        }

        @Override // android.support.v7.widget.PopupMenu.OnMenuItemClickListener
        public boolean onMenuItemClick(MenuItem item) {
            return AbsVideoListFragment.this.onPopupItemSelected(getItem(), item);
        }
    }
}
