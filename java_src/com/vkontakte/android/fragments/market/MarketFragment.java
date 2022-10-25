package com.vkontakte.android.fragments.market;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.R;
import com.vkontakte.android.TextFormatter;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.market.MarketGetMarketPage;
import com.vkontakte.android.attachments.MarketAttachment;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.data.GoodAlbum;
import com.vkontakte.android.fragments.CardRecyclerFragment;
import com.vkontakte.android.fragments.market.GoodFragment;
import com.vkontakte.android.fragments.market.MarketFilterPriceFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.holder.RecyclerSectionAdapter;
import com.vkontakte.android.ui.holder.commons.BottomButtonHolder;
import com.vkontakte.android.ui.holder.commons.GridHolder;
import com.vkontakte.android.ui.holder.commons.TitleHolder;
import com.vkontakte.android.ui.holder.market.GoodAlbumGridItemHolder;
import com.vkontakte.android.ui.holder.market.GoodGridItemHolder;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes2.dex */
public class MarketFragment extends CardRecyclerFragment implements AdapterView.OnItemSelectedListener, View.OnClickListener {
    private static final int MODE_ALBUM = 1;
    private static final int MODE_ALBUMS_WITH_GOODS = 0;
    private static final int MODE_ALL_ALBUMS = 2;
    private static final int MODE_FAVE = 4;
    private static final int MODE_SEARCH = 3;
    private static final int REQUEST_CODE_FILTERS = 4309586;
    private Adapter adapter;
    private String currency;
    public List<RecyclerSectionAdapter.Data> dataHorizontal;
    public List<RecyclerSectionAdapter.Data> dataVertical;
    private boolean filterByPrice;
    private long filterByPriceFinish;
    private long filterByPriceStart;
    private long maxPriceLong;
    private long minPriceLong;
    private int mode;
    private String searchQuery;
    private SearchViewWrapper searchView;
    private boolean searching;
    private View.OnClickListener showAllAlbums;
    private MarketGetMarketPage.SortType sortType;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder(int ownerId) {
            super(MarketFragment.class);
            this.args.putInt("owner_id", ownerId);
        }

        public Builder setAlbum(int album) {
            this.args.putInt(ArgKeys.ALBUM, album);
            return this;
        }

        public Builder setTitle(String title) {
            this.args.putString("title", title);
            return this;
        }

        public Builder setAllAlbumsMode() {
            this.args.putBoolean("isAllAlbums", true);
            return this;
        }

