package com.vkontakte.android.fragments.photos;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.LayoutRes;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.ClipboardManager;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.PopupMenu;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.NetworkStateReceiver;
import com.vkontakte.android.Photo;
import com.vkontakte.android.PhotoViewer;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.photos.PhotosDeleteAlbum;
import com.vkontakte.android.api.photos.PhotosGetAlbums;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.fragments.VKRecyclerFragment;
import com.vkontakte.android.fragments.photos.PhotoListFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.upload.Upload;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class PhotoAlbumListFragment extends VKRecyclerFragment<PhotoAlbum> {
    private static final int EDIT_RESULT = 8295;
    private static final float ITEM_RATIO = 0.75f;
    private static final int SELECT_RESULT = 8294;
    private PhotoAlbumsAdapter adapter;
    private boolean isAdmin;
    private int itemWidth;
    private BroadcastReceiver receiver;
    private boolean select;
    private int uid;

    /* loaded from: classes3.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(PhotoAlbumListFragment.class);
        }

        public Builder setSelectMode() {
            this.args.putBoolean(ArgKeys.SELECT, true);
            return this;
        }

        public Builder setSelectAlbumMode() {
            this.args.putBoolean("select_album", true);
            return this;
        }
    }

    public PhotoAlbumListFragment() {
        super(1);
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.photos.PhotoAlbumListFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context arg0, Intent intent) {
                if (Upload.ACTION_PHOTO_ADDED.equals(intent.getAction())) {
                    int aid = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, 0);
                    Iterator it = PhotoAlbumListFragment.this.data.iterator();
                    while (it.hasNext()) {
                        PhotoAlbum album = (PhotoAlbum) it.next();
                        if (aid == album.id) {
                            album.numPhotos++;
                            if (album.thumbIsLast) {
                                char needSize = 'p';
                                if (Global.displayDensity >= 1.5f) {
                                    needSize = 'q';
                                }
                                if (Global.displayDensity >= 2.0f) {
                                    needSize = 'r';
                                }
                                Photo photo = (Photo) intent.getParcelableExtra("photo");
                                if (photo.getImage(needSize) != null) {
                                    album.thumbURL = photo.getImage(needSize).url;
                                } else {
                                    album.thumbURL = photo.getImage((Global.displayDensity < 2.0f || !NetworkStateReceiver.isHighSpeed() || photo.getImage('x') == null) ? 'm' : 'x').url;
                                }
                            }
                            PhotoAlbumListFragment.this.adapter.notifyItemChanged(PhotoAlbumListFragment.this.data.indexOf(album));
                        }
                    }
                }
                if (Upload.ACTION_PHOTO_REMOVED.equals(intent.getAction())) {
                    int aid2 = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, 0);
                    Iterator it2 = PhotoAlbumListFragment.this.data.iterator();
                    while (it2.hasNext()) {
                        PhotoAlbum album2 = (PhotoAlbum) it2.next();
                        if (aid2 == album2.id) {
                            album2.numPhotos--;
                            PhotoAlbumListFragment.this.adapter.notifyItemChanged(PhotoAlbumListFragment.this.data.indexOf(album2));
                        }
                    }
                }
                if (PhotoViewer.ACTION_UPDATE_ALBUM_COVER.equals(intent.getAction())) {
                    PhotoAlbumListFragment.this.setCover(intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, 0), intent.getStringExtra("new_cover_url"));
                }
            }
        };
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        IntentFilter filter = new IntentFilter();
        filter.addAction(Upload.ACTION_PHOTO_ADDED);
        filter.addAction(Upload.ACTION_PHOTO_REMOVED);
        filter.addAction(PhotoViewer.ACTION_UPDATE_ALBUM_COVER);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
        super.onDestroy();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        boolean z = false;
        super.onAttach(activity);
        this.uid = getArguments().getInt(ArgKeys.UID);
        this.isAdmin = this.uid == 0 || this.uid == VKAccountManager.getCurrent().getUid() || (this.uid < 0 && Groups.isGroupAdmin(-this.uid));
        if (getArguments().getBoolean(ArgKeys.SELECT) || getArguments().getBoolean("select_album")) {
            z = true;
        }
        this.select = z;
        if (getArguments() != null && getArguments().containsKey("title")) {
            setTitle(getArguments().getString("title"));
        } else if (!getArguments().getBoolean("no_title")) {
            setTitle(R.string.albums);
        }
        if (!getArguments().getBoolean(AppKitFragment.EXTRA_IS_TAB)) {
            loadData();
        }
        if (!this.select) {
            setHasOptionsMenu(true);
        }
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        menu.clear();
        inflater.inflate(R.menu.photoalbums, menu);
        MenuItem item = menu.findItem(R.id.create);
        boolean showCreate = this.isAdmin && (!getArguments().getBoolean(ArgKeys.SELECT) || getArguments().getBoolean("select_album"));
        item.setVisible(showCreate);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.create) {
            Bundle args = new Bundle();
            args.putInt("owner_id", this.uid);
            new Navigator(EditAlbumFragment.class, new TabletDialogActivity.Builder().setGravity(17), args).forResult(this, EDIT_RESULT);
            return true;
        }
        return true;
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.list.setDrawSelectorOnTop(true);
        this.list.setPadding(0, 0, V.dp(-4.0f), 0);
        this.list.setSelector(R.drawable.highlight);
        this.list.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.fragments.photos.PhotoAlbumListFragment.2
            @Override // android.support.v7.widget.RecyclerView.ItemDecoration
            public void getItemOffsets(Rect outRect, View view2, RecyclerView parent, RecyclerView.State state) {
                int pos = parent.getChildAdapterPosition(view2);
                outRect.right = V.dp(4.0f);
                if (pos >= 0 && pos < PhotoAlbumListFragment.this.data.size() && ((PhotoAlbum) PhotoAlbumListFragment.this.data.get(pos)).id == Integer.MIN_VALUE) {
                    if (pos > 0) {
                        outRect.top = V.dp(-4.0f);
                        return;
                    }
                    return;
                }
                outRect.bottom = V.dp(4.0f);
            }
        });
        this.list.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.vkontakte.android.fragments.photos.PhotoAlbumListFragment.3
            @Override // android.view.View.OnLayoutChangeListener
            public void onLayoutChange(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
                int w = right - left;
                int prevW = oldRight - oldLeft;
                if (w != prevW) {
                    PhotoAlbumListFragment.this.updateItemSize(w);
                }
            }
        });
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: onCreateLayoutManager */
    protected RecyclerView.LayoutManager mo1032onCreateLayoutManager() {
        final GridLayoutManager glm = new GridLayoutManager(getActivity(), 1);
        glm.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() { // from class: com.vkontakte.android.fragments.photos.PhotoAlbumListFragment.4
            @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
            public int getSpanSize(int position) {
                if (position < PhotoAlbumListFragment.this.data.size()) {
                    if (((PhotoAlbum) PhotoAlbumListFragment.this.data.get(position)).id == Integer.MIN_VALUE) {
                        return glm.getSpanCount();
                    }
                    return 1;
                }
                return glm.getSpanCount();
            }
        });
        return glm;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateItemSize(int width) {
        int cols = Math.round(width / V.dp(this.isTablet ? 240.0f : 180.0f));
        this.itemWidth = (width - (V.dp(4.0f) * (cols - 1))) / cols;
        ((GridLayoutManager) this.list.getLayoutManager()).setSpanCount(cols);
        this.adapter.notifyDataSetChanged();
        this.list.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.photos.PhotoAlbumListFragment.5
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                PhotoAlbumListFragment.this.list.getViewTreeObserver().removeOnPreDrawListener(this);
                PhotoAlbumListFragment.this.list.requestLayout();
                return false;
            }
        });
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new PhotosGetAlbums(this.uid, !getArguments().getBoolean("select_album")).setCallback(new SimpleCallback<PhotosGetAlbums.Result>(this) { // from class: com.vkontakte.android.fragments.photos.PhotoAlbumListFragment.6
            @Override // com.vkontakte.android.api.Callback
            public void success(PhotosGetAlbums.Result result) {
                ArrayList<PhotoAlbum> res = new ArrayList<>();
                int prevID = 0;
                PhotoAlbum divider = new PhotoAlbum();
                divider.id = Integer.MIN_VALUE;
                divider.numPhotos = result.albums.size();
                Iterator<PhotoAlbum> it = result.albums.iterator();
                while (it.hasNext()) {
                    PhotoAlbum a = it.next();
                    if (prevID < 0 && a.id > 0) {
                        divider.numPhotos -= res.size();
                        res.add(divider);
                    }
                    res.add(a);
                    prevID = a.id;
                }
                divider.title = PhotoAlbumListFragment.this.getResources().getQuantityString(R.plurals.albums, divider.numPhotos, Integer.valueOf(divider.numPhotos));
                PhotoAlbumListFragment.this.onDataLoaded(res, false);
            }
        }).exec((Context) getActivity());
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new PhotoAlbumsAdapter();
        }
        return this.adapter;
    }

    public void disableRefresh() {
        setRefreshEnabled(false);
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent intent) {
        if (reqCode == SELECT_RESULT && resCode == -1) {
            getActivity().setResult(-1, intent);
            getActivity().finish();
        }
        if (reqCode == EDIT_RESULT && resCode == -1) {
            PhotoAlbum a = (PhotoAlbum) intent.getParcelableExtra(ArgKeys.ALBUM);
            int insertAt = 0;
            for (int i = 0; i < this.data.size(); i++) {
                if (((PhotoAlbum) this.data.get(i)).id == Integer.MIN_VALUE) {
                    insertAt = i + 1;
                }
                if (((PhotoAlbum) this.data.get(i)).id == a.id) {
                    this.data.set(i, a);
                    this.adapter.notifyItemChanged(i);
                    return;
                }
            }
            this.data.add(insertAt, a);
            this.adapter.notifyItemInserted(insertAt);
        }
    }

    public void deleteAlbum(final PhotoAlbum a) {
        new VKAlertDialog.Builder(getActivity()).setTitle(R.string.delete_album).setMessage(R.string.delete_album_confirm).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.photos.PhotoAlbumListFragment.7
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                PhotoAlbumListFragment.this.doDelete(a);
            }
        }).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doDelete(final PhotoAlbum a) {
        new PhotosDeleteAlbum(a.id, this.uid < 0 ? -this.uid : 0).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.photos.PhotoAlbumListFragment.8
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                int idx = PhotoAlbumListFragment.this.data.indexOf(a);
                PhotoAlbumListFragment.this.data.remove(idx);
                PhotoAlbumListFragment.this.adapter.notifyItemRemoved(idx);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void copyLink(PhotoAlbum a) {
        ClipboardManager cm = (ClipboardManager) getActivity().getSystemService("clipboard");
        cm.setText("https://vk.com/album" + a.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + a.id);
        Toast.makeText(getActivity(), (int) R.string.link_copied, 0).show();
    }

    public void setCover(int id, String cover) {
        Iterator it = this.data.iterator();
        while (it.hasNext()) {
            PhotoAlbum a = (PhotoAlbum) it.next();
            if (a.id == id) {
                a.thumbURL = cover;
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void editAlbum(PhotoAlbum a) {
        Bundle args = new Bundle();
        args.putParcelable(ArgKeys.ALBUM, a);
        new Navigator(EditAlbumFragment.class, new TabletDialogActivity.Builder().setGravity(17), args).forResult(this, EDIT_RESULT);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class PhotoAlbumsAdapter extends UsableRecyclerView.Adapter<RecyclerHolder<PhotoAlbum>> {
        private PhotoAlbumsAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder<PhotoAlbum> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            if (viewType == 1) {
                return new EmptyPhotoAlbumViewHolder();
            }
            if (viewType == 2) {
                return new SectionHeaderViewHolder();
            }
            return new PhotoAlbumViewHolder();
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder<PhotoAlbum> holder, int position) {
            holder.bind(PhotoAlbumListFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return PhotoAlbumListFragment.this.data.size();
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return (((PhotoAlbum) PhotoAlbumListFragment.this.data.get(position)).numPhotos <= 0 || TextUtils.isEmpty(((PhotoAlbum) PhotoAlbumListFragment.this.data.get(position)).thumbURL)) ? 0 : 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            return ((PhotoAlbum) PhotoAlbumListFragment.this.data.get(position)).thumbURL;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            PhotoAlbum a = (PhotoAlbum) PhotoAlbumListFragment.this.data.get(position);
            if (a.id == Integer.MIN_VALUE) {
                return 2;
            }
            if (a.numPhotos == 0 || TextUtils.isEmpty(a.thumbURL)) {
                return 1;
            }
            return 0;
        }
    }

    /* loaded from: classes3.dex */
    private abstract class AbsPhotoAlbumViewHolder extends RecyclerHolder<PhotoAlbum> implements UsableRecyclerView.Clickable {
        private ImageView menuBtn;
        private VKImageView photo;
        private TextView quantity;
        private TextView title;

        public AbsPhotoAlbumViewHolder(@LayoutRes int layout) {
            super(layout, PhotoAlbumListFragment.this.getActivity());
            this.title = (TextView) this.itemView.findViewById(R.id.album_title);
            this.quantity = (TextView) this.itemView.findViewById(R.id.album_qty);
            View imageView = this.itemView.findViewById(R.id.album_thumb);
            if (imageView != null && (imageView instanceof VKImageView)) {
                this.photo = (VKImageView) imageView;
                this.photo.setPlaceholderColor(-855310);
            }
            this.menuBtn = (ImageView) this.itemView.findViewById(R.id.album_actions);
            this.itemView.setLayoutParams(new RecyclerView.LayoutParams(-1, Math.round(PhotoAlbumListFragment.this.itemWidth * 0.75f)));
            this.menuBtn.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.photos.PhotoAlbumListFragment.AbsPhotoAlbumViewHolder.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    if (((PhotoAlbum) AbsPhotoAlbumViewHolder.this.item).id >= 0) {
                        PopupMenu pm = new PopupMenu(PhotoAlbumListFragment.this.getActivity(), v);
                        pm.getMenu().add(0, 0, 0, AbsPhotoAlbumViewHolder.this.getResources().getString(R.string.edit));
                        pm.getMenu().add(0, 1, 0, AbsPhotoAlbumViewHolder.this.getResources().getString(R.string.delete));
                        pm.getMenu().add(0, 2, 0, AbsPhotoAlbumViewHolder.this.getResources().getString(R.string.copy_link));
                        pm.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() { // from class: com.vkontakte.android.fragments.photos.PhotoAlbumListFragment.AbsPhotoAlbumViewHolder.1.1
                            @Override // android.widget.PopupMenu.OnMenuItemClickListener
                            public boolean onMenuItemClick(MenuItem item) {
                                switch (item.getItemId()) {
                                    case 0:
                                        PhotoAlbumListFragment.this.editAlbum((PhotoAlbum) AbsPhotoAlbumViewHolder.this.item);
                                        return true;
                                    case 1:
                                        PhotoAlbumListFragment.this.deleteAlbum((PhotoAlbum) AbsPhotoAlbumViewHolder.this.item);
                                        return true;
                                    case 2:
                                        PhotoAlbumListFragment.this.copyLink((PhotoAlbum) AbsPhotoAlbumViewHolder.this.item);
                                        return true;
                                    default:
                                        return true;
                                }
                            }
                        });
                        pm.show();
                    }
                }
            });
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(PhotoAlbum item) {
            this.itemView.getLayoutParams().height = Math.round(PhotoAlbumListFragment.this.itemWidth * 0.75f);
            this.title.setText(item.title);
            this.quantity.setText(String.valueOf(item.numPhotos));
            this.menuBtn.setVisibility((!PhotoAlbumListFragment.this.isAdmin || item.id <= 0 || PhotoAlbumListFragment.this.select) ? 8 : 0);
            if (item.numPhotos > 0 && this.photo != null) {
                this.photo.load(item.thumbURL);
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            if (PhotoAlbumListFragment.this.getArguments().getBoolean("select_album")) {
                Intent intent = new Intent();
                intent.putExtra(ArgKeys.ALBUM, (Parcelable) this.item);
                PhotoAlbumListFragment.this.getActivity().setResult(-1, intent);
                PhotoAlbumListFragment.this.getActivity().finish();
                return;
            }
            Bundle args = new Bundle();
            args.putParcelable(ArgKeys.ALBUM, (Parcelable) this.item);
            if (!PhotoAlbumListFragment.this.getArguments().getBoolean(ArgKeys.SELECT)) {
                new PhotoListFragment.Builder((PhotoAlbum) this.item).go(PhotoAlbumListFragment.this.getActivity());
            } else {
                new PhotoListFragment.Builder((PhotoAlbum) this.item).setSelect(true).forResult(PhotoAlbumListFragment.this, PhotoAlbumListFragment.SELECT_RESULT);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class PhotoAlbumViewHolder extends AbsPhotoAlbumViewHolder {
        public PhotoAlbumViewHolder() {
            super(R.layout.photoalbums_item);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class EmptyPhotoAlbumViewHolder extends AbsPhotoAlbumViewHolder {
        public EmptyPhotoAlbumViewHolder() {
            super(R.layout.photoalbums_item_empty);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class SectionHeaderViewHolder extends RecyclerHolder<PhotoAlbum> {
        public SectionHeaderViewHolder() {
            super(PhotoAlbumListFragment.this.getActivity(), R.layout.list_section_header, PhotoAlbumListFragment.this.list);
            this.itemView.setBackgroundDrawable(null);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(PhotoAlbum item) {
            ((TextView) this.itemView).setText(item.title);
        }
    }
}
