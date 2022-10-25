package com.vkontakte.android.ui.widget;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.utils.AdsUtil;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes3.dex */
public class VideoPlayerAdsPanel extends LinearLayout {
    private TextView adsButton;
    private TextView adsTitle;
    private ShitAttachment attachment;
    private int lastOrientation;
    private CharSequence title;

    public VideoPlayerAdsPanel(Context context) {
        this(context, null);
    }

    public VideoPlayerAdsPanel(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public VideoPlayerAdsPanel(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.lastOrientation = getResources().getConfiguration().orientation;
        initView(context);
    }

    public void bind(ShitAttachment attachment, CharSequence title) {
        this.attachment = attachment;
        this.title = title;
        bind();
    }

    private void bind() {
        if (this.attachment != null) {
            this.adsTitle.setText(this.title);
            this.adsButton.setText(this.attachment.installed ? this.attachment.buttonTextInstalled : this.attachment.buttonText);
        }
    }

    @Override // android.view.View
    protected void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (this.lastOrientation != newConfig.orientation) {
            this.lastOrientation = newConfig.orientation;
            initView(getContext());
        }
    }

    private void initView(Context context) {
        removeAllViews();
        View view = inflate(context, R.layout.video_player_ads_panel, null);
        view.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        addView(view);
        this.adsTitle = (TextView) view.findViewById(R.id.ads_title);
        this.adsButton = (TextView) view.findViewById(R.id.ads_button);
        this.adsButton.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.widget.VideoPlayerAdsPanel.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Context context2 = v.getContext();
                if (VideoPlayerAdsPanel.this.attachment != null) {
                    AdsUtil.onAdsPostClick(context2, VideoPlayerAdsPanel.this.attachment);
                }
                Activity activity = Utils.castToActivity(v.getContext());
                if (activity != null) {
                    activity.finish();
                }
            }
        });
        bind();
    }
}
