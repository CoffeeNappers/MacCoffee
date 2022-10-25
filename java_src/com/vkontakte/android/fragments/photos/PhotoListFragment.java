package com.vkontakte.android.fragments.photos;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.common.util.UriUtil;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.ImagePickerActivity;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.Photo;
import com.vkontakte.android.PhotoViewer;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.fave.FaveGetPhotos;
import com.vkontakte.android.api.photos.PhotosGet;
import com.vkontakte.android.api.photos.PhotosGetAll;
import com.vkontakte.android.api.photos.PhotosGetUserPhotos;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.VKRecyclerFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.navigation.NavigationDelegateActivity;
import com.vkontakte.android.ui.navigation.NavigationDelegateLeftMenu;
import com.vkontakte.android.ui.navigation.NavigationDelegateProvider;
import com.vkontakte.android.upload.AlbumPhotoUploadTask;
import com.vkontakte.android.upload.BatchUploadTask;
import com.vkontakte.android.upload.Upload;
import com.vkontakte.android.upload.UploadTask;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.api.PaginatedList;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.utils.MergeRecyclerAdapter;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class PhotoListFragment extends VKRecyclerFragment<Photo> implements PhotoViewer.PhotoViewerCallback {
    private static final int ROW_HEIGHT = 180;
    private static final int UPLOAD_RESULT = 3890;
    protected MergeRecyclerAdapter adapter;
    protected PhotoAlbum album;
    protected ArrayList<PhotoLayoutInfo> layout;
    private int listWidth;
    private BroadcastReceiver receiver;
    protected boolean showAlbumHeader;
    protected PhotoViewer viewer;

    /* loaded from: classes3.dex */
    public static class Builder extends Navigator {
        public Builder(PhotoAlbum album) {
            super(PhotoListFragment.class);
            this.args.putParcelable(ArgKeys.ALBUM, album);
        }

        public Builder setSelect(boolean select) {
            this.args.putBoolean(ArgKeys.SELECT, select);
            return this;
        }
    }

    public PhotoListFragment() {
        super(100);
        this.layout = new ArrayList<>();
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.photos.PhotoListFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context arg0, Intent intent) {
                if (Upload.ACTION_PHOTO_ADDED.equals(intent.getAction())) {
                    int aid = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, 0);
                    if (aid == PhotoListFragment.this.album.id) {
                        PhotoListFragment.this.data.add((Photo) intent.getParcelableExtra("photo"));
                        PhotoListFragment.this.layoutPhotos();
                        PhotoListFragment.this.album.numPhotos++;
                        PhotoListFragment.this.updateList();
                    }
                }
                if (Upload.ACTION_PHOTO_REMOVED.equals(intent.getAction())) {
                    int aid2 = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, 0);
                    if (aid2 == PhotoListFragment.this.album.id) {
                        int pid = intent.getIntExtra("pid", 0);
                        Iterator it = PhotoListFragment.this.data.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                break;
                            }
                            Photo photo = (Photo) it.next();
                            if (photo.id == pid) {
                                PhotoListFragment.this.data.remove(photo);
                                PhotoAlbum photoAlbum = PhotoListFragment.this.album;
                                photoAlbum.numPhotos--;
                                break;
                            }
                        }
                        PhotoListFragment.this.layoutPhotos();
                        PhotoListFragment.this.updateList();
                        PhotoListFragment.this.onPhotoRemoved();
                    }
                }
                if (PhotoViewer.ACTION_UPDATE_PHOTO.equals(intent.getAction())) {
                    int aid3 = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, 0);
                    if (aid3 == PhotoListFragment.this.album.id) {
                        Photo photo2 = (Photo) intent.getParcelableExtra("photo");
                        for (int i = 0; i < PhotoListFragment.this.data.size(); i++) {
                            if (((Photo) PhotoListFragment.this.data.get(i)).id == photo2.id) {
                                ((Photo) PhotoListFragment.this.data.get(i)).descr = photo2.descr;
                                ((Photo) PhotoListFragment.this.data.get(i)).nLikes = photo2.nLikes;
                                ((Photo) PhotoListFragment.this.data.get(i)).isLiked = photo2.isLiked;
                                ((Photo) PhotoListFragment.this.data.get(i)).nReposts = photo2.nReposts;
                                return;
                            }
                        }
                    }
                }
            }
        };
    }

    public PhotoListFragment(int perPage) {
        super(perPage);
        this.layout = new ArrayList<>();
        this.receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.photos.PhotoListFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context arg0, Intent intent) {
                if (Upload.ACTION_PHOTO_ADDED.equals(intent.getAction())) {
                    int aid = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, 0);
                    if (aid == PhotoListFragment.this.album.id) {
                        PhotoListFragment.this.data.add((Photo) intent.getParcelableExtra("photo"));
                        PhotoListFragment.this.layoutPhotos();
                        PhotoListFragment.this.album.numPhotos++;
                        PhotoListFragment.this.updateList();
                    }
                }
                if (Upload.ACTION_PHOTO_REMOVED.equals(intent.getAction())) {
                    int aid2 = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, 0);
                    if (aid2 == PhotoListFragment.this.album.id) {
                        int pid = intent.getIntExtra("pid", 0);
                        Iterator it = PhotoListFragment.this.data.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                break;
                            }
                            Photo photo = (Photo) it.next();
                            if (photo.id == pid) {
                                PhotoListFragment.this.data.remove(photo);
                                PhotoAlbum photoAlbum = PhotoListFragment.this.album;
                                photoAlbum.numPhotos--;
                                break;
                            }
                        }
                        PhotoListFragment.this.layoutPhotos();
                        PhotoListFragment.this.updateList();
                        PhotoListFragment.this.onPhotoRemoved();
                    }
                }
                if (PhotoViewer.ACTION_UPDATE_PHOTO.equals(intent.getAction())) {
                    int aid3 = intent.getIntExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, 0);
                    if (aid3 == PhotoListFragment.this.album.id) {
                        Photo photo2 = (Photo) intent.getParcelableExtra("photo");
                        for (int i = 0; i < PhotoListFragment.this.data.size(); i++) {
                            if (((Photo) PhotoListFragment.this.data.get(i)).id == photo2.id) {
                                ((Photo) PhotoListFragment.this.data.get(i)).descr = photo2.descr;
                                ((Photo) PhotoListFragment.this.data.get(i)).nLikes = photo2.nLikes;
                                ((Photo) PhotoListFragment.this.data.get(i)).isLiked = photo2.isLiked;
                                ((Photo) PhotoListFragment.this.data.get(i)).nReposts = photo2.nReposts;
                                return;
                            }
                        }
                    }
                }
            }
        };
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.album = (PhotoAlbum) getArguments().getParcelable(ArgKeys.ALBUM);
        this.showAlbumHeader = !getArguments().getBoolean("no_album_header");
        setTitle(this.album.title);
        if (!getArguments().getBoolean(AppKitFragment.EXTRA_IS_TAB)) {
            activity.setTheme(R.style.BaseStyle_WhiteToolbar);
            setHasOptionsMenu(true);
        }
        if (!this.loaded && (!getArguments().getBoolean(AppKitFragment.EXTRA_IS_TAB) || getArguments().getBoolean("autoload"))) {
            loadData();
        }
        ActivityUtils.setBeamLink(getActivity(), ArgKeys.ALBUM + this.album.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.album.id);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle s) {
        super.onCreate(s);
        IntentFilter filter = new IntentFilter();
        filter.addAction(Upload.ACTION_PHOTO_ADDED);
        filter.addAction(Upload.ACTION_PHOTO_REMOVED);
        filter.addAction(PhotoViewer.ACTION_UPDATE_PHOTO);
        filter.addAction(PhotoViewer.ACTION_UPDATE_ALBUM_COVER);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        VKApplication.context.unregisterReceiver(this.receiver);
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (!getArguments().getBoolean(AppKitFragment.EXTRA_IS_TAB) && getToolbar() != null && getToolbar().getNavigationIcon() != null) {
            getToolbar().setNavigationIcon(new RecoloredDrawable(getToolbar().getNavigationIcon(), -9341574));
        }
        this.list.setDrawSelectorOnTop(true);
        this.list.setPadding(0, 0, V.dp(-3.0f), 0);
        this.list.setSelector(R.drawable.highlight);
        this.list.setScrollBarStyle(0);
        this.list.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.fragments.photos.PhotoListFragment.2
            @Override // android.support.v7.widget.RecyclerView.ItemDecoration
            public void getItemOffsets(Rect outRect, View view2, RecyclerView parent, RecyclerView.State state) {
                int pos = parent.getChildAdapterPosition(view2);
                UsableRecyclerView.Adapter inner = PhotoListFragment.this.adapter.getAdapterForPosition(pos);
                PhotoListFragment.this.getItemOffsets(inner, PhotoListFragment.this.adapter.getAdapterPosition(pos), pos, outRect);
            }
        });
        view.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.vkontakte.android.fragments.photos.PhotoListFragment.3
            @Override // android.view.View.OnLayoutChangeListener
            public void onLayoutChange(View v, int left, int top, int right, int bottom, int oldLeft, int oldTop, int oldRight, int oldBottom) {
                int w = right - left;
                int prevW = oldRight - oldLeft;
                PhotoListFragment.this.listWidth = w;
                if (w != prevW) {
                    PhotoListFragment.this.layoutPhotos();
                    PhotoListFragment.this.adapter.notifyDataSetChanged();
                }
            }
        });
        if (!getArguments().getBoolean(AppKitFragment.EXTRA_IS_TAB)) {
            Activity activity = getActivity();
            if ((activity instanceof NavigationDelegateProvider) && (((NavigationDelegateProvider) activity).getNavigationDelegate() instanceof NavigationDelegateLeftMenu)) {
                NavigationDelegateLeftMenu ndlm = (NavigationDelegateLeftMenu) ((NavigationDelegateActivity) activity).getNavigationDelegate();
                ndlm.setStatusBarColor(-1);
            }
            if (Build.VERSION.SDK_INT >= 23) {
                getActivity().getWindow().setStatusBarColor(1169931195);
                view.setSystemUiVisibility(8192);
            }
            if (!getArguments().getBoolean("no_album_header")) {
                this.list.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.photos.PhotoListFragment.4
                    private View _list;
                    private boolean visible = true;
                    private Animator currentAnim = null;
                    private int lastTextAlpha = 255;
                    private Interpolator interpolator = new DecelerateInterpolator();

                    @Override // android.view.ViewTreeObserver.OnPreDrawListener
                    public boolean onPreDraw() {
                        boolean newVisible;
                        if (this._list == null) {
                            this._list = PhotoListFragment.this.list;
                        }
                        if (PhotoListFragment.this.list != null) {
                            if (PhotoListFragment.this.list.getChildCount() > 0) {
                                if (PhotoListFragment.this.list.getChildCount() > 0 && PhotoListFragment.this.list.getChildAdapterPosition(PhotoListFragment.this.list.getChildAt(0)) == 0 && PhotoListFragment.this.list.getChildAt(0).getTop() > V.dp(-50.0f)) {
                                    newVisible = false;
                                } else {
                                    newVisible = true;
                                }
                                if (newVisible != this.visible) {
                                    this.visible = newVisible;
                                    if (this.currentAnim != null) {
                                        this.currentAnim.cancel();
                                        this.currentAnim = null;
                                    }
                                    AnimatorSet set = new AnimatorSet();
                                    int[] iArr = new int[1];
                                    iArr[0] = this.visible ? 255 : 0;
                                    ObjectAnimator alpha = ObjectAnimator.ofInt(this, "toolbarTitleTextAlpha", iArr);
                                    if (Build.VERSION.SDK_INT >= 21) {
                                        Animator[] animatorArr = new Animator[2];
                                        animatorArr[0] = alpha;
                                        Toolbar toolbar = PhotoListFragment.this.getToolbar();
                                        float[] fArr = new float[1];
                                        fArr[0] = this.visible ? V.dp(3.0f) : 0.0f;
                                        animatorArr[1] = ObjectAnimator.ofFloat(toolbar, "elevation", fArr);
                                        set.playTogether(animatorArr);
                                    } else {
                                        set.playTogether(alpha);
                                    }
                                    set.setDuration(200L);
                                    set.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.fragments.photos.PhotoListFragment.4.1
                                        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                        public void onAnimationEnd(Animator animation) {
                                            AnonymousClass4.this.currentAnim = null;
                                        }
                                    });
                                    this.currentAnim = set;
                                    set.start();
                                }
                            }
                        } else {
                            this._list.getViewTreeObserver().removeOnPreDrawListener(this);
                        }
                        return true;
                    }

                    public void setToolbarTitleTextAlpha(int alpha) {
                        Toolbar toolbar = PhotoListFragment.this.getToolbar();
                        if (toolbar != null) {
                            PhotoListFragment.this.getToolbar().setTitleTextColor((alpha << 24) | 7107450);
                        }
                        this.lastTextAlpha = alpha;
                    }

                    public int getToolbarTitleTextAlpha() {
                        return this.lastTextAlpha;
                    }
                });
            }
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: onCreateLayoutManager */
    protected RecyclerView.LayoutManager mo1032onCreateLayoutManager() {
        GridLayoutManager glm = new GridLayoutManager(getActivity(), 1000);
        glm.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() { // from class: com.vkontakte.android.fragments.photos.PhotoListFragment.5
            @Override // android.support.v7.widget.GridLayoutManager.SpanSizeLookup
            public int getSpanSize(int position) {
                int position2;
                UsableRecyclerView.Adapter a = PhotoListFragment.this.adapter.getAdapterForPosition(position);
                if ((a instanceof PhotoAdapter) && PhotoListFragment.this.layout.size() > (position2 = PhotoListFragment.this.adapter.getAdapterPosition(position) + ((PhotoAdapter) a).offset)) {
                    return PhotoListFragment.this.layout.get(position2).spanSize;
                }
                return 1000;
            }
        });
        return glm;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (this.album == null) {
            this.album = (PhotoAlbum) getArguments().getParcelable(ArgKeys.ALBUM);
            if (this.album == null && getActivity() != null) {
                getActivity().finish();
            }
        } else if (this.album.id > -9000) {
            this.currentRequest = new PhotosGet(this.album.oid, this.album.id, offset, count, true).setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
        } else if (this.album.id == -9000) {
            this.dataLoading = true;
            this.currentRequest = new PhotosGetUserPhotos(this.album.oid, offset, count).setCallback(new SimpleListCallback<Photo>(this) { // from class: com.vkontakte.android.fragments.photos.PhotoListFragment.6
                @Override // com.vkontakte.android.api.SimpleListCallback, com.vkontakte.android.api.Callback
                public void success(VKList<Photo> result) {
                    super.success((VKList) result);
                    PhotoListFragment.this.album.numPhotos = result.total();
                }
            }).exec((Context) getActivity());
        } else if (this.album.id == -9001) {
            this.currentRequest = new FaveGetPhotos(offset, count).setCallback(new SimpleListCallback<Photo>(this) { // from class: com.vkontakte.android.fragments.photos.PhotoListFragment.7
                @Override // com.vkontakte.android.api.SimpleListCallback, com.vkontakte.android.api.Callback
                public void success(VKList<Photo> result) {
                    super.success((VKList) result);
                    PhotoListFragment.this.album.numPhotos = result.total();
                }
            }).exec((Context) getActivity());
        } else if (this.album.id == -9002) {
            this.currentRequest = new PhotosGetAll(this.album.oid, offset, count).setCallback(new SimpleListCallback<Photo>(this) { // from class: com.vkontakte.android.fragments.photos.PhotoListFragment.8
                @Override // com.vkontakte.android.api.SimpleListCallback, com.vkontakte.android.api.Callback
                public void success(VKList<Photo> result) {
                    super.success((VKList) result);
                    PhotoListFragment.this.album.numPhotos = result.total();
                }
            }).exec((Context) getActivity());
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void onDataLoaded(PaginatedList<Photo> d) {
        super.onDataLoaded((PaginatedList) d);
        this.album.numPhotos = d.total();
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (!getArguments().getBoolean(AppKitFragment.EXTRA_IS_TAB)) {
            inflater.inflate(R.menu.photo_list, menu);
            menu.findItem(R.id.add).setIcon(new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_add_24dp).mutate(), -8881798));
            menu.findItem(R.id.add).setVisible(this.album.id > 0 && (this.album.canUpload || VKAccountManager.isCurrentUser(this.album.oid)));
            menu.findItem(R.id.copy_link).setVisible(this.album.id > -9000);
            MenuItem add = menu.findItem(R.id.add);
            if (add != null) {
                SubMenu subMenu = add.getSubMenu();
                ViewUtils.colorizeSubmenu(subMenu, getResources().getColor(R.color.brand_primary));
                for (int i = 0; i < subMenu.size(); i++) {
                    MenuItem item = subMenu.getItem(i);
                    if (item != null) {
                        CharSequence title = item.getTitle();
                        SpannableString ss = new SpannableString(title);
                        ss.setSpan(new ForegroundColorSpan(getResources().getColor(R.color.brand_primary)), 0, ss.length(), 0);
                        item.setTitle(ss);
                    }
                }
            }
        }
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.copy_link) {
            ClipboardManager mgr = (ClipboardManager) getActivity().getSystemService("clipboard");
            mgr.setText("https://vk.com/album" + this.album.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.album.id);
            Toast.makeText(getActivity(), (int) R.string.link_copied, 0).show();
            return true;
        }
        if (item.getItemId() == R.id.add_camera) {
            Intent intent = new Intent(getActivity(), ImagePickerActivity.class);
            intent.putExtra(ServerKeys.TYPE, 0);
            startActivityForResult(intent, UPLOAD_RESULT);
        }
        if (item.getItemId() == R.id.add_gallery) {
            Intent intent2 = new Intent(getActivity(), ImagePickerActivity.class);
            intent2.putExtra(ServerKeys.TYPE, 1);
            startActivityForResult(intent2, UPLOAD_RESULT);
        }
        return false;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new MergeRecyclerAdapter();
            if (this.showAlbumHeader) {
                this.adapter.addAdapter(new HeaderAdapter());
            }
            this.adapter.addAdapter(new PhotoAdapter(0, Integer.MAX_VALUE));
        }
        return this.adapter;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public void onAppendItems(List<Photo> items) {
        super.onAppendItems(items);
        if (this.viewer != null) {
            this.viewer.appendPhotos(items);
        }
        layoutPhotos();
    }

    public void disableRefresh() {
        setRefreshEnabled(false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void layoutPhotos() {
        if (this.data.size() != 0 && this.listWidth != 0) {
            this.layout.clear();
            int scrW = Math.round(this.listWidth / getResources().getDisplayMetrics().density);
            int maxW = Math.round(scrW * 1.5f);
            ArrayList<PhotoLayoutInfo> row = new ArrayList<>();
            int rowW = 0;
            int j = 0;
            Iterator it = this.data.iterator();
            while (it.hasNext()) {
                Photo photo = (Photo) it.next();
                Photo.Image img = photo.getImage('x');
                int scaledW = img.width == 0 ? 180 : Math.round(Math.min(1.5f, Math.max(0.5f, img.width / img.height)) * 180.0f);
                boolean forceBreak = needLineBreakAfter(j);
                if (rowW + scaledW > maxW || forceBreak) {
                    float f = scrW / rowW;
                    int spansLeft = 1000;
                    int widthLeft = Math.max(rowW, scrW);
                    int i = 0;
                    Iterator<PhotoLayoutInfo> it2 = row.iterator();
                    while (it2.hasNext()) {
                        PhotoLayoutInfo li = it2.next();
                        li.height = Math.round(V.dp(180.0f) * Math.min(f, 1.1f));
                        li.spanSize = Math.round((li.scaledWidth / widthLeft) * spansLeft);
                        spansLeft -= li.spanSize;
                        widthLeft -= li.scaledWidth;
                        if (forceBreak && i == row.size() - 1 && spansLeft < 100) {
                            li.spanSize += spansLeft;
                        }
                        i++;
                    }
                    if (!forceBreak && spansLeft > 0) {
                        int i2 = 0;
                        Iterator<PhotoLayoutInfo> it3 = row.iterator();
                        while (it3.hasNext()) {
                            PhotoLayoutInfo li2 = it3.next();
                            int add = spansLeft / (row.size() - i2);
                            li2.spanSize += add;
                            spansLeft -= add;
                            i2++;
                        }
                    }
                    this.layout.addAll(row);
                    row.clear();
                    rowW = 0;
                }
                if (rowW + scaledW <= maxW) {
                    PhotoLayoutInfo li3 = new PhotoLayoutInfo();
                    li3.photo = photo;
                    li3.scaledWidth = scaledW;
                    row.add(li3);
                    rowW += scaledW;
                }
                j++;
            }
            if (row.size() > 0) {
                float f2 = Math.min(1.0f, scrW / rowW);
                int spansLeft2 = 1000;
                int widthLeft2 = Math.max(rowW, scrW);
                int i3 = 0;
                Iterator<PhotoLayoutInfo> it4 = row.iterator();
                while (it4.hasNext()) {
                    PhotoLayoutInfo li4 = it4.next();
                    li4.height = Math.round(V.dp(180.0f) * f2);
                    li4.spanSize = Math.round((li4.scaledWidth / widthLeft2) * spansLeft2);
                    spansLeft2 -= li4.spanSize;
                    widthLeft2 -= li4.scaledWidth;
                    if (i3 == row.size() - 1 && spansLeft2 < 10) {
                        li4.spanSize += spansLeft2;
                    }
                    i3++;
                }
                this.layout.addAll(row);
                row.clear();
            }
        }
    }

    protected boolean needLineBreakAfter(int position) {
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void getItemOffsets(UsableRecyclerView.Adapter adapter, int positionInAdapter, int absPosition, Rect outRect) {
        int pos;
        if ((adapter instanceof PhotoAdapter) && (pos = positionInAdapter + ((PhotoAdapter) adapter).offset) < this.data.size()) {
            outRect.right = V.dp(3.0f);
            if (((Photo) this.data.get(pos)).id == Integer.MIN_VALUE) {
                if (pos > 0) {
                    outRect.top = V.dp(-3.0f);
                    return;
                }
                return;
            }
            outRect.bottom = V.dp(3.0f);
        }
    }

    protected void openPhoto(Photo photo) {
        if (getArguments().getBoolean(ArgKeys.SELECT)) {
            Intent intent = new Intent();
            intent.putExtra("photo", photo);
            getActivity().setResult(-1, intent);
            getActivity().finish();
            return;
        }
        this.viewer = new PhotoViewer(getActivity(), this.data, this.data.indexOf(photo), this);
        this.viewer.setTitle(this.album.title);
        this.viewer.setDisplayTotal(this.album.numPhotos);
        this.viewer.setAlbumIDs(this.album.oid, this.album.id);
        this.viewer.show();
    }

    @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
    public void getPhotoBounds(int index, Rect outRect, Rect outClip) {
        for (int i = 0; this.list != null && i < this.list.getChildCount(); i++) {
            View v = this.list.getChildAt(i);
            UsableRecyclerView.ViewHolder holder = this.list.mo1205getChildViewHolder(v);
            if (holder instanceof PhotoViewHolder) {
                Photo photo = ((PhotoViewHolder) holder).getItem();
                if (this.data.indexOf(photo) == index) {
                    int[] loc = {0, 0};
                    v.getLocationInWindow(loc);
                    outRect.set(loc[0], loc[1], loc[0] + v.getWidth(), loc[1] + v.getHeight());
                    Point offset = V.getViewOffset(v, this.list);
                    if (offset.y < 0) {
                        outClip.top = -offset.y;
                    }
                    if (offset.y + v.getHeight() > this.list.getHeight()) {
                        outClip.bottom = (offset.y + v.getHeight()) - this.list.getHeight();
                        return;
                    }
                    return;
                }
            }
        }
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        ArrayList<String> files;
        if (reqCode == UPLOAD_RESULT && resCode == -1) {
            if (data.hasExtra("files")) {
                files = data.getStringArrayListExtra("files");
            } else {
                files = new ArrayList<>();
                files.add(data.getStringExtra(UriUtil.LOCAL_FILE_SCHEME));
            }
            ArrayList<UploadTask> tasks = new ArrayList<>();
            Iterator<String> it = files.iterator();
            while (it.hasNext()) {
                String file = it.next();
                tasks.add(new AlbumPhotoUploadTask(getActivity(), file, this.album.id, this.album.oid, "", false));
            }
            Intent intent = getActivity().getIntent();
            PendingIntent pIntent = PendingIntent.getActivity(getActivity(), 0, intent, 0);
            Upload.start(getActivity(), new BatchUploadTask(getActivity(), tasks, getString(R.string.uploading_photo), getString(R.string.photos_upload_ok), getString(R.string.photos_upload_ok_long), pIntent));
        }
    }

    @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
    public boolean isMoreAvailable() {
        return this.preloader.isMoreAvailable();
    }

    @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
    public void loadMore() {
        onScrolledToLastItem();
    }

    @Override // com.vkontakte.android.PhotoViewer.PhotoViewerCallback
    public void onDismissed() {
        this.viewer = null;
    }

    protected void onPhotoRemoved() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class PhotoLayoutInfo {
        public int height;
        public Photo photo;
        public int scaledWidth;
        public int spanSize;

        private PhotoLayoutInfo() {
        }
    }

    /* loaded from: classes3.dex */
    protected class HeaderAdapter extends UsableRecyclerView.Adapter<HeaderViewHolder> {
        /* JADX INFO: Access modifiers changed from: protected */
        public HeaderAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public HeaderViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new HeaderViewHolder();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(HeaderViewHolder holder, int position) {
            holder.update();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return 2;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes3.dex */
    public class PhotoAdapter extends UsableRecyclerView.Adapter<PhotoViewHolder> {
        private int count;
        private int offset;

        public PhotoAdapter(int offset, int count) {
            this.offset = offset;
            this.count = count;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public PhotoViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new PhotoViewHolder();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(PhotoViewHolder holder, int position) {
            if (PhotoListFragment.this.layout.size() > 0) {
                holder.bindLayout(PhotoListFragment.this.layout.get(this.offset + position));
            }
            holder.bind(PhotoListFragment.this.data.get(this.offset + position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return Math.min(PhotoListFragment.this.data.size() - this.offset, this.count);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return 1;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            int index = this.offset + position;
            Photo photo = (index < 0 || index >= PhotoListFragment.this.data.size()) ? null : (Photo) PhotoListFragment.this.data.get(index);
            PhotoLayoutInfo layoutInfo = (index < 0 || index >= PhotoListFragment.this.layout.size()) ? null : PhotoListFragment.this.layout.get(index);
            if (photo == null || layoutInfo == null) {
                return null;
            }
            Photo.Image image1 = photo.getImageByHeight(Math.min(320, layoutInfo.height));
            if (image1 != null) {
                return image1.url;
            }
            return null;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return 1;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class PhotoViewHolder extends RecyclerHolder<Photo> implements UsableRecyclerView.Clickable {
        private PhotoLayoutInfo info;

        public PhotoViewHolder() {
            super(new VKImageView(PhotoListFragment.this.getActivity()));
            this.itemView.setLayoutParams(new RecyclerView.LayoutParams(-1, V.dp(180.0f)));
            ((VKImageView) this.itemView).setActualScaleType(ScalingUtils.ScaleType.CENTER_CROP);
            ((VKImageView) this.itemView).setPlaceholderColor(-855310);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Photo photo) {
            Photo.Image image1;
            if (this.info != null && (image1 = photo.getImageByHeight(Math.min(320, this.info.height))) != null) {
                ((VKImageView) this.itemView).load(image1.url);
            }
        }

        public void bindLayout(PhotoLayoutInfo l) {
            this.itemView.getLayoutParams().height = l.height;
            this.info = l;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            if (PhotoListFragment.this.viewer == null) {
                PhotoListFragment.this.openPhoto((Photo) this.item);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class HeaderViewHolder extends UsableRecyclerView.ViewHolder {
        private TextView description;
        private TextView subtitle;
        private TextView title;

        public HeaderViewHolder() {
            super(View.inflate(PhotoListFragment.this.getActivity(), R.layout.photo_album_header, null));
            this.title = (TextView) this.itemView.findViewById(R.id.title);
            this.subtitle = (TextView) this.itemView.findViewById(R.id.subtitle);
            this.description = (TextView) this.itemView.findViewById(R.id.description);
        }

        public void update() {
            this.title.setText(PhotoListFragment.this.album.title);
            this.subtitle.setText(PhotoListFragment.this.getResources().getQuantityString(R.plurals.photos, PhotoListFragment.this.album.numPhotos, Integer.valueOf(PhotoListFragment.this.album.numPhotos)));
            if (TextUtils.isEmpty(PhotoListFragment.this.album.descr)) {
                this.description.setVisibility(8);
                return;
            }
            this.description.setVisibility(0);
            this.description.setText(LinkParser.parseLinks(PhotoListFragment.this.album.descr));
        }
    }
}