        public Builder setSearchMode() {
            this.args.putBoolean("isSearchMode", true);
            return this;
        }
    }

    public /* synthetic */ void lambda$new$0(View v) {
        new Builder(getOwnerId()).setAllAlbumsMode().go(v.getContext());
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        state.putInt("sortType", this.sortType.ordinal());
        state.putLong("minPrice", this.minPriceLong);
        state.putLong("maxPrice", this.maxPriceLong);
        state.putString("currency", this.currency);
        state.putByte("filterByPrice", this.filterByPrice ? (byte) 1 : (byte) 0);
        state.putLong("filterByPriceStart", this.filterByPriceStart);
        state.putLong("filterByPriceFinish", this.filterByPriceFinish);
        state.putInt("mode", this.mode);
        state.putString("searchQuery", this.searchQuery);
    }

    public MarketFragment() {
        super(R.layout.market_fragment, 24);
        this.dataHorizontal = new ArrayList();
        this.dataVertical = new ArrayList();
        this.adapter = new Adapter();
        this.sortType = MarketGetMarketPage.SortType.values()[0];
        this.searching = false;
        this.minPriceLong = Long.MIN_VALUE;
        this.maxPriceLong = Long.MIN_VALUE;
        this.filterByPrice = false;
        this.filterByPriceStart = 0L;
        this.filterByPriceFinish = 0L;
        this.mode = 0;
        this.searchQuery = null;
        this.showAllAlbums = MarketFragment$$Lambda$1.lambdaFactory$(this);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle state) {
        boolean z = false;
        super.onCreate(state);
        if (state != null) {
            this.sortType = MarketGetMarketPage.SortType.values()[state.getInt("sortType", 0)];
            this.minPriceLong = state.getLong("minPrice", this.minPriceLong);
            this.maxPriceLong = state.getLong("maxPrice", this.maxPriceLong);
            this.currency = state.getString("currency", this.currency);
            if (state.getByte("filterByPrice", (byte) 0).byteValue() != 0) {
                z = true;
            }
            this.filterByPrice = z;
            this.filterByPriceStart = state.getLong("filterByPriceStart", this.filterByPriceStart);
            this.filterByPriceFinish = state.getLong("filterByPriceFinish", this.filterByPriceFinish);
            this.mode = state.getInt("mode", this.mode);
            this.searchQuery = state.getString("searchQuery", this.searchQuery);
        }
        if (this.mode == 3) {
            this.searchView = new SearchViewWrapper(getActivity(), new SearchViewWrapper.SearchListener() { // from class: com.vkontakte.android.fragments.market.MarketFragment.1
                {
                    MarketFragment.this = this;
                }

                @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
                public void onQueryConfirmed(String query) {
                }

                @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
                public void onQuerySubmitted(String query) {
                }

                @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
                public void onQueryChanged(String query) {
                    boolean ns = query != null && query.length() > 0;
                    if (ns != MarketFragment.this.searching) {
                        MarketFragment.this.searching = ns;
                    }
                    MarketFragment.this.searchQuery = query;
                    MarketFragment.this.reload();
                }
            }) { // from class: com.vkontakte.android.fragments.market.MarketFragment.2
                {
                    MarketFragment.this = this;
                }

                @Override // com.vkontakte.android.ui.SearchViewWrapper
                public void setExpanded(boolean expanded) {
                    super.setExpanded(expanded);
                    if (!expanded && MarketFragment.this.getActivity() != null) {
                        MarketFragment.this.getActivity().finish();
                    }
                }
            };
        }
        setHasOptionsMenu(true);
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        if (getArguments().getBoolean("isFaveMode", false)) {
            this.mode = 4;
            MarketAttachment.setLastSource(GoodFragment.Builder.Source.fave);
        } else if (getArguments().getBoolean("isSearchMode", false)) {
            this.mode = 3;
        } else if (getArguments().getBoolean("isAllAlbums", false)) {
            this.mode = 2;
        } else if (getAlbumId() == -1) {
            this.mode = 0;
        } else {
            this.mode = 1;
        }
        switch (this.mode) {
            case 0:
                setTitle(R.string.market);
                break;
            case 1:
                setTitle(getArguments().getString("title", ""));
                break;
            case 2:
                setTitle(R.string.good_albums);
                break;
        }
        loadData();
    }

    protected int getOwnerId() {
        return getArguments().getInt("owner_id");
    }

    protected int getAlbumId() {
        return getArguments().getInt(ArgKeys.ALBUM, -1);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(final int offset, final int count) {
        MarketGetMarketPage getMarketPage;
        final boolean isVertical = false;
        switch (this.mode) {
            case 1:
                getMarketPage = new MarketGetMarketPage(getOwnerId(), count, offset);
                getMarketPage.setSortType(this.sortType);
                getMarketPage.setAlbumId(getAlbumId());
                if (this.filterByPrice) {
                    getMarketPage.setPrice(this.filterByPriceStart, this.filterByPriceFinish);
                }
                if (offset == 0) {
                    getMarketPage.forceLoadMarket();
                    break;
                }
                break;
            case 2:
                getMarketPage = new MarketGetMarketPage(getOwnerId(), 0, 0);
                getMarketPage.setAlbumsParams(count, offset);
                break;
            case 3:
                getMarketPage = new MarketGetMarketPage(getOwnerId(), count, offset);
                getMarketPage.setSortType(this.sortType);
                if (!TextUtils.isEmpty(this.searchQuery)) {
                    getMarketPage.setQuery(this.searchQuery);
                }
                if (this.filterByPrice) {
                    getMarketPage.setPrice(this.filterByPriceStart, this.filterByPriceFinish);
                }
                if (offset == 0) {
                    getMarketPage.forceLoadMarket();
                    break;
                }
                break;
            case 4:
                getMarketPage = MarketGetMarketPage.fave(count, offset);
                break;
            default:
                getMarketPage = new MarketGetMarketPage(getOwnerId(), count, offset);
                if (offset == 0) {
                    getMarketPage.setAlbumsParams(this.isTablet ? 3 : 4, 0);
                    break;
                }
                break;
        }
        if (getResources().getConfiguration().orientation == 1 || this.isTablet) {
            isVertical = true;
        }
        getMarketPage.setCallback(new SimpleCallback<MarketGetMarketPage.Response>(this) { // from class: com.vkontakte.android.fragments.market.MarketFragment.3
            {
                MarketFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(MarketGetMarketPage.Response result) {
                boolean z = true;
                if (result.hasMarket) {
                    MarketFragment.this.minPriceLong = result.minPrice;
                    MarketFragment.this.maxPriceLong = result.maxPrice;
                    MarketFragment.this.currency = result.currency;
                }
                if (offset == 0) {
                    MarketFragment.this.dataVertical.clear();
                    MarketFragment.this.dataHorizontal.clear();
                }
                if (!TextUtils.isEmpty(result.albumTitle)) {
                    MarketFragment.this.setTitle(result.albumTitle);
                }
                MarketFragment.this.dataVertical.addAll(MarketFragment.this.createData(result, offset == 0, true));
                MarketFragment.this.dataHorizontal.addAll(MarketFragment.this.createData(result, offset == 0, false));
                MarketFragment.this.adapter.setData(isVertical ? MarketFragment.this.dataVertical : MarketFragment.this.dataHorizontal);
                if (MarketFragment.this.mode == 2) {
                    MarketFragment marketFragment = MarketFragment.this;
                    List arrayList = result.albums == null ? new ArrayList() : result.albums;
                    if (result.albums == null || result.albums.size() < count) {
                        z = false;
                    }
                    marketFragment.onDataLoaded(arrayList, z);
                    return;
                }
                MarketFragment marketFragment2 = MarketFragment.this;
                if (result.size() < count) {
                    z = false;
                }
                marketFragment2.onDataLoaded(result, z);
            }
        });
        this.currentRequest = getMarketPage;
        getMarketPage.exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void updateConfiguration() {
        super.updateConfiguration();
        this.adapter.setData((getResources().getConfiguration().orientation == 1 || this.isTablet) ? this.dataVertical : this.dataHorizontal);
    }

    private void updateFilters() {
        View view = getView();
        if (view != null) {
            ViewUtils.setVisibility(view.findViewById(R.id.filter_price), this.filterByPrice ? 0 : 8);
            ViewUtils.setText((TextView) view.findViewById(R.id.price_filter_text), this.filterByPriceStart + " - " + this.filterByPriceFinish + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.currency);
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        MarketGetMarketPage.SortType[] values;
        DividerItemDecoration.Provider provider;
        View view = super.onCreateView(inflater, container, savedInstanceState);
        view.findViewById(R.id.buttonPriceSettings).setOnClickListener(this);
        if (this.mode != 3 && this.mode != 1) {
            ViewUtils.setVisibility(view.findViewById(R.id.filter_block), 8);
            ViewUtils.setVisibility(view.findViewById(R.id.filter_block_shadow), 8);
            ViewUtils.setVisibility(view.findViewById(R.id.filter_price), 8);
        } else {
            Spinner spinner = (Spinner) view.findViewById(R.id.spinner);
            ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(inflater.getContext(), R.layout.market_sort_item);
            arrayAdapter.setDropDownViewResource(R.layout.market_sort_item_dropdown);
            for (MarketGetMarketPage.SortType sortType : MarketGetMarketPage.SortType.values()) {
                arrayAdapter.add(getString(sortType.titleRes));
            }
            spinner.setAdapter((SpinnerAdapter) arrayAdapter);
            spinner.setOnItemSelectedListener(this);
        }
        Drawable transparent = new ColorDrawable(0);
        DividerItemDecoration dividers = new DividerItemDecoration(transparent, 0, transparent, V.dp(8.0f), transparent, V.dp(8.0f));
        provider = MarketFragment$$Lambda$2.instance;
        dividers.setProvider(provider);
        this.list.addItemDecoration(dividers);
        return view;
    }

    public static /* synthetic */ boolean lambda$onCreateView$1(int position) {
        return false;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.buttonPriceSettings /* 2131755917 */:
                if (this.minPriceLong != Long.MIN_VALUE && this.maxPriceLong != Long.MIN_VALUE && !TextUtils.isEmpty(this.currency)) {
                    MarketFilterPriceFragment.Builder builder = new MarketFilterPriceFragment.Builder(this.minPriceLong, this.maxPriceLong, this.currency);
                    if (this.filterByPriceStart != 0 && this.filterByPriceFinish != 0) {
                        builder.setCurrentValues(this.filterByPriceStart, this.filterByPriceFinish);
                    }
                    builder.forResult(this, REQUEST_CODE_FILTERS);
                    return;
                }
                return;
            case R.id.filter_price /* 2131755918 */:
            case R.id.price_filter_text /* 2131755920 */:
            default:
                return;
            case R.id.filter_price_badge /* 2131755919 */:
                if (this.minPriceLong != Long.MIN_VALUE && this.maxPriceLong != Long.MIN_VALUE) {
                    new MarketFilterPriceFragment.Builder(this.minPriceLong, this.maxPriceLong, this.currency).setCurrentValues(this.filterByPriceStart, this.filterByPriceFinish).forResult(this, REQUEST_CODE_FILTERS);
                    return;
                }
                return;
            case R.id.filter_price_close /* 2131755921 */:
                this.filterByPrice = false;
                updateFilters();
                reload();
                return;
        }
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        switch (requestCode) {
            case REQUEST_CODE_FILTERS /* 4309586 */:
                if (resultCode == -1) {
                    this.filterByPrice = true;
                    this.filterByPriceStart = data.getLongExtra("min", 0L);
                    this.filterByPriceFinish = data.getLongExtra("max", 0L);
                    updateFilters();
                    reload();
                    return;
                }
                return;
            default:
                super.onActivityResult(requestCode, resultCode, data);
                return;
        }
    }

    @Override // com.vkontakte.android.fragments.CardRecyclerFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (this.searchView != null) {
            getToolbar().addView(this.searchView.getView());
        }
        view.findViewById(R.id.filter_price_badge).setOnClickListener(this);
        view.findViewById(R.id.filter_price_close).setOnClickListener(this);
        updateFilters();
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (this.mode == 0) {
            inflater.inflate(R.menu.market, menu);
        }
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.search /* 2131755135 */:
                new Builder(getOwnerId()).setSearchMode().go(getActivity());
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        if (this.sortType != MarketGetMarketPage.SortType.values()[position]) {
            this.sortType = MarketGetMarketPage.SortType.values()[position];
            reload();
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onNothingSelected(AdapterView<?> parent) {
    }

    protected List<RecyclerSectionAdapter.Data> createData(MarketGetMarketPage.Response response, boolean showMarketTitle, boolean isVertical) {
        int TYPE_ALBUM_ITEMS = isVertical ? 2 : 3;
        int TYPE_GOOD_ITEMS = isVertical ? 0 : 1;
        List<RecyclerSectionAdapter.Data> list = new ArrayList<>();
        if (response.albums != null && response.albums.size() > 0) {
            if (this.mode != 2) {
                CharSequence title = TextFormatter.processString(VKApplication.context.getString(R.string.good_albums) + "  /cFF909499" + NumberFormat.getInstance().format(response.albums.total()) + "/e");
                if ((list.isEmpty() && !this.isTablet) || !showMarketTitle) {
                    list.add(RecyclerSectionAdapter.Data.middle(5, title));
                } else {
                    list.add(RecyclerSectionAdapter.Data.top(5, title));
                }
            }
            int countInRow = (this.isTablet ? 3 : 2) * (isVertical ? 1 : 2);
            int countRow = response.albums.size() % countInRow == 0 ? response.albums.size() / countInRow : (response.albums.size() / countInRow) + 1;
            for (int i = 0; i < countRow; i++) {
                GoodAlbum[] albums = new GoodAlbum[countInRow];
                for (int j = 0; j < countInRow; j++) {
                    albums[j] = (GoodAlbum) getSafety(response.albums, (i * countInRow) + j);
                }
                if (i == countRow - 1) {
                    if (this.mode == 2) {
                        if (response.albums.size() == response.albums.total()) {
                            list.add(RecyclerSectionAdapter.Data.bottom(TYPE_ALBUM_ITEMS, albums));
                        } else {
                            list.add(RecyclerSectionAdapter.Data.middle(TYPE_ALBUM_ITEMS, albums));
                        }
                    } else if (response.albums.size() != response.albums.total()) {
                        list.add(RecyclerSectionAdapter.Data.middle(TYPE_ALBUM_ITEMS, albums));
                    } else {
                        list.add(RecyclerSectionAdapter.Data.bottom(TYPE_ALBUM_ITEMS, albums));
                    }
                } else {
                    list.add(RecyclerSectionAdapter.Data.middle(TYPE_ALBUM_ITEMS, albums));
                }
            }
            if (this.mode != 2 && response.albums.size() != response.albums.total()) {
                list.add(RecyclerSectionAdapter.Data.bottom(4, new BottomButtonHolder.Data(this.showAllAlbums, Integer.valueOf((int) R.string.show_all))));
            }
        }
        int countInRow2 = (this.isTablet ? 4 : 2) * (isVertical ? 1 : 2);
        int countRow2 = response.size() % countInRow2 == 0 ? response.size() / countInRow2 : (response.size() / countInRow2) + 1;
        if (response.size() > 0 && this.mode == 0 && showMarketTitle) {
            CharSequence title2 = TextFormatter.processString(VKApplication.context.getString(R.string.goods) + "  /cFF909499" + NumberFormat.getInstance().format(response.total()) + "/e");
            if (list.isEmpty()) {
                list.add(RecyclerSectionAdapter.Data.middle(5, title2));
            } else {
                list.add(RecyclerSectionAdapter.Data.top(5, title2));
            }
        }
        for (int i2 = 0; i2 < countRow2; i2++) {
            Good[] goods = new Good[countInRow2];
            for (int j2 = 0; j2 < countInRow2; j2++) {
                goods[j2] = (Good) getSafety(response, (i2 * countInRow2) + j2);
            }
            list.add(RecyclerSectionAdapter.Data.middle(TYPE_GOOD_ITEMS, goods));
        }
        return list;
    }

    @Nullable
    protected <T> T getSafety(List<T> list, int index) {
        if (index < 0 || index >= list.size()) {
            return null;
        }
        return list.get(index);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        return this.adapter;
    }

    /* loaded from: classes2.dex */
    public class Adapter extends RecyclerSectionAdapter {
        static final int TYPE_ALBUM_ITEMS_HORIZONTAL = 3;
        static final int TYPE_ALBUM_ITEMS_VERTICAL = 2;
        static final int TYPE_GOOD_ITEMS_HORIZONTAL = 1;
        static final int TYPE_GOOD_ITEMS_VERTICAL = 0;
        static final int TYPE_SHOW_ALL_ALBUMS = 4;
        static final int TYPE_TITLE = 5;

        private Adapter() {
            MarketFragment.this = r1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerHolder mo1206onCreateViewHolder(final ViewGroup parent, int viewType) {
            int i = 4;
            int i2 = 3;
            int i3 = 2;
            switch (viewType) {
                case 0:
                    if (MarketFragment.this.isTablet) {
                        i3 = 4;
                    }
                    return new GridHolder<Good, GoodGridItemHolder>(parent, i3) { // from class: com.vkontakte.android.fragments.market.MarketFragment.Adapter.3
                        {
                            Adapter.this = this;
                        }

                        @Override // com.vkontakte.android.ui.holder.commons.GridHolder
                        public GoodGridItemHolder createViewHolder(Context context) {
                            return new GoodGridItemHolder(parent);
                        }
                    };
                case 1:
                    if (!MarketFragment.this.isTablet) {
                        i = 2;
                    }
                    return new GridHolder<Good, GoodGridItemHolder>(parent, i * 2) { // from class: com.vkontakte.android.fragments.market.MarketFragment.Adapter.4
                        {
                            Adapter.this = this;
                        }

                        @Override // com.vkontakte.android.ui.holder.commons.GridHolder
                        public GoodGridItemHolder createViewHolder(Context context) {
                            return new GoodGridItemHolder(parent);
                        }
                    };
                case 2:
                    if (!MarketFragment.this.isTablet) {
                        i2 = 2;
                    }
                    return new GridHolder<GoodAlbum, GoodAlbumGridItemHolder>(parent, i2) { // from class: com.vkontakte.android.fragments.market.MarketFragment.Adapter.1
                        {
                            Adapter.this = this;
                        }

                        @Override // com.vkontakte.android.ui.holder.commons.GridHolder
                        public GoodAlbumGridItemHolder createViewHolder(Context context) {
                            return new GoodAlbumGridItemHolder(parent);
                        }
                    };
                case 3:
                    if (!MarketFragment.this.isTablet) {
                        i2 = 2;
                    }
                    return new GridHolder<GoodAlbum, GoodAlbumGridItemHolder>(parent, i2 * 2) { // from class: com.vkontakte.android.fragments.market.MarketFragment.Adapter.2
                        {
                            Adapter.this = this;
                        }

                        @Override // com.vkontakte.android.ui.holder.commons.GridHolder
                        public GoodAlbumGridItemHolder createViewHolder(Context context) {
                            return new GoodAlbumGridItemHolder(parent);
                        }
                    };
                case 4:
                    return new BottomButtonHolder(parent);
                case 5:
                    return TitleHolder.blackTitle(parent);
                default:
                    return null;
            }
        }
    }
}
