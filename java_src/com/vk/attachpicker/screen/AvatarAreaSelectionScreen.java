package com.vk.attachpicker.screen;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import com.vk.attachpicker.AttachResulter;
import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.crop.CropAspectRatio;
import com.vk.attachpicker.crop.CropImageView;
import com.vk.attachpicker.crop.GeometryState;
import com.vk.attachpicker.crop.RectCropOverlayView;
import com.vk.attachpicker.mediastore.MediaStoreEntry;
import com.vk.attachpicker.widget.ContextProgressView;
import com.vk.attachpicker.widget.EditorBottomPanel;
import com.vk.core.simplescreen.BaseScreen;
import com.vk.core.util.FileUtils;
import com.vk.core.util.TimeoutLock;
import com.vk.imageloader.VKImageLoader;
import com.vkontakte.android.R;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.schedulers.Schedulers;
import java.io.File;
import java.io.FileOutputStream;
/* loaded from: classes2.dex */
public class AvatarAreaSelectionScreen extends BaseScreen {
    private EditorBottomPanel bottomPanel;
    private final TimeoutLock buttonLock;
    private boolean controlsEnabled;
    private CropImageView cropView;
    private Bitmap croppedBitmap;
    private Disposable currentTask;
    private final MediaStoreEntry entry;
    private ContextProgressView progressView;

    public AvatarAreaSelectionScreen(MediaStoreEntry entry) {
        this.buttonLock = new TimeoutLock(1000L);
        this.controlsEnabled = true;
        this.entry = entry;
        this.croppedBitmap = null;
    }

    public AvatarAreaSelectionScreen(Bitmap croppedBitmap) {
        this.buttonLock = new TimeoutLock(1000L);
        this.controlsEnabled = true;
        this.croppedBitmap = croppedBitmap;
        this.entry = null;
    }

    private float div(float a, float b) {
        if (b == 0.0f) {
            return 0.0f;
        }
        return a / b;
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public View createView(LayoutInflater inflater) {
        View view = inflater.inflate(R.layout.picker_screen_avatar_area_selection, (ViewGroup) null);
        this.cropView = (CropImageView) view.findViewById(R.id.cv_crop);
        this.bottomPanel = (EditorBottomPanel) view.findViewById(R.id.ebp_bottom);
        this.progressView = (ContextProgressView) view.findViewById(R.id.cpv_progress);
        this.bottomPanel.setOnCancelClickListener(AvatarAreaSelectionScreen$$Lambda$1.lambdaFactory$(this));
        this.bottomPanel.setOnApplyClickListener(AvatarAreaSelectionScreen$$Lambda$2.lambdaFactory$(this));
        this.cropView.setDelegate(new CropImageView.Delegate() { // from class: com.vk.attachpicker.screen.AvatarAreaSelectionScreen.1
            @Override // com.vk.attachpicker.crop.CropImageView.Delegate
            public void setAdjusterViewTouchEnabled(boolean enabled) {
            }

            @Override // com.vk.attachpicker.crop.CropImageView.Delegate
            public void onImageGeometryChange() {
            }

            @Override // com.vk.attachpicker.crop.CropImageView.Delegate
            public void setControlsTouchEnabled(boolean enabled) {
                AvatarAreaSelectionScreen.this.setControlsEnabled(enabled);
            }
        });
        loadImages();
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createView$0(View v) {
        if (!checkButtonLock()) {
            finish();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$createView$1(View v) {
        Intent resultIntent;
        if (!checkButtonLock()) {
            this.cropView.cancelPendingAnimations();
            Activity a = getActivity();
            if (a != null) {
                try {
                    RectF cropRect = this.cropView.getCropController().getCropRect();
                    RectF imageRect = this.cropView.getCropController().getImageRect();
                    float deltaX = -imageRect.left;
                    float deltaY = -imageRect.top;
                    cropRect.left += deltaX;
                    cropRect.top += deltaY;
                    cropRect.right += deltaX;
                    cropRect.bottom += deltaY;
                    imageRect.left += deltaX;
                    imageRect.top += deltaY;
                    imageRect.right += deltaX;
                    imageRect.bottom += deltaY;
                    if (this.entry != null) {
                        resultIntent = SelectionContext.packSingleEntry(this.entry);
                    } else {
                        File resultFile = FileUtils.getPhotoFile();
                        FileOutputStream fos = new FileOutputStream(resultFile);
                        this.croppedBitmap.compress(Bitmap.CompressFormat.JPEG, 86, fos);
                        resultIntent = SelectionContext.packSinglePhoto(resultFile);
                    }
                    resultIntent.putExtra("cropLeft", div(cropRect.left, imageRect.right));
                    resultIntent.putExtra("cropTop", div(cropRect.top, imageRect.bottom));
                    resultIntent.putExtra("cropRight", div(cropRect.right, imageRect.right));
                    resultIntent.putExtra("cropBottom", div(cropRect.bottom, imageRect.bottom));
                    ((AttachResulter) a).setResultAndFinish(resultIntent);
                } catch (Exception e) {
                    Toast.makeText(a, (int) R.string.picker_saving_error, 0).show();
                }
            }
        }
    }

    private void loadImages() {
        if (this.croppedBitmap != null) {
            initUi();
        } else if (this.currentTask == null) {
            this.currentTask = VKImageLoader.getVeryBigBitmap(this.entry.path).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(AvatarAreaSelectionScreen$$Lambda$3.lambdaFactory$(this), AvatarAreaSelectionScreen$$Lambda$4.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$loadImages$2(Bitmap bitmap) throws Exception {
        this.croppedBitmap = bitmap;
        this.currentTask = null;
        initUi();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$loadImages$3(Throwable throwable) throws Exception {
        this.currentTask = null;
    }

    private void initUi() {
        this.progressView.setVisibility(8);
        GeometryState geometryState = new GeometryState(this.croppedBitmap.getWidth(), this.croppedBitmap.getHeight());
        geometryState.resetTransformationMatrix();
        this.cropView.setBitmap(this.croppedBitmap, geometryState, CropAspectRatio.CROP_SQUARE, true, false);
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void onTopPaddingChanged(int topPadding) {
        this.cropView.overlayView().setTopSidePadding(RectCropOverlayView.SIDE_PADDING + topPadding);
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public boolean onBackPressed() {
        if (this.controlsEnabled) {
            return super.onBackPressed();
        }
        return true;
    }

    @Override // com.vk.core.simplescreen.BaseScreen
    public void finish() {
        this.cropView.cancelPendingAnimations();
        this.cropView.disableAll();
        super.finish();
    }

    private boolean checkButtonLock() {
        if (this.buttonLock.isLocked()) {
            return true;
        }
        this.buttonLock.lock();
        return false;
    }

    public void setControlsEnabled(boolean enabled) {
        this.controlsEnabled = enabled;
    }
}
