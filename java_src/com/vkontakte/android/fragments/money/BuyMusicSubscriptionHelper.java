package com.vkontakte.android.fragments.money;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import com.vkontakte.android.NetworkStateReceiver;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.PurchasesManager.Product;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.ResulterProvider;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public class BuyMusicSubscriptionHelper<D extends PurchasesManager.Product> implements ActivityResulter, PurchasesManager.OnSuccessListener<D> {
    private PurchasesManager<D> manager;

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.data.PurchasesManager.OnSuccessListener
    public /* bridge */ /* synthetic */ void onSuccess(Object obj) {
        onSuccess((BuyMusicSubscriptionHelper<D>) ((PurchasesManager.Product) obj));
    }

    public void purchase(Fragment fragment, D subscription, PurchasesManager.OnSuccessListener<D> listener) {
        if (this.manager == null) {
            this.manager = new PurchasesManager<>(fragment);
        }
        this.manager.purchase(subscription, BuyMusicSubscriptionHelper$$Lambda$1.lambdaFactory$(this, listener));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Multi-variable type inference failed */
    public /* synthetic */ void lambda$purchase$0(PurchasesManager.OnSuccessListener listener, PurchasesManager.Product d) {
        listener.onSuccess(d);
        onSuccess((BuyMusicSubscriptionHelper<D>) d);
    }

    public void restore(Fragment fragment, D subscription, PurchasesManager.OnSuccessListener<D> listener) {
        if (this.manager == null) {
            this.manager = new PurchasesManager<>(fragment);
        }
        this.manager.restore(subscription, BuyMusicSubscriptionHelper$$Lambda$2.lambdaFactory$(this, listener));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Multi-variable type inference failed */
    public /* synthetic */ void lambda$restore$1(PurchasesManager.OnSuccessListener listener, PurchasesManager.Product d) {
        listener.onSuccess(d);
        onSuccess((BuyMusicSubscriptionHelper<D>) d);
    }

    public void onAttach(Activity activity) {
        if (activity instanceof ResulterProvider) {
            ((ResulterProvider) activity).registerActivityResult(this);
        }
    }

    public void onDetach(Activity activity) {
        if (activity instanceof ResulterProvider) {
            ((ResulterProvider) activity).unregisterActivityResult(this);
        }
    }

    @Override // com.vkontakte.android.ui.ActivityResulter
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (this.manager != null) {
            this.manager.onActivityResult(requestCode, resultCode, data);
        }
    }

    public void onSuccess(D d) {
        NetworkStateReceiver.updateInfo(VKApplication.context);
    }
}
