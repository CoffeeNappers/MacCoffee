package com.vk.core.simplescreen;

import android.app.Activity;
import android.app.Dialog;
import android.support.annotation.IdRes;
import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import com.vk.core.simplescreen.ScreenContainer;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class WindowScreenContainer extends Dialog implements ScreenContainer.OnDismissListener {
    private final ScreenContainer screenContainer;

    public WindowScreenContainer(@NonNull Activity activity) {
        super(activity, R.style.FullScreenDialogDialog);
        setCancelable(true);
        setCanceledOnTouchOutside(false);
        WindowManager.LayoutParams lp = new WindowManager.LayoutParams();
        lp.copyFrom(getWindow().getAttributes());
        lp.width = -1;
        lp.height = -1;
        lp.windowAnimations = R.style.PickerDialogNoAnimation;
        lp.softInputMode = 48;
        getWindow().setAttributes(lp);
        if (activity.getResources().getBoolean(R.bool.picker_transparent_status_bar)) {
            getWindow().addFlags(67108864);
        }
        View contentView = activity.getLayoutInflater().inflate(R.layout.picker_layout_window_screen_container, (ViewGroup) null);
        setContentView(contentView);
        this.screenContainer = (ScreenContainer) $(R.id.sc_container);
        this.screenContainer.setOnDismissListener(this);
        View view = $(R.id.view_top_padding);
        view.getViewTreeObserver().addOnGlobalLayoutListener(WindowScreenContainer$$Lambda$1.lambdaFactory$(this, view));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(View view) {
        this.screenContainer.onTopPaddingChanged(view.getPaddingTop());
    }

    public void onResume() {
        this.screenContainer.onResume();
    }

    public void onPause() {
        this.screenContainer.onPause();
    }

    public void onDestroy() {
        this.screenContainer.onDestroy();
    }

    public void showScreen(BaseScreen screen) {
        this.screenContainer.showScreen(screen);
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        if (!this.screenContainer.onBackPressed()) {
            super.dismiss();
        }
    }

    public final <T extends View> T $(@IdRes int id) {
        return (T) findViewById(id);
    }

    @Override // com.vk.core.simplescreen.ScreenContainer.OnDismissListener
    public void onDismiss() {
        super.dismiss();
    }
}
