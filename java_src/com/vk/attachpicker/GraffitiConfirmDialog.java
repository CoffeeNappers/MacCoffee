package com.vk.attachpicker;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.TextView;
import com.vk.attachpicker.widget.RotateLayout;
import com.vk.core.util.Screen;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.attachments.GraffitiAttachment;
/* loaded from: classes2.dex */
public class GraffitiConfirmDialog extends Dialog {
    private View graffitiContainer;
    private VKImageView imagePreview;
    private View preview;
    private RotateLayout resultContainer;
    private TextView sendButton;

    public GraffitiConfirmDialog(Activity activity, Document document) {
        super(activity, R.style.FullScreenDialogDialog);
        View.OnClickListener onClickListener;
        setCancelable(true);
        setCanceledOnTouchOutside(false);
        WindowManager.LayoutParams lp = new WindowManager.LayoutParams();
        lp.copyFrom(getWindow().getAttributes());
        lp.width = -1;
        lp.height = -1;
        lp.softInputMode = 48;
        getWindow().setAttributes(lp);
        if (activity.getResources().getBoolean(R.bool.picker_transparent_status_bar)) {
            getWindow().addFlags(67108864);
        }
        View contentView = activity.getLayoutInflater().inflate(R.layout.picker_layout_graffiti_result, (ViewGroup) null);
        setContentView(contentView);
        this.resultContainer = (RotateLayout) findViewById(R.id.rl_result_container);
        this.preview = findViewById(R.id.fl_graffiti_preview);
        this.graffitiContainer = findViewById(R.id.fl_graffiti_container);
        this.imagePreview = (VKImageView) findViewById(R.id.iv_preview);
        this.sendButton = (TextView) findViewById(R.id.tv_send_button);
        float ar = document.width / document.height;
        this.imagePreview.setAspectRatio(Math.min(2.0f, Math.max(0.6f, ar)));
        this.imagePreview.load(document.url, ImageSize.MID);
        this.imagePreview.setMaxHeight(Screen.realWidth() - Screen.dp(128));
        this.imagePreview.setMaxWidth(Screen.realWidth() - Screen.dp(32));
        VKImageView vKImageView = this.imagePreview;
        onClickListener = GraffitiConfirmDialog$$Lambda$1.instance;
        vKImageView.setOnClickListener(onClickListener);
        this.preview.setOnClickListener(GraffitiConfirmDialog$$Lambda$2.lambdaFactory$(this));
        this.sendButton.setOnClickListener(GraffitiConfirmDialog$$Lambda$3.lambdaFactory$(document, activity));
    }

    public static /* synthetic */ void lambda$new$0(View v) {
    }

    public /* synthetic */ void lambda$new$1(View v) {
        dismiss();
    }

    public static /* synthetic */ void lambda$new$2(Document document, Activity activity, View v) {
        Intent result = new Intent();
        result.putExtra(AttachIntent.RESULT_GRAFFITI, new GraffitiAttachment(document));
        activity.setResult(-1, result);
        if (activity instanceof AttachActivity) {
            ((AttachActivity) activity).superFinish();
        } else {
            activity.finish();
        }
    }
}
