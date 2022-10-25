package com.vkontakte.android.fragments.stickers;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.helper.ItemTouchHelper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.TextView;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.store.StoreGetPurchases;
import com.vkontakte.android.api.store.StoreReorderProducts;
import com.vkontakte.android.api.store.StoreSetActive;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.fragments.base.GridFragment;
import com.vkontakte.android.fragments.friends.HeaderHolder;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.recyclerview.BottomDividerDecoration;
import com.vkontakte.android.ui.recyclerview.CardItemDecoration;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class StickerManagerFragment extends GridFragment<StickerStockItem> implements BackListener {
    final List<StickerStockItem> mActive;
    final BottomDividerDecoration mDecoration;
    final List<StickerStockItem> mInactive;
    int mPhotoSize;
    VKAPIRequest mReorderReq;

    public static void start(@NonNull Activity activity) {
        new Navigator(StickerManagerFragment.class, new TabletDialogActivity.Builder().windowBackgroundResource(Screen.isTablet(activity) ? R.color.gifts_dialog_bg : 17170443).setMaxWidth(V.dp(652.0f))).go(activity);
    }

    public StickerManagerFragment() {
        super(30);
        this.mActive = new ArrayList();
        this.mInactive = new ArrayList();
        this.mDecoration = new BottomDividerDecoration((BottomDividerDecoration.Provider) mo1066getAdapter(), Math.max(1, V.dp(0.5f)), 251658240, V.dp(8.0f));
        setLayout(R.layout.window_content_layout);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        setRefreshEnabled(false);
        this.mPhotoSize = getResources().getDimensionPixelSize(R.dimen.small_photo_size);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        getToolbar().setNavigationIcon(R.drawable.ic_ab_back);
        getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
        getToolbar().setTitle(R.string.my_stickers);
        new ItemTouchHelper(new DragController()).attachToRecyclerView(this.list);
        this.list.addItemDecoration(this.mDecoration);
    }

    @Override // android.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialog) {
        super.onCancel(dialog);
        refreshAutoSuggestStickersIfNeeded();
    }

    @Override // android.app.DialogFragment, android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialog) {
        super.onDismiss(dialog);
        refreshAutoSuggestStickersIfNeeded();
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        refreshAutoSuggestStickersIfNeeded();
        return false;
    }

    private void refreshAutoSuggestStickersIfNeeded() {
        Stickers.get().reloadAutoSuggestDictionaryIfNeeded(false);
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (!this.loaded) {
            loadData();
        } else {
            dataLoaded();
        }
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected int getColumnsCount() {
        return 1;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.base.GridFragment
    public GridFragment<StickerStockItem>.GridAdapter<?> createAdapter() {
        return new Adapter();
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.currentRequest = new StoreGetPurchases().setCallback(new SimpleCallback<List<StickerStockItem>>(this) { // from class: com.vkontakte.android.fragments.stickers.StickerManagerFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(List<StickerStockItem> packs) {
                StickerManagerFragment.this.currentRequest = null;
                for (int i = 0; i < packs.size(); i++) {
                    StickerStockItem pack = packs.get(i);
                    if (pack.active) {
                        StickerManagerFragment.this.mActive.add(pack);
                    } else {
                        StickerManagerFragment.this.mInactive.add(pack);
                    }
                }
                StickerManagerFragment.this.onDataLoaded(packs, false);
                StickerManagerFragment.this.updateList();
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment
    protected CardItemDecoration onCreateCardDecorator() {
        boolean z = false;
        int listPadding = this.isTablet ? V.dp(48.0f) : 0;
        int paddingY = V.dp(8.0f);
        int paddingX = this.isTablet ? V.dp(16.0f) : 0;
        this.mDecoration.setPadding(listPadding - paddingX, listPadding - paddingX);
        this.list.setPadding(listPadding, paddingY, listPadding, 0);
        GridFragment.GridAdapter adapter = mo1066getAdapter();
        if (!this.isTablet) {
            z = true;
        }
        return new CardItemDecoration(adapter, z).setPadding(paddingX, paddingY, paddingX, paddingY).setCardsSpacing(V.dp(15.0f));
    }

    void setActiveState(final StickerStockItem item, final boolean activate) {
        new StoreSetActive(item.id, activate).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.fragments.stickers.StickerManagerFragment.2
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Stickers.get().setActive(item, activate);
                if (activate) {
                    StickerManagerFragment.this.mInactive.remove(item);
                    StickerManagerFragment.this.mActive.add(item);
                } else {
                    StickerManagerFragment.this.mActive.remove(item);
                    StickerManagerFragment.this.mInactive.add(0, item);
                }
                StickerManagerFragment.this.updateList();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    void sendReorder(int prevListPosition, int listPosition) {
        int afterId = -1;
        int prevPosition = listActivePositionToCollectionIndex(prevListPosition);
        int position = listActivePositionToCollectionIndex(listPosition);
        int beforeId = position + 1 < this.mActive.size() ? this.mActive.get(position + 1).id : -1;
        if (position - 1 >= 0) {
            afterId = this.mActive.get(position - 1).id;
        }
        this.mReorderReq = new StoreReorderProducts(this.mActive.get(position).id, beforeId, afterId).setCallback(new AnonymousClass3(this, position, prevPosition)).exec();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.stickers.StickerManagerFragment$3  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass3 extends ResultlessCallback {
        final /* synthetic */ int val$position;
        final /* synthetic */ int val$prevPosition;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass3(Fragment fragment, int i, int i2) {
            super(fragment);
            this.val$position = i;
            this.val$prevPosition = i2;
        }

        @Override // com.vkontakte.android.api.ResultlessCallback
        public void success() {
            StickerManagerFragment.this.mReorderReq = null;
            Stickers.get().swap(this.val$position, this.val$prevPosition);
        }

        @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse err) {
            StickerManagerFragment.this.mReorderReq = null;
            super.fail(err);
            StickerManagerFragment.this.list.post(StickerManagerFragment$3$$Lambda$1.lambdaFactory$(this, this.val$position, this.val$prevPosition));
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$0(int position, int prevPosition) {
            StickerStockItem item = StickerManagerFragment.this.mActive.remove(position);
            StickerManagerFragment.this.mActive.add(prevPosition, item);
            StickerManagerFragment.this.updateList();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class Adapter extends GridFragment<StickerStockItem>.GridAdapter<RecyclerHolder> implements BottomDividerDecoration.Provider {
        static final int TYPE_HEADER = 0;
        static final int TYPE_ITEM = 1;
        static final int TYPE_SETTING = 2;

        private Adapter() {
            super();
        }

        private StickerStockItem get(int position) {
            int position2 = StickerManagerFragment.this.listActivePositionToCollectionIndex(position);
            if (position2 < StickerManagerFragment.this.mActive.size()) {
                return StickerManagerFragment.this.mActive.get(position2);
            }
            return StickerManagerFragment.this.mInactive.get((position2 - 1) - StickerManagerFragment.this.mActive.size());
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            int i = 0;
            int size = (StickerManagerFragment.this.mInactive.isEmpty() ? 0 : 1) + StickerManagerFragment.this.mInactive.size() + StickerManagerFragment.this.mActive.size() + 1;
            if (!StickerManagerFragment.this.mActive.isEmpty()) {
                i = 1;
            }
            return size + i;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            if (position == 0) {
                return 2;
            }
            if (position == 1 && !StickerManagerFragment.this.mActive.isEmpty()) {
                return 0;
            }
            return (StickerManagerFragment.this.listActivePositionToCollectionIndex(position) != StickerManagerFragment.this.mActive.size() || StickerManagerFragment.this.mInactive.isEmpty()) ? 1 : 0;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public int getImageCountForItem(int position) {
            return getItemViewType(position) == 1 ? 1 : 0;
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Adapter, me.grishka.appkit.preloading.PrefetchInfoProvider
        public String getImageURL(int position, int image) {
            if (getItemViewType(position) == 1) {
                return get(position).getPhoto(StickerManagerFragment.this.mPhotoSize);
            }
            return null;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public RecyclerHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 0:
                    return new HeaderHolder(parent);
                case 1:
                    return new Holder(parent);
                case 2:
                    return new SettingHolder(parent);
                default:
                    return null;
            }
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerHolder holder, int position) {
            switch (getItemViewType(position)) {
                case 0:
                    ((HeaderHolder) holder).bind(holder.getString((position != 1 || StickerManagerFragment.this.mActive.isEmpty()) ? R.string.stickers_inactive : R.string.stickers_active));
                    return;
                case 1:
                    ((Holder) holder).bind(get(position));
                    return;
                case 2:
                    ((SettingHolder) holder).bind(Boolean.valueOf(Stickers.get(StickerManagerFragment.this.getActivity()).isSuggestsEnabled()));
                    return;
                default:
                    return;
            }
        }

        @Override // com.vkontakte.android.fragments.base.GridFragment.GridAdapter, com.vkontakte.android.ui.recyclerview.CardItemDecoration.Provider
        public int getBlockType(int position) {
            int result = 0;
            int itemCount = getItemCount();
            if (position == itemCount) {
                return 0;
            }
            if (position == 0) {
                result = 0 | 6;
            }
            if (position == 1) {
                result |= 2;
            }
            if (position == itemCount - 1) {
            }
            if (result == 0) {
                result |= 1;
            }
            return result;
        }

        @Override // com.vkontakte.android.ui.recyclerview.BottomDividerDecoration.Provider
        public boolean drawAfter(int position) {
            return position < getItemCount() + (-1) && getItemViewType(position + 1) == 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class SettingHolder extends RecyclerHolder<Boolean> implements View.OnClickListener, CompoundButton.OnCheckedChangeListener {
        final CompoundButton mSwitch;

        public SettingHolder(@NonNull ViewGroup parent) {
            super((int) R.layout.sticker_settings_switch_item, parent);
            this.mSwitch = (CompoundButton) $(R.id.checkbox);
            this.itemView.setOnClickListener(this);
            this.mSwitch.setOnCheckedChangeListener(this);
        }

        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            Stickers.get(getContext()).setSuggestsEnabled(isChecked);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            this.mSwitch.toggle();
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(Boolean item) {
            this.mSwitch.setChecked(item.booleanValue());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class Holder extends RecyclerHolder<StickerStockItem> implements View.OnClickListener {
        private ImageView mActionButton;
        private VKImageView mPhoto;
        private TextView mTitle;

        public Holder(@NonNull ViewGroup parent) {
            super((int) R.layout.sticker_settings_item, parent);
            this.mTitle = (TextView) $(R.id.title);
            this.mPhoto = (VKImageView) $(R.id.photo);
            this.mActionButton = (ImageView) $(R.id.action);
            this.itemView.setOnClickListener(this);
            this.mActionButton.setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(StickerStockItem item) {
            this.mPhoto.load(item.getPhoto(StickerManagerFragment.this.mPhotoSize));
            this.mTitle.setText(item.title);
            this.mActionButton.setImageResource(item.active ? R.drawable.ic_list_remove : R.drawable.ic_list_add);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (v == this.mActionButton) {
                if (!getItem().active) {
                    StickerManagerFragment.this.setActiveState(getItem(), true);
                } else {
                    new VKAlertDialog.Builder(StickerManagerFragment.this.getActivity()).setTitle(R.string.confirm).setMessage(R.string.stickers_deactivate_confirm).setPositiveButton(R.string.yes, StickerManagerFragment$Holder$$Lambda$1.lambdaFactory$(this)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
                }
            } else if (v == this.itemView) {
                StickersDetailsFragment.show(getItem(), StickerManagerFragment.this.getActivity());
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onClick$0(DialogInterface dialog, int which) {
            StickerManagerFragment.this.setActiveState(getItem(), false);
        }
    }

    /* loaded from: classes3.dex */
    private class DragController extends ItemTouchHelper.Callback {
        private boolean mDragging;
        private int mEndPosition;
        private int mStartPosition;

        private DragController() {
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public int getMovementFlags(RecyclerView recyclerView, RecyclerView.ViewHolder viewHolder) {
            if (!(viewHolder instanceof Holder) || !((Holder) viewHolder).getItem().active || StickerManagerFragment.this.mActive.size() <= 1) {
                return 0;
            }
            return makeMovementFlags(3, 0);
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public boolean canDropOver(RecyclerView recyclerView, RecyclerView.ViewHolder current, RecyclerView.ViewHolder target) {
            return (target instanceof Holder) && ((Holder) target).getItem().active;
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public boolean onMove(RecyclerView recyclerView, RecyclerView.ViewHolder viewHolder, RecyclerView.ViewHolder target) {
            int fromPosition = viewHolder.getAdapterPosition();
            int toPosition = target.getAdapterPosition();
            if (fromPosition < toPosition) {
                for (int i = fromPosition; i < toPosition; i++) {
                    Collections.swap(StickerManagerFragment.this.mActive, StickerManagerFragment.this.listActivePositionToCollectionIndex(i), StickerManagerFragment.this.listActivePositionToCollectionIndex(i + 1));
                }
            } else {
                for (int i2 = fromPosition; i2 > toPosition; i2--) {
                    Collections.swap(StickerManagerFragment.this.mActive, StickerManagerFragment.this.listActivePositionToCollectionIndex(i2), StickerManagerFragment.this.listActivePositionToCollectionIndex(i2 - 1));
                }
            }
            GridFragment.GridAdapter adapter = StickerManagerFragment.this.mo1066getAdapter();
            this.mEndPosition = toPosition;
            adapter.notifyItemMoved(fromPosition, toPosition);
            return true;
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public void onSelectedChanged(RecyclerView.ViewHolder viewHolder, int actionState) {
            super.onSelectedChanged(viewHolder, actionState);
            switch (actionState) {
                case 0:
                    if (this.mDragging && this.mStartPosition != this.mEndPosition) {
                        StickerManagerFragment.this.sendReorder(this.mStartPosition, this.mEndPosition);
                    }
                    this.mDragging = false;
                    return;
                case 1:
                default:
                    return;
                case 2:
                    this.mDragging = true;
                    this.mStartPosition = viewHolder.getAdapterPosition();
                    viewHolder.itemView.performHapticFeedback(0);
                    return;
            }
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public void onSwiped(RecyclerView.ViewHolder viewHolder, int direction) {
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public boolean isLongPressDragEnabled() {
            return true;
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public boolean isItemViewSwipeEnabled() {
            return false;
        }
    }

    int listActivePositionToCollectionIndex(int position) {
        return position - (this.mActive.isEmpty() ? 1 : 2);
    }
}
