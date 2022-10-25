package com.vkontakte.android.fragments.gifts;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.SpannableStringBuilder;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.attachpicker.AttachActivity;
import com.vk.attachpicker.SupportExternalToolbarContainer;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.gifts.GiftsGetCatalog;
import com.vkontakte.android.api.models.CatalogedGift;
import com.vkontakte.android.api.models.GiftCategory;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.recyclerview.BottomDividerDecoration;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import com.vkontakte.android.ui.recyclerview.SpaceItemDecoration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class GiftsCatalogFragment extends GridFragment<GiftCategory> implements SupportExternalToolbarContainer {
    public static final String ExtraUsers = "users";
    private TextView mBalance;
    private final BottomDividerDecoration mDecoration;
    private final Rect mGiftCardPadding;
    private int mGiftMinSize;
    private final VoidF1<CatalogedGift> mGiftSender;
    private final BroadcastReceiver mGiftsReceiver;
    private int mGiftsWidth;
    private int mListHeight;
    private int mListPadding;
    @Nullable
    private UserProfile mTo;
    private ArrayList<UserProfile> mUsersTo;
    private int mVotes;
    private static final int GIFTS_SPACING = V.dp(8.0f);
    private static final SpaceItemDecoration GIFTS_DECORATION = new SpaceItemDecoration(0, 0, GIFTS_SPACING, 0);

    private boolean isInContextOfAttachActivity() {
        return getActivity() instanceof AttachActivity;
    }

    public GiftsCatalogFragment() {
        super(30);
        this.mGiftSender = GiftsCatalogFragment$$Lambda$1.lambdaFactory$(this);
        this.mGiftCardPadding = new Rect();
        this.mDecoration = new BottomDividerDecoration((BottomDividerDecoration.Provider) mo1066getAdapter(), Math.max(V.dp(0.5f), 1), -2631463, V.dp(8.0f));
        this.mGiftsReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.gifts.GiftsCatalogFragment.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                CatalogedGift catalogedGift;
                CatalogedGift gift = (CatalogedGift) intent.getParcelableExtra("gift");
                int[] user_ids = intent.getIntArrayExtra(ServerKeys.USER_IDS);
                if (GiftsCatalogFragment.this.data != null) {
                    Iterator it = GiftsCatalogFragment.this.data.iterator();
                    while (it.hasNext()) {
                        GiftCategory category = (GiftCategory) it.next();
                        if (category.cache != null && (catalogedGift = category.cache.get(gift.gift.id)) != null) {
                            boolean notifyAdapter = false;
                            if (GiftsCatalogFragment.this.mTo != null && catalogedGift.isStickerPack() && Arrays.binarySearch(user_ids, GiftsCatalogFragment.this.mTo.uid) != -1) {
                                catalogedGift.disabled = true;
                                notifyAdapter = true;
                            }
                            if (catalogedGift.gifts_left != null) {
                                catalogedGift.gifts_left = Integer.valueOf(catalogedGift.gifts_left.intValue() - user_ids.length);
                                if (catalogedGift.isLimitExpired()) {
                                    category.items.remove(catalogedGift);
                                }
                                notifyAdapter = true;
                            }
                            if (notifyAdapter && category.getTag() != null) {
                                ((RecyclerView.Adapter) category.getTag()).notifyDataSetChanged();
                                return;
                            }
                            return;
                        }
                    }
                }
            }
        };
        setLayout(R.layout.window_content_layout);
        setListLayoutId(R.layout.gifts_catalog_content);
    }

    public static void start(@NonNull Activity activity, @Nullable UserProfile to) {
        ArrayList<UserProfile> users = new ArrayList<>();
        if (to != null) {
            users.add(to);
        }
        Bundle args = new Bundle();
        args.putParcelableArrayList("users", users);
        new Navigator(GiftsCatalogFragment.class, new TabletDialogActivity.Builder().windowBackgroundResource(R.color.gifts_dialog_bg), args).go(activity);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Drawable drawable = getResources().getDrawable(R.drawable.bg_gift_card);
        if (drawable != null) {
            drawable.getPadding(this.mGiftCardPadding);
        }
        this.mListPadding = (getResources().getDimensionPixelSize(R.dimen.gifts_padding) - this.mGiftCardPadding.left) - V.dp(4.0f);
        this.mGiftMinSize = getResources().getDimensionPixelSize(R.dimen.gift_min_size);
        if (isInContextOfAttachActivity()) {
            this.mGiftMinSize = Global.scale(96.0f);
        }
        this.mUsersTo = getArguments().getParcelableArrayList("users");
        if (this.mUsersTo.size() == 1) {
            this.mTo = this.mUsersTo.get(0);
        }
        setRefreshEnabled(false);
        setTitle(R.string.select_gift);
        getActivity().registerReceiver(this.mGiftsReceiver, new IntentFilter(GiftSendFragment.ACTION_GIFT_SENT), "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        getActivity().unregisterReceiver(this.mGiftsReceiver);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.mBalance = (TextView) view.findViewById(R.id.balance);
        getActivity();
        if (isInContextOfAttachActivity()) {
            view.setBackgroundColor(getResources().getColor(R.color.gifts_dialog_bg));
            getToolbar().setVisibility(8);
        }
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (!this.loaded) {
            loadData();
        } else {
            buildTitle();
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void doLoadData(int offset, int count) {
        this.currentRequest = new GiftsGetCatalog(getActivity(), this.mTo != null ? this.mTo.uid : 0).setCallback(new SimpleCallback<GiftsGetCatalog.Result>() { // from class: com.vkontakte.android.fragments.gifts.GiftsCatalogFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(GiftsGetCatalog.Result result) {
                GiftsCatalogFragment.this.mVotes = result.votes;
                GiftsCatalogFragment.this.onDataLoaded(result.catalog);
            }
        }).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    public void onDataLoaded(List<GiftCategory> d) {
        super.onDataLoaded(d);
        buildTitle();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        int screenWidth = this.list.getWidth() - this.mListPadding;
        int giftMinWidth = this.mGiftMinSize + this.mGiftCardPadding.left + this.mGiftCardPadding.right;
        float initialCount = (GIFTS_SPACING + screenWidth) / (giftMinWidth + GIFTS_SPACING);
        float remains = initialCount - ((int) initialCount);
        this.mGiftsWidth = this.mGiftMinSize;
        if (remains <= 0.25f || remains > 0.75f) {
            this.mGiftsWidth = (int) (((GIFTS_SPACING + screenWidth) / (((int) (initialCount - 0.5f)) + 0.75f)) - GIFTS_SPACING);
        }
        this.mListHeight = this.mGiftCardPadding.top + this.mGiftsWidth + V.dp(40.0f);
        mo1066getAdapter().notifyDataSetChanged();
        return 1;
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected CardItemDecoration onCreateCardDecorator() {
        this.list.removeItemDecoration(this.mDecoration);
        this.list.addItemDecoration(this.mDecoration.setPadding(this.isTablet ? this.mListPadding : V.dp(16.0f), 0));
        return null;
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected GridFragment<GiftCategory>.GridAdapter<?> createAdapter() {
        return new Adapter();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean canGoBack() {
        if (isInContextOfAttachActivity()) {
            return false;
        }
        return super.canGoBack();
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        if (isInContextOfAttachActivity()) {
            return false;
        }
        return super.hasNavigationDrawer();
    }

    void showCategory(GiftCategory category) {
        GiftCategoryFragment.start(getActivity(), this.mUsersTo, category, this.mVotes);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendGift(CatalogedGift gift) {
        if (!gift.disabled) {
            GiftSendFragment.start(getActivity(), this.mUsersTo, gift, this.mVotes);
        } else {
            Toast.makeText(getActivity(), gift.gift.stickers_product_id == null ? R.string.gift_disabled_error : R.string.gift_sticker_disabled_error, 0).show();
        }
    }

    void buildTitle() {
        String votes = Integer.toString(this.mVotes);
        SpannableStringBuilder sb = new SpannableStringBuilder(getString(R.string.your_balance));
        sb.append((CharSequence) votes);
        sb.setSpan(new Font.TypefaceSpan(Font.Medium), sb.length() - votes.length(), sb.length(), 0);
        sb.append((CharSequence) getResources().getQuantityString(R.plurals.balance_votes_simple, this.mVotes));
        this.mBalance.setText(sb);
    }

    @Override // com.vk.attachpicker.SupportExternalToolbarContainer
    public ViewGroup provideToolbar(Context context) {
        return getToolbar();
    }

    /* loaded from: classes2.dex */
    private class Adapter extends GridFragment<GiftCategory>.GridAdapter<RecyclerHolder<GiftCategory>> implements BottomDividerDecoration.Provider {
        static final int TYPE_FOOTER = 2;
        static final int TYPE_HEADER = 1;
        static final int TYPE_ITEM = 0;
        private SparseArray<Parcelable> mGridStates;

        private Adapter() {
            super();
            this.mGridStates = new SparseArray<>();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder<GiftCategory> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new ItemHolder(parent);
                case 1:
                    return new HeaderHolder(parent);
                case 2:
                    return new FooterHolder(parent);
                default:
                    return null;
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onViewRecycled(RecyclerHolder<GiftCategory> holder) {
            if (holder.getItemViewType() == 0) {
                this.mGridStates.put(holder.getAdapterPosition(), ((RecyclerView) holder.itemView).getLayoutManager().onSaveInstanceState());
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder<GiftCategory> holder, int position) {
            Parcelable savedState;
            int viewType = getItemViewType(position);
            if (viewType != 2) {
                holder.bind(GiftsCatalogFragment.this.data.get(position >> 1));
            }
            if (viewType == 0 && (savedState = this.mGridStates.get(position)) != null) {
                ((RecyclerView) holder.itemView).getLayoutManager().onRestoreInstanceState(savedState);
            }
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            if (position == getItemCount() - 1) {
                return 2;
            }
            return position % 2 == 0 ? 1 : 0;
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return (GiftsCatalogFragment.this.data.size() << 1) + 1;
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, com.vkontakte.android.ui.recyclerview.CardItemDecoration.Provider
        public int getBlockType(int position) {
            return 0;
        }

        @Override // com.vkontakte.android.ui.recyclerview.BottomDividerDecoration.Provider
        public boolean drawAfter(int position) {
            return getItemViewType(position) == 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class HeaderHolder extends RecyclerHolder<GiftCategory> implements View.OnClickListener {
        private final TextView mAction;
        private final TextView mTitle;

        public HeaderHolder(ViewGroup parent) {
            super((int) R.layout.gifts_section_header, parent);
            this.mTitle = (TextView) $(R.id.title);
            this.mAction = (TextView) $(R.id.action);
            this.mAction.setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(GiftCategory item) {
            this.mTitle.setText(item.title);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            GiftsCatalogFragment.this.showCategory(getItem());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ItemHolder extends RecyclerHolder<GiftCategory> {
        private final RecyclerView.Adapter mAdapter;
        private List<CatalogedGift> mData;
        private int mLastMinHeight;
        int mLastPosition;
        private final UsableRecyclerView mRecycler;

        public ItemHolder(ViewGroup parent) {
            super(new UsableRecyclerView(parent.getContext()));
            this.mLastPosition = -1;
            this.mRecycler = (UsableRecyclerView) this.itemView;
            this.mRecycler.setNestedScrollingEnabled(false);
            this.mRecycler.setClipToPadding(false);
            this.mRecycler.setPadding(GiftsCatalogFragment.this.mListPadding, 0, GiftsCatalogFragment.this.mListPadding, 0);
            this.mRecycler.setLayoutManager(new LinearLayoutManager(getContext(), 0, false));
            UsableRecyclerView usableRecyclerView = this.mRecycler;
            HorizontalListAdapter horizontalListAdapter = new HorizontalListAdapter();
            this.mAdapter = horizontalListAdapter;
            usableRecyclerView.setAdapter(horizontalListAdapter);
            this.mRecycler.removeItemDecoration(GiftsCatalogFragment.GIFTS_DECORATION);
            this.mRecycler.addItemDecoration(GiftsCatalogFragment.GIFTS_DECORATION);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(GiftCategory item) {
            this.mData = item.items;
            item.setTag(this.mAdapter);
            this.mAdapter.notifyDataSetChanged();
            if (this.mLastMinHeight != GiftsCatalogFragment.this.mListHeight) {
                this.mLastMinHeight = GiftsCatalogFragment.this.mListHeight;
                this.mRecycler.setMinimumHeight(GiftsCatalogFragment.this.mListHeight);
            }
        }

        /* loaded from: classes2.dex */
        private class HorizontalListAdapter extends UsableRecyclerView.Adapter<GiftHolder> {
            private HorizontalListAdapter() {
            }

            @Override // android.support.v7.widget.RecyclerView.Adapter
            /* renamed from: onCreateViewHolder  reason: collision with other method in class */
            public GiftHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
                return new GiftHolder(parent).onClick(GiftsCatalogFragment.this.mGiftSender).setSize(GiftsCatalogFragment.this.mGiftsWidth);
            }

            @Override // android.support.v7.widget.RecyclerView.Adapter
            public void onBindViewHolder(GiftHolder holder, int position) {
                holder.setSize(GiftsCatalogFragment.this.mGiftsWidth).bind(ItemHolder.this.mData.get(position));
            }

            @Override // android.support.v7.widget.RecyclerView.Adapter
            public int getItemCount() {
                if (ItemHolder.this.mData == null) {
                    return 0;
                }
                return ItemHolder.this.mData.size();
            }

            @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
            public int getImageCountForItem(int position) {
                return 1;
            }

            @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
            public String getImageURL(int position, int image) {
                return ((CatalogedGift) ItemHolder.this.mData.get(position)).gift.getImage(GiftsCatalogFragment.this.mGiftMinSize);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class FooterHolder extends RecyclerHolder<GiftCategory> {
        public FooterHolder(@NonNull ViewGroup parent) {
            super((int) R.layout.gifts_catalog_footer, parent);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(GiftCategory item) {
        }
    }
}
