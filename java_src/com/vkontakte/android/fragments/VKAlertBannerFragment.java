package com.vkontakte.android.fragments;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.fragments.VKAlertFragment;
import com.vkontakte.android.utils.L;
/* loaded from: classes2.dex */
public class VKAlertBannerFragment extends VKAlertFragment {
    protected TextView buttonTitle;
    protected ImageView icon;
    protected TextView subtitle;
    protected TextView title;
    private String url;

    @Override // com.vkontakte.android.fragments.VKAlertFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.alert_banner, container, false);
    }

    @Override // com.vkontakte.android.fragments.VKAlertFragment
    protected void init(View view) {
        this.icon = (ImageView) view.findViewById(R.id.icon);
        this.title = (TextView) view.findViewById(R.id.title);
        this.subtitle = (TextView) view.findViewById(R.id.subtitle);
        this.buttonTitle = (TextView) view.findViewById(R.id.button_title);
        view.findViewById(R.id.button).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.VKAlertBannerFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                VKAlertBannerFragment.this.action();
            }
        });
        bind();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.VKAlertFragment
    public void action() {
        if (!TextUtils.isEmpty(this.url)) {
            try {
                startActivity(new Intent("android.intent.action.VIEW", Uri.parse(this.url)));
            } catch (Exception e) {
                L.e(e, new Object[0]);
            }
        }
        super.action();
    }

    protected void bind() {
        VKAlertFragment.Builder builder;
        Bundle arguments = getArguments();
        if (arguments != null && (builder = (VKAlertFragment.Builder) arguments.getParcelable("Builder")) != null) {
            this.icon.setImageResource(builder.iconId);
            this.title.setText(builder.titleId);
            this.subtitle.setText(builder.message);
            this.buttonTitle.setText(builder.positiveButtonTitleId);
            this.url = builder.url;
            return;
        }
        getActivity().finish();
    }
}
