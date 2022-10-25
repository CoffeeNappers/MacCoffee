package com.vkontakte.android.ui.posts;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.mediastore.AlbumEntry;
import com.vk.attachpicker.mediastore.MediaStoreController;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.attachpicker.screen.ViewerScreen;
import com.vk.attachpicker.widget.MediaStoreItemSmallView;
import com.vk.attachpicker.widget.OnItemClickListener;
import com.vk.core.util.IntentUtils;
import com.vk.core.util.KeyboardUtils;
import com.vk.core.util.ToastUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.Image;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.ResulterProvider;
import com.vkontakte.android.ui.adapters.PhotoSmallPickerAdapter;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.gamepage.GameInfoHolder;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.PostPublisher;
import com.vkontakte.android.utils.Utils;
import java.io.File;
import java.util.ArrayList;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class NotificationPostDisplayItemGallery extends PostDisplayItem {
    static final int BUTTON_CELL = 0;
    static final int BUTTON_NEW_POST = 3;
    static final int BUTTON_PRIMARY = 1;
    static final int BUTTON_SECONDARY = 2;
    private static final int GALLERY_PHOTO_INTENT = 2;
    private static final int LAYOUT_APP = 0;
    private static final int LAYOUT_BANNER = 2;
    private static final int LAYOUT_INFO = 1;
    private static final int LAYOUT_NEW_POST = 3;
    private final UserNotification userNotification;
    static final int[] HEADERS = {R.layout.notifications_block_header_1, R.layout.notifications_block_header_2, R.layout.notifications_block_header_3, R.layout.notifications_block_header_4};
    static final int[] BUTTONS = {R.layout.notifications_block_button_1, R.layout.notifications_block_button_2, R.layout.notifications_block_button_3, R.layout.notifications_block_button_4, R.layout.notifications_block_button_null};
    static final int BUTTON_NULL = BUTTONS.length - 1;

    public NotificationPostDisplayItemGallery(UserNotification userNotification) {
        super(userNotification.id, NewsEntry.OWNER_ID_NOTIFICATION);
        this.userNotification = userNotification;
    }

    public static View createView(Fragment fragment, int viewType) {
        return new ViewHolder(fragment.getActivity(), viewType).itemView;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return createViewType(getStyle(this.userNotification), getButtonStyle(this.userNotification), hasUsers(this.userNotification));
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 0;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return null;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        ((ViewHolder) view.getTag()).bind(this.userNotification);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static class ViewHolder extends RecyclerHolder<UserNotification> implements View.OnClickListener, ViewTreeObserver.OnPreDrawListener, ViewerScreen.PhotoViewerProvider, ActivityResulter {
        private PhotoSmallPickerAdapter adapter;
        @Nullable
        final TextView button;
        private LinearLayout galleryDescriptionContainer;
        @Nullable
        final VKImageView imageView;
        private LinearLayoutManager linearLayoutManager;
        @Nullable
        final TextView message;
        final VKImageView[] profileViews;
        final TextView profilesDescription;
        @Nullable
        final PostPublisher publisher;
        private RecyclerView rvGallery;
        private SelectionContext selectionContext;
        int style;
        @Nullable
        final TextView title;

        public ViewHolder(Activity context, int viewType) {
            super(new LinearLayout(context));
            this.style = 0;
            this.publisher = new PostPublisher(new PostPublisher.PostPublisherCallback() { // from class: com.vkontakte.android.ui.posts.NotificationPostDisplayItemGallery.ViewHolder.1
                @Override // com.vkontakte.android.utils.PostPublisher.PostPublisherCallback
                public void onError(@Nullable VKAPIRequest.VKErrorResponse error) {
                    if (error == null) {
                        ToastUtils.showToast(ViewHolder.this.getString(R.string.err_text));
                    } else {
                        APIUtils.showErrorToast(VKApplication.context, error.getCode(), error.message);
                    }
                }

                @Override // com.vkontakte.android.utils.PostPublisher.PostPublisherCallback
                public void onSuccess() {
                    ViewHolder.this.getItem().hideNotification(ViewHolder.this.getContext(), true);
                }
            });
            this.itemView.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() { // from class: com.vkontakte.android.ui.posts.NotificationPostDisplayItemGallery.ViewHolder.2
                @Override // android.view.View.OnAttachStateChangeListener
                public void onViewAttachedToWindow(View v) {
                    ((ResulterProvider) ViewHolder.this.getContext()).registerActivityResult(ViewHolder.this);
                }

                @Override // android.view.View.OnAttachStateChangeListener
                public void onViewDetachedFromWindow(View v) {
                    ((ResulterProvider) ViewHolder.this.getContext()).unregisterActivityResult(ViewHolder.this);
                    if (ViewHolder.this.style == 3) {
                        KeyboardUtils.hideKeyboard(ViewHolder.this.getContext());
                    }
                }
            });
            LinearLayout layout = (LinearLayout) this.itemView;
            layout.setOrientation(1);
            layout.setTag(this);
            int buttonStyle = NotificationPostDisplayItemGallery.getButtonStyle(viewType);
            LayoutInflater from = LayoutInflater.from(context);
            int[] iArr = NotificationPostDisplayItemGallery.HEADERS;
            int style = NotificationPostDisplayItemGallery.getStyle(viewType);
            this.style = style;
            layout.addView(from.inflate(iArr[style], (ViewGroup) null));
            if (NotificationPostDisplayItemGallery.hasUsers(viewType)) {
                layout.addView(LayoutInflater.from(context).inflate(R.layout.notifications_block_users, (ViewGroup) null));
            }
            View button = LayoutInflater.from(context).inflate(NotificationPostDisplayItemGallery.BUTTONS[buttonStyle], (ViewGroup) null);
            layout.addView(button);
            if (buttonStyle == 1 || buttonStyle == 2) {
                switch (this.style) {
                    case 0:
                        int leftPad = context.getResources().getDimensionPixelSize(R.dimen.post_side_padding) + V.dp(76.0f);
                        button.setPadding(leftPad, button.getPaddingTop(), button.getPaddingRight(), button.getPaddingBottom());
                        break;
                    case 1:
                        int leftPad2 = context.getResources().getDimensionPixelSize(R.dimen.post_side_padding) + V.dp(44.0f);
                        button.setPadding(leftPad2, button.getPaddingTop(), button.getPaddingRight(), button.getPaddingBottom());
                        break;
                    case 2:
                        ((LinearLayout) button).setGravity(1);
                        break;
                }
            }
            this.title = (TextView) $(16908310);
            TextView textView = (TextView) $(16908313);
            this.button = textView;
            if (textView != null) {
                this.button.setOnClickListener(this);
            }
            this.message = (TextView) $(16908299);
            if (this.style == 3) {
                configureNewPost(context);
            }
            this.imageView = (VKImageView) $(16908294);
            this.profilesDescription = (TextView) $(R.id.users_text);
            this.profileViews = new VKImageView[4];
            this.profileViews[0] = (VKImageView) $(R.id.user1);
            this.profileViews[1] = (VKImageView) $(R.id.user2);
            this.profileViews[2] = (VKImageView) $(R.id.user3);
            this.profileViews[3] = (VKImageView) $(R.id.user4);
            View buttonClose = $(16908327);
            if (buttonClose != null) {
                buttonClose.setOnClickListener(this);
            }
        }

        private void setupRecyclerView(final Context context) {
            if (this.selectionContext == null) {
                this.selectionContext = new SelectionContext();
                this.selectionContext.setSelectListener(NotificationPostDisplayItemGallery$ViewHolder$$Lambda$1.lambdaFactory$(this));
            }
            this.galleryDescriptionContainer = (LinearLayout) $(R.id.galleryDescriptionContainer);
            this.rvGallery = (RecyclerView) $(R.id.rv_gallery);
            showGallery(false);
            this.linearLayoutManager = new LinearLayoutManager(context, 0, false);
            this.rvGallery.setLayoutManager(this.linearLayoutManager);
            this.rvGallery.setHasFixedSize(true);
            this.adapter = new PhotoSmallPickerAdapter(context, this.selectionContext, false);
            this.rvGallery.setAdapter(this.adapter);
            this.rvGallery.addItemDecoration(new GameInfoHolder.SpacesItemDecoration(V.dp(4.0f)));
            this.adapter.setItemClickListener(new OnItemClickListener() { // from class: com.vkontakte.android.ui.posts.NotificationPostDisplayItemGallery.ViewHolder.3
                @Override // com.vk.attachpicker.widget.OnItemClickListener
                public void onItemClickListener(int position) {
                    Activity a = Utils.castToActivity(context);
                    try {
                        if (position == ViewHolder.this.adapter.getItemCount() - 1) {
                            IntentUtils.dispatchImageIntent(a, 2);
                        }
                    } catch (Exception e) {
                    }
                }
            });
            loadPhotosInside();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$setupRecyclerView$0(int countSelected) {
            checkBtnPublishPost();
        }

        private void loadMediaStore() {
            MediaStoreController.load(222, NotificationPostDisplayItemGallery$ViewHolder$$Lambda$2.lambdaFactory$(this));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$loadMediaStore$1(ArrayList mediaStore) {
            if (mediaStore != null && mediaStore.size() > 0) {
                showGallery(true);
                this.adapter.setImages(((AlbumEntry) mediaStore.get(0)).getBucketImages());
                return;
            }
            showGallery(false);
            this.adapter.setImages(new ArrayList());
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void checkBtnPublishPost() {
            boolean z = false;
            if (this.message != null) {
                boolean isTextNotEmpty = this.message.getText().toString().trim().length() > 0;
                boolean isSelected = this.selectionContext != null && this.selectionContext.selectionCount() > 0;
                if (isTextNotEmpty || isSelected) {
                    z = true;
                }
                setBtnPublishPost(z);
            }
        }

        private void setBtnPublishPost(boolean enabled) {
            if (this.button != null) {
                this.button.setEnabled(enabled);
                this.button.setAlpha(enabled ? 1.0f : 0.6f);
            }
        }

        private void configureNewPost(Context context) {
            if (this.message != null) {
                setBtnPublishPost(false);
                this.message.addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.ui.posts.NotificationPostDisplayItemGallery.ViewHolder.4
                    @Override // android.text.TextWatcher
                    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                    }

                    @Override // android.text.TextWatcher
                    public void onTextChanged(CharSequence s, int start, int before, int count) {
                        ViewHolder.this.checkBtnPublishPost();
                    }

                    @Override // android.text.TextWatcher
                    public void afterTextChanged(Editable s) {
                        Global.replaceEmoji(s);
                    }
                });
                this.message.setOnTouchListener(new View.OnTouchListener() { // from class: com.vkontakte.android.ui.posts.NotificationPostDisplayItemGallery.ViewHolder.5
                    @Override // android.view.View.OnTouchListener
                    public boolean onTouch(View v, MotionEvent event) {
                        v.getParent().requestDisallowInterceptTouchEvent(true);
                        switch (event.getAction() & 255) {
                            case 1:
                            case 3:
                                v.getParent().requestDisallowInterceptTouchEvent(false);
                                break;
                        }
                        return false;
                    }
                });
                View userInfoView = $(R.id.userInfoView);
                if (userInfoView != null) {
                    userInfoView.setOnClickListener(this);
                }
                setupRecyclerView(context);
            }
        }

        private void showCurrentUserProfile(Context context) {
            NewsEntry newsEntry = new NewsEntry(getItem());
            PostInteract postInteract = new PostInteract("", newsEntry);
            int id = VKAccountManager.getCurrent().getUid();
            new ProfileFragment.Builder(id).setFromPost(id, newsEntry.postID).go(context);
            postInteract.commit(PostInteract.Type.open_user);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            ArrayList<Uri> arrayList = null;
            switch (v.getId()) {
                case 16908313:
                    if (this.style == 3) {
                        PostPublisher postPublisher = this.publisher;
                        Context context = v.getContext();
                        CharSequence text = this.message == null ? null : this.message.getText();
                        if (this.selectionContext != null) {
                            arrayList = this.selectionContext.getSelectionPaths();
                        }
                        postPublisher.publishPost(context, text, arrayList);
                        return;
                    }
                    getItem().forceAction(v.getContext());
                    return;
                case 16908327:
                    getItem().forceClose(v.getContext());
                    return;
                case R.id.userInfoView /* 2131756080 */:
                    showCurrentUserProfile(v.getContext());
                    return;
                default:
                    return;
            }
        }

        private void showGallery(boolean show) {
            if (show) {
                this.galleryDescriptionContainer.setVisibility(0);
                this.rvGallery.setVisibility(0);
                return;
            }
            this.galleryDescriptionContainer.setVisibility(8);
            this.rvGallery.setVisibility(8);
        }

        private void loadPhotosInside() {
            ArrayList<AlbumEntry> lastLoadedMediaStore = MediaStoreController.lastLoadedPhoto();
            if (lastLoadedMediaStore != null && lastLoadedMediaStore.size() > 0) {
                showGallery(true);
                this.adapter.setImages(lastLoadedMediaStore.get(0).getBucketImages());
            } else {
                showGallery(false);
            }
            loadMediaStore();
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(UserNotification item) {
            if (this.style == 3) {
                ViewUtils.setText(this.title, VKAccountManager.getCurrent().getName());
                if (this.message != null) {
                    this.message.setHint(item.message);
                }
            } else {
                ViewUtils.setText(this.title, item.title);
                if (this.message != null) {
                    this.message.setHint((CharSequence) null);
                }
                ViewUtils.setText(this.message, item.message);
            }
            ViewUtils.setText(this.button, item.buttonText);
            ViewUtils.setText(this.profilesDescription, item.profileDescription);
            if (item.profiles != null) {
                for (int i = 0; i < Math.min(this.profileViews.length, item.profiles.size()); i++) {
                    this.profileViews[i].load(item.profiles.get(i).photo);
                }
            }
            if (this.imageView != null) {
                switch (this.style) {
                    case 0:
                        this.imageView.load(item.findImageUrl(V.dp(64.0f), V.dp(64.0f)));
                        return;
                    case 1:
                        this.imageView.load(item.findImageUrl(V.dp(32.0f), V.dp(32.0f)));
                        return;
                    case 2:
                        Image image = getItem().findImage(100);
                        if (image != null) {
                            this.imageView.setAspectRatio(image.w, image.h);
                        }
                        this.imageView.getViewTreeObserver().addOnPreDrawListener(this);
                        return;
                    case 3:
                        this.imageView.load(VKAccountManager.getCurrent().getPhoto());
                        return;
                    default:
                        return;
                }
            }
        }

        @Override // android.view.ViewTreeObserver.OnPreDrawListener
        public boolean onPreDraw() {
            if (this.imageView != null) {
                this.imageView.getViewTreeObserver().removeOnPreDrawListener(this);
                if (this.style == 2 && (this.imageView instanceof VKImageView)) {
                    this.imageView.load(getItem().findImageUrl(this.imageView.getWidth(), -1));
                }
            }
            return false;
        }

        @Override // com.vk.attachpicker.screen.ViewerScreen.PhotoViewerProvider
        public ViewerScreen.PlaceProviderObject getPlaceForPhoto(int index) {
            ViewerScreen.PlaceProviderObject object = null;
            int firstPosition = this.linearLayoutManager.findFirstVisibleItemPosition();
            int wantedChild = index - firstPosition;
            if (wantedChild < 0 || wantedChild >= this.rvGallery.getChildCount()) {
                L.e("GalleryFragment", "Unable to getTexture imageView for desired position, because it's not being displayed on screen.");
            } else {
                View view = this.rvGallery.getChildAt(wantedChild);
                MediaStoreItemSmallView imageView = (MediaStoreItemSmallView) view;
                if (imageView != null) {
                    object = new ViewerScreen.PlaceProviderObject();
                    object.imageView = imageView;
                    object.containerView = view;
                    object.parentView = this.rvGallery;
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

        @Override // com.vkontakte.android.ui.ActivityResulter
        public void onActivityResult(int requestCode, int resultCode, Intent data) {
            Activity a = (Activity) getContext();
            if (a != null && resultCode == -1 && requestCode == 2) {
                IntentUtils.handleResult(a, data, new IntentUtils.ResolveCallback() { // from class: com.vkontakte.android.ui.posts.NotificationPostDisplayItemGallery.ViewHolder.6
                    @Override // com.vk.core.util.IntentUtils.ResolveCallback
                    public void onResolved(File file) {
                        Uri uri = Uri.fromFile(file);
                        MediaStoreController.findPhoto(uri, new MediaStoreController.MediaStoreMediaEntryCallback() { // from class: com.vkontakte.android.ui.posts.NotificationPostDisplayItemGallery.ViewHolder.6.1
                            @Override // com.vk.attachpicker.mediastore.MediaStoreController.MediaStoreMediaEntryCallback
                            public void onLoaded(MediaStoreEntry mediaStoreEntry) {
                                if (mediaStoreEntry != null) {
                                    ViewHolder.this.adapter.addItem(mediaStoreEntry);
                                    ViewHolder.this.selectionContext.addSelection(mediaStoreEntry);
                                    ViewHolder.this.rvGallery.scrollToPosition(0);
                                }
                            }
                        });
                    }

                    @Override // com.vk.core.util.IntentUtils.ResolveCallback
                    public void onError() {
                        ToastUtils.showToast((int) R.string.picker_loading_error);
                    }
                });
            }
        }
    }

    public static boolean isNotificationViewType(int viewType) {
        return viewType == createViewType(getStyle(viewType), getButtonStyle(viewType), hasUsers(viewType));
    }

    static int createViewType(int style, int buttonStyle, boolean hasUsers) {
        return (hasUsers ? 1 : 0) + 23 + (buttonStyle * 10) + (style * 100);
    }

    static int getStyle(UserNotification notification) {
        String valueOf = String.valueOf(notification.layout);
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -1396342996:
                if (valueOf.equals(UserNotification.LAYOUT_NEWSFEED_BANNER)) {
                    c = 1;
                    break;
                }
                break;
            case 96801:
                if (valueOf.equals("app")) {
                    c = 0;
                    break;
                }
                break;
            case 3237038:
                if (valueOf.equals(UserNotification.LAYOUT_NEWSFEED_INFO)) {
                    c = 2;
                    break;
                }
                break;
            case 1377217503:
                if (valueOf.equals(UserNotification.LAYOUT_NEWSFEED_NEW_POST)) {
                    c = 3;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return 0;
            case 1:
                return 2;
            case 2:
                return 1;
            case 3:
                return 3;
            default:
                L.e("error: Unknown newsfeed layout type");
                return 0;
        }
    }

    static int getStyle(int viewType) {
        return (viewType - 23) / 100;
    }

    static int getButtonStyle(UserNotification notification) {
        String str = notification.buttonStyle;
        char c = 65535;
        switch (str.hashCode()) {
            case -1196636574:
                if (str.equals(UserNotification.BUTTON_STYLE_NEW_POST)) {
                    c = 3;
                    break;
                }
                break;
            case -817598092:
                if (str.equals(UserNotification.BUTTON_STYLE_SECONDARY)) {
                    c = 2;
                    break;
                }
                break;
            case -314765822:
                if (str.equals(UserNotification.BUTTON_STYLE_PRIMARY)) {
                    c = 1;
                    break;
                }
                break;
            case 3049826:
                if (str.equals(UserNotification.BUTTON_STYLE_CELL)) {
                    c = 0;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return 0;
            case 1:
                return 1;
            case 2:
                return 2;
            case 3:
                return 3;
            default:
                return BUTTON_NULL;
        }
    }

    static int getButtonStyle(int viewType) {
        return ((viewType - 23) / 10) % 10;
    }

    static boolean hasUsers(UserNotification notification) {
        return notification.profiles != null;
    }

    static boolean hasUsers(int viewType) {
        return (viewType + (-23)) % 10 != 0;
    }
}
