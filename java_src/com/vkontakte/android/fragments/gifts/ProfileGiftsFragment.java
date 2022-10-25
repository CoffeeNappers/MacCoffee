package com.vkontakte.android.fragments.gifts;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.CoordinatorLayout;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.PopupMenu;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.SimpleListCallback;
import com.vkontakte.android.api.gifts.GiftsDelete;
import com.vkontakte.android.api.gifts.GiftsGet;
import com.vkontakte.android.api.models.GiftItem;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.recyclerview.BottomDividerDecoration;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class ProfileGiftsFragment extends GridFragment<GiftItem> implements View.OnClickListener {
    final BottomDividerDecoration bottomDividerDecoration;
    Drawable mLoadingPlaceholder;
    @Nullable
    UserProfile mProfile;
    int mUserId;

    /* loaded from: classes2.dex */
    public static final class Extra {
        public static final String Title = "title";
        public static final String User = "user";
    }

    public ProfileGiftsFragment() {
        super(25);
        this.bottomDividerDecoration = new BottomDividerDecoration((BottomDividerDecoration.Provider) mo1066getAdapter(), Math.max(1, V.dp(0.5f)), 637534208, 0);
        setLayout(R.layout.fab_loader_fragment);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mProfile = (UserProfile) getArguments().getParcelable(Extra.User);
        this.mUserId = this.mProfile == null ? VKAccountManager.getCurrent().getUid() : this.mProfile.uid;
        this.mLoadingPlaceholder = getResources().getDrawable(R.drawable.gift_placeholder);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(VKAccountManager.isCurrentUser(this.mUserId) ? getString(R.string.gifts_my) : getArguments().getString("title"));
        ImageView fab = (ImageView) this.contentView.findViewById(R.id.fab);
        if (!VKAccountManager.isCurrentUser(this.mUserId) && VKAccountManager.getCurrent().isReal()) {
            fab.setImageDrawable(new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_ab_gift), -1));
            fab.setOnClickListener(this);
        } else {
            fab.setVisibility(8);
            ((CoordinatorLayout.LayoutParams) fab.getLayoutParams()).setBehavior(null);
        }
        this.list.setDrawSelectorOnTop(true);
        this.list.setSelectorBoundsProvider(ProfileGiftsFragment$$Lambda$1.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$0(View child, Rect outRect) {
        View nextChild;
        RecyclerView.ViewHolder rawHolder = this.list.mo1205getChildViewHolder(child);
        outRect.left = child.getLeft();
        outRect.right = child.getRight();
        outRect.top = child.getTop();
        outRect.bottom = child.getBottom();
        if (rawHolder instanceof Holder) {
            RecyclerView.LayoutManager layoutManager = this.list.getLayoutManager();
            for (int i = 0; i < layoutManager.getChildCount(); i++) {
                View v = layoutManager.getChildAt(i);
                if (v == child && (nextChild = layoutManager.getChildAt(i + 1)) != null && (this.list.mo1205getChildViewHolder(nextChild) instanceof FooterHolder)) {
                    outRect.bottom = nextChild.getBottom();
                    return;
                }
            }
        }
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected CardItemDecoration onCreateCardDecorator() {
        CardItemDecoration decorator = new CardItemDecoration(mo1066getAdapter(), !this.isTablet);
        int paddingTop = V.dp(8.0f);
        int margin = this.scrW >= 924 ? V.dp(Math.max(16, ((this.scrW - 840) - 84) / 2)) : 0;
        int dividerMargin = margin + getResources().getDimensionPixelSize(R.dimen.post_side_padding);
        this.list.setPadding(margin, paddingTop, margin, 0);
        this.list.addItemDecoration(this.bottomDividerDecoration.setPadding(dividerMargin, dividerMargin));
        return decorator.setCardsSpacing(paddingTop);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.base.GridFragment
    public GridFragment<GiftItem>.GridAdapter<?> createAdapter() {
        return new Adapter();
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        return 1;
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (this.data == null || this.data.isEmpty()) {
            loadData();
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new GiftsGet(this.mUserId, offset, count).setCallback(new SimpleListCallback(this)).exec((Context) getActivity());
    }

    void openProfile(int user_id) {
        new ProfileFragment.Builder(user_id).go(getActivity());
    }

    void sendGiftTo(UserProfile profile) {
        GiftsCatalogFragment.start(getActivity(), profile);
    }

    void showUsersGifts(GiftItem giftItem) {
        Bundle args = new Bundle();
        args.putParcelable(Extra.User, giftItem.from);
        args.putString("title", getString(R.string.gifts_of_placeholder, new Object[]{giftItem.from.first_name_gen}));
        Navigate.to(ProfileGiftsFragment.class, args, getActivity());
    }

    void showGiftDeleteDialog(GiftItem giftItem) {
        new AlertDialog.Builder(getActivity()).setTitle(R.string.confirm).setMessage(R.string.gift_delete_confirm).setPositiveButton(R.string.yes, ProfileGiftsFragment$$Lambda$2.lambdaFactory$(this, giftItem)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$showGiftDeleteDialog$1(final GiftItem giftItem, DialogInterface dialog, int which) {
        new GiftsDelete(giftItem).setCallback(new SimpleCallback<Boolean>() { // from class: com.vkontakte.android.fragments.gifts.ProfileGiftsFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(Boolean result) {
                if (result.booleanValue()) {
                    ProfileGiftsFragment.this.data.remove(giftItem);
                    ProfileGiftsFragment.this.updateList();
                    Toast.makeText(ProfileGiftsFragment.this.getActivity(), (int) R.string.gift_deleted_successfully, 0).show();
                }
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        sendGiftTo(this.mProfile);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class Adapter extends GridFragment<GiftItem>.GridAdapter<RecyclerHolder<GiftItem>> implements BottomDividerDecoration.Provider {
        static final int TYPE_FOOTER = 1;
        static final int TYPE_ITEM = 0;

        private Adapter() {
            super();
        }

        boolean split() {
            return (ProfileGiftsFragment.this.mProfile == null || VKAccountManager.isCurrentUser(ProfileGiftsFragment.this.mProfile.uid)) && VKAccountManager.getCurrent().isReal();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder<GiftItem> mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return viewType == 0 ? new Holder(parent) : new FooterHolder(parent);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            if (getItemViewType(position) == 0) {
                if (split()) {
                    position >>= 1;
                }
                GiftItem giftItem = (GiftItem) ProfileGiftsFragment.this.data.get(position);
                return image == 0 ? giftItem.gift.thumb_256 : giftItem.from.photo;
            }
            return null;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            if (getItemViewType(position) == 0) {
                if (split()) {
                    position >>= 1;
                }
                return ((GiftItem) ProfileGiftsFragment.this.data.get(position)).from != null ? 2 : 1;
            }
            return 0;
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, com.vkontakte.android.ui.recyclerview.CardItemDecoration.Provider
        public int getBlockType(int position) {
            if (split()) {
                return (getItemViewType(position) == 0 ? 2 : 4) | 24;
            }
            return 30;
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return super.getItemCount() << (split() ? 1 : 0);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return (!split() || position % 2 != 1) ? 0 : 1;
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder<GiftItem> holder, int position) {
            if (split()) {
                position >>= 1;
            }
            super.onBindViewHolder((Adapter) holder, position);
        }

        @Override // com.vkontakte.android.ui.recyclerview.BottomDividerDecoration.Provider
        public boolean drawAfter(int position) {
            return split() && getItemViewType(position) == 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class Holder extends RecyclerHolder<GiftItem> implements UsableRecyclerView.Clickable, View.OnClickListener, PopupMenu.OnMenuItemClickListener {
        private TextView mDate;
        private TextView mFrom;
        private VKImageView mGift;
        private View mOptions;
        private VKImageView mPhoto;
        private TextView mSubtitle;
        private TextView mTitle;

        public Holder(ViewGroup parent) {
            super((int) R.layout.list_item_gift, parent);
            this.mPhoto = (VKImageView) $(R.id.photo);
            this.mOptions = $(R.id.actions);
            this.mGift = (VKImageView) $(R.id.gift);
            this.mDate = (TextView) $(R.id.date);
            this.mFrom = (TextView) $(R.id.username);
            this.mTitle = (TextView) $(R.id.title);
            this.mSubtitle = (TextView) $(R.id.subtitle);
            this.mOptions.setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(GiftItem data) {
            int i = 8;
            if (data.from != null && !TextUtils.isEmpty(data.from.photo)) {
                this.mPhoto.load(data.from.photo);
            } else {
                this.mPhoto.clear();
            }
            if (data.gift != null) {
                this.mGift.load(data.gift.thumb_256);
            }
            this.mFrom.setText(data.from != null ? data.from.fullName : getString(R.string.gifts_anonymous));
            this.mDate.setText(data.dateStr);
            this.mTitle.setText(data.message);
            this.mSubtitle.setVisibility((!data.isPrivate() || !VKAccountManager.isCurrentUser(ProfileGiftsFragment.this.mUserId)) ? 8 : 0);
            this.mTitle.setVisibility((!TextUtils.isEmpty(data.message) || this.mSubtitle.getVisibility() != 8) ? 0 : 8);
            View view = this.mOptions;
            if ((data.from != null && data.from.can_see_gifts) || VKAccountManager.isCurrentUser(ProfileGiftsFragment.this.mUserId)) {
                i = 0;
            }
            view.setVisibility(i);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (getItem() != null) {
                if (v == this.itemView && getItem().from_id != 0) {
                    ProfileGiftsFragment.this.openProfile(getItem().from_id);
                }
                if (v == this.mOptions) {
                    PopupMenu menu = new PopupMenu(ProfileGiftsFragment.this.getActivity(), v);
                    if (getItem().from != null && getItem().from.can_see_gifts) {
                        menu.getMenu().add(0, R.string.gifts_of_placeholder, 0, getString(R.string.gifts_of_placeholder, getItem().from.first_name_gen));
                    }
                    if (VKAccountManager.isCurrentUser(ProfileGiftsFragment.this.mUserId)) {
                        menu.getMenu().add(0, R.string.delete, 0, R.string.delete);
                    }
                    menu.setOnMenuItemClickListener(this);
                    menu.show();
                }
            }
        }

        @Override // android.widget.PopupMenu.OnMenuItemClickListener
        public boolean onMenuItemClick(MenuItem item) {
            switch (item.getItemId()) {
                case R.string.delete /* 2131231132 */:
                    ProfileGiftsFragment.this.showGiftDeleteDialog(getItem());
                    return true;
                case R.string.gifts_of_placeholder /* 2131231378 */:
                    ProfileGiftsFragment.this.showUsersGifts(getItem());
                    return true;
                default:
                    return true;
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            onClick(this.itemView);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class FooterHolder extends RecyclerHolder<GiftItem> implements UsableRecyclerView.Clickable {
        private TextView mOptionsValue;

        public FooterHolder(ViewGroup parent) {
            super((int) R.layout.list_item_gift_send, parent);
            this.mOptionsValue = (TextView) ((ViewGroup) this.itemView).getChildAt(0);
            this.mOptionsValue.setCompoundDrawablesWithIntrinsicBounds(new RecoloredDrawable(getDrawable(R.drawable.ic_ab_gift), -11435592), (Drawable) null, (Drawable) null, (Drawable) null);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            if (getItem() != null && getItem().from != null) {
                ProfileGiftsFragment.this.sendGiftTo(getItem().from);
            }
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(GiftItem data) {
            if (data.from != null) {
                ViewGroup.LayoutParams lp = this.itemView.getLayoutParams();
                if (lp == null) {
                    lp = new GridLayoutManager.LayoutParams(-1, V.dp(49.0f));
                } else {
                    lp.height = V.dp(49.0f);
                }
                this.itemView.setLayoutParams(lp);
                String longText = getString(R.string.profile_gifts_action_long);
                int requiredWidth = (int) (this.mOptionsValue.getPaint().measureText(longText) + this.mOptionsValue.getCompoundDrawablePadding() + this.mOptionsValue.getPaddingLeft() + this.mOptionsValue.getPaddingRight() + this.mOptionsValue.getCompoundDrawables()[0].getIntrinsicWidth());
                int maxWidth = (((ProfileGiftsFragment.this.list.getWidth() - ProfileGiftsFragment.this.list.getPaddingLeft()) - ProfileGiftsFragment.this.list.getPaddingRight()) - ProfileGiftsFragment.this.bottomDividerDecoration.getPaddingLeft()) - ProfileGiftsFragment.this.bottomDividerDecoration.getPaddingRight();
                TextView textView = this.mOptionsValue;
                if (requiredWidth > maxWidth) {
                    longText = getString(R.string.profile_gifts_action);
                }
                textView.setText(longText);
                return;
            }
            ViewGroup.LayoutParams lp2 = this.itemView.getLayoutParams();
            if (lp2 == null) {
                lp2 = new GridLayoutManager.LayoutParams(-1, 0);
            } else {
                lp2.height = 0;
            }
            this.itemView.setLayoutParams(lp2);
        }
    }
}
