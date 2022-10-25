package com.vkontakte.android.stickers;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.DisplayMetrics;
import android.view.KeyCharacterMap;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.inputmethod.InputMethodManager;
import android.widget.PopupWindow;
import com.vk.core.util.Screen;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.ViewUtils;
/* loaded from: classes3.dex */
public class KeyboardPopup {
    public static final String ACTION_HIDE_POPUP = "com.vkontakte.andoroid.HIDE_EMOJI_POPUP";
    private static IntentFilter sIntentFilter;
    private static final boolean sUseFlymeHack;
    private boolean keyboardVisible;
    private final Activity mActivity;
    private View mAnchor;
    private final View mContentView;
    private int mDisplayHeight;
    private int mDisplayWidth;
    private final InputMethodManager mImm;
    private int mKeyboardHeight;
    private OnVisibilityChangedListener mListener;
    private int mPopupBgColor;
    private PopupWindow mPopupWindow;
    private final boolean mTablet;
    private final View mView;
    public static final int TABLE_WIDTH = Global.scale(350.0f);
    public static final int TABLET_HEIGHT = Global.scale(260.0f);
    private final BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.stickers.KeyboardPopup.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (KeyboardPopup.ACTION_HIDE_POPUP.equals(intent.getAction())) {
                KeyboardPopup.this.hide();
            }
        }
    };
    private final Rect mContentResizeRect = new Rect();
    private final Rect mKeyboardRect = new Rect();

    /* loaded from: classes3.dex */
    public interface OnVisibilityChangedListener {
        void showDefaultIcon();

        void showHideIcon();

        void showKeyboardIcon();
    }

    static {
        sUseFlymeHack = Build.DISPLAY.contains("Flyme OS") && Build.DISPLAY.contains("4");
        sIntentFilter = new IntentFilter() { // from class: com.vkontakte.android.stickers.KeyboardPopup.2
            {
                addAction(KeyboardPopup.ACTION_HIDE_POPUP);
            }
        };
    }

    public boolean getKeyboardVisible() {
        return this.keyboardVisible;
    }

    public KeyboardPopup(@NonNull Activity activity, @NonNull View contentView, @NonNull View view) {
        this.mActivity = activity;
        this.mView = view;
        this.mContentView = contentView;
        this.mImm = (InputMethodManager) this.mActivity.getSystemService("input_method");
        this.mTablet = Screen.isTablet(activity);
    }

    public void attachToAnchor(@Nullable View anchor, int popupBgColor) {
        this.mAnchor = anchor;
        this.mPopupBgColor = popupBgColor;
    }

    public void toggle() {
        show(!isShowing());
    }

    public void show(boolean show) {
        View focus;
        if (show != isShowing()) {
            if (this.mPopupWindow == null) {
                this.mPopupWindow = new PopupWindow(this.mView);
                this.mPopupWindow.setOnDismissListener(new PopupWindow.OnDismissListener() { // from class: com.vkontakte.android.stickers.KeyboardPopup.3
                    @Override // android.widget.PopupWindow.OnDismissListener
                    public void onDismiss() {
                        KeyboardPopup.this.unregisterReceiver();
                    }
                });
            }
            if (show) {
                unregisterReceiver();
                this.mActivity.registerReceiver(this.receiver, sIntentFilter, "com.vkontakte.android.permission.ACCESS_DATA", null);
            }
            if (!this.mTablet) {
                if (show) {
                    if (this.mKeyboardHeight <= Global.scale(100.0f)) {
                        this.mKeyboardHeight = this.mActivity.getSharedPreferences("emoji", 0).getInt("kbd_height" + this.mDisplayWidth + '_' + this.mDisplayHeight, Global.scale(200.0f));
                    }
                    if (this.mKeyboardHeight < Global.scale(200.0f)) {
                        this.mKeyboardHeight = Global.scale(200.0f);
                    }
                    if (!this.keyboardVisible && this.mKeyboardHeight > (this.mContentView.getHeight() / 3) * 2) {
                        this.mKeyboardHeight = (this.mContentView.getHeight() / 3) * 2;
                    }
                    int keyboardHeight = (!sUseFlymeHack || this.mContentView.getHeight() <= this.mContentView.getWidth()) ? this.mKeyboardHeight : this.mKeyboardHeight - ViewUtils.getNavigationBarHeight(this.mActivity);
                    this.mPopupWindow.setHeight(View.MeasureSpec.makeMeasureSpec(keyboardHeight, 1073741824));
                    this.mPopupWindow.setWidth(View.MeasureSpec.makeMeasureSpec(this.mDisplayWidth, 1073741824));
                    int bottom = 0;
                    if ((Build.VERSION.SDK_INT >= 20 || sUseFlymeHack) && this.mContentView.getHeight() > this.mContentView.getWidth() && ((!KeyCharacterMap.deviceHasKey(3) && !ViewUtils.isImmersiveModeOrNoNavigationBar(this.mActivity)) || sUseFlymeHack)) {
                        bottom = ViewUtils.getNavigationBarHeight(this.mActivity);
                    }
                    this.mPopupWindow.showAtLocation(this.mActivity.getWindow().getDecorView(), 83, 0, bottom);
                    if (!this.keyboardVisible) {
                        this.mContentView.setPadding(0, 0, 0, keyboardHeight);
                        if (this.mListener != null) {
                            this.mListener.showHideIcon();
                            return;
                        }
                        return;
                    } else if (this.mListener != null) {
                        this.mListener.showKeyboardIcon();
                        return;
                    } else {
                        return;
                    }
                }
                if (this.mListener != null) {
                    this.mListener.showDefaultIcon();
                }
                this.mPopupWindow.dismiss();
                this.mContentView.post(new Runnable() { // from class: com.vkontakte.android.stickers.KeyboardPopup.4
                    @Override // java.lang.Runnable
                    public void run() {
                        KeyboardPopup.this.mContentView.setPadding(0, 0, 0, 0);
                    }
                });
            } else if (show) {
                this.mPopupWindow.setWidth(TABLE_WIDTH);
                this.mPopupWindow.setHeight(TABLET_HEIGHT);
                final PopupArrowDrawable bd = new PopupArrowDrawable(this.mPopupBgColor);
                this.mPopupWindow.setBackgroundDrawable(bd);
                this.mPopupWindow.setOutsideTouchable(true);
                this.mPopupWindow.showAsDropDown(this.mAnchor, -((this.mPopupWindow.getWidth() / 2) - (this.mAnchor.getWidth() / 2)), 0);
                final int[] eloc = {0, 0};
                final int[] aloc = {0, 0};
                this.mAnchor.getLocationOnScreen(aloc);
                this.mActivity.getWindow().getDecorView().getWindowVisibleDisplayFrame(this.mKeyboardRect);
                if (this.mPopupWindow.getHeight() > this.mKeyboardRect.height() && (focus = this.mActivity.getCurrentFocus()) != null) {
                    this.mImm.hideSoftInputFromWindow(focus.getWindowToken(), 0);
                }
                this.mView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.stickers.KeyboardPopup.5
                    @Override // android.view.ViewTreeObserver.OnPreDrawListener
                    public boolean onPreDraw() {
                        KeyboardPopup.this.mView.getViewTreeObserver().removeOnPreDrawListener(this);
                        KeyboardPopup.this.mView.getLocationOnScreen(eloc);
                        bd.setArrowX((aloc[0] - eloc[0]) + (KeyboardPopup.this.mAnchor.getWidth() / 2));
                        return true;
                    }
                });
            } else {
                this.mPopupWindow.dismiss();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void unregisterReceiver() {
        try {
            this.mActivity.unregisterReceiver(this.receiver);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void notifyLayoutHasChanged() {
        if (!this.mTablet) {
            Log.v("KeyboardPopup", "notifyLayoutHasChanged ENTERED");
            DisplayMetrics displayMetrics = this.mActivity.getResources().getDisplayMetrics();
            this.mDisplayWidth = displayMetrics.widthPixels;
            this.mDisplayHeight = displayMetrics.heightPixels;
            this.mActivity.getWindow().getDecorView().getWindowVisibleDisplayFrame(this.mContentResizeRect);
            this.mKeyboardHeight = this.mDisplayHeight - this.mContentResizeRect.bottom;
            this.keyboardVisible = this.mKeyboardHeight > Global.scale(100.0f);
            Log.v("KeyboardPopup", "notifyLayoutHasChanged: mDisplayWidth = " + this.mDisplayWidth + ", mDisplayHeight = " + this.mDisplayHeight + ", mContentResizeRect = " + this.mContentResizeRect + ", mKeyboardHeight = " + this.mKeyboardHeight + ", keyboardVisible = " + this.keyboardVisible + ", density = " + Global.displayDensity + ", mContentView.getPaddingBottom = " + this.mContentView.getPaddingBottom());
            if (this.mKeyboardHeight > Global.scale(100.0f)) {
                this.mActivity.getSharedPreferences("emoji", 0).edit().putInt("kbd_height" + this.mDisplayWidth + '_' + this.mDisplayHeight, this.mKeyboardHeight).commit();
            }
            if (this.keyboardVisible && this.mContentView.getPaddingBottom() == 0 && this.mPopupWindow != null && this.mPopupWindow.isShowing()) {
                Log.v("KeyboardPopup", "notifyLayoutHasChanged: condition1 is true");
                this.mPopupWindow.setHeight(this.mKeyboardHeight);
                this.mPopupWindow.dismiss();
                this.mPopupWindow.showAtLocation(this.mActivity.getWindow().getDecorView(), 83, 0, 0);
            }
            if (this.keyboardVisible && this.mContentView.getPaddingBottom() > 0) {
                Log.v("KeyboardPopup", "notifyLayoutHasChanged: condition2 is true");
                show(false);
            }
            if (!this.keyboardVisible && this.mPopupWindow != null && this.mPopupWindow.isShowing()) {
                Log.v("KeyboardPopup", "notifyLayoutHasChanged: condition3 is true");
                show(false);
            }
            Log.v("KeyboardPopup", "notifyLayoutHasChanged EXIT");
        }
    }

    public boolean isShowing() {
        return this.mPopupWindow != null && this.mPopupWindow.isShowing();
    }

    public void hide() {
        if (this.mPopupWindow != null && this.mPopupWindow.isShowing()) {
            try {
                show(false);
            } catch (Exception e) {
                unregisterReceiver();
            }
        }
    }

    public OnVisibilityChangedListener getOnVisibilityChangedListener() {
        return this.mListener;
    }

    public void setOnVisibilityChangedListener(OnVisibilityChangedListener mListener) {
        this.mListener = mListener;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class PopupArrowDrawable extends Drawable {
        private static final int PADDING = Global.scale(5.0f);
        private static final int ARROW_SIZE = Global.scale(7.0f);
        private Bitmap bitmap = null;
        private int arrowX = 200;
        private final Rect boundRect = new Rect();
        private Paint paint = new Paint();

        public PopupArrowDrawable(int color) {
            this.paint.setColor(color);
            this.paint.setShadowLayer(Global.scale(4.0f), 0.0f, Global.scale(1.0f), 1426063360);
            this.paint.setAntiAlias(true);
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            copyBounds(this.boundRect);
            if (this.bitmap == null || this.boundRect.width() != this.bitmap.getWidth() || this.boundRect.height() != this.bitmap.getHeight()) {
                this.bitmap = Bitmap.createBitmap(this.boundRect.width(), this.boundRect.height(), Bitmap.Config.ARGB_8888);
                Canvas c = new Canvas(this.bitmap);
                Rect r = new Rect(this.boundRect);
                r.offsetTo(0, 0);
                r.inset(PADDING, PADDING);
                r.bottom -= ARROW_SIZE;
                Path path = new Path();
                path.addRect(new RectF(r), Path.Direction.CW);
                path.moveTo(this.arrowX - ARROW_SIZE, r.bottom);
                path.lineTo(this.arrowX, r.bottom + ARROW_SIZE);
                path.lineTo(this.arrowX + ARROW_SIZE, r.bottom);
                path.close();
                c.drawPath(path, this.paint);
            }
            canvas.drawBitmap(this.bitmap, new Rect(0, 0, this.boundRect.width(), PADDING), new Rect(this.boundRect.left, this.boundRect.top, this.boundRect.right, this.boundRect.top + PADDING), this.paint);
            canvas.drawBitmap(this.bitmap, new Rect(0, (this.boundRect.height() - PADDING) - ARROW_SIZE, this.boundRect.width(), this.boundRect.height()), new Rect(this.boundRect.left, (this.boundRect.bottom - PADDING) - ARROW_SIZE, this.boundRect.right, this.boundRect.bottom), this.paint);
            canvas.drawBitmap(this.bitmap, new Rect(0, PADDING, PADDING, (this.boundRect.bottom - PADDING) - ARROW_SIZE), new Rect(this.boundRect.left, this.boundRect.top + PADDING, this.boundRect.left + PADDING, (this.boundRect.bottom - PADDING) - ARROW_SIZE), this.paint);
            canvas.drawBitmap(this.bitmap, new Rect(this.boundRect.width() - PADDING, PADDING, this.boundRect.width(), (this.boundRect.bottom - PADDING) - ARROW_SIZE), new Rect(this.boundRect.right - PADDING, this.boundRect.top + PADDING, this.boundRect.right, (this.boundRect.bottom - PADDING) - ARROW_SIZE), this.paint);
        }

        public void setArrowX(int x) {
            this.arrowX = Global.scale(5.0f) + x;
            this.bitmap = null;
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return -3;
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int alpha) {
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter cf) {
        }

        @Override // android.graphics.drawable.Drawable
        public boolean getPadding(Rect out) {
            out.set(PADDING, PADDING, PADDING, PADDING + ARROW_SIZE);
            return true;
        }
    }
}
