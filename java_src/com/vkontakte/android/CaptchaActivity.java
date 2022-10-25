package com.vkontakte.android;

import android.app.Activity;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import com.vk.core.network.Network;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.activities.LogoutReceiver;
/* loaded from: classes2.dex */
public class CaptchaActivity extends Activity {
    public static boolean isReady;
    public static String lastKey;
    private ImageView image;
    private EditText input;
    private LogoutReceiver logoutReceiver = null;
    private ProgressBar progress;
    private String url;

    @Override // android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.logoutReceiver = LogoutReceiver.register(this);
        overridePendingTransition(0, 0);
        setContentView(new View(this));
        LinearLayout layout = new LinearLayout(this);
        int padding = Global.scale(12.0f);
        int imageWidth = (int) (130.0f * Math.max(1.0f, Global.displayDensity));
        int imageHeight = (int) (50.0f * Math.max(1.0f, Global.displayDensity));
        layout.setPadding(padding, padding, padding, padding);
        layout.setOrientation(1);
        layout.setGravity(1);
        FrameLayout imgFrame = new FrameLayout(this);
        LinearLayout.LayoutParams flParams = new LinearLayout.LayoutParams(imageWidth, imageHeight);
        flParams.bottomMargin = padding;
        imgFrame.setLayoutParams(flParams);
        this.progress = new ProgressBar(this);
        FrameLayout.LayoutParams pbParams = new FrameLayout.LayoutParams(-2, -2);
        pbParams.gravity = 17;
        this.progress.setLayoutParams(pbParams);
        imgFrame.addView(this.progress);
        this.image = new ImageView(this);
        FrameLayout.LayoutParams ivParams = new FrameLayout.LayoutParams(-1, -1);
        ivParams.gravity = 17;
        this.image.setLayoutParams(ivParams);
        imgFrame.addView(this.image);
        layout.addView(imgFrame);
        this.input = new EditText(this);
        this.input.setInputType(176);
        this.input.setSingleLine(true);
        LinearLayout.LayoutParams inParams = new LinearLayout.LayoutParams(imageWidth, -2);
        this.input.setLayoutParams(inParams);
        layout.addView(this.input);
        this.url = getIntent().getStringExtra("url");
        isReady = false;
        new VKAlertDialog.Builder(this).setView(layout).setTitle(R.string.captcha_hint).setPositiveButton(R.string.ok, CaptchaActivity$$Lambda$1.lambdaFactory$(this)).setNegativeButton(R.string.cancel, CaptchaActivity$$Lambda$2.lambdaFactory$(this)).setOnCancelListener(CaptchaActivity$$Lambda$3.lambdaFactory$(this)).show();
        loadImage();
        this.input.requestFocus();
        this.input.postDelayed(CaptchaActivity$$Lambda$4.lambdaFactory$(this), 500L);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$0(DialogInterface dialog, int which) {
        captchaDone();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$1(DialogInterface dialog, int which) {
        captchaCanceled();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$2(DialogInterface dialog) {
        captchaCanceled();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreate$3() {
        InputMethodManager imm = (InputMethodManager) getSystemService("input_method");
        imm.showSoftInput(this.input, 0);
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.logoutReceiver.unregister();
        super.onDestroy();
    }

    private void loadImage() {
        new Thread(CaptchaActivity$$Lambda$5.lambdaFactory$(this)).start();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$loadImage$4() {
        try {
            byte[] imdata = Network.getURL(this.url);
            if (imdata != null) {
                Bitmap bitmap = BitmapFactory.decodeByteArray(imdata, 0, imdata.length);
                displayImage(bitmap);
            }
        } catch (Exception e) {
        }
    }

    private void displayImage(Bitmap bitmap) {
        runOnUiThread(CaptchaActivity$$Lambda$6.lambdaFactory$(this, bitmap));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$displayImage$5(Bitmap bitmap) {
        this.image.setImageBitmap(bitmap);
        this.progress.setVisibility(8);
    }

    private void captchaDone() {
        lastKey = this.input.getText().toString();
        isReady = true;
        finish();
    }

    private void captchaCanceled() {
        lastKey = null;
        isReady = true;
        setResult(0);
        finish();
    }

    @Override // android.app.Activity
    public void onResume() {
        super.onResume();
        AppStateTracker.onActivityResumed(this);
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
        AppStateTracker.onActivityPaused();
    }
}
