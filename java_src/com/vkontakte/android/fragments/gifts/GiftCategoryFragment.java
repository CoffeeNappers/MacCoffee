package com.vkontakte.android.fragments.gifts;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.models.CatalogedGift;
import com.vkontakte.android.api.models.GiftCategory;
import com.vkontakte.android.background.AsyncTask;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import com.vkontakte.android.ui.recyclerview.FitGridItemDecoration;
import java.util.ArrayList;
import java.util.Arrays;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class GiftCategoryFragment extends GridFragment<CatalogedGift> {
    private static final String ExtraBalance = "balance";
    private static final String ExtraData = "data";
    private static final String ExtraUsers = "uids";
    private int mBalance;
    private GiftCategory mData;
    private final FitGridItemDecoration mDecoration;
    private final Rect mGiftCardPadding;
    private final VoidF1<CatalogedGift> mGiftSender;
    private final BroadcastReceiver mGiftsReceiver;
    private int mItemMinSize;
    private int mItemWidth;
    private int mListPadding;
    @Nullable
    private UserProfile mTo;
    private ArrayList<UserProfile> mUsersTo;

    public GiftCategoryFragment() {
        super(Integer.MAX_VALUE);
        this.mGiftSender = GiftCategoryFragment$$Lambda$1.lambdaFactory$(this);
        this.mDecoration = new FitGridItemDecoration();
        this.mGiftCardPadding = new Rect();
        this.mGiftsReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.gifts.GiftCategoryFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                CatalogedGift catalogedGift;
                CatalogedGift gift = (CatalogedGift) intent.getParcelableExtra("gift");
                int[] user_ids = intent.getIntArrayExtra(ServerKeys.USER_IDS);
                if (GiftCategoryFragment.this.mData.cache != null && (catalogedGift = GiftCategoryFragment.this.mData.cache.get(gift.gift.id)) != null) {
                    boolean notifyAdapter = false;
                    if (catalogedGift.gift.stickers_product_id != null && Arrays.binarySearch(user_ids, GiftCategoryFragment.this.mTo.uid) != -1) {
                        catalogedGift.disabled = true;
                        notifyAdapter = true;
                    }
                    if (catalogedGift.gifts_left != null) {
                        catalogedGift.gifts_left = Integer.valueOf(catalogedGift.gifts_left.intValue() - user_ids.length);
                        if (catalogedGift.isLimitExpired()) {
                            GiftCategoryFragment.this.mData.items.remove(catalogedGift);
                        }
                        notifyAdapter = true;
                    }
                    if (notifyAdapter && GiftCategoryFragment.this.mo1066getAdapter() != null) {
                        GiftCategoryFragment.this.mo1066getAdapter().notifyDataSetChanged();
                    }
                }
            }
        };
        setLayout(R.layout.window_content_layout);
    }

    public static void start(Activity activity, @Nullable UserProfile to, GiftCategory category, int balance) {
        ArrayList<UserProfile> users = new ArrayList<>();
        if (to != null) {
            users.add(to);
        }
        start(activity, users, category, balance);
    }

    public static void start(Activity activity, ArrayList<UserProfile> toUsers, GiftCategory category, int balance) {
        Bundle args = new Bundle();
        args.putParcelableArrayList(ExtraUsers, toUsers);
        args.putParcelable("data", category);
        args.putInt(ExtraBalance, balance);
        if (activity instanceof TabletDialogActivity) {
            ((TabletDialogActivity) activity).start(GiftCategoryFragment.class, args);
        } else {
            new Navigator(GiftCategoryFragment.class, new TabletDialogActivity.Builder().windowBackgroundResource(R.color.gifts_dialog_bg), args).go(activity);
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Drawable drawable = getResources().getDrawable(R.drawable.bg_gift_card);
        if (drawable != null) {
            drawable.getPadding(this.mGiftCardPadding);
        }
        this.mListPadding = getResources().getDimensionPixelSize(R.dimen.gifts_category_padding) - this.mGiftCardPadding.left;
        this.mItemMinSize = getResources().getDimensionPixelSize(R.dimen.gift_category_min_size);
        this.mBalance = getArguments().getInt(ExtraBalance);
        this.mUsersTo = getArguments().getParcelableArrayList(ExtraUsers);
        if (this.mUsersTo.size() == 1) {
            this.mTo = this.mUsersTo.get(0);
        }
        setRefreshEnabled(false);
        getActivity().registerReceiver(this.mGiftsReceiver, new IntentFilter(GiftSendFragment.ACTION_GIFT_SENT), "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected CardItemDecoration onCreateCardDecorator() {
        this.list.removeItemDecoration(this.mDecoration);
        this.list.addItemDecoration(this.mDecoration);
        return null;
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.list.setPadding(this.mListPadding, this.mListPadding, this.mListPadding, this.mListPadding);
        getToolbar().setNavigationIcon(R.drawable.ic_ab_back);
        getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (!this.loaded) {
            loadData();
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        new AsyncTask<Void, Void, GiftCategory>() { // from class: com.vkontakte.android.fragments.gifts.GiftCategoryFragment.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.vkontakte.android.background.AsyncTask
            public GiftCategory doInBackground(Void... args) throws Throwable {
                return (GiftCategory) GiftCategoryFragment.this.getArguments().getParcelable("data");
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.vkontakte.android.background.AsyncTask
            public void onPostExecute(GiftCategory category) {
                GiftCategoryFragment.this.mData = category;
                GiftCategoryFragment.this.setTitle(category.title);
                GiftCategoryFragment.this.onDataLoaded(category.items);
            }
        }.execPool(new Void[0]);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<CatalogedGift>.GridAdapter<?> createAdapter() {
        return new GridFragment<CatalogedGift>.GridAdapter<GiftHolder>() { // from class: com.vkontakte.android.fragments.gifts.GiftCategoryFragment.3
            @Override // android.support.v7.widget.RecyclerView.Adapter
            /* renamed from: onCreateViewHolder  reason: collision with other method in class */
            public GiftHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
                return new GiftHolder(parent).onClick(GiftCategoryFragment.this.mGiftSender).setSize(GiftCategoryFragment.this.mItemWidth);
            }

            @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter
            public void onBindViewHolder(GiftHolder holder, int position) {
                super.onBindViewHolder((AnonymousClass3) holder.setSize(GiftCategoryFragment.this.mItemWidth), position);
            }

            @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
            public int getImageCountForItem(int position) {
                return 1;
            }

            @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
            public String getImageURL(int position, int image) {
                return ((CatalogedGift) GiftCategoryFragment.this.data.get(position)).gift.getImage(GiftCategoryFragment.this.mItemMinSize);
            }
        };
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        int screenHeight = this.list.getHeight() - this.mListPadding;
        int heightExtra = this.mGiftCardPadding.top + V.dp(40.0f);
        int giftMinHeight = this.mItemMinSize + heightExtra;
        float initialCount = screenHeight / giftMinHeight;
        float remains = initialCount - ((int) initialCount);
        this.mItemWidth = this.mItemMinSize;
        if (remains <= 0.25f || remains > 0.6f) {
            this.mItemWidth = (int) ((screenHeight / (((int) (initialCount - 0.5f)) + 0.6f)) - heightExtra);
        }
        int listWidth = (this.list.getWidth() - this.mListPadding) - this.mListPadding;
        int giftMinWidth = this.mItemWidth + this.mGiftCardPadding.left + this.mGiftCardPadding.right;
        int numColumns = listWidth / giftMinWidth;
        int space = (listWidth - (giftMinWidth * numColumns)) / (numColumns - 1);
        this.mDecoration.set(numColumns, space);
        mo1066getAdapter().notifyDataSetChanged();
        return numColumns;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        getActivity().unregisterReceiver(this.mGiftsReceiver);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendGift(CatalogedGift gift) {
        if (!gift.disabled) {
            GiftSendFragment.start((TabletDialogActivity) getActivity(), this.mUsersTo, gift, this.mBalance);
        } else {
            Toast.makeText(getActivity(), gift.gift.stickers_product_id == null ? R.string.gift_disabled_error : R.string.gift_sticker_disabled_error, 0).show();
        }
    }
}
