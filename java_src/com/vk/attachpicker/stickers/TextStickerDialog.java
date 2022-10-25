package com.vk.attachpicker.stickers;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.drawing.DrawingColors;
import com.vk.attachpicker.widget.BackPressEditText;
import com.vk.attachpicker.widget.ColorSelectorView;
import com.vk.attachpicker.widget.EmptyLineTextWatcher;
import com.vk.core.util.AndroidBug5497Workaround2;
import com.vk.core.util.KeyboardUtils;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class TextStickerDialog extends Dialog implements DialogInterface.OnDismissListener {
    private AndroidBug5497Workaround2 androidBug5497Workaround;
    private final TextStickerDialogCallback callback;
    private View clickHandler;
    private ColorSelectorView colorSelectorView;
    private DialogInterface.OnDismissListener customDissmissListener;
    private ImageView doneButton;
    private BackPressEditText editText;
    private ImageView fontChange;
    private StickerStyle stickerStyle;

    /* loaded from: classes2.dex */
    public interface TextStickerDialogCallback {
        void onApply(String str, int i, StickerStyle stickerStyle);
    }

    public TextStickerDialog(boolean noStatusBar, boolean enabledFixedTextStyle, Context context, TextStickerDialogCallback callback) {
        this(noStatusBar, enabledFixedTextStyle, context, "", DrawingColors.COLORS[7], StickerStyle.ROBOTO_BOLD, callback);
    }

    public TextStickerDialog(boolean noStatusBar, boolean enabledFixedTextStyle, Context context, String text, int initialColor, StickerStyle initialStickerStyle, TextStickerDialogCallback callback) {
        super(context, noStatusBar ? R.style.PickerFullScreenNoStatusDialog : R.style.PickerFullScreenDialog);
        this.stickerStyle = StickerStyle.ROBOTO_BOLD;
        this.callback = callback;
        this.stickerStyle = initialStickerStyle;
        KeyboardUtils.setSoftInputModeAdjustResize(getWindow());
        getWindow().setWindowAnimations(R.style.PickerDialogAnimation);
        View view = LayoutInflater.from(context).inflate(R.layout.picker_layout_text_sticker_dialog, (ViewGroup) null);
        setContentView(view);
        if (noStatusBar) {
            this.androidBug5497Workaround = new AndroidBug5497Workaround2(getWindow(), view);
        }
        this.editText = (BackPressEditText) findViewById(R.id.et_sticker);
        this.colorSelectorView = (ColorSelectorView) findViewById(R.id.ccv_text_color_selector);
        this.fontChange = (ImageView) findViewById(R.id.iv_font);
        this.doneButton = (ImageView) findViewById(R.id.iv_done);
        this.clickHandler = findViewById(R.id.click_handler);
        this.doneButton.setOnClickListener(TextStickerDialog$$Lambda$1.lambdaFactory$(this));
        this.editText.setAlpha(0.0f);
        this.editText.addTextChangedListener(EmptyLineTextWatcher.INSTANCE);
        this.editText.setInputType(671745);
        this.editText.setText(text);
        this.editText.setTextColor(initialColor);
        this.editText.getViewTreeObserver().addOnPreDrawListener(new AnonymousClass1());
        this.editText.setCallback(TextStickerDialog$$Lambda$2.lambdaFactory$(this));
        this.colorSelectorView.setAlpha(0.0f);
        this.colorSelectorView.setSelectedColor(initialColor);
        this.colorSelectorView.setOnColorSelectedListener(new ColorSelectorView.OnColorSelectedListener() { // from class: com.vk.attachpicker.stickers.TextStickerDialog.2
            @Override // com.vk.attachpicker.widget.ColorSelectorView.OnColorSelectedListener
            public void onColorSelected(int color) {
                TextStickerDialog.this.editText.setTextColor(color);
            }

            @Override // com.vk.attachpicker.widget.ColorSelectorView.OnColorSelectedListener
            public void onBrushTypeSelected(int brushType) {
            }
        });
        this.fontChange.setOnClickListener(TextStickerDialog$$Lambda$3.lambdaFactory$(this, enabledFixedTextStyle));
        this.clickHandler.setOnClickListener(TextStickerDialog$$Lambda$4.lambdaFactory$(this));
        setStickerFont();
        super.setOnDismissListener(this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(View view1) {
        lambda$new$1();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vk.attachpicker.stickers.TextStickerDialog$1  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass1 implements ViewTreeObserver.OnPreDrawListener {
        AnonymousClass1() {
        }

        @Override // android.view.ViewTreeObserver.OnPreDrawListener
        public boolean onPreDraw() {
            TextStickerDialog.this.editText.getViewTreeObserver().removeOnPreDrawListener(this);
            KeyboardUtils.showKeyboard(TextStickerDialog.this.editText);
            TextStickerDialog.this.editText.setSelection(TextStickerDialog.this.editText.getText().length());
            Picker.runDelayed(TextStickerDialog$1$$Lambda$1.lambdaFactory$(this), 300L);
            return true;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onPreDraw$0() {
            TextStickerDialog.this.editText.animate().alpha(1.0f).setDuration(200L).start();
            TextStickerDialog.this.colorSelectorView.animate().alpha(1.0f).setDuration(200L).start();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$2(boolean enabledFixedTextStyle, View v) {
        if (this.stickerStyle == null) {
            this.stickerStyle = StickerStyle.ROBOTO_BOLD;
        } else if (this.stickerStyle == StickerStyle.ROBOTO_BOLD) {
            this.stickerStyle = StickerStyle.LOBSTER_REGULAR;
        } else if (this.stickerStyle == StickerStyle.LOBSTER_REGULAR) {
            this.stickerStyle = StickerStyle.IMPACT;
        } else if (this.stickerStyle == StickerStyle.IMPACT && enabledFixedTextStyle) {
            this.stickerStyle = StickerStyle.ROBOTO_FIXED;
        } else {
            this.stickerStyle = StickerStyle.ROBOTO_BOLD;
        }
        setStickerFont();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$3(View view1) {
        lambda$new$1();
    }

    @Override // android.app.Dialog
    public void setOnDismissListener(DialogInterface.OnDismissListener listener) {
        this.customDissmissListener = listener;
    }

    @Override // android.app.Dialog
    public void show() {
        super.show();
        if (this.androidBug5497Workaround != null) {
            this.androidBug5497Workaround.enable();
        }
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialogInterface) {
        if (this.androidBug5497Workaround != null) {
            this.androidBug5497Workaround.disable();
        }
        if (this.customDissmissListener != null) {
            this.customDissmissListener.onDismiss(dialogInterface);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: saveText */
    public void lambda$new$1() {
        this.callback.onApply(this.editText.getText().toString().trim(), this.colorSelectorView.getSelectedColor(), this.stickerStyle);
        KeyboardUtils.hideKeyboard(getContext());
        dismiss();
    }

    private void setStickerFont() {
        if (this.stickerStyle != null) {
            this.editText.setTypeface(this.stickerStyle.typeface);
            this.fontChange.setImageResource(this.stickerStyle.iconResId);
            if (this.stickerStyle.fullWidth) {
                this.editText.getLayoutParams().width = -1;
            } else {
                this.editText.getLayoutParams().width = -2;
            }
            this.editText.setTextSize(0, this.stickerStyle.fontSize);
            this.editText.setBackgroundColor(this.stickerStyle.background);
            this.editText.requestLayout();
        }
    }
}
