package com.vkontakte.android.fragments.videos;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.content.LocalBroadcastManager;
import android.support.v7.widget.PopupMenu;
import android.text.ClipboardManager;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VideoAlbum;
import com.vkontakte.android.api.video.VideoDeleteAlbum;
import com.vkontakte.android.api.video.VideoGetAlbums;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class VideoAlbumsFragment extends GridFragment<VideoAlbum> {
    static final int EDIT_RESULT = 103;
    static final int SELECT_RESULT = 102;
    boolean mCanEdit;
    int mOwnerId;
    BroadcastReceiver mReceiver;
    boolean mSelectMode;

    public static VideoAlbumsFragment newInstance(int ownerId, boolean select) {
        Bundle args = new Bundle();
        args.putInt("owner_id", ownerId);
        args.putBoolean(ArgKeys.SELECT, select);
        VideoAlbumsFragment result = new VideoAlbumsFragment();
        result.setArguments(args);
        return result;
    }

    public VideoAlbumsFragment() {
        super(50);
        this.mReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.videos.VideoAlbumsFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                VideoAlbum album;
                if (VideoAddHelper.ACTION_RELOAD_VIDEO_ALBUMS.equals(intent.getAction()) && intent.getIntExtra("target_id", 0) == VideoAlbumsFragment.this.mOwnerId) {
                    VideoAlbumsFragment.this.refresh();
                }
                if ("com.vkontakte.android.VIDEO_ALBUM_CREATED".equals(intent.getAction()) && VideoAlbumsFragment.this.loaded && (album = Videos.extractAlbum(intent)) != null && VideoAlbumsFragment.this.mOwnerId == album.ownerID) {
                    VideoAlbumsFragment.this.data.add(0, album);
                    VideoAlbumsFragment.this.mo1066getAdapter().notifyItemInserted(0);
                }
            }
        };
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        boolean z = false;
        super.onCreate(savedInstanceState);
        this.mOwnerId = getArguments().getInt("owner_id", 0);
        this.mSelectMode = getArguments().getBoolean(ArgKeys.SELECT);
        if (VKAccountManager.isCurrentUser(this.mOwnerId) || (this.mOwnerId < 0 && Groups.getAdminLevel(-this.mOwnerId) >= 1)) {
            z = true;
        }
        this.mCanEdit = z;
        VKApplication.context.registerReceiver(this.mReceiver, new IntentFilter(VideoAddHelper.ACTION_RELOAD_VIDEO_ALBUMS), "com.vkontakte.android.permission.ACCESS_DATA", null);
        LocalBroadcastManager.getInstance(getActivity()).registerReceiver(this.mReceiver, new IntentFilter("com.vkontakte.android.VIDEO_ALBUM_CREATED"));
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        if (!this.loaded) {
            loadData();
            return;
        }
        showContent();
        updateList();
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        VKApplication.context.unregisterReceiver(this.mReceiver);
        LocalBroadcastManager.getInstance(getActivity()).unregisterReceiver(this.mReceiver);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(final int offset, final int count) {
        new VideoGetAlbums(this.mOwnerId, offset, count).setCallback(new SimpleCallback<VKList<VideoAlbum>>(this) { // from class: com.vkontakte.android.fragments.videos.VideoAlbumsFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<VideoAlbum> result) {
                VideoAlbumsFragment.this.onDataLoaded(result, offset + count < result.total());
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<VideoAlbum>.GridAdapter<?> createAdapter() {
        return new VideoAdapter();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        int listWidth = (this.list.getWidth() - this.list.getPaddingLeft()) - this.list.getPaddingRight();
        int columnWidth = this.scrW >= 600 ? V.dp(256.0f) : listWidth;
        return listWidth / columnWidth;
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == -1) {
            switch (requestCode) {
                case 102:
                    getActivity().setResult(-1, data);
                    getActivity().finish();
                    return;
                case 103:
                    if (this.loaded) {
                        VideoAlbum album = (VideoAlbum) data.getParcelableExtra(ArgKeys.ALBUM);
                        for (int i = 0; i < this.data.size(); i++) {
                            if (((VideoAlbum) this.data.get(i)).equals(album)) {
                                this.data.set(i, album);
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

    void editAlbum(VideoAlbum album) {
        AlbumEditorFragment.edit(album).forResult(this, 103);
    }

    void showDeleteDialog(VideoAlbum album, int position) {
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.delete_video_album_confirm).setPositiveButton(R.string.yes, VideoAlbumsFragment$$Lambda$1.lambdaFactory$(this, album, position)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$showDeleteDialog$0(VideoAlbum album, int position, DialogInterface dialog, int which) {
        deleteAlbum(album, position);
    }

    void deleteAlbum(final VideoAlbum album, final int position) {
        new VideoDeleteAlbum(album.ownerID, album.id).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.videos.VideoAlbumsFragment.3
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                VideoAlbumsFragment.this.data.remove(album);
                VideoAlbumsFragment.this.mo1066getAdapter().notifyItemRemoved(position);
                VideoAlbumsFragment.this.updateList();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    void copyLink(VideoAlbum album) {
        ClipboardManager cm = (ClipboardManager) getActivity().getSystemService("clipboard");
        cm.setText("https://vk.com/videos" + album.ownerID + "?section=album_" + album.id);
        Toast.makeText(getActivity(), (int) R.string.link_copied, 0).show();
    }

    void openAlbum(VideoAlbum album) {
        if (this.mSelectMode) {
            VideoAlbumFragment.newInstance(album, true).forResult(this, 102);
        } else {
            VideoAlbumFragment.newInstance(album, false).go(this);
        }
    }

    public void disableRefresh() {
        setRefreshEnabled(false);
    }

    /* loaded from: classes3.dex */
    private class VideoAdapter extends GridFragment<VideoAlbum>.GridAdapter<VideoAlbumHolder> {
        private VideoAdapter() {
            super();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public VideoAlbumHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new VideoAlbumHolder(parent);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return ((VideoAlbum) VideoAlbumsFragment.this.data.get(position)).photoBig;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class VideoAlbumHolder extends RecyclerHolder<VideoAlbum> implements View.OnClickListener {
        private final TextView mInfo;
        private final View mLock;
        private final View mOptions;
        private final VKImageView mPhoto;
        private final TextView mSubtitle;
        private final TextView mTitle;

        public VideoAlbumHolder(@NonNull ViewGroup parent) {
            super((int) R.layout.video_album_item, parent);
            this.mTitle = (TextView) $(R.id.title);
            this.mSubtitle = (TextView) $(R.id.subtitle);
            this.mInfo = (TextView) $(R.id.info);
            this.mPhoto = (VKImageView) $(R.id.photo);
            this.mLock = $(R.id.lock);
            this.mOptions = $(R.id.options);
            this.mOptions.setOnClickListener(this);
            this.itemView.setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(VideoAlbum item) {
            int i = 8;
            this.mPhoto.load(item.photoBig);
            this.mTitle.setText(item.title);
            this.mSubtitle.setText(getString(R.string.video_album_time_updated, TimeUtils.langDateDay(item.lastUpdated)));
            this.mInfo.setText(getResources().getQuantityString(R.plurals.album_video_count, item.count, Integer.valueOf(item.count)));
            this.mOptions.setVisibility(VideoAlbumsFragment.this.mCanEdit ? 0 : 8);
            View view = this.mLock;
            if (item.privacy.size() != 1 || !PrivacySetting.ALL.apiValue().equals(item.privacy.get(0).apiValue())) {
                i = 0;
            }
            view.setVisibility(i);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (v == this.itemView) {
                VideoAlbumsFragment.this.openAlbum(getItem());
            } else if (v == this.mOptions) {
                PopupMenu pm = new PopupMenu(VideoAlbumsFragment.this.getActivity(), v);
                if (VKAccountManager.isCurrentUser(getItem().ownerID) || (getItem().ownerID < 0 && Groups.getAdminLevel(-getItem().ownerID) >= 2)) {
                    pm.getMenu().add(0, R.id.edit, 0, R.string.edit);
                    pm.getMenu().add(0, R.id.delete, 0, R.string.delete);
                }
                pm.getMenu().add(0, R.id.copy_link, 0, R.string.copy_link);
                pm.setOnMenuItemClickListener(VideoAlbumsFragment$VideoAlbumHolder$$Lambda$1.lambdaFactory$(this));
                pm.show();
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ boolean lambda$onClick$0(MenuItem item) {
            switch (item.getItemId()) {
                case R.id.copy_link /* 2131755023 */:
                    VideoAlbumsFragment.this.copyLink(getItem());
                    return true;
                case R.id.delete /* 2131756520 */:
                    VideoAlbumsFragment.this.showDeleteDialog(getItem(), getAdapterPosition());
                    return true;
                case R.id.edit /* 2131756528 */:
                    VideoAlbumsFragment.this.editAlbum(getItem());
                    return true;
                default:
                    return true;
            }
        }
    }
}
