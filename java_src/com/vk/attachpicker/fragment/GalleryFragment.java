package com.vk.attachpicker.fragment;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.util.Pair;
import android.support.v7.widget.GridLayoutManager;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.SpinnerAdapter;
import android.widget.Toast;
import com.vk.attachpicker.AttachIntent;
import com.vk.attachpicker.PhotoVideoAttachActivity;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.SupportExternalToolbarContainer;
import com.vk.attachpicker.adapter.AlbumPickSpinnerAdapter;
import com.vk.attachpicker.adapter.PhotoSmallAdapter;
import com.vk.attachpicker.events.NotificationCenter;
import com.vk.attachpicker.events.NotificationListener;
import com.vk.attachpicker.mediastore.AlbumEntry;
import com.vk.attachpicker.mediastore.MediaStoreController;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.attachpicker.screen.EditorScreen;
import com.vk.attachpicker.screen.TrimScreen;
import com.vk.attachpicker.screen.ViewerScreen;
import com.vk.attachpicker.util.CameraUtils;
import com.vk.attachpicker.widget.ContextProgressView;
import com.vk.attachpicker.widget.CustomSpinner;
import com.vk.attachpicker.widget.GalleryRecyclerView;
import com.vk.attachpicker.widget.MediaStoreItemSmallView;
import com.vk.attachpicker.widget.RobotoMediumTextView;
import com.vk.core.simplescreen.BaseScreen;
import com.vk.core.simplescreen.WindowScreenContainer;
import com.vk.core.util.IntentUtils;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
import com.vkontakte.android.utils.L;
import java.io.File;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class GalleryFragment extends Fragment implements ViewerScreen.PhotoViewerProvider, SupportExternalToolbarContainer {
    private static final int GALLERY_PHOTO_INTENT = 2;
    private static final int GALLERY_VIDEO_INTENT = 3;
    private PhotoSmallAdapter adapter;
    private boolean bigPreviews;
    private boolean cameraEnabled;
    private GridLayoutManager gridLayoutManager;
    private WindowScreenContainer imageViewer;
    private long onlyLastNMilliseconds;
    private ContextProgressView progressView;
    private GalleryRecyclerView recyclerView;
    private CustomSpinner spinner;
    private AlbumPickSpinnerAdapter spinnerAdapter;
    private String staticHeaderTitle;
    private RobotoMediumTextView staticTitle;
    private FrameLayout toolbarContainer;
    private boolean preventStyling = false;
    private boolean preventStylingPhoto = false;
    private boolean preventStylingVideo = false;
    private long videoMaxLengthMs = 0;
    private boolean singleMode = false;
    private int mediaType = 222;
    private boolean thumb = false;
    private final NotificationListener<Void> selectionUpdateListener = GalleryFragment$$Lambda$1.lambdaFactory$(this);

    @Override // android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        NotificationCenter.getInstance().addListener(1, this.selectionUpdateListener);
        if (getArguments() != null) {
            this.preventStyling = getArguments().getBoolean(AttachIntent.INTENT_PREVENT_STYLING, false);
            this.preventStylingPhoto = getArguments().getBoolean(AttachIntent.INTENT_PREVENT_STYLING_PHOTO, false);
            this.preventStylingVideo = getArguments().getBoolean(AttachIntent.INTENT_PREVENT_STYLING_VIDEO, false);
            this.videoMaxLengthMs = getArguments().getLong(AttachIntent.INTENT_VIDEO_MAX_LENGTH_MS, 0L);
            this.staticHeaderTitle = getArguments().getString(AttachIntent.INTENT_STATIC_HEADER_TITLE, null);
            this.bigPreviews = getArguments().getBoolean(AttachIntent.INTENT_BIG_PREVIEWS, false);
            this.cameraEnabled = getArguments().getBoolean(AttachIntent.INTENT_CAMERA_ENABLED, true);
            this.onlyLastNMilliseconds = getArguments().getLong(AttachIntent.INTENT_ONLY_LAST_N_MILLISECONDS, 0L);
            this.singleMode = getArguments().getBoolean(AttachIntent.INTENT_SINGLE_MODE, false);
            this.mediaType = getArguments().getInt("media_type", 222);
            this.thumb = getArguments().getBoolean(AttachIntent.INTENT_THUMB, false);
        }
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.picker_fragment_gallery, (ViewGroup) null);
    }

    @Override // android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        ArrayList<AlbumEntry> lastLoadedMediaStore;
        provideToolbar(getActivity());
        this.progressView = (ContextProgressView) view.findViewById(R.id.cpv_progress);
        this.progressView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vk.attachpicker.fragment.GalleryFragment.1
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                GalleryFragment.this.progressView.getViewTreeObserver().removeOnPreDrawListener(this);
                try {
                    int rvTop = (int) GalleryFragment.this.getResources().getDimension(R.dimen.picker_top_offset);
                    int visiblePart = GalleryFragment.this.recyclerView.getHeight() - rvTop;
                    ((FrameLayout.LayoutParams) GalleryFragment.this.progressView.getLayoutParams()).topMargin = (int) ((visiblePart / 2) - (GalleryFragment.this.getResources().getDimension(R.dimen.picker_gallery_loading_progress) / 2.0f));
                    GalleryFragment.this.progressView.requestLayout();
                    return false;
                } catch (Exception e) {
                    return false;
                }
            }
        });
        this.gridLayoutManager = new GridLayoutManager(view.getContext(), 3);
        this.recyclerView = (GalleryRecyclerView) view.findViewById(R.id.rv_gallery);
        this.recyclerView.setLayoutManager(this.gridLayoutManager);
        this.recyclerView.setHasFixedSize(true);
        if (this.bigPreviews) {
            this.recyclerView.setColumnWidthResId(R.dimen.picker_graffiti_size);
        } else {
            this.recyclerView.setColumnWidthResId(R.dimen.picker_item_size_image);
        }
        if (getActivity() != null && (getActivity() instanceof PhotoVideoAttachActivity)) {
            this.recyclerView.setPadding(this.recyclerView.getPaddingLeft(), this.recyclerView.getPaddingTop(), this.recyclerView.getPaddingRight(), (int) getActivity().getResources().getDimension(R.dimen.picker_bottom_button_height));
        }
        SelectionContext selectionContext = getSelectionContext();
        this.adapter = new PhotoSmallAdapter(getActivity(), selectionContext, this.singleMode);
        this.recyclerView.setAdapter(this.adapter);
        this.adapter.setItemClickListener(GalleryFragment$$Lambda$2.lambdaFactory$(this, selectionContext));
        if (this.mediaType == 111 && this.onlyLastNMilliseconds == 0) {
            lastLoadedMediaStore = MediaStoreController.lastLoadedPhotoVideo();
        } else if (this.mediaType == 333 && this.onlyLastNMilliseconds == 0) {
            lastLoadedMediaStore = MediaStoreController.lastLoadedVideo();
        } else if (this.mediaType == 222 && this.onlyLastNMilliseconds == 0) {
            lastLoadedMediaStore = MediaStoreController.lastLoadedPhoto();
        } else {
            lastLoadedMediaStore = null;
        }
        if (lastLoadedMediaStore != null && lastLoadedMediaStore.size() > 0) {
            this.progressView.setVisibility(8);
            this.recyclerView.setVisibility(0);
            this.adapter.setImages(lastLoadedMediaStore.get(0).getBucketImages());
            initSpinner(lastLoadedMediaStore);
        }
        this.adapter.setCameraEnabled(this.cameraEnabled && this.mediaType == 111 && CameraUtils.isDeviceHasCamera());
        this.adapter.setPhotoClickListener(GalleryFragment$$Lambda$3.lambdaFactory$(this));
        this.adapter.setVideoClickListener(GalleryFragment$$Lambda$4.lambdaFactory$(this));
        loadMediastore();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$0(SelectionContext selectionContext, int position) {
        Activity a = getActivity();
        if (a != null) {
            try {
                if (!this.adapter.getItem(position - this.adapter.delta()).isCorrupted()) {
                    if (this.imageViewer == null) {
                        this.imageViewer = new WindowScreenContainer(a);
                    }
                    if (!this.imageViewer.isShowing()) {
                        this.imageViewer.show();
                        ViewerScreen screen = new ViewerScreen(this.adapter.getItemsCopy(), position - this.adapter.delta(), selectionContext, this, this.preventStyling, this.preventStylingPhoto, this.preventStylingVideo, this.videoMaxLengthMs, this.singleMode, this.thumb);
                        this.imageViewer.showScreen(screen);
                        screen.animateIn();
                    }
                }
            } catch (Exception e) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$1(View v) {
        dispatchTakePictureIntent();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$2(View v) {
        dispatchTakeVideoIntent();
    }

    public void setStaticHeaderTitle(String staticHeaderTitle) {
        this.staticHeaderTitle = staticHeaderTitle;
    }

    private SelectionContext getSelectionContext() {
        if (getActivity() != null && (getActivity() instanceof SelectionContext.SelectionContextProvider)) {
            SelectionContext selectionContext = ((SelectionContext.SelectionContextProvider) getActivity()).getSelectionContext();
            return selectionContext;
        }
        return null;
    }

    private void initSpinner(ArrayList<AlbumEntry> albums) {
        Activity a = getActivity();
        if (a != null && this.spinner != null && this.adapter != null && this.adapter.getItemCount() > 1) {
            this.spinnerAdapter = new AlbumPickSpinnerAdapter(a, albums, this.mediaType);
            this.spinnerAdapter.setSpinner(this.spinner);
            this.spinner.setAdapter((SpinnerAdapter) this.spinnerAdapter);
            this.spinner.setVisibility(0);
            this.spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.vk.attachpicker.fragment.GalleryFragment.2
                AlbumEntry prevEntry;
                int prevSelection = 0;

                @Override // android.widget.AdapterView.OnItemSelectedListener
                public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                    try {
                        AlbumEntry item = GalleryFragment.this.spinnerAdapter.mo449getItem(i);
                        if (item == AlbumPickSpinnerAdapter.PHOTO_ENTRY) {
                            GalleryFragment.this.spinner.setSelection(this.prevSelection);
                            IntentUtils.dispatchImageIntent(GalleryFragment.this, 2);
                        } else if (item == AlbumPickSpinnerAdapter.VIDEO_ENTRY) {
                            GalleryFragment.this.spinner.setSelection(this.prevSelection);
                            IntentUtils.dispatchVideoIntent(GalleryFragment.this, 3);
                        } else {
                            if (this.prevEntry != item) {
                                GalleryFragment.this.adapter.setImages(item.getBucketImages());
                                GalleryFragment.this.recyclerView.scrollToPosition(0);
                            }
                            this.prevSelection = i;
                            this.prevEntry = item;
                        }
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                    }
                }

                @Override // android.widget.AdapterView.OnItemSelectedListener
                public void onNothingSelected(AdapterView<?> adapterView) {
                }
            });
        }
    }

    private void loadMediastore() {
        MediaStoreController.load(this.mediaType, this.onlyLastNMilliseconds, GalleryFragment$$Lambda$5.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$loadMediastore$3(ArrayList mediaStore) {
        if (getActivity() != null) {
            this.progressView.setVisibility(8);
            this.recyclerView.setVisibility(0);
            if (mediaStore != null && mediaStore.size() > 0) {
                this.adapter.setEmptyEnabled(false);
                this.adapter.setImages(((AlbumEntry) mediaStore.get(0)).getBucketImages());
            } else {
                this.adapter.setEmptyEnabled(true);
                this.adapter.setImages(new ArrayList<>());
            }
            initSpinner(mediaStore);
        }
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        if (this.imageViewer != null) {
            this.imageViewer.onResume();
        }
        if (this.adapter.getImagesCount() == 0) {
            loadMediastore();
        }
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        if (this.imageViewer != null) {
            this.imageViewer.onPause();
        }
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        if (this.imageViewer != null) {
            this.imageViewer.onDestroy();
            this.imageViewer.dismiss();
        }
        super.onDestroy();
        NotificationCenter.getInstance().removeListener(this.selectionUpdateListener);
    }

    @Override // com.vk.attachpicker.screen.ViewerScreen.PhotoViewerProvider
    public ViewerScreen.PlaceProviderObject getPlaceForPhoto(int index) {
        ViewerScreen.PlaceProviderObject object = null;
        int firstPosition = this.gridLayoutManager.findFirstVisibleItemPosition() - this.adapter.delta();
        int wantedChild = index - firstPosition;
        if (wantedChild < 0 || wantedChild >= this.recyclerView.getChildCount()) {
            L.e("GalleryFragment", "Unable to getTexture imageView for desired position, because it's not being displayed on screen.");
        } else {
            View view = this.recyclerView.getChildAt(wantedChild);
            MediaStoreItemSmallView imageView = (MediaStoreItemSmallView) view;
            if (imageView != null) {
                object = new ViewerScreen.PlaceProviderObject();
                object.imageView = imageView;
                object.containerView = view;
                object.parentView = this.recyclerView;
                object.entry = imageView.getStoreEntry();
                if (imageView.hasImage()) {
                    object.thumbImageWidth = imageView.getImageWidth();
                    object.thumbImageHeight = imageView.getImageHeight();
                }
            }
        }
        return object;
    }

    @Override // com.vk.attachpicker.screen.ViewerScreen.PhotoViewerProvider
    public void onPhotoSwitch(int fromIndex, int toIndex) {
        if (fromIndex != -1) {
            ViewerScreen.PlaceProviderObject oldObject = getPlaceForPhoto(fromIndex);
            if (oldObject != null) {
                oldObject.containerView.setVisibility(0);
            }
            ViewerScreen.PlaceProviderObject newObject = getPlaceForPhoto(toIndex);
            if (newObject != null) {
                newObject.containerView.setVisibility(4);
            }
        }
    }

    @Override // com.vk.attachpicker.screen.ViewerScreen.PhotoViewerProvider
    public void onPhotoSelected(MediaStoreEntry imageEntry) {
    }

    @Override // android.app.Fragment
    public void onActivityResult(final int requestCode, int resultCode, Intent data) {
        Intent result;
        BaseScreen screen;
        final Activity a = getActivity();
        if (a != null && resultCode == -1) {
            if (CameraUtils.isRequestValid(requestCode)) {
                boolean isVideo = CameraUtils.isVideoRequest(requestCode);
                File file = CameraUtils.getFileById(requestCode);
                CameraUtils.addMediaToGallery(Picker.getContext(), file, GalleryFragment$$Lambda$6.lambdaFactory$(this));
                if (this.preventStyling || ((!isVideo && this.preventStylingPhoto) || (isVideo && this.preventStylingVideo))) {
                    if (isVideo) {
                        result = SelectionContext.packSingleVideo(Uri.fromFile(file));
                    } else {
                        result = SelectionContext.packSinglePhoto(file);
                    }
                    a.setResult(-1, result);
                    a.finish();
                    return;
                }
                try {
                    if (this.imageViewer == null) {
                        this.imageViewer = new WindowScreenContainer(getActivity());
                    }
                    if (!this.imageViewer.isShowing()) {
                        this.imageViewer.show();
                        if (isVideo) {
                            screen = new TrimScreen(Uri.fromFile(file), this.videoMaxLengthMs, null);
                        } else {
                            screen = new EditorScreen(file, (EditorScreen.Delegate) null, this.thumb);
                        }
                        this.imageViewer.showScreen(screen);
                    }
                } catch (Exception e) {
                }
            } else if (requestCode == 2 || requestCode == 3) {
                IntentUtils.handleResult(a, data, new IntentUtils.ResolveCallback() { // from class: com.vk.attachpicker.fragment.GalleryFragment.3
                    @Override // com.vk.core.util.IntentUtils.ResolveCallback
                    public void onResolved(File file2) {
                        Intent result2;
                        BaseScreen screen2;
                        boolean videoRequest = requestCode == 3;
                        boolean photoRequest = requestCode == 2;
                        if (!GalleryFragment.this.preventStyling && ((!photoRequest || !GalleryFragment.this.preventStylingPhoto) && (!videoRequest || !GalleryFragment.this.preventStylingVideo))) {
                            try {
                                if (GalleryFragment.this.imageViewer == null) {
                                    GalleryFragment.this.imageViewer = new WindowScreenContainer(GalleryFragment.this.getActivity());
                                }
                                if (!GalleryFragment.this.imageViewer.isShowing()) {
                                    GalleryFragment.this.imageViewer.show();
                                    if (requestCode == 3) {
                                        screen2 = new TrimScreen(Uri.fromFile(file2), GalleryFragment.this.videoMaxLengthMs, null);
                                    } else {
                                        screen2 = new EditorScreen(file2, (EditorScreen.Delegate) null, GalleryFragment.this.thumb);
                                    }
                                    GalleryFragment.this.imageViewer.showScreen(screen2);
                                    return;
                                }
                                return;
                            } catch (Exception e2) {
                                return;
                            }
                        }
                        if (requestCode == 3) {
                            result2 = SelectionContext.packSingleVideo(Uri.fromFile(file2));
                        } else {
                            result2 = SelectionContext.packSinglePhoto(file2);
                        }
                        a.setResult(-1, result2);
                        a.finish();
                    }

                    @Override // com.vk.core.util.IntentUtils.ResolveCallback
                    public void onError() {
                        Toast.makeText(a, (int) R.string.picker_loading_error, 0).show();
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onActivityResult$4(String path, Uri uri) {
        loadMediastore();
    }

    @Override // com.vk.attachpicker.SupportExternalToolbarContainer
    public ViewGroup provideToolbar(Context context) {
        if (this.toolbarContainer == null) {
            this.toolbarContainer = new FrameLayout(context);
            this.toolbarContainer.setPadding(Screen.dp(16), 0, Screen.dp(16), 0);
            if (TextUtils.isEmpty(this.staticHeaderTitle)) {
                this.spinner = new CustomSpinner(context);
                this.spinner.setDropDownWidth((int) (Screen.realWidth() * 0.6666667f));
                this.spinner.setVisibility(4);
                this.toolbarContainer.addView(this.spinner, new FrameLayout.LayoutParams(-2, -1));
            } else {
                this.staticTitle = new RobotoMediumTextView(context);
                this.staticTitle.setTextColor(-7301991);
                this.staticTitle.setText(this.staticHeaderTitle);
                this.staticTitle.setAllCaps(true);
                this.staticTitle.setGravity(19);
                this.staticTitle.setTextSize(14.0f);
                this.toolbarContainer.addView(this.staticTitle, new FrameLayout.LayoutParams(-2, -1));
            }
        }
        return this.toolbarContainer;
    }

    private void dispatchTakePictureIntent() {
        Intent takePictureIntent = new Intent("android.media.action.IMAGE_CAPTURE");
        if (takePictureIntent.resolveActivity(getActivity().getPackageManager()) != null) {
            Pair<Integer, File> request = CameraUtils.getCameraRequestData(false);
            takePictureIntent.putExtra("output", Uri.fromFile(request.second));
            startActivityForResult(takePictureIntent, request.first.intValue());
        }
    }

    private void dispatchTakeVideoIntent() {
        Intent takePictureIntent = new Intent("android.media.action.VIDEO_CAPTURE");
        if (takePictureIntent.resolveActivity(getActivity().getPackageManager()) != null) {
            Pair<Integer, File> request = CameraUtils.getCameraRequestData(true);
            takePictureIntent.putExtra("output", Uri.fromFile(request.second));
            startActivityForResult(takePictureIntent, request.first.intValue());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$5(int eventType, int eventId, Void eventArgs) {
        if (this.adapter != null) {
            this.adapter.notifyDataSetChanged();
        }
    }
}
