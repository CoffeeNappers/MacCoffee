package com.vk.sharing.view;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.support.annotation.ColorInt;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.v4.content.ContextCompat;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import com.vk.core.util.Screen;
import com.vk.sharing.action.ActionsInfo;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public final class SharingActionsView extends LinearLayout {
    private View.OnClickListener internalClickListener;
    private Listener listener;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface Listener {
        void onActionClick(int i);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(View v) {
        if (this.listener != null) {
            this.listener.onActionClick(((ItemView) v).action);
        }
    }

    public SharingActionsView(Context context) {
        super(context);
        this.internalClickListener = SharingActionsView$$Lambda$1.lambdaFactory$(this);
    }

    public SharingActionsView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.internalClickListener = SharingActionsView$$Lambda$2.lambdaFactory$(this);
    }

    public SharingActionsView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.internalClickListener = SharingActionsView$$Lambda$3.lambdaFactory$(this);
    }

    @TargetApi(21)
    public SharingActionsView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.internalClickListener = SharingActionsView$$Lambda$4.lambdaFactory$(this);
    }

    public void setListener(@Nullable Listener listener) {
        this.listener = listener;
    }

    public void setInfo(@NonNull ActionsInfo actionsInfo) {
        removeAllViews();
        if (actionsInfo.canRepost()) {
            addItemView(1, R.drawable.ic_repost_24dp, R.string.sharing_action_button_label1);
        }
        if (actionsInfo.canPostGroup()) {
            addItemView(2, R.drawable.ic_menu_communities, R.string.sharing_action_button_label2);
        }
        if (actionsInfo.canExtractLink()) {
            addItemView(3, R.drawable.ic_copy_24dp, R.string.sharing_action_button_label3);
        }
        if (actionsInfo.canShareExternal()) {
            addItemView(4, R.drawable.ic_share_external_24dp, R.string.sharing_action_button_label4);
        }
    }

    private void addItemView(int action, @DrawableRes int icon, @StringRes int label) {
        Context context = getContext();
        ItemView itemView = new ItemView(context, action, ContextCompat.getDrawable(context, icon), context.getString(label));
        itemView.setOnClickListener(this.internalClickListener);
        FrameLayout frame = new FrameLayout(getContext());
        frame.addView(itemView, new FrameLayout.LayoutParams(-2, -2, 1));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, -1);
        params.weight = 1.0f;
        addView(frame, params);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class ItemView extends View {
        final int action;
        final Drawable decorDrawable;
        Drawable icon;
        @ColorInt
        final int iconColor;
        Layout labelLayout;
        final TextPaint labelPaint;
        static final Rect ICON_RECT = new Rect(Screen.dp(28), Screen.dp(24), Screen.dp(52), Screen.dp(48));
        static final Rect DECOR_RECT = new Rect(Screen.dp(8), Screen.dp(4), Screen.dp(72), Screen.dp(68));
        static final int TEXT_MAX_WIDTH = Screen.dp(76);
        static final int TEXT_X_OFFSET = Screen.dp(2);
        static final int TEXT_Y_OFFSET = Screen.dp(70);

        public ItemView(Context context) {
            this(context, 4, null, null);
        }

        public ItemView(Context context, int action, @Nullable Drawable icon, @Nullable String label) {
            super(context);
            this.iconColor = ContextCompat.getColor(context, R.color.cool_grey);
            this.labelPaint = new TextPaint(1);
            this.labelPaint.setTypeface(Typeface.SANS_SERIF);
            this.labelPaint.setTextSize(Screen.dp(12));
            this.labelPaint.setColor(ContextCompat.getColor(context, R.color.dark_grey));
            this.decorDrawable = ContextCompat.getDrawable(context, R.drawable.bg_sharing_action_shadow);
            this.decorDrawable.setBounds(DECOR_RECT);
            this.action = action;
            setIcon(icon);
            setLabel(label);
            setBackgroundResource(R.drawable.rounded_list_selector);
        }

        @Override // android.view.View
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            setMeasuredDimension(Screen.dp(80), Screen.dp(104));
        }

        @Override // android.view.View
        protected void onDraw(Canvas canvas) {
            this.decorDrawable.draw(canvas);
            if (this.icon != null) {
                this.icon.draw(canvas);
            }
            if (this.labelLayout != null) {
                canvas.save();
                canvas.translate(TEXT_X_OFFSET, TEXT_Y_OFFSET);
                this.labelLayout.draw(canvas);
                canvas.restore();
            }
        }

        public void setIcon(@Nullable Drawable icon) {
            if (icon != null) {
                Drawable icon2 = DrawableCompat.wrap(icon).mutate();
                icon2.setBounds(ICON_RECT);
                DrawableCompat.setTint(icon2, this.iconColor);
                this.icon = icon2;
            } else {
                this.icon = null;
            }
            invalidate();
        }

        public void setLabel(@Nullable String label) {
            if (label != null) {
                this.labelLayout = new StaticLayout(label, this.labelPaint, TEXT_MAX_WIDTH, Layout.Alignment.ALIGN_CENTER, 1.0f, 0.0f, false);
            }
            invalidate();
        }
    }
}
