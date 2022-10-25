package com.vkontakte.android.fragments.gifts;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.style.StyleSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.core.util.KeyboardUtils;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.WikiLinkParser;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.gifts.GiftsSend;
import com.vkontakte.android.api.models.CatalogedGift;
import com.vkontakte.android.api.store.StoreGetFriendsList;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.VotesFragment;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.fragments.friends.FriendsFragment;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.recyclerview.BottomDividerDecoration;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class GiftSendFragment extends GridFragment<Object> {
    public static final String ACTION_GIFT_SENT = "com.vkontakte.android.ACTION_GIFT_SENT";
    private static final String ExtraBalance = "balance";
    private static final String ExtraGift = "gift";
    private static final String ExtraUsers = "toUsers";
    private static final int REQUEST_ADD_RECIPIENT = 42;
    boolean mActive;
    boolean mAddVisibility;
    int mBalance;
    boolean mCanSend;
    final BottomDividerDecoration mDecoration;
    CatalogedGift mGift;
    CharSequence mMessage;
    boolean mPaymentRequired;
    boolean mPrivacyEnabled;
    final BroadcastReceiver mReceiver;
    final List<UserProfile> mRecipients;
    boolean mSendEnabled;
    CharSequence mSendText;
    boolean mSubTitleVisible;
    CharSequence mSubtitleText;
    CharSequence mTitleText;
    int mTotalPrice;

    public static void start(Activity activity, @Nullable UserProfile to, CatalogedGift gift, int balance) {
        ArrayList<UserProfile> toUsers = new ArrayList<>();
        if (to != null) {
            toUsers.add(to);
        }
        start(activity, toUsers, gift, balance);
    }

    public static void start(Activity activity, @Nullable ArrayList<UserProfile> toUsers, CatalogedGift gift, int balance) {
        Bundle args = new Bundle();
        args.putParcelableArrayList(ExtraUsers, toUsers);
        args.putParcelable(ExtraGift, gift);
        args.putInt(ExtraBalance, balance);
        if (activity instanceof TabletDialogActivity) {
            ((TabletDialogActivity) activity).start(GiftSendFragment.class, args);
        } else {
            new Navigator(GiftSendFragment.class, new TabletDialogActivity.Builder().windowBackgroundResource(R.color.gifts_dialog_bg), args).go(activity);
        }
    }

    public GiftSendFragment() {
        super(Integer.MAX_VALUE);
        this.mRecipients = new ArrayList(1);
        this.mDecoration = new BottomDividerDecoration((BottomDividerDecoration.Provider) mo1066getAdapter(), Math.max(1, V.dp(0.5f)), 637534208, 0);
        this.mSubTitleVisible = true;
        this.mMessage = "";
        this.mReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.gifts.GiftSendFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                GiftSendFragment.this.mBalance = intent.getIntExtra(GiftSendFragment.ExtraBalance, GiftSendFragment.this.mBalance);
                GiftSendFragment.this.mPaymentRequired = intent.getBooleanExtra("payment_required", false);
                if (GiftSendFragment.this.mPaymentRequired && GiftSendFragment.this.mActive) {
                    GiftSendFragment.this.mPaymentRequired = false;
                    GiftSendFragment.this.sendGift();
                }
                GiftSendFragment.this.invalidateBalance();
                if (GiftSendFragment.this.mo1066getAdapter() != null) {
                    GiftSendFragment.this.mo1066getAdapter().notifyDataSetChanged();
                }
            }
        };
        setLayout(R.layout.window_content_layout);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRefreshEnabled(false);
        this.mGift = (CatalogedGift) getArguments().getParcelable(ExtraGift);
        this.mBalance = getArguments().getInt(ExtraBalance);
        ArrayList<UserProfile> toUsers = getArguments().getParcelableArrayList(ExtraUsers);
        if (toUsers != null) {
            Iterator<UserProfile> it = toUsers.iterator();
            while (it.hasNext()) {
                UserProfile user = it.next();
                if (!VKAccountManager.isCurrentUser(user.uid)) {
                    this.mRecipients.add(user);
                }
            }
        }
        getActivity().registerReceiver(this.mReceiver, new IntentFilter(VotesFragment.ACTION_BALANCE_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(R.string.send_gift);
        getToolbar().setNavigationIcon(R.drawable.ic_ab_back);
        getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
        updateList();
        dataLoaded();
        updateFinishOnTouchOutside();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        if (this.list.mo1204getAdapter() != null) {
            invalidate();
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onStart() {
        super.onStart();
        this.mActive = true;
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        if (this.mPaymentRequired) {
            this.mPaymentRequired = false;
            sendGift();
        }
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected CardItemDecoration onCreateCardDecorator() {
        int padding;
        CardItemDecoration decorator = new CardItemDecoration(mo1066getAdapter(), !this.isTablet);
        if (this.scrW >= 600) {
            padding = V.dp(16.0f);
        } else if (this.scrW >= 480) {
            padding = V.dp(8.0f);
        } else {
            padding = 0;
        }
        int margin = this.scrW >= 924 ? V.dp(Math.min(16, ((this.scrW - 840) - 84) / 2)) : 0;
        this.list.setPadding(margin + padding, 0, margin + padding, 0);
        decorator.setPadding(padding, V.dp(8.0f), padding, V.dp(8.0f));
        int dividerPadding = margin + padding + V.dp(16.0f);
        this.list.removeItemDecoration(this.mDecoration);
        this.list.addItemDecoration(this.mDecoration.setPadding(dividerPadding, dividerPadding));
        return decorator.setCardsSpacing(V.dp(24.0f)).setBackgroundColor(0);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected View onCreateFooterView(LayoutInflater inflater) {
        return null;
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<Object>.GridAdapter<?> createAdapter() {
        return new Adapter();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        return 1;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onStop() {
        super.onStop();
        this.mActive = false;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        getActivity().setFinishOnTouchOutside(true);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        getActivity().unregisterReceiver(this.mReceiver);
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 42 && resultCode == -1 && data != null) {
            addRecipient((UserProfile) data.getParcelableExtra(ProfileGiftsFragment.Extra.User));
        }
    }

    void invalidate() {
        invalidatePrice();
        invalidateBalance();
        mo1066getAdapter().notifyDataSetChanged();
    }

    void invalidatePrice() {
        int price;
        String cost;
        boolean canAddMore;
        if (this.mGift.gifts_left == null) {
            price = this.mGift.price;
            cost = this.mGift.price_str;
            canAddMore = true;
            this.mCanSend = true;
        } else if (this.mGift.price > 0) {
            price = this.mGift.price;
            cost = this.mGift.price_str;
            this.mCanSend = this.mGift.gifts_left.intValue() - this.mRecipients.size() >= 0;
            canAddMore = Math.max(this.mGift.gifts_left.intValue() - this.mRecipients.size(), 0) > 0;
        } else if (this.mGift.real_price <= 0) {
            price = 0;
            cost = getString(R.string.price_free);
            this.mCanSend = this.mGift.gifts_left.intValue() - this.mRecipients.size() >= 0;
            canAddMore = Math.max(this.mGift.gifts_left.intValue() - this.mRecipients.size(), 0) > 0;
        } else if (this.mGift.gifts_left.intValue() <= 0) {
            price = this.mGift.real_price;
            cost = this.mGift.real_price_str;
            canAddMore = true;
            this.mCanSend = true;
        } else {
            price = 0;
            cost = getString(R.string.price_free);
            canAddMore = Math.max(this.mGift.gifts_left.intValue() - this.mRecipients.size(), 0) > 0;
            this.mCanSend = this.mGift.gifts_left.intValue() - this.mRecipients.size() >= 0;
        }
        this.mTotalPrice = Math.max(this.mRecipients.size(), 1) * price;
        this.mTitleText = cost;
        this.mAddVisibility = canAddMore || this.mRecipients.isEmpty();
        if (this.mRecipients.isEmpty()) {
            this.mSendText = getString(R.string.send);
            this.mSendEnabled = false;
        } else if (this.mRecipients.size() == 1) {
            this.mSendText = getString(R.string.send_gift);
            this.mSendEnabled = true;
        } else {
            SpannableStringBuilder sb = new SpannableStringBuilder();
            sb.append((CharSequence) getString(R.string.send));
            sb.append(' ');
            String bold = getResources().getQuantityString(R.plurals.gifts, this.mRecipients.size(), Integer.valueOf(this.mRecipients.size()));
            sb.append((CharSequence) bold);
            sb.setSpan(new StyleSpan(1), sb.length() - bold.length(), sb.length(), 0);
            this.mSendText = sb;
            this.mSendEnabled = true;
        }
    }

    void invalidateBalance() {
        if (this.mGift.gifts_left != null && this.mGift.gifts_left.intValue() > 0) {
            this.mSubTitleVisible = true;
            this.mSubtitleText = getResources().getQuantityString(R.plurals.gifts_remains, this.mGift.gifts_left.intValue(), this.mGift.gifts_left);
        } else if (this.mBalance > 0) {
            this.mSubTitleVisible = true;
            this.mSubtitleText = getString(R.string.accout_votes_left, new Object[]{getResources().getQuantityString(R.plurals.balance_votes, this.mBalance, Integer.valueOf(this.mBalance))});
        } else {
            this.mSubTitleVisible = false;
        }
    }

    void addRecipient() {
        Bundle args = new Bundle();
        args.putBoolean(ArgKeys.SELECT, true);
        args.putString("title", getString(R.string.gifts_add_recipient));
        args.putBoolean(ArgKeys.GLOBAL_SEARCH, false);
        args.putInt(ArgKeys.UID, VKAccountManager.getCurrent().getUid());
        args.putBoolean(ArgKeys.DISABLE_SPINNER, true);
        if (this.mGift.gift.stickers_product_id != null) {
            args.putInt("product_id", this.mGift.gift.stickers_product_id.intValue());
        }
        new Navigator(this.mGift.gift.stickers_product_id != null ? PickerFragment.class : FriendsFragment.class, args).forResult(this, 42);
    }

    void addRecipient(UserProfile profile) {
        if (!this.mRecipients.contains(profile)) {
            this.mRecipients.add(profile);
            invalidatePrice();
            mo1066getAdapter().notifyDataSetChanged();
            updateFinishOnTouchOutside();
        }
    }

    void deleteRecipient(UserProfile profile) {
        this.mRecipients.remove(profile);
        invalidatePrice();
        mo1066getAdapter().notifyDataSetChanged();
        updateFinishOnTouchOutside();
    }

    void sendGift() {
        if (this.mRecipients.isEmpty()) {
            Toast.makeText(getActivity(), (int) R.string.gifts_error_no_recipients, 0).show();
        } else if (this.mCanSend) {
            int guid = this.mGift.hashCode() ^ this.mMessage.hashCode();
            for (UserProfile profile : this.mRecipients) {
                guid ^= profile.hashCode();
            }
            new GiftsSend(getActivity(), guid, this.mRecipients, this.mGift, this.mMessage, this.mPrivacyEnabled).setCallback(new Callback<GiftsSend.Result>() { // from class: com.vkontakte.android.fragments.gifts.GiftSendFragment.2
                @Override // com.vkontakte.android.api.Callback
                public void success(GiftsSend.Result result) {
                    if (GiftSendFragment.this.getActivity() != null) {
                        Toast.makeText(GiftSendFragment.this.getActivity(), GiftSendFragment.this.mRecipients.size() > 1 ? R.string.gifts_send_success : R.string.gift_send_success, 0).show();
                        GiftSendFragment.this.notifyBalanceHasChanged(GiftSendFragment.this.mBalance - result.withdrawn_votes);
                        GiftSendFragment.this.notifyGiftHasSent(GiftSendFragment.this.mGift, result.user_ids);
                        GiftSendFragment.this.getActivity().finish();
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    if (error.getCodeValue() == 504) {
                        Bundle args = new Bundle();
                        args.putInt(VotesFragment.Extra.RequiredBalance, GiftSendFragment.this.mTotalPrice);
                        Navigate.to(VotesFragment.class, args, GiftSendFragment.this.getActivity());
                        return;
                    }
                    APIUtils.showErrorToast(GiftSendFragment.this.getActivity(), error.getCode(), error.message);
                }
            }).wrapProgress(getActivity()).exec((Context) getActivity());
        }
    }

    void notifyBalanceHasChanged(int newBalance) {
        Intent intent = new Intent(VotesFragment.ACTION_BALANCE_CHANGED);
        intent.putExtra(ExtraBalance, newBalance);
        getActivity().sendBroadcast(intent);
    }

    void updateFinishOnTouchOutside() {
        getActivity().setFinishOnTouchOutside(TextUtils.isEmpty(this.mMessage) && this.mRecipients.isEmpty());
    }

    void notifyGiftHasSent(CatalogedGift gift, int[] user_ids) {
        Intent intent = new Intent(ACTION_GIFT_SENT);
        intent.putExtra(ExtraGift, gift);
        intent.putExtra(ServerKeys.USER_IDS, user_ids);
        getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    /* loaded from: classes2.dex */
    public static class PickerFragment extends FriendsFragment {
        @Override // com.vkontakte.android.fragments.friends.FriendsFragment, me.grishka.appkit.fragments.LoaderFragment
        protected void doLoadData() {
            this.currentRequest = new StoreGetFriendsList(getArguments().getInt("product_id")).setCallback(new SimpleCallback<VKList<UserProfile>>(this) { // from class: com.vkontakte.android.fragments.gifts.GiftSendFragment.PickerFragment.1
                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<UserProfile> result) {
                    PickerFragment.this.setData(result);
                }
            }).exec((Context) getActivity());
        }
    }

    /* loaded from: classes2.dex */
    final class Adapter extends GridFragment<Object>.GridAdapter<RecyclerHolder<?>> implements BottomDividerDecoration.Provider {
        static final int TYPE_ADD = 3;
        static final int TYPE_GIFT = 0;
        static final int TYPE_HEADER = 1;
        static final int TYPE_MESSAGE = 4;
        static final int TYPE_PRIVACY = 5;
        static final int TYPE_SEND = 6;
        static final int TYPE_USER = 2;

        Adapter() {
            super();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder<?> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new GiftHolder(parent);
                case 1:
                    return new HeaderHolder(parent);
                case 2:
                    return new UserHolder(parent);
                case 3:
                    return new AddHolder(parent);
                case 4:
                    return new MessageHolder(parent);
                case 5:
                    return new PrivacyHolder(parent);
                case 6:
                    return new SendHolder(parent);
                default:
                    return null;
            }
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder<?> holder, int position) {
            switch (getItemViewType(position)) {
                case 0:
                    ((GiftHolder) holder).bind(GiftSendFragment.this.mGift);
                    return;
                case 1:
                    holder.bind(null);
                    return;
                case 2:
                    ((UserHolder) holder).bind(GiftSendFragment.this.mRecipients.get(position - 2));
                    return;
                case 3:
                    holder.bind(null);
                    return;
                case 4:
                    holder.bind(null);
                    return;
                case 5:
                    holder.bind(null);
                    return;
                case 6:
                    holder.bind(null);
                    return;
                default:
                    return;
            }
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            int i = 5;
            if (GiftSendFragment.this.mRecipients.isEmpty()) {
                return 5;
            }
            if (GiftSendFragment.this.mAddVisibility) {
                i = 6;
            }
            return i + GiftSendFragment.this.mRecipients.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            if (!GiftSendFragment.this.mRecipients.isEmpty()) {
                switch (position) {
                    case 0:
                        return 0;
                    case 1:
                        return 1;
                    default:
                        switch (getItemCount() - position) {
                            case 1:
                                return 6;
                            case 2:
                                return 5;
                            case 3:
                                return 4;
                            case 4:
                                return !GiftSendFragment.this.mAddVisibility ? 2 : 3;
                            default:
                                return 2;
                        }
                }
            }
            switch (position) {
                case 0:
                    return 0;
                case 1:
                    return 3;
                case 2:
                    return 4;
                case 3:
                    return 5;
                case 4:
                    return 6;
                default:
                    return 2;
            }
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, com.vkontakte.android.ui.recyclerview.CardItemDecoration.Provider
        public int getBlockType(int position) {
            switch (getItemViewType(position)) {
                case 1:
                case 4:
                    return 26;
                case 2:
                    return ((GiftSendFragment.this.mAddVisibility || position + (-2) != GiftSendFragment.this.mRecipients.size() + (-1)) ? 1 : 4) | 24;
                case 3:
                case 5:
                    return 28;
                default:
                    return 0;
            }
        }

        @Override // com.vkontakte.android.ui.recyclerview.BottomDividerDecoration.Provider
        public boolean drawAfter(int position) {
            return getItemViewType(position) == 4;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onViewDetachedFromWindow(RecyclerHolder<?> holder) {
            if ((holder instanceof MessageHolder) && GiftSendFragment.this.getActivity() != null) {
                KeyboardUtils.hideKeyboard(GiftSendFragment.this.getActivity());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class GiftHolder extends RecyclerHolder<CatalogedGift> {
        private TextView mDescription;
        private final VKImageView mPhoto;
        private TextView mSubTitle;
        private TextView mTitle;

        public GiftHolder(ViewGroup parent) {
            super((int) R.layout.gift_send_gift, parent);
            this.mTitle = (TextView) $(R.id.title);
            this.mSubTitle = (TextView) $(R.id.subtitle);
            this.mDescription = (TextView) $(R.id.description);
            this.mPhoto = (VKImageView) $(R.id.photo);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(CatalogedGift item) {
            int i = 0;
            this.mDescription.setVisibility(!TextUtils.isEmpty(item.description) ? 0 : 8);
            this.mDescription.setText(WikiLinkParser.parse(item.description));
            this.mTitle.setText(GiftSendFragment.this.mTitleText);
            this.mSubTitle.setText(GiftSendFragment.this.mSubtitleText);
            TextView textView = this.mSubTitle;
            if (!GiftSendFragment.this.mSubTitleVisible) {
                i = 8;
            }
            textView.setVisibility(i);
            this.mPhoto.load(item.gift.thumb_256);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class HeaderHolder extends RecyclerHolder<Void> {
        public HeaderHolder(ViewGroup parent) {
            super(new TextView(parent.getContext()));
            TextView tv = (TextView) this.itemView;
            tv.setTextColor(-9801867);
            tv.setTypeface(Font.Medium.typeface);
            int padding = V.dp(16.0f);
            tv.setPadding(padding, V.dp(5.0f), padding, padding);
            tv.setText(R.string.send_gift_recipient);
            tv.setTextSize(1, 14.0f);
            tv.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Void item) {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class UserHolder extends com.vkontakte.android.ui.holder.UserHolder<UserProfile> {
        protected UserHolder(ViewGroup parent) {
            super(parent, R.layout.user_item_gifts, false, false, true);
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder, android.view.View.OnClickListener
        public void onClick(View view) {
            if (view == this.mActionButton) {
                GiftSendFragment.this.deleteRecipient((UserProfile) getItem());
            } else {
                super.onClick(view);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class AddHolder extends RecyclerHolder<Void> implements UsableRecyclerView.Clickable {
        public AddHolder(ViewGroup parent) {
            super((int) R.layout.gift_send_add, parent);
            ((TextView) this.itemView).setCompoundDrawablesWithIntrinsicBounds(new RecoloredDrawable(getDrawable(R.drawable.ic_add), -11435592), (Drawable) null, (Drawable) null, (Drawable) null);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Void item) {
            this.itemView.setVisibility(GiftSendFragment.this.mAddVisibility ? 0 : 8);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            GiftSendFragment.this.addRecipient();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class MessageHolder extends RecyclerHolder<Void> implements TextWatcher {
        public MessageHolder(ViewGroup parent) {
            super((int) R.layout.gift_send_message, parent);
            ((TextView) this.itemView).addTextChangedListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Void item) {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
            GiftSendFragment.this.mMessage = s;
            GiftSendFragment.this.updateFinishOnTouchOutside();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class PrivacyHolder extends RecyclerHolder<Void> implements CompoundButton.OnCheckedChangeListener {
        public PrivacyHolder(ViewGroup parent) {
            super((int) R.layout.gift_send_checkbox, parent);
            ((Switch) this.itemView).setOnCheckedChangeListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Void item) {
        }

        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            GiftSendFragment.this.mPrivacyEnabled = !isChecked;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class SendHolder extends RecyclerHolder<Void> implements View.OnClickListener {
        public SendHolder(ViewGroup parent) {
            super((int) R.layout.gift_send_button, parent);
            this.itemView.setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Void item) {
            this.itemView.setEnabled(GiftSendFragment.this.mSendEnabled);
            ((TextView) this.itemView).setText(GiftSendFragment.this.mSendText);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            GiftSendFragment.this.sendGift();
        }
    }
}
