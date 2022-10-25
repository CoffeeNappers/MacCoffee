package com.vk.attachpicker;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.IdRes;
import android.view.View;
import com.facebook.common.util.UriUtil;
import com.vk.attachpicker.screen.EditorScreen;
import com.vk.core.simplescreen.ScreenContainer;
import com.vk.core.util.KeyboardUtils;
import com.vkontakte.android.R;
import com.vkontakte.android.VKActivity;
import java.io.File;
/* loaded from: classes2.dex */
public class PhotoEditorActivity extends VKActivity implements ScreenContainer.OnDismissListener, AttachResulter {
    private ScreenContainer screenContainer;
    private boolean thumb;

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        KeyboardUtils.setSoftInputModeNothing(this);
        Picker.init((Activity) this);
        this.thumb = getIntent().getBooleanExtra(AttachIntent.INTENT_THUMB, false);
        setContentView(R.layout.picker_layout_window_screen_container);
        this.screenContainer = (ScreenContainer) $(R.id.sc_container);
        this.screenContainer.setOnDismissListener(this);
        View view = $(R.id.view_top_padding);
        view.getViewTreeObserver().addOnGlobalLayoutListener(PhotoEditorActivity$$Lambda$1.lambdaFactory$(this, view));
        File file = (File) getIntent().getSerializableExtra(UriUtil.LOCAL_FILE_SCHEME);
        if (file == null) {
            finish();
        } else {
            this.screenContainer.showScreen(new EditorScreen(file, (EditorScreen.Delegate) null, this.thumb));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(View view) {
        this.screenContainer.onTopPaddingChanged(view.getPaddingTop());
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        this.screenContainer.onResume();
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        super.onPause();
        this.screenContainer.onPause();
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        this.screenContainer.onDestroy();
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        if (!this.screenContainer.onBackPressed()) {
            super.onBackPressed();
        }
    }

    @Override // com.vk.core.simplescreen.ScreenContainer.OnDismissListener
    public void onDismiss() {
        super.finish();
    }

    @Override // com.vk.attachpicker.AttachResulter
    public void setResultAndFinish(Intent result) {
        if (result == null) {
            setResult(0);
            finish();
            return;
        }
        setResult(-1, result);
        finish();
    }

    @Override // com.vkontakte.android.VKActivity
    public final <T extends View> T $(@IdRes int id) {
        return (T) findViewById(id);
    }
}
