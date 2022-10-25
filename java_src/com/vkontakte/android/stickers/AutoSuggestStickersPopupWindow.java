package com.vkontakte.android.stickers;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.support.annotation.NonNull;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.PopupWindow;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKImageView;
import com.vk.imageloader.view.VKStickerImageView;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.R;
import com.vkontakte.android.data.orm.Product;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.data.orm.StickersDictionaryItem;
import com.vkontakte.android.fragments.stickers.StickersDetailsFragment;
import com.vkontakte.android.stickers.StickersView;
import com.vkontakte.android.stickers.WindowRecyclerView;
import com.vkontakte.android.utils.Utils;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class AutoSuggestStickersPopupWindow {
    private static final int POPUP_HEIGHT = StickersConfig.STICKER_AUTOSUGGEST_ITEM_SIZE + V.dp(28.0f);
    private final EditText mAnchorTextView;
    private final View mAnchorView;
    private final Context mContext;
    private StickersDictionaryItem mData;
    private LeftDeltaLayout mLeftDeltaLayout;
    private StickersView.Listener mListener;
    private PopupWindow mPopupWindow;
    private WindowRecyclerView mStickersRecyclerView;
    private boolean mPopupShowing = false;
    private WindowRecyclerView.Callback mViewToUrlProjection = new WindowRecyclerView.Callback() { // from class: com.vkontakte.android.stickers.AutoSuggestStickersPopupWindow.1
        @Override // com.vkontakte.android.stickers.WindowRecyclerView.Callback
        public String getURL(View view) {
            Integer id = (Integer) view.getTag(R.id.id);
            if (id == null || AutoSuggestStickersPopupWindow.this.mData == null) {
                return null;
            }
            return StickerStockItem.getServerStickerViewURL(AutoSuggestStickersPopupWindow.this.mData.base_url, id.intValue());
        }
    };

    public AutoSuggestStickersPopupWindow(@NonNull Context context, @NonNull EditText editText, @NonNull View anchorView) {
        Log.v("AutoSuggestWindow", "Create instance");
        this.mContext = context;
        this.mAnchorTextView = editText;
        this.mAnchorView = anchorView;
        this.mAnchorTextView.addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.stickers.AutoSuggestStickersPopupWindow.2
            private String previousText = "";

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                if (s.length() <= 40) {
                    String keyString = s.toString();
                    if (!areStringsDifferWithOneCharOnly(keyString, this.previousText) && keyString.length() > 1 && keyString.endsWith(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR)) {
                        keyString = keyString.substring(0, keyString.length() - 1);
                    }
                    AutoSuggestStickersPopupWindow.this.showHidePopupWindow(Stickers.get().getAutoSuggestStickersFor(keyString));
                } else {
                    AutoSuggestStickersPopupWindow.this.showHidePopupWindow(null);
                }
                this.previousText = s.toString();
            }

            private boolean areStringsDifferWithOneCharOnly(String str1, String str2) {
                if (str1.length() < str2.length()) {
                    return areStringsDifferWithOneCharOnly(str2, str1);
                }
                if (str1.length() - str2.length() != 1) {
                    return false;
                }
                boolean haveDiff = false;
                for (int i = 0; i < str2.length(); i++) {
                    if (!haveDiff && str1.charAt(i) != str2.charAt(i)) {
                        haveDiff = true;
                    }
                    if (haveDiff && str1.charAt(i + 1) != str2.charAt(i)) {
                        return false;
                    }
                }
                return true;
            }
        });
        Stickers.get().reloadAutoSuggestDictionaryIfNeeded(false);
    }

    public void setListener(StickersView.Listener listener) {
        this.mListener = listener;
    }

    private void initializePopupWindow() {
        int widthMode = -2;
        if (this.mPopupWindow == null) {
            int padding = V.dp(10.0f);
            final int paddingLeftRight = V.dp(5.0f);
            this.mStickersRecyclerView = new WindowRecyclerView(this.mContext);
            this.mStickersRecyclerView.init(this.mViewToUrlProjection);
            this.mStickersRecyclerView.setPadding(paddingLeftRight, padding, paddingLeftRight, V.dp(18.0f));
            this.mStickersRecyclerView.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.vkontakte.android.stickers.AutoSuggestStickersPopupWindow.3
                @Override // android.support.v7.widget.RecyclerView.ItemDecoration
                public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
                    outRect.left = paddingLeftRight;
                    outRect.top = 0;
                    outRect.right = paddingLeftRight;
                    outRect.bottom = 0;
                }
            });
            CalloutPopupBackgroundDrawable mCalloutDrawable = new CalloutPopupBackgroundDrawable(ContextCompat.getDrawable(this.mContext, R.drawable.bg_stickers_suggestions_left), ContextCompat.getDrawable(this.mContext, R.drawable.bg_stickers_suggestions_center), ContextCompat.getDrawable(this.mContext, R.drawable.bg_stickers_suggestions_right));
            this.mStickersRecyclerView.setBackgroundDrawable(mCalloutDrawable);
            this.mStickersRecyclerView.setLayoutManager(new LinearLayoutManager(this.mContext, 0, false));
            this.mLeftDeltaLayout = new LeftDeltaLayout(this.mContext);
            this.mLeftDeltaLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
            this.mLeftDeltaLayout.addView(this.mStickersRecyclerView, new ViewGroup.LayoutParams(-2, -2));
            this.mLeftDeltaLayout.setCalloutPopupBackgroundDrawable(mCalloutDrawable);
            this.mLeftDeltaLayout.setPadding(this.mContext.getResources().getDimensionPixelSize(R.dimen.left_menu_size), 0, 0, 0);
            boolean isTablet = Screen.isTablet(this.mContext);
            if (!isTablet) {
                widthMode = -1;
            }
            this.mPopupWindow = new PopupWindow((View) this.mLeftDeltaLayout, widthMode, POPUP_HEIGHT, false);
            this.mPopupWindow.setAnimationStyle(16973826);
            if (isTablet) {
                this.mPopupWindow.setInputMethodMode(1);
                this.mPopupWindow.setOutsideTouchable(true);
                this.mPopupWindow.setBackgroundDrawable(new BitmapDrawable());
            }
        }
    }

    public void showHidePopupWindow(StickersDictionaryItem autoSuggestStickers) {
        this.mData = autoSuggestStickers;
        if (autoSuggestStickers == null) {
            if (this.mPopupWindow != null && this.mPopupShowing) {
                this.mPopupWindow.dismiss();
                this.mPopupShowing = false;
                return;
            }
            return;
        }
        int[] location = new int[2];
        this.mAnchorTextView.getLocationOnScreen(location);
        Log.v("AutoSuggestPopup", "Anchor location  x = " + location[0] + ", y = " + location[1]);
        if (this.mPopupWindow == null) {
            initializePopupWindow();
        }
        this.mLeftDeltaLayout.setDelta((location[0] - V.dp(24.0f)) - this.mContext.getResources().getDimensionPixelSize(R.dimen.left_menu_size));
        if (this.mStickersRecyclerView.mo1204getAdapter() instanceof Adapter) {
            Adapter adapter = (Adapter) this.mStickersRecyclerView.mo1204getAdapter();
            adapter.mData = autoSuggestStickers;
            adapter.mListener = this.mListener;
            adapter.notifyDataSetChanged();
        } else {
            this.mStickersRecyclerView.setAdapter(new Adapter(autoSuggestStickers, this.mListener));
        }
        if (this.mAnchorView.getWindowToken() != null && !this.mPopupShowing) {
            int gravity = Screen.isTablet(this.mContext) ? 51 : 48;
            this.mPopupWindow.showAtLocation(this.mAnchorView, gravity, 0, (location[1] - POPUP_HEIGHT) + V.dp(16.0f));
            this.mPopupShowing = true;
        }
    }

    public void hidePopup() {
        showHidePopupWindow(null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class Adapter extends UsableRecyclerView.Adapter<UsableRecyclerView.ViewHolder> {
        private StickersDictionaryItem mData;
        private StickersView.Listener mListener;

        public Adapter(StickersDictionaryItem data, StickersView.Listener listener) {
            this.mData = data;
            this.mListener = listener;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public UsableRecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new AutoSuggestStickersHolder(new VKStickerImageView(parent.getContext()));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(UsableRecyclerView.ViewHolder holder, int position) {
            int id;
            boolean isUserSticker = true;
            if (this.mData.user_stickers != null && this.mData.user_stickers.length > position) {
                id = this.mData.user_stickers[position];
            } else {
                if (this.mData.user_stickers != null) {
                    position -= this.mData.user_stickers.length;
                }
                id = this.mData.promoted_stickers[position];
                isUserSticker = false;
            }
            ((AutoSuggestStickersHolder) holder).bind(id, isUserSticker);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            int cnt = 0;
            if (this.mData.user_stickers != null) {
                cnt = 0 + this.mData.user_stickers.length;
            }
            if (this.mData.promoted_stickers != null) {
                return cnt + this.mData.promoted_stickers.length;
            }
            return cnt;
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes3.dex */
        public class AutoSuggestStickersHolder extends UsableRecyclerView.ViewHolder implements View.OnClickListener {
            private int mId;
            private boolean mIsUserSticker;

            private String getUri() {
                return Adapter.this.mData.base_url + this.mId + CameraUtilsEffects.FILE_DELIM + StickerStockItem.adjustSize(StickersConfig.STICKER_AUTOSUGGEST_ITEM_SIZE, 64, 128, 256, 352, 512) + "b.png";
            }

            public AutoSuggestStickersHolder(View view) {
                super(view);
                ((VKImageView) this.itemView).setFixedSize(StickersConfig.STICKER_AUTOSUGGEST_ITEM_SIZE);
                view.setOnClickListener(this);
            }

            public void bind(int id, boolean isUserSticker) {
                this.mId = id;
                this.mIsUserSticker = isUserSticker;
                this.itemView.setTag(R.id.id, Integer.valueOf(id));
                this.itemView.setAlpha(this.mIsUserSticker ? 1.0f : 0.5f);
                ((VKImageView) this.itemView).load(getUri());
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (this.mIsUserSticker) {
                    if (Adapter.this.mListener != null) {
                        StickerStockItem stockItem = Stickers.get().getByStickerId(this.mId);
                        if (stockItem != null) {
                            Stickers.get().addRecent(this.mId, stockItem.id);
                        }
                        int packId = stockItem == null ? 0 : stockItem.id;
                        Adapter.this.mListener.onStickerSelected(packId, this.mId, getUri(), "suggestion_" + Adapter.this.mData.dictionary_key);
                        return;
                    }
                    return;
                }
                StickersDetailsFragment.showByStickerId(this.mId, Product.getReferrerSuggestion(Adapter.this.mData.dictionary_key), Utils.castToActivity(v.getContext()), true);
            }
        }
    }
}
