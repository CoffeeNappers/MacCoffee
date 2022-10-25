package com.vkontakte.android.fragments.location;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.media.TransportMediator;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.MapsInitializer;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.places.PlacesAdd;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.navigation.Navigator;
import java.util.Locale;
import me.grishka.appkit.fragments.ContainerFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class SelectGeoPointFragment extends ContainerFragment {
    String mAddress;
    boolean mCreateMode;
    Drawable mDoneDrawable;
    MenuItem mDoneItem;
    boolean mHasLocation;
    double mLatitude;
    double mLongitude;
    boolean mMapMoved;
    MapView mMapView;
    Marker mMarker;
    LatLng mSelectedPoint;
    TextView mSubtitle;
    TextView mTitle;
    String mTitleText;
    boolean firstLocUpdate = true;
    boolean mDoneEnabled = false;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(SelectGeoPointFragment.class, new TabletDialogActivity.Builder().setGravity(17).setInputMode(16).setMaxWidth(V.dp(720.0f)).setMinSpacing(V.dp(32.0f)).windowBackgroundResource(17170443));
        }

        public Builder create(String title, String address) {
            this.args.putBoolean("create_place", true);
            this.args.putString("place_title", title);
            this.args.putString("place_address", address);
            return this;
        }

        public Builder place(double latitude, double longitude) {
            this.args.putDouble("prevLat", latitude);
            this.args.putDouble("prevLon", longitude);
            return this;
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        try {
            MapsInitializer.initialize(activity);
            if (!ActivityUtils.requireGoogleMaps(activity, true)) {
                throw new Exception();
            }
        } catch (Exception e) {
            activity.finish();
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
        this.mCreateMode = getArguments().getBoolean("create_place");
        this.mTitleText = getArguments().getString("place_title");
        this.mAddress = getArguments().getString("place_address");
        this.mHasLocation = getArguments().containsKey("prevLat");
        this.mLatitude = getArguments().getDouble("prevLat");
        this.mLongitude = getArguments().getDouble("prevLon");
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_select_geo_point, container, false);
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        this.mDoneItem = menu.add(0, R.id.done, 0, this.mCreateMode ? R.string.done : R.string.select);
        MenuItem menuItem = this.mDoneItem;
        Drawable drawable = getResources().getDrawable(R.drawable.ic_check_24dp);
        this.mDoneDrawable = drawable;
        menuItem.setIcon(drawable).setShowAsAction(2);
        this.mDoneItem.setEnabled(this.mDoneEnabled);
        this.mDoneDrawable.setAlpha(this.mDoneEnabled ? 255 : TransportMediator.KEYCODE_MEDIA_PAUSE);
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.done) {
            onDone();
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(this.mCreateMode ? R.string.add_place : R.string.select_geo_point);
        getToolbar().setNavigationIcon(this.isTablet ? R.drawable.ic_temp_close : R.drawable.ic_ab_back);
        getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
        view.findViewById(R.id.create).setVisibility(this.mCreateMode ? 0 : 8);
        this.mTitle = (TextView) view.findViewById(R.id.title);
        this.mSubtitle = (TextView) view.findViewById(R.id.subtitle);
        this.mTitle.setText(this.mTitleText);
        this.mSubtitle.setText(this.mAddress);
        initMap(view, savedInstanceState);
    }

    public void initMap(View view, Bundle savedInstanceState) {
        this.mMapView = (MapView) view.findViewById(R.id.map);
        this.mMapView.onCreate(savedInstanceState);
        this.mMapView.getMapAsync(SelectGeoPointFragment$$Lambda$1.lambdaFactory$(this));
    }

    public /* synthetic */ void lambda$initMap$3(GoogleMap map) {
        if (getActivity() != null) {
            if (map == null) {
                Toast.makeText(getActivity(), (int) R.string.error, 0).show();
                getActivity().finish();
                return;
            }
            map.setMyLocationEnabled(true);
            map.setOnMyLocationChangeListener(SelectGeoPointFragment$$Lambda$4.lambdaFactory$(this, map));
            map.setOnCameraChangeListener(SelectGeoPointFragment$$Lambda$5.lambdaFactory$(this));
            map.setOnMapClickListener(SelectGeoPointFragment$$Lambda$6.lambdaFactory$(this, map));
            if (this.mHasLocation) {
                initMarker(map, this.mLatitude, this.mLongitude);
            }
        }
    }

    public /* synthetic */ void lambda$null$0(GoogleMap map, Location location) {
        if (!this.mMapMoved || this.firstLocUpdate) {
            LatLng latLng = new LatLng(location.getLatitude(), location.getLongitude());
            this.mSelectedPoint = latLng;
            map.moveCamera(CameraUpdateFactory.newLatLngZoom(latLng, 15.0f));
        }
        if (this.firstLocUpdate) {
            enableDone(true);
            if (!this.mHasLocation) {
                initMarker(map, location.getLatitude(), location.getLongitude());
            }
            this.firstLocUpdate = false;
        }
    }

    public /* synthetic */ void lambda$null$1(CameraPosition pos) {
        this.mMapMoved = true;
    }

    public /* synthetic */ void lambda$null$2(GoogleMap map, LatLng point) {
        if (this.mMarker != null) {
            this.mMarker.setPosition(point);
        } else {
            initMarker(map, point.latitude, point.longitude);
            enableDone(true);
        }
        this.mSelectedPoint = point;
    }

    void initMarker(GoogleMap map, double latitude, double longitude) {
        this.mMarker = map.addMarker(new MarkerOptions().position(new LatLng(latitude, longitude)).draggable(true));
        map.setOnMarkerDragListener(new GoogleMap.OnMarkerDragListener() { // from class: com.vkontakte.android.fragments.location.SelectGeoPointFragment.1
            {
                SelectGeoPointFragment.this = this;
            }

            @Override // com.google.android.gms.maps.GoogleMap.OnMarkerDragListener
            public void onMarkerDragStart(Marker marker) {
            }

            @Override // com.google.android.gms.maps.GoogleMap.OnMarkerDragListener
            public void onMarkerDragEnd(Marker marker) {
                SelectGeoPointFragment.this.mSelectedPoint = marker.getPosition();
            }

            @Override // com.google.android.gms.maps.GoogleMap.OnMarkerDragListener
            public void onMarkerDrag(Marker marker) {
            }
        });
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        if (this.mMapView != null) {
            this.mMapView.onResume();
        }
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        if (this.mMapView != null) {
            this.mMapView.onPause();
        }
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        if (this.mMapView != null) {
            this.mMapView.onDestroy();
        }
    }

    void enableDone(boolean enable) {
        if (enable != this.mDoneEnabled) {
            this.mDoneEnabled = enable;
            if (this.mDoneDrawable != null) {
                this.mDoneDrawable.setAlpha(this.mDoneEnabled ? 255 : TransportMediator.KEYCODE_MEDIA_PAUSE);
            }
            if (this.mDoneItem != null) {
                this.mDoneItem.setEnabled(this.mDoneEnabled);
            }
        }
    }

    void onDone() {
        Activity activity = getActivity();
        final GeoAttachment att = new GeoAttachment();
        att.lat = this.mSelectedPoint.latitude;
        att.lon = this.mSelectedPoint.longitude;
        if (!this.mCreateMode) {
            ProgressDialog progress = new ProgressDialog(activity);
            progress.setMessage(getResources().getString(R.string.loading));
            progress.setCancelable(false);
            progress.show();
            new Thread(SelectGeoPointFragment$$Lambda$2.lambdaFactory$(this, att, progress, activity)).start();
            return;
        }
        new PlacesAdd(this.mTitle.getText().toString(), this.mSubtitle.getText().toString(), att.lat, att.lon).setCallback(new SimpleCallback<Integer>(getActivity()) { // from class: com.vkontakte.android.fragments.location.SelectGeoPointFragment.2
            {
                SelectGeoPointFragment.this = this;
            }

            @Override // com.vkontakte.android.api.Callback
            public void success(Integer id) {
                att.id = id.intValue();
                att.address = SelectGeoPointFragment.this.mSubtitle.getText().toString();
                att.title = SelectGeoPointFragment.this.mTitle.getText().toString();
                Intent intent = new Intent();
                intent.putExtra("point", att);
                SelectGeoPointFragment.this.getActivity().setResult(-1, intent);
                SelectGeoPointFragment.this.getActivity().finish();
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    public /* synthetic */ void lambda$onDone$5(GeoAttachment att, ProgressDialog progress, Activity activity) {
        String country = "??";
        try {
            Geocoder geocoder = new Geocoder(getActivity().getBaseContext(), Locale.getDefault());
            Address address = geocoder.getFromLocation(att.lat, att.lon, 1).get(0);
            String addressLine = address.getAddressLine(0);
            country = address.getCountryCode();
            att.address = addressLine;
        } catch (Exception x) {
            Log.w("vk", x);
        }
        String finalCountry = country;
        getActivity().runOnUiThread(SelectGeoPointFragment$$Lambda$3.lambdaFactory$(progress, att, finalCountry, activity));
    }

    public static /* synthetic */ void lambda$null$4(ProgressDialog progress, GeoAttachment att, String finalCountry, Activity activity) {
        ViewUtils.dismissDialogSafety(progress);
        Intent intent = new Intent();
        intent.putExtra("point", att);
        intent.putExtra("country", finalCountry);
        activity.setResult(-1, intent);
        activity.finish();
    }
}
