package com.vkontakte.android.fragments.money;

import android.app.Activity;
import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.SpannableStringBuilder;
import android.text.style.ImageSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.vkontakte.android.FragmentDialogActivity;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.store.GetSubscription;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.Subscription;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.functions.Functions;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.utils.Utils;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class BuyMusicSubscriptionFragment extends AppKitFragment implements View.OnClickListener, PurchasesManager.OnSuccessListener<Subscription> {
    private static final int MUSIC_SUBSCRIPTION_ID = 1;
    private static boolean showed = false;
    private TextView buttonPrice;
    private TextView buttonTitle;
    private View buyButton;
    private View buyButtonDisable;
    private TextView buyButtonDisableText;
    private ProgressBar progressBar;
    private GetSubscription currentRequest = null;
    private Subscription subscription = null;
    private final BuyMusicSubscriptionHelper<Subscription> helper = new BuyMusicSubscriptionHelper<>();

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        showed = true;
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        showed = false;
    }

    public static boolean isShowed() {
        return showed;
    }

    public static void show(Context ctx) {
        new Navigator(BuyMusicSubscriptionFragment.class, new TabletDialogActivity.Builder(FragmentDialogActivity.class).setMaxWidth(V.dp(312.0f)).setMinSpacing(V.dp(32.0f)).setGravity(17).windowBackgroundResource(R.drawable.white_rect_with_2dp_corners), new Bundle()).go(ctx);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.helper.onAttach(activity);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDetach() {
        this.helper.onDetach(getActivity());
        super.onDetach();
    }

    @Override // com.vkontakte.android.data.PurchasesManager.OnSuccessListener
    public void onSuccess(Subscription subscription) {
        Activity activity = getActivity();
        if (activity != null) {
            MusicSubscriptionsWasBoughtFragment.show(activity);
            activity.finish();
        }
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fr_buy_music_subscription, container, false);
        this.buyButton = view.findViewById(R.id.buy_button);
        this.buyButton.setOnClickListener(this);
        this.buyButton.setEnabled(false);
        this.buyButtonDisable = view.findViewById(R.id.buy_button_disable);
        this.buyButtonDisableText = (TextView) view.findViewById(R.id.buy_button_disable_text);
        this.progressBar = (ProgressBar) view.findViewById(R.id.progress);
        this.progressBar.getIndeterminateDrawable().setColorFilter(-1, PorterDuff.Mode.SRC_ATOP);
        this.buttonTitle = (TextView) view.findViewById(R.id.button_title);
        this.buttonPrice = (TextView) view.findViewById(R.id.button_price);
        View closeBtn = view.findViewById(R.id.close_btn);
        closeBtn.setOnClickListener(this);
        View closeBtnImg = view.findViewById(R.id.close_btn_img);
        Drawable drawable = ViewUtils.getDrawable(inflater.getContext(), R.drawable.ic_close);
        int gray = inflater.getContext().getResources().getColor(R.color.gray);
        closeBtnImg.setBackground(new RecoloredDrawable(drawable, gray));
        TextView textView = (TextView) view.findViewById(R.id.text3);
        String string = String.valueOf(textView.getText());
        SpannableStringBuilder builder = new SpannableStringBuilder(string);
        Drawable d = ViewUtils.getDrawable(getActivity(), R.drawable.ic_music_promo_boom_logo);
        d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
        ImageSpan imageSpan = new ImageSpan(d, 1);
        int startIndex = string.indexOf("boom");
        builder.setSpan(imageSpan, startIndex, startIndex + 4, 0);
        textView.setText(builder);
        return view;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        loadStockItemInfo();
    }

    private void loadStockItemInfo() {
        if (this.currentRequest == null) {
            this.currentRequest = new GetSubscription(1);
            this.currentRequest.setCallback(new AnonymousClass1());
            this.currentRequest.exec((Context) getActivity());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.money.BuyMusicSubscriptionFragment$1  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass1 implements Callback<Subscription> {
        AnonymousClass1() {
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Subscription result) {
            F1 f1;
            BuyMusicSubscriptionFragment.this.subscription = result;
            boolean canBePurchased = result.can_purchase;
            if (!canBePurchased) {
                BuyMusicSubscriptionFragment.this.showButtonInfo(null, false);
            } else if (!PurchasesManager.canUseInApps()) {
                BuyMusicSubscriptionFragment.this.showButtonInfo(result.priceStr, true);
            } else {
                List singletonList = Collections.singletonList(result);
                f1 = BuyMusicSubscriptionFragment$1$$Lambda$1.instance;
                Map<String, Subscription> map = Functions.map(singletonList, f1);
                PurchasesManager.getGooglePlayPricesSubs(map, BuyMusicSubscriptionFragment$1$$Lambda$2.lambdaFactory$(this));
            }
            BuyMusicSubscriptionFragment.this.currentRequest = null;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ Void lambda$success$1(Subscription subscription1, String s) {
            subscription1.priceStr = s;
            ViewUtils.post(BuyMusicSubscriptionFragment$1$$Lambda$3.lambdaFactory$(this, s));
            return null;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$null$0(String s) {
            BuyMusicSubscriptionFragment.this.showButtonInfo(s, true);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            BuyMusicSubscriptionFragment.this.currentRequest = null;
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.progressBar = null;
        this.buttonPrice = null;
        this.buttonTitle = null;
        this.buyButton = null;
        this.buyButtonDisable = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showButtonInfo(String price, boolean canBePurchased) {
        boolean inappAvailable = PurchasesManager.canUseInApps();
        boolean canBePurchased2 = canBePurchased && inappAvailable;
        if (this.progressBar != null && this.buttonTitle != null && this.buttonPrice != null && this.buyButton != null && this.buyButtonDisable != null) {
            if (canBePurchased2) {
                this.progressBar.setVisibility(8);
                this.buttonPrice.setVisibility(0);
                this.buttonPrice.setText(this.buttonPrice.getContext().getString(R.string.music_subs_buy_price_2, price));
                this.buttonTitle.setVisibility(0);
                this.buyButton.setEnabled(true);
                return;
            }
            this.buyButtonDisable.setVisibility(0);
            if (inappAvailable) {
                this.buyButtonDisableText.setText(R.string.music_subscription_unavailable_region);
            } else {
                this.buyButtonDisableText.setText(R.string.music_subscription_unavailable_device);
            }
            this.buyButton.setVisibility(8);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.close_btn /* 2131755674 */:
                Utils.castToActivity(v.getContext()).finish();
                return;
            case R.id.close_btn_img /* 2131755675 */:
            case R.id.text3 /* 2131755676 */:
            default:
                return;
            case R.id.buy_button /* 2131755677 */:
                if (this.subscription != null) {
                    this.helper.purchase(this, this.subscription, this);
                    return;
                }
                return;
        }
    }
}
