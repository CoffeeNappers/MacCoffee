package com.vk.attachpicker;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Path;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.view.OrientationEventListener;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.imagepipeline.common.RotationOptions;
import com.my.target.ads.instream.InstreamAd;
import com.vk.attachpicker.drawing.DrawingCanvas;
import com.vk.attachpicker.drawing.DrawingColors;
import com.vk.attachpicker.drawing.DrawingState;
import com.vk.attachpicker.drawing.DrawingView;
import com.vk.attachpicker.util.BitmapUtils;
import com.vk.attachpicker.util.Utils;
import com.vk.attachpicker.widget.ColorSelectorView;
import com.vk.attachpicker.widget.RotateLayout;
import com.vk.attachpicker.widget.WidthSelectorView;
import com.vk.core.util.FileUtils;
import com.vk.core.util.Screen;
import com.vk.core.util.TimeoutLock;
import com.vk.imageloader.VKImageLoader;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.VKActivity;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.attachments.PendingGraffitiAttachment;
import com.vkontakte.android.upload.Upload;
import io.reactivex.Observable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.io.File;
import java.io.FileOutputStream;
/* loaded from: classes2.dex */
public class GraffitiActivity extends VKActivity {
    private static final int SIZE = 720;
    private ColorSelectorView colorSelectorView;
    private View drawingCancel;
    private FrameLayout drawingContainer;
    private ImageView drawingEraser;
    private View drawingSend;
    private View drawingUndo;
    private DrawingView drawingView;
    private ImageView drawingWidthButton;
    private String graffitiAvatar;
    private Bitmap graffitiBitmap;
    private View graffitiContainer;
    private String graffitiTitle;
    private VKImageView imagePreview;
    private LinearLayout innerUserContainer;
    private int lastOrientation;
    private OrientationEventListener orientationEventListener;
    private View preview;
    private RotateLayout resultContainer;
    private TextView sendButton;
    private ImageView userAvatar;
    private FrameLayout userContainer;
    private TextView userName;
    private final TimeoutLock exitLock = new TimeoutLock(300);
    private final Handler orientationChangeHandler = new Handler(Looper.getMainLooper());
    private final Runnable orientationChangeRunnable = GraffitiActivity$$Lambda$1.lambdaFactory$(this);

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(@Nullable Bundle savedInstanceState) {
        View.OnClickListener onClickListener;
        Consumer<? super Throwable> consumer;
        super.onCreate(savedInstanceState);
        setContentView(R.layout.picker_activity_graffiti);
        this.graffitiTitle = getIntent().getStringExtra(AttachIntent.INTENT_GRAFFITI_TITLE);
        this.graffitiAvatar = getIntent().getStringExtra(AttachIntent.INTENT_GRAFFITI_AVATAR);
        this.orientationEventListener = new OrientationEventListener(this) { // from class: com.vk.attachpicker.GraffitiActivity.1
            {
                GraffitiActivity.this = this;
            }

            @Override // android.view.OrientationEventListener
            public void onOrientationChanged(int orientation) {
                GraffitiActivity.this.onOrientationEvent(orientation);
            }
        };
        this.drawingContainer = (FrameLayout) findViewById(R.id.fl_drawing_container);
        this.drawingView = (DrawingView) findViewById(R.id.dv_drawing);
        this.drawingView.setTouchEnabled(true);
        this.drawingView.setFixTouchPosition(false);
        this.colorSelectorView = (ColorSelectorView) findViewById(R.id.ccv_drawing_color_selector);
        this.drawingWidthButton = (ImageView) findViewById(R.id.iv_drawing_width);
        this.drawingCancel = findViewById(R.id.iv_drawing_cancel);
        this.drawingSend = findViewById(R.id.iv_send);
        this.drawingUndo = findViewById(R.id.iv_drawing_undo);
        this.drawingEraser = (ImageView) findViewById(R.id.iv_drawing_eraser);
        this.drawingEraser.setOnClickListener(GraffitiActivity$$Lambda$2.lambdaFactory$(this));
        this.drawingWidthButton.setOnClickListener(GraffitiActivity$$Lambda$3.lambdaFactory$(this));
        this.colorSelectorView.setOnColorSelectedListener(new ColorSelectorView.OnColorSelectedListener() { // from class: com.vk.attachpicker.GraffitiActivity.3
            int color = DrawingColors.COLORS[0];
            int brushType = 1;

            {
                GraffitiActivity.this = this;
            }

            @Override // com.vk.attachpicker.widget.ColorSelectorView.OnColorSelectedListener
            public void onColorSelected(int color) {
                GraffitiActivity.this.drawingView.setColor(color);
                GraffitiActivity.this.setEraserModeDisabled(this.brushType, color);
            }

            @Override // com.vk.attachpicker.widget.ColorSelectorView.OnColorSelectedListener
            public void onBrushTypeSelected(int brushType) {
                GraffitiActivity.this.drawingView.setBrushType(brushType);
                GraffitiActivity.this.setEraserModeDisabled(brushType, this.color);
            }
        });
        this.drawingUndo.setOnClickListener(GraffitiActivity$$Lambda$4.lambdaFactory$(this));
        this.drawingUndo.setOnLongClickListener(GraffitiActivity$$Lambda$5.lambdaFactory$(this));
        this.drawingView.setOnMotionEventListener(new DrawingView.OnMotionEventListener() { // from class: com.vk.attachpicker.GraffitiActivity.4
            {
                GraffitiActivity.this = this;
            }

            @Override // com.vk.attachpicker.drawing.DrawingView.OnMotionEventListener
            public void onDown() {
                boolean z = true;
                GraffitiActivity.this.drawingUndo.setEnabled(GraffitiActivity.this.drawingView.getHistorySize() > 0);
                View view = GraffitiActivity.this.drawingSend;
                if (GraffitiActivity.this.drawingView.getHistorySize() <= 0) {
                    z = false;
                }
                view.setEnabled(z);
            }

            @Override // com.vk.attachpicker.drawing.DrawingView.OnMotionEventListener
            public void onUp() {
            }
        });
        this.drawingUndo.setEnabled(false);
        this.drawingSend.setEnabled(false);
        this.drawingCancel.setOnClickListener(GraffitiActivity$$Lambda$6.lambdaFactory$(this));
        this.drawingSend.setOnClickListener(GraffitiActivity$$Lambda$7.lambdaFactory$(this));
        this.resultContainer = (RotateLayout) findViewById(R.id.rl_result_container);
        this.preview = findViewById(R.id.fl_graffiti_preview);
        this.graffitiContainer = findViewById(R.id.fl_graffiti_container);
        this.imagePreview = (VKImageView) findViewById(R.id.iv_preview);
        this.sendButton = (TextView) findViewById(R.id.tv_send_button);
        this.resultContainer.setVisibility(4);
        this.resultContainer.setBackgroundColor(1711276032);
        this.preview.setBackgroundColor(0);
        this.imagePreview.setMaxHeight(Screen.realWidth() - Screen.dp(128));
        this.imagePreview.setMaxWidth(Screen.realWidth() - Screen.dp(32));
        VKImageView vKImageView = this.imagePreview;
        onClickListener = GraffitiActivity$$Lambda$8.instance;
        vKImageView.setOnClickListener(onClickListener);
        this.preview.setOnClickListener(GraffitiActivity$$Lambda$9.lambdaFactory$(this));
        this.sendButton.setOnClickListener(GraffitiActivity$$Lambda$10.lambdaFactory$(this));
        this.userContainer = (FrameLayout) findViewById(R.id.fl_user_container);
        this.innerUserContainer = (LinearLayout) findViewById(R.id.ll_user_container_inner);
        this.userAvatar = (ImageView) this.innerUserContainer.findViewById(R.id.iv_avatar);
        this.userName = (TextView) this.innerUserContainer.findViewById(R.id.tv_username);
        if (this.graffitiTitle != null) {
            Observable<Bitmap> observeOn = VKImageLoader.getCircleBitmap(this.graffitiAvatar).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread());
            Consumer<? super Bitmap> lambdaFactory$ = GraffitiActivity$$Lambda$11.lambdaFactory$(this);
            consumer = GraffitiActivity$$Lambda$12.instance;
            observeOn.subscribe(lambdaFactory$, consumer);
            this.userName.setText(this.graffitiTitle);
            Utils.runOnPreDraw(this.userContainer, GraffitiActivity$$Lambda$13.lambdaFactory$(this));
            return;
        }
        ((FrameLayout.LayoutParams) this.drawingContainer.getLayoutParams()).topMargin = 0;
        this.userContainer.setVisibility(8);
    }

    public /* synthetic */ void lambda$onCreate$1(View v) {
        setEraserModeEnabled();
    }

    public /* synthetic */ void lambda$onCreate$2(View v) {
        WidthSelectorView.show(this.drawingWidthButton, this.colorSelectorView.getSelectedColor(), DrawingState.findIntIndex(this.drawingView.getWidthMultiplier()), new WidthSelectorView.OnWidthSelectedListener() { // from class: com.vk.attachpicker.GraffitiActivity.2
            {
                GraffitiActivity.this = this;
            }

            @Override // com.vk.attachpicker.widget.WidthSelectorView.OnWidthSelectedListener
            public void onWidthSelected(int widthIndex) {
                GraffitiActivity.this.drawingView.setWidthMultiplier(DrawingState.WIDTH[widthIndex]);
            }
        });
    }

    public /* synthetic */ void lambda$onCreate$3(View v) {
        boolean z = true;
        this.drawingView.undo();
        this.drawingUndo.setEnabled(this.drawingView.getHistorySize() > 0);
        View view = this.drawingSend;
        if (this.drawingView.getHistorySize() <= 0) {
            z = false;
        }
        view.setEnabled(z);
    }

    public /* synthetic */ boolean lambda$onCreate$4(View v) {
        this.drawingView.clear();
        this.drawingUndo.setEnabled(false);
        this.drawingSend.setEnabled(false);
        return true;
    }

    public /* synthetic */ void lambda$onCreate$5(View v) {
        finish();
    }

    public /* synthetic */ void lambda$onCreate$6(View v) {
        showResult();
    }

    public static /* synthetic */ void lambda$onCreate$7(View v) {
    }

    public /* synthetic */ void lambda$onCreate$8(View v) {
        finish();
    }

    public /* synthetic */ void lambda$onCreate$9(View v) {
        setResultAndFinish();
    }

    public /* synthetic */ void lambda$onCreate$10(Bitmap bitmap) throws Exception {
        this.userAvatar.setImageBitmap(bitmap);
    }

    public static /* synthetic */ void lambda$onCreate$11(Throwable throwable) throws Exception {
    }

    public /* synthetic */ void lambda$onCreate$12() {
        ((FrameLayout.LayoutParams) this.drawingContainer.getLayoutParams()).topMargin = this.userContainer.getMeasuredHeight();
        this.drawingContainer.requestLayout();
    }

    private void setEraserModeEnabled() {
        this.drawingView.setBrushType(0);
        this.colorSelectorView.setSelectedColor(0);
        this.drawingEraser.setColorFilter(ContextCompat.getColor(this, R.color.picker_blue));
    }

    public void setEraserModeDisabled(int brushType, int color) {
        this.drawingView.setBrushType(brushType);
        this.colorSelectorView.setSelectedColor(color);
        this.drawingEraser.setColorFilter(ContextCompat.getColor(this, R.color.picker_dark_icon));
    }

    public void onOrientationEvent(int deg) {
        int realDeg;
        int deg2 = deg - ViewUtils.getDeviceDegreesInPortraitMode(this);
        if (deg2 >= 0) {
            int tmpDeg = deg2 % 90;
            if (tmpDeg < 45) {
                realDeg = deg2 - tmpDeg;
            } else {
                realDeg = (deg2 + 90) - tmpDeg;
            }
            int realDeg2 = realDeg % InstreamAd.DEFAULT_VIDEO_QUALITY;
            if (realDeg2 > 180) {
                realDeg2 -= 360;
            }
            int realDeg3 = realDeg2 * (-1);
            if (realDeg3 != this.lastOrientation) {
                this.orientationChangeHandler.removeCallbacks(this.orientationChangeRunnable);
                this.orientationChangeHandler.postDelayed(this.orientationChangeRunnable, 300L);
            }
            this.lastOrientation = realDeg3;
        }
    }

    /* renamed from: handleOrientationChange */
    public void lambda$new$0() {
        this.resultContainer.setAngle(-this.lastOrientation);
        this.drawingCancel.animate().rotation(this.lastOrientation).start();
        this.drawingSend.animate().rotation(this.lastOrientation).start();
        this.drawingWidthButton.animate().rotation(this.lastOrientation).start();
        this.drawingUndo.animate().rotation(this.lastOrientation).start();
        this.drawingEraser.animate().rotation(this.lastOrientation).start();
        if (this.userAvatar.getWidth() > 0 && this.userName.getWidth() > 0) {
            if (this.lastOrientation % RotationOptions.ROTATE_180 == 0) {
                this.userAvatar.animate().rotation(this.lastOrientation).translationX(0.0f).start();
                this.userName.animate().translationX(0.0f).alpha(1.0f).start();
                return;
            }
            float avatarTranslation = (this.innerUserContainer.getWidth() / 2) - (this.userAvatar.getLeft() + (this.userAvatar.getWidth() / 2));
            float nameTranslation = (this.innerUserContainer.getWidth() / 2) - (this.userName.getLeft() + (this.userName.getWidth() / 2));
            this.userAvatar.animate().rotation(this.lastOrientation).translationX(avatarTranslation).start();
            this.userName.animate().translationX(nameTranslation).alpha(0.0f).start();
        }
    }

    private void showResult() {
        if (!this.drawingView.isDefault()) {
            float w = this.drawingView.getMeasuredWidth();
            float h = this.drawingView.getMeasuredHeight();
            DrawingState ds = this.drawingView.getDrawingStateCopy();
            Path mergedPath = ds.getMergedPath();
            RectF bounds = new RectF();
            mergedPath.computeBounds(bounds, true);
            int p = (int) ((ds.getMaxBrushWidth() / 2.0f) + Screen.dp(1));
            bounds.left -= p;
            bounds.top -= p;
            bounds.right += p;
            bounds.bottom += p;
            if (bounds.left < 0.0f) {
                bounds.left = 0.0f;
            }
            if (bounds.top < 0.0f) {
                bounds.top = 0.0f;
            }
            if (bounds.right > w) {
                bounds.right = w;
            }
            if (bounds.bottom > h) {
                bounds.bottom = h;
            }
            ds.postTranslate(-bounds.left, -bounds.top);
            float graffitiWidth = bounds.width();
            float graffitiHeigth = bounds.height();
            float graffitiScale = Math.min(2.0f, Math.min(w / bounds.width(), h / bounds.height()));
            float graffitiWidth2 = graffitiWidth * graffitiScale;
            float graffitiHeigth2 = graffitiHeigth * graffitiScale;
            if (graffitiWidth2 > 720.0f || graffitiHeigth2 > 720.0f) {
                float downscale = 720.0f / Math.max(graffitiWidth2, graffitiHeigth2);
                graffitiScale *= downscale;
                graffitiWidth2 *= downscale;
                graffitiHeigth2 *= downscale;
            }
            int finalWidth = (int) graffitiWidth2;
            int finalHeight = (int) graffitiHeigth2;
            ds.postScale(graffitiScale, 0.0f, 0.0f);
            this.graffitiBitmap = Bitmap.createBitmap(finalWidth, finalHeight, Bitmap.Config.ARGB_4444);
            DrawingCanvas drawingCanvas = new DrawingCanvas(this.graffitiBitmap);
            drawingCanvas.draw(ds);
            if (this.lastOrientation != 0) {
                this.graffitiBitmap = BitmapUtils.rotateBitmap(this.graffitiBitmap, -this.lastOrientation, false);
            }
            this.imagePreview.setAspectRatio(Math.min(1.8f, Math.max(0.8f, BitmapUtils.getAspectRatio(this.graffitiBitmap))));
            this.imagePreview.setImageBitmap(this.graffitiBitmap);
            this.resultContainer.setAlpha(0.0f);
            this.resultContainer.setVisibility(0);
            this.resultContainer.animate().alpha(1.0f).setListener(null).setDuration(200L).start();
        }
    }

    private void setResultAndFinish() {
        if (this.graffitiBitmap != null) {
            try {
                File output = FileUtils.getTempGraffitiFile();
                FileOutputStream fos = new FileOutputStream(output);
                this.graffitiBitmap.compress(Bitmap.CompressFormat.PNG, 100, fos);
                fos.close();
                VKImageLoader.prefetchToMemory(Uri.fromFile(output));
                Intent result = new Intent();
                result.putExtra(AttachIntent.RESULT_NEW_GRAFFITI, new PendingGraffitiAttachment(Upload.getNewID(), 0, output.getAbsolutePath(), this.graffitiBitmap.getWidth(), this.graffitiBitmap.getHeight(), null));
                setResult(-1, result);
                super.finish();
            } catch (Exception e) {
                Toast.makeText(this, (int) R.string.picker_graffiti_save_result, 0).show();
            }
        }
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        this.orientationEventListener.enable();
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        super.onPause();
        this.orientationEventListener.disable();
    }

    @Override // android.app.Activity
    public void finish() {
        DialogInterface.OnClickListener onClickListener;
        if (!this.exitLock.isLocked()) {
            this.exitLock.lock();
            if (this.resultContainer.getVisibility() == 0) {
                this.resultContainer.animate().alpha(0.0f).setListener(new AnimatorListenerAdapter() { // from class: com.vk.attachpicker.GraffitiActivity.5
                    {
                        GraffitiActivity.this = this;
                    }

                    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                    public void onAnimationEnd(Animator animation) {
                        GraffitiActivity.this.resultContainer.setVisibility(4);
                    }
                }).setDuration(200L).start();
            } else if (!this.drawingView.isDefault()) {
                VKAlertDialog.Builder builder = new VKAlertDialog.Builder(this);
                builder.setTitle(R.string.confirm);
                builder.setMessage(R.string.picker_editor_exit_confirm);
                builder.setPositiveButton(R.string.picker_yes, GraffitiActivity$$Lambda$14.lambdaFactory$(this));
                onClickListener = GraffitiActivity$$Lambda$15.instance;
                builder.setNegativeButton(R.string.picker_no, onClickListener);
                builder.show();
            } else {
                super.finish();
            }
        }
    }

    public /* synthetic */ void lambda$finish$13(DialogInterface dialog, int which) {
        super.finish();
    }
}
