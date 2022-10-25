package com.vk.masks;

import android.content.Context;
import android.location.Location;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.attachpicker.util.LocationUtils;
import com.vk.core.util.Screen;
import com.vk.lists.AbstractPaginatedView;
import com.vk.lists.PaginateHelper;
import com.vk.lists.RecyclerPaginatedView;
import com.vk.masks.model.Mask;
import com.vkontakte.android.R;
import com.vkontakte.android.api.masks.MasksGet;
import com.vkontakte.android.api.masks.MasksResponse;
import io.reactivex.Observable;
import io.reactivex.ObservableSource;
import io.reactivex.annotations.NonNull;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
/* loaded from: classes2.dex */
public class MasksView extends RecyclerPaginatedView implements PaginateHelper.PagedDataProviderWithOffset<MasksResponse> {
    private final MasksAdapter adapter;
    private final MasksContainer masksContainer;
    private final OnMaskSelectedListener onMaskSelectedListener;
    private PaginateHelper paginateHelper;
    private final int sectionId;
    private Mask selectedMask;

    /* loaded from: classes2.dex */
    public interface OnMaskSelectedListener {
        void onMaskSelected(int i, Mask mask);

        void onMasksListUpdated(int i);
    }

    public MasksView(Context context, MasksContainer masksContainer, int sectionId, OnMaskSelectedListener onMaskSelectedListener) {
        super(new ContextThemeWrapper(context, (int) R.style.BaseStyle_Dark));
        int neededIndex;
        this.sectionId = sectionId;
        this.masksContainer = masksContainer;
        this.adapter = new MasksAdapter(getContext(), masksContainer, sectionId, onMaskSelectedListener);
        this.onMaskSelectedListener = onMaskSelectedListener;
        init(context);
        if (masksContainer.selectedMask() != null && (neededIndex = this.adapter.getItems().indexOf(masksContainer.selectedMask())) > 0) {
            getRecyclerView().scrollToPosition(neededIndex);
        }
    }

    @Override // com.vk.lists.AbstractPaginatedView
    protected View createLoadingView() {
        return LayoutInflater.from(getContext()).inflate(R.layout.layout_masks_loading_view, (ViewGroup) null);
    }

    private void init(Context context) {
        initLayoutManager(AbstractPaginatedView.LayoutType.GRID).setSpanCount(1).buildAndSet();
        setColumnWidth((int) getResources().getDimension(R.dimen.mask_list_item_size));
        setSwipeRefreshEnabled(false);
        setAdapter(this.adapter);
        int bottomPadding = Screen.dp(80);
        getRecyclerView().setClipToPadding(false);
        getRecyclerView().setPadding(Screen.dp(8), Screen.dp(8), Screen.dp(8), bottomPadding);
        this.errorView.setPadding(0, 0, 0, bottomPadding);
        this.loadingView.setPadding(0, 0, 0, bottomPadding);
        this.emptyView.setPadding(0, 0, 0, bottomPadding);
        this.paginateHelper = PaginateHelper.createWithOffset(this).setDefaultNextFrom(this.masksContainer.getNextFromForSectionId(this.sectionId)).setReloadOnBind(false).setPageSize(60).buildAndBind(this);
    }

    public void reloadIfLocal() {
        if (this.sectionId == -1) {
            this.paginateHelper.reload();
        }
    }

    public void notifyDataSetChanged() {
        this.adapter.notifyDataSetChanged();
    }

    public void setSelectedMask(Mask selectedMask) {
        this.selectedMask = selectedMask;
        this.adapter.setSelectedMask(selectedMask);
    }

    @Override // com.vk.lists.PaginateHelper.PagedDataProvider
    public Observable<MasksResponse> reload(PaginateHelper helper) {
        return loadNext(0, helper).doOnNext(new Consumer<MasksResponse>() { // from class: com.vk.masks.MasksView.1
            @Override // io.reactivex.functions.Consumer
            public void accept(@NonNull MasksResponse masks) throws Exception {
                MasksView.this.adapter.clear();
            }
        });
    }

    @Override // com.vk.lists.PaginateHelper.PagedDataProviderWithOffset
    public Observable<MasksResponse> loadNext(final int offset, final PaginateHelper helper) {
        if (this.sectionId == -1) {
            return Observable.just(MasksController.getInstance().recentMasks());
        }
        return LocationUtils.getLastKnownLocationRx().flatMap(new Function<Location, ObservableSource<? extends MasksResponse>>() { // from class: com.vk.masks.MasksView.2
            @Override // io.reactivex.functions.Function
            /* renamed from: apply  reason: avoid collision after fix types in other method */
            public ObservableSource<? extends MasksResponse> mo1190apply(@NonNull Location location) throws Exception {
                if (location == LocationUtils.NO_LOCATION) {
                    return new MasksGet(MasksView.this.sectionId, helper.getPageSize(), offset).toObservable();
                }
                return new MasksGet(MasksView.this.sectionId, helper.getPageSize(), offset, location.getLatitude(), location.getLongitude()).toObservable();
            }
        });
    }

    @Override // com.vk.lists.PaginateHelper.PagedDataProvider
    public void onNewData(Observable<MasksResponse> observable, final PaginateHelper helper) {
        observable.subscribe(new Consumer<MasksResponse>() { // from class: com.vk.masks.MasksView.3
            @Override // io.reactivex.functions.Consumer
            public void accept(@NonNull MasksResponse masks) throws Exception {
                helper.incrementPage(masks.masks.total());
                MasksView.this.masksContainer.setNextFromForSectionId(MasksView.this.sectionId, helper.getNextFrom());
                MasksView.this.adapter.appendRange(masks.masks);
                if (MasksView.this.adapter.getItems().contains(MasksView.this.selectedMask)) {
                    MasksView.this.onMaskSelectedListener.onMasksListUpdated(MasksView.this.sectionId);
                }
            }
        }, new Consumer<Throwable>() { // from class: com.vk.masks.MasksView.4
            @Override // io.reactivex.functions.Consumer
            public void accept(@NonNull Throwable throwable) throws Exception {
            }
        });
    }
}
