package com.vkontakte.android.fragments;

import com.vkontakte.android.R;
import com.vkontakte.android.utils.VKLiveUtils;
/* loaded from: classes2.dex */
public class VKLiveInstallBannerFragment extends VKAlertBannerFragment {
    @Override // com.vkontakte.android.fragments.VKAlertBannerFragment
    protected void bind() {
        this.icon.setImageResource(R.drawable.vk_live_install_banner);
        this.title.setText(R.string.vk_live_install_title);
        this.subtitle.setText(R.string.vk_live_install_tip);
        this.buttonTitle.setText(R.string.vk_live_install);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.VKAlertBannerFragment, com.vkontakte.android.fragments.VKAlertFragment
    public void action() {
        VKLiveUtils.openMarket(getContext());
        super.action();
    }
}
