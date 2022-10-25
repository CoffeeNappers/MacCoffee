package com.vkontakte.android.fragments.location;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Canvas;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.MapsInitializer;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.vk.attachpicker.AttachActivity;
import com.vk.attachpicker.SupportExternalToolbarContainer;
import com.vk.attachpicker.util.LocationUtils;
import com.vk.attachpicker.util.Utils;
import com.vk.attachpicker.widget.MapPlaceholderDrawable;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKImageView;
import com.vk.media.camera.CameraUtils;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.GeoPlace;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.places.PlacesSearch;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.background.AsyncTask;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.fragments.VKRecyclerFragment;
import com.vkontakte.android.fragments.location.SelectGeoPointFragment;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.recyclerview.BottomDividerDecoration;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class CheckInFragment extends VKRecyclerFragment<GeoPlace> implements BackListener, SupportExternalToolbarContainer {
    static final int CHECK_IN_RESULT = 8345;
    static final int CREATE_PLACE_RESULT = 8346;
    private static final String KEY_MAP_SAVED_STATE = "mapState";
    static final int LIST_PADDING = V.dp(8.0f);
    static final int MAP_HEIGHT = V.dp(150.0f);
    final Adapter mAdapter;
    GeoPlace mAddPlace;
    String mAddress;
    GeoPlace mCurrentLocation;
    Location mLocation;
    MapView mMap;
    ViewGroup mMapContainer;
    private boolean mMapInitialized;
    final List<GeoPlace> mNearLocations;
    String mQuery;
    final List<GeoPlace> mSearchLocations;
    boolean mSearchMode;
    SearchViewWrapper mSearchView;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(CheckInFragment.class, new TabletDialogActivity.Builder().setGravity(17).setInputMode(16).setMaxWidth(V.dp(720.0f)).setMinSpacing(V.dp(32.0f)).windowBackgroundResource(17170443));
        }
    }

    public static Navigator start() {
        return new Builder();
    }

    private boolean isInContextOfAttachActivity() {
        return getActivity() instanceof AttachActivity;
    }

    public CheckInFragment() {
        super(Integer.MAX_VALUE);
        this.mNearLocations = new ArrayList();
        this.mSearchLocations = new ArrayList();
        this.mAdapter = new Adapter();
        this.mCurrentLocation = new GeoPlace();
        this.mAddPlace = new GeoPlace();
        this.mMapInitialized = false;
        setLayout(R.layout.window_content_layout);
        setListLayoutId(R.layout.checkin_fragment);
    }

    @Override // com.vk.attachpicker.SupportExternalToolbarContainer
    public ViewGroup provideToolbar(Context context) {
        return getToolbar();
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

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        if (!isInContextOfAttachActivity()) {
            this.mMapInitialized = false;
            if (!ActivityUtils.requireGoogleMaps(activity, true)) {
                Toast.makeText(activity, (int) R.string.error, 0).show();
                activity.finish();
                return;
            }
            MapsInitializer.initialize(activity);
            this.mMapInitialized = true;
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRefreshEnabled(false);
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        initToolbar();
        initMap(view, savedInstanceState);
        initList();
        initMockLocations();
        if (isInContextOfAttachActivity()) {
            getToolbar().setVisibility(8);
            view.setBackgroundColor(-1);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showMapNotAvailable() {
        TextView textViewError = (TextView) getView().findViewById(R.id.text_maps_not_available);
        textViewError.setVisibility(0);
        this.mMapContainer.setVisibility(8);
        this.list.setVisibility(8);
        setEmptyText("");
        onDataLoaded(new ArrayList(), false);
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        this.mSearchView.onCreateOptionsMenu(menu);
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        if (this.mMap != null) {
            this.mMap.onPause();
        }
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        if (this.mMap != null) {
            this.mMap.onResume();
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        cancelLoading();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        if (this.mMap != null) {
            Bundle mapState = new Bundle();
            this.mMap.onSaveInstanceState(mapState);
            state.putBundle(KEY_MAP_SAVED_STATE, mapState);
        }
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == -1 && requestCode == CHECK_IN_RESULT) {
            getActivity().setResult(-1, data);
            getActivity().finish();
        }
        if (resultCode == -1 && requestCode == CREATE_PLACE_RESULT) {
            getActivity().setResult(-1, data);
            getActivity().finish();
        }
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.mSearchView == null || !this.mSearchView.isExpanded()) {
            return false;
        }
        this.mSearchView.setExpanded(false);
        return true;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        int i;
        if (this.mLocation == null) {
            if (!this.mMapInitialized) {
                onDataLoaded(new ArrayList(), false);
                return;
            }
            return;
        }
        cancelLoading();
        double latitude = this.mLocation.getLatitude();
        double longitude = this.mLocation.getLongitude();
        if (!TextUtils.isEmpty(this.mQuery)) {
            i = 3;
        } else {
            i = this.mLocation.getAccuracy() > 100.0f ? 2 : 1;
        }
        this.currentRequest = new PlacesSearch(latitude, longitude, i, this.mQuery).setCallback(new SimpleCallback<VKList<GeoPlace>>(this) { // from class: com.vkontakte.android.fragments.location.CheckInFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<GeoPlace> result) {
                CheckInFragment.this.currentRequest = null;
                CheckInFragment.this.data.clear();
                CheckInFragment.this.onDataLoaded(result, false);
                if (TextUtils.isEmpty(CheckInFragment.this.mQuery)) {
                    CheckInFragment.this.mNearLocations.clear();
                    CheckInFragment.this.mNearLocations.add(CheckInFragment.this.mCurrentLocation);
                    CheckInFragment.this.mNearLocations.addAll(result);
                } else {
                    CheckInFragment.this.mSearchLocations.clear();
                    CheckInFragment.this.mSearchLocations.add(CheckInFragment.this.mAddPlace);
                    CheckInFragment.this.mSearchLocations.addAll(result);
                }
                CheckInFragment.this.updateList();
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                super.fail(error);
                CheckInFragment.this.currentRequest = null;
            }
        }).exec((Context) getActivity());
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        return this.mAdapter;
    }

    void initMockLocations() {
        this.mCurrentLocation.title = getString(R.string.current_location);
        this.mCurrentLocation.id = -1;
        this.mCurrentLocation.address = getString(R.string.loading);
        this.mAddPlace.title = getString(R.string.add_place);
        this.mAddPlace.id = -2;
    }

    void initList() {
        this.list.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.fragments.location.CheckInFragment.2
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                View focus = CheckInFragment.this.getActivity().getCurrentFocus();
                if (newState != 0 && focus != null) {
                    InputMethodManager imm = (InputMethodManager) CheckInFragment.this.getActivity().getSystemService("input_method");
                    imm.hideSoftInputFromWindow(focus.getWindowToken(), 0);
                    focus.clearFocus();
                }
            }

            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                CheckInFragment.this.onScroll();
            }
        });
        this.list.addItemDecoration(new BottomDividerDecoration(null, Math.max(1, V.dp(0.5f)), 637534208, 0).setPadding(V.dp(76.0f), 0));
        setListPadding();
    }

    private void setListPadding() {
        this.list.setPadding(0, (this.mSearchMode ? 0 : MAP_HEIGHT) + LIST_PADDING, 0, LIST_PADDING);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onScroll() {
        View child = this.list == null ? null : this.list.getChildAt(0);
        if (child != null) {
            int firstChildTop = child.getTop() - LIST_PADDING;
            int position = this.list.getChildAdapterPosition(child);
            if (position > 0) {
                firstChildTop -= child.getHeight() * position;
            }
            if (this.mMapContainer != null) {
                this.mMapContainer.setTranslationY(firstChildTop - this.mMapContainer.getMeasuredHeight());
            }
            if (this.mMap != null) {
                this.mMap.invalidate();
            }
        }
    }

    void initToolbar() {
        setTitle(R.string.check_in_title);
        if (!isInContextOfAttachActivity()) {
            getToolbar().setNavigationIcon(this.isTablet ? R.drawable.ic_temp_close : R.drawable.ic_ab_back);
            getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
        }
        this.mSearchView = new SearchViewWrapper(getActivity(), new SearchViewWrapper.SearchListener() { // from class: com.vkontakte.android.fragments.location.CheckInFragment.3
            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryConfirmed(String query) {
                CheckInFragment.this.mQuery = query;
                CheckInFragment.this.loadData();
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQuerySubmitted(String query) {
            }

            @Override // com.vkontakte.android.ui.SearchViewWrapper.SearchListener
            public void onQueryChanged(String query) {
                CheckInFragment.this.setSearchMode(query != null && query.length() > 0);
                CheckInFragment.this.updateList();
            }
        });
        setHasOptionsMenu(true);
    }

    void setSearchMode(boolean searchMode) {
        if (this.mSearchMode != searchMode) {
            this.mSearchMode = searchMode;
            if (this.mMapContainer != null) {
                this.mMapContainer.setVisibility(this.mSearchMode ? 8 : 0);
                setListPadding();
                if (!this.mSearchMode) {
                    this.list.smoothScrollToPosition(0);
                }
            }
        }
    }

    void initMap(View view, Bundle savedInstanceState) {
        this.mMapContainer = (ViewGroup) view.findViewById(R.id.map_wrap);
        if (isInContextOfAttachActivity()) {
            new AnonymousClass4().execPool(new Void[0]);
        } else if (this.mMapInitialized) {
            this.mMap = new MapView(getActivity(), isInContextOfAttachActivity() ? new GoogleMapOptions().liteMode(true) : new GoogleMapOptions().compassEnabled(false).zoomControlsEnabled(false)) { // from class: com.vkontakte.android.fragments.location.CheckInFragment.5
                @Override // android.view.ViewGroup, android.view.View
                public boolean dispatchTouchEvent(MotionEvent ev) {
                    return false;
                }

                @Override // android.view.ViewGroup, android.view.View
                public void dispatchDraw(Canvas c) {
                    c.save();
                    c.clipRect(0.0f, 0.0f, getWidth(), getHeight() - getTranslationY());
                    super.dispatchDraw(c);
                    c.restore();
                }
            };
            Bundle mapState = savedInstanceState != null ? savedInstanceState.getBundle(KEY_MAP_SAVED_STATE) : null;
            this.mMap.onCreate(mapState);
            this.mMapContainer.addView(this.mMap, -1, MAP_HEIGHT);
            this.mMap.getMapAsync(CheckInFragment$$Lambda$1.lambdaFactory$(this));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.location.CheckInFragment$4  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass4 extends AsyncTask<Void, Void, Location> {
        AnonymousClass4() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public Location doInBackground(Void... args) throws Throwable {
            return LocationUtils.getLastKnownLocation();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.background.AsyncTask
        public void onPostExecute(Location location) {
            Activity a = CheckInFragment.this.getActivity();
            if (a == null || location == null) {
                CheckInFragment.this.showMapNotAvailable();
                return;
            }
            VKImageView imageMapView = new VKImageView(a);
            imageMapView.setPlaceholderImage(new MapPlaceholderDrawable());
            Utils.runOnPreDraw(imageMapView, CheckInFragment$4$$Lambda$1.lambdaFactory$(this));
            imageMapView.setScaleType(ImageView.ScaleType.CENTER_CROP);
            CheckInFragment.this.mMapContainer.addView(imageMapView, -1, CheckInFragment.MAP_HEIGHT);
            String locationString = location.getLatitude() + "," + location.getLongitude();
            StringBuilder urlBuilder = new StringBuilder("https://maps.googleapis.com/maps/api/staticmap?center=");
            urlBuilder.append(locationString);
            urlBuilder.append("&zoom=16&scale=2&size=");
            urlBuilder.append(CameraUtils.Settings.LOW_WIDTH).append("x").append((CheckInFragment.MAP_HEIGHT * CameraUtils.Settings.LOW_WIDTH) / Screen.realWidth());
            urlBuilder.append("&markers=color:blue%7C");
            urlBuilder.append(locationString);
            imageMapView.load(urlBuilder.toString());
            CheckInFragment.this.mLocation = location;
            CheckInFragment.this.loadData();
            CheckInFragment.this.loadPlace();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onPostExecute$0() {
            CheckInFragment.this.onScroll();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$initMap$1(GoogleMap map) {
        if (getActivity() != null) {
            if (map == null) {
                if (!isInContextOfAttachActivity()) {
                    Toast.makeText(getActivity(), (int) R.string.error, 0).show();
                    getActivity().finish();
                    return;
                }
                return;
            }
            map.setMyLocationEnabled(true);
            map.getUiSettings().setMyLocationButtonEnabled(false);
            map.getUiSettings().setZoomControlsEnabled(false);
            if (isInContextOfAttachActivity()) {
                map.getUiSettings().setMapToolbarEnabled(false);
            }
            map.setOnMyLocationChangeListener(CheckInFragment$$Lambda$2.lambdaFactory$(this, map));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0(GoogleMap map, Location loc) {
        CameraPosition cameraPosition = new CameraPosition.Builder().target(new LatLng(loc.getLatitude(), loc.getLongitude())).zoom(16.0f).build();
        map.moveCamera(CameraUpdateFactory.newCameraPosition(cameraPosition));
        if (this.mLocation != null) {
            float distance = this.mLocation.distanceTo(loc);
            if (distance > 20.0f || (this.mLocation.getAccuracy() > 100.0f && loc.getAccuracy() < 100.0f)) {
                this.mLocation = loc;
                if (this.mSearchView.getText().length() == 0) {
                    loadData();
                    loadPlace();
                }
            }
        }
        if (this.mLocation == null) {
            this.mLocation = loc;
            loadData();
            loadPlace();
        }
    }

    void loadPlace() {
        new AsyncTask<Context, Void, String>() { // from class: com.vkontakte.android.fragments.location.CheckInFragment.6
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.vkontakte.android.background.AsyncTask
            public String doInBackground(Context... args) throws Throwable {
                Geocoder geocoder = new Geocoder(args[0]);
                List<Address> addresses = geocoder.getFromLocation(CheckInFragment.this.mLocation.getLatitude(), CheckInFragment.this.mLocation.getLongitude(), 1);
                Address address = addresses.get(0);
                List<String> result = new ArrayList<>();
                if (address.getThoroughfare() != null) {
                    result.add(address.getThoroughfare());
                }
                if (address.getSubThoroughfare() != null) {
                    result.add(address.getSubThoroughfare());
                }
                if (address.getFeatureName() != null && !address.getFeatureName().equals(address.getSubThoroughfare())) {
                    result.add(address.getFeatureName());
                }
                String finalResult = TextUtils.join(", ", result);
                if (finalResult == null || "null".equals(finalResult)) {
                    return CheckInFragment.this.getString(R.string.loading);
                }
                return finalResult;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.vkontakte.android.background.AsyncTask
            public void onPostExecute(String s) {
                super.onPostExecute((AnonymousClass6) s);
                CheckInFragment.this.mAddress = s;
                CheckInFragment.this.updateList();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.vkontakte.android.background.AsyncTask
            public void onError(Throwable t) {
                super.onError(t);
                Log.w("vk", t);
            }
        }.execPool(getActivity().getBaseContext());
    }

    /* loaded from: classes2.dex */
    private class Adapter extends UsableRecyclerView.Adapter {
        private Adapter() {
        }

        GeoPlace get(int position) {
            return (CheckInFragment.this.mSearchMode ? CheckInFragment.this.mSearchLocations : CheckInFragment.this.mNearLocations).get(position);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder */
        public RecyclerView.ViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new PlaceHolder(parent);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
            ((PlaceHolder) holder).bind(get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return (CheckInFragment.this.mSearchMode ? CheckInFragment.this.mSearchLocations : CheckInFragment.this.mNearLocations).size();
        }
    }

    /* loaded from: classes2.dex */
    private class PlaceHolder extends RecyclerHolder<GeoPlace> implements View.OnClickListener {
        final VKImageView mImage;
        final TextView mInfo;
        final TextView mSubtitle;
        final TextView mTitle;

        public PlaceHolder(@NonNull ViewGroup parent) {
            super((int) R.layout.places_item, parent);
            this.mTitle = (TextView) $(R.id.title);
            this.mSubtitle = (TextView) $(R.id.subtitle);
            this.mInfo = (TextView) $(R.id.info);
            this.mImage = (VKImageView) $(R.id.photo);
            this.itemView.setOnClickListener(this);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(GeoPlace place) {
            int i;
            this.mImage.load(place.photo);
            this.mTitle.setText(place.title);
            if (place.id >= 0) {
                if (place.distance > 0) {
                    String text = (String) place.getTag();
                    if (text == null) {
                        text = place.distance + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + getString(R.string.meters) + ", " + place.address;
                        place.setTag(text);
                    }
                    this.mSubtitle.setText(text);
                } else {
                    this.mSubtitle.setText(place.address);
                }
            } else {
                this.mSubtitle.setText(CheckInFragment.this.mAddress != null ? CheckInFragment.this.mAddress : getString(R.string.loading));
            }
            if (TextUtils.isEmpty(place.photo)) {
                VKImageView vKImageView = this.mImage;
                if (place.id == -1) {
                    i = R.drawable.ic_place_current_48dp;
                } else {
                    i = place.id == -2 ? R.drawable.ic_place_new_48dp : R.drawable.ic_attach_place_64dp;
                }
                vKImageView.setImageResource(i);
            }
            this.mInfo.setText(String.valueOf(place.checkins));
            this.mInfo.setVisibility(place.checkins > 0 ? 0 : 4);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (getItem().id) {
                case -2:
                    if (CheckInFragment.this.mLocation != null) {
                        new SelectGeoPointFragment.Builder().create(String.valueOf(CheckInFragment.this.mSearchView.getText()), CheckInFragment.this.mAddress).forResult(CheckInFragment.this, CheckInFragment.CREATE_PLACE_RESULT);
                        return;
                    }
                    return;
                case -1:
                    if (CheckInFragment.this.mLocation != null) {
                        GeoAttachment point = new GeoAttachment();
                        point.lat = CheckInFragment.this.mLocation.getLatitude();
                        point.lon = CheckInFragment.this.mLocation.getLongitude();
                        point.address = CheckInFragment.this.mAddress;
                        CheckInFragment.this.getActivity().setResult(-1, new Intent().putExtra("point", point));
                        CheckInFragment.this.getActivity().finish();
                        return;
                    }
                    return;
                default:
                    GeoAttachment att = new GeoAttachment();
                    att.lat = getItem().lat;
                    att.lon = getItem().lon;
                    att.address = getItem().address;
                    att.id = getItem().id;
                    att.title = getItem().title;
                    att.photo = getItem().photo;
                    GeoPlaceFragment.start(att, true).forResult(CheckInFragment.this, CheckInFragment.CHECK_IN_RESULT);
                    return;
            }
        }
    }
}
