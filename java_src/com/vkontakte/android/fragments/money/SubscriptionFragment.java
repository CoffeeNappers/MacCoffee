package com.vkontakte.android.fragments.money;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.LinkSpan;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.store.GetSubscription;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.Subscription;
import com.vkontakte.android.fragments.CardRecyclerFragment;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.functions.Functions;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.RecyclerSectionAdapter;
import com.vkontakte.android.ui.holder.commons.BackgroundHolder;
import com.vkontakte.android.ui.holder.money.SubscriptionHeaderHolder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class SubscriptionFragment extends CardRecyclerFragment<RecyclerSectionAdapter.Data> implements PurchasesManager.OnSuccessListener<Subscription> {
    private Adapter adapter;
    private GetSubscription currentRequest;
    private final BuyMusicSubscriptionHelper<Subscription> helper;

    /* loaded from: classes3.dex */
    public static class Builder extends Navigator {
        public Builder(Subscription subscription) {
            super(SubscriptionFragment.class);
            this.args.putParcelable("subscription", subscription);
        }

        public Builder(int id) {
            super(SubscriptionFragment.class);
            this.args.putInt("subscription_id", id);
        }
    }

    public SubscriptionFragment() {
        super(20);
        this.adapter = null;
        this.currentRequest = null;
        this.helper = new BuyMusicSubscriptionHelper<>();
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.subscription);
        setHasOptionsMenu(true);
        this.helper.onAttach(act);
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onDetach() {
        this.helper.onDetach(getActivity());
        super.onDetach();
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        loadData();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        Subscription subscription = (Subscription) getArguments().getParcelable("subscription");
        if (subscription != null) {
            onSubscriptionLoaded(subscription);
            return;
        }
        int subscriptionId = getArguments().getInt("subscription_id");
        this.currentRequest = new GetSubscription(subscriptionId);
        this.currentRequest.setCallback(new AnonymousClass1());
        this.currentRequest.exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.money.SubscriptionFragment$1  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass1 implements Callback<Subscription> {
        AnonymousClass1() {
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(Subscription result) {
            F1 f1;
            if (result.purchased || !PurchasesManager.canUseInApps()) {
                SubscriptionFragment.this.onSubscriptionLoaded(result);
            } else {
                SubscriptionFragment.this.helper.restore(SubscriptionFragment.this, result, SubscriptionFragment.this);
                List singletonList = Collections.singletonList(result);
                f1 = SubscriptionFragment$1$$Lambda$1.instance;
                Map<String, Subscription> map = Functions.map(singletonList, f1);
                PurchasesManager.getGooglePlayPricesSubs(map, SubscriptionFragment$1$$Lambda$2.lambdaFactory$(this));
            }
            SubscriptionFragment.this.currentRequest = null;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ Void lambda$success$1(Subscription subscription1, String s) {
            subscription1.priceStr = s;
            ViewUtils.post(SubscriptionFragment$1$$Lambda$3.lambdaFactory$(this, subscription1));
            return null;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$null$0(Subscription subscription1) {
            SubscriptionFragment.this.onSubscriptionLoaded(subscription1);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse error) {
            SubscriptionFragment.this.onError(error);
            SubscriptionFragment.this.currentRequest = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onSubscriptionLoaded(Subscription subscription) {
        ArrayList arrayList = new ArrayList();
        if (this.isTablet) {
            arrayList.add(RecyclerSectionAdapter.Data.top(0, subscription));
        } else {
            arrayList.add(RecyclerSectionAdapter.Data.middle(0, subscription));
        }
        arrayList.add(RecyclerSectionAdapter.Data.bottom(1, Integer.valueOf((int) R.drawable.apps_top_padding_white_8)));
        arrayList.add(RecyclerSectionAdapter.Data.topBottom(3, subscription));
        arrayList.add(RecyclerSectionAdapter.Data.none(2, subscription));
        mo1066getAdapter().setData(arrayList);
        onDataLoaded(arrayList, false);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        GetSubscription req = this.currentRequest;
        if (req != null) {
            req.cancel();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter  reason: collision with other method in class */
    public Adapter mo1066getAdapter() {
        if (this.adapter == null) {
            this.adapter = new Adapter(this, null);
        }
        return this.adapter;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.OnSuccessListener
    public void onSuccess(Subscription subscription) {
        subscription.purchased = true;
        Activity activity = getActivity();
        if (activity != null) {
            MusicSubscriptionsWasBoughtFragment.show(activity);
            updateList();
            refresh();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class Adapter extends RecyclerSectionAdapter {
        static final int TYPE_BG = 1;
        static final int TYPE_BOTTOM_TEXT = 2;
        static final int TYPE_CONTROL_SUBS = 3;
        static final int TYPE_HEADER = 0;

        private Adapter() {
        }

        /* synthetic */ Adapter(SubscriptionFragment x0, AnonymousClass1 x1) {
            this();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new SubscriptionHeaderHolder(parent.getContext());
                case 1:
                    return new BackgroundHolder(parent);
                case 2:
                    return new DescriptionHolder(parent);
                case 3:
                    return new ControlSubscriptionHolder(parent.getContext());
                default:
                    return null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class DescriptionHolder extends RecyclerHolder<Subscription> {
        final TextView textView;

        DescriptionHolder(ViewGroup parent) {
            super((int) R.layout.subscription_listence_holder, parent);
            this.textView = (TextView) $(16908308);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Subscription o) {
            SpannableStringBuilder result = new SpannableStringBuilder(VKApplication.context.getString(R.string.subscription_bottom_text));
            result.setSpan(new LinkSpan(o.terms_url), 0, result.length(), 0);
            this.textView.setText(result);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class ControlSubscriptionHolder extends RecyclerHolder<Subscription> implements UsableRecyclerView.Clickable {
        final TextView textView;

        ControlSubscriptionHolder(Context ctx) {
            super((int) R.layout.subscription_control_holder, ctx);
            this.textView = (TextView) $(16908308);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Subscription o) {
            this.textView.setText(!o.purchased ? R.string.music_subs_try_free : R.string.control_subscription);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            if (getItem().purchased) {
                Intent intent = new Intent(getContext(), LinkRedirActivity.class);
                intent.setData(Uri.parse(getItem().management_url));
                getContext().startActivity(intent);
            } else if (PurchasesManager.canUseInApps()) {
                SubscriptionFragment.this.helper.purchase(SubscriptionFragment.this, getItem(), SubscriptionFragment.this);
            } else {
                Intent intent2 = new Intent(getContext(), LinkRedirActivity.class);
                intent2.setData(Uri.parse(getItem().no_inapp_url));
                getContext().startActivity(intent2);
            }
        }
    }
}
