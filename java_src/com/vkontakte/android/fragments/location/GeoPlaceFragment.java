package com.vkontakte.android.fragments.location;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.MapsInitializer;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.GeoPlace;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.TabletDialogActivity;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.places.PlacesGetInfo;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.userlist.CheckinsListFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.ui.PhotoStripView;
import com.vkontakte.android.ui.cardview.CardDrawable;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.fragments.LoaderFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class GeoPlaceFragment extends LoaderFragment {
    private static final String KEY_MAP_SAVED_STATE = "mapState";
    GeoAttachment mAttachment;
    boolean mCheckInMode;
    TextView mInfo;
    MapView mMap;
    VKImageView mPhoto;
    String mPhotoURL;
    GeoPlace mPlace;
    String mStatusText;
    TextView mSubtitle;
    List<String> mUserPhotos = new ArrayList();
    PhotoStripView mUsers;
    TextView mUsersCount;
    View mUsersWrap;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder() {
            super(GeoPlaceFragment.class, new TabletDialogActivity.Builder().setGravity(17).setInputMode(16).setMaxWidth(V.dp(720.0f)).setMinSpacing(V.dp(32.0f)).windowBackgroundResource(17170443));
        }

        public Builder point(GeoAttachment att) {
            this.args.putParcelable("point", att);
            return this;
        }

        public Builder checkin(boolean checkin) {
            this.args.putBoolean("checkin", checkin);
            return this;
        }
    }

    public GeoPlaceFragment() {
        setLayout(R.layout.window_content_layout);
    }

    public static Navigator start(GeoAttachment att, boolean checkin) {
        return new Builder().point(att).checkin(checkin);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        if (!ActivityUtils.requireGoogleMaps(activity, true)) {
            Toast.makeText(activity, (int) R.string.error, 0).show();
            activity.finish();
            return;
        }
        MapsInitializer.initialize(activity);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mAttachment = (GeoAttachment) getArguments().getParcelable("point");
        this.mCheckInMode = getArguments().getBoolean("checkin");
    }

    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        loadData();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(R.string.place);
        getToolbar().setNavigationIcon(R.drawable.ic_ab_back);
        getToolbar().setNavigationOnClickListener((View.OnClickListener) getActivity());
        ViewGroup mapContainer = (ViewGroup) view.findViewById(R.id.map_wrap);
        TextView title = (TextView) view.findViewById(R.id.title);
        this.mPhoto = (VKImageView) view.findViewById(R.id.photo);
        this.mInfo = (TextView) view.findViewById(R.id.info);
        this.mSubtitle = (TextView) view.findViewById(R.id.subtitle);
        this.mUsersCount = (TextView) view.findViewById(R.id.users_count);
        this.mUsersWrap = view.findViewById(R.id.users_wrap);
        this.mUsers = (PhotoStripView) view.findViewById(R.id.users);
        ViewUtils.setBackgroundWithViewPadding(view.findViewById(R.id.root), new CardDrawable(getResources(), -1, V.dp(2.0f), true));
        View.OnClickListener mClickListener = GeoPlaceFragment$$Lambda$1.lambdaFactory$(this);
        title.setText(this.mAttachment.title);
        this.mInfo.setText(this.mAttachment.address);
        this.mSubtitle.setText(this.mStatusText);
        invalidate();
        if (this.mCheckInMode) {
            view.findViewById(R.id.action).setOnClickListener(mClickListener);
        } else {
            view.findViewById(R.id.action).setVisibility(8);
        }
        view.findViewById(R.id.header).setOnClickListener(mClickListener);
        this.mInfo.setOnClickListener(mClickListener);
        this.mUsersWrap.setOnClickListener(mClickListener);
        if (Global.isAppInstalled(getActivity(), "com.google.android.apps.maps") && GooglePlayServicesUtil.isGooglePlayServicesAvailable(VKApplication.context) == 0) {
            this.mMap = new MapView(getActivity(), new GoogleMapOptions().compassEnabled(false).zoomControlsEnabled(false)) { // from class: com.vkontakte.android.fragments.location.GeoPlaceFragment.1
                @Override // android.view.ViewGroup, android.view.View
                public boolean dispatchTouchEvent(MotionEvent ev) {
                    return false;
                }
            };
            Bundle mapState = savedInstanceState != null ? savedInstanceState.getBundle(KEY_MAP_SAVED_STATE) : null;
            this.mMap.onCreate(mapState);
            mapContainer.addView(this.mMap);
            this.mMap.getMapAsync(GeoPlaceFragment$$Lambda$2.lambdaFactory$(this));
            mapContainer.setOnClickListener(mClickListener);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$1(View v) {
        switch (v.getId()) {
            case R.id.map_wrap /* 2131755617 */:
            case R.id.info /* 2131755697 */:
                try {
                    startActivity(new Intent("android.intent.action.VIEW", Uri.parse("geo:" + this.mPlace.lat + "," + this.mPlace.lon + "?z=18&q=" + this.mPlace.lat + "," + this.mPlace.lon)));
                    return;
                } catch (Throwable th) {
                    new VKAlertDialog.Builder(getActivity()).setTitle(R.string.maps_not_available).setMessage(R.string.maps_not_available_descr).setPositiveButton(R.string.open_google_play, GeoPlaceFragment$$Lambda$3.lambdaFactory$(this)).setNegativeButton(R.string.close, (DialogInterface.OnClickListener) null).show();
                    return;
                }
            case R.id.action /* 2131755703 */:
                Intent intent = new Intent();
                intent.putExtra("point", this.mAttachment);
                getActivity().setResult(-1, intent);
                getActivity().finish();
                return;
            case R.id.header /* 2131756212 */:
                if (this.mPlace != null && this.mPlace.groupID != 0) {
                    new ProfileFragment.Builder(-this.mPlace.groupID).go(getActivity());
                    return;
                }
                return;
            case R.id.users_wrap /* 2131756213 */:
                Bundle args = new Bundle();
                args.putInt("place_id", this.mAttachment.id);
                args.putString("title", getResources().getString(R.string.checked_in));
                Navigate.to(CheckinsListFragment.class, args, getActivity());
                return;
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0(DialogInterface dialog, int which) {
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("https://play.google.com/store/apps/details?id=com.google.android.apps.maps"));
        intent.addFlags(268435456);
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onViewCreated$2(GoogleMap map) {
        if (getActivity() != null) {
            map.setMyLocationEnabled(true);
            map.getUiSettings().setMyLocationButtonEnabled(false);
            map.moveCamera(CameraUpdateFactory.newCameraPosition(new CameraPosition.Builder().target(new LatLng(this.mAttachment.lat, this.mAttachment.lon)).zoom(16.0f).build()));
            map.addMarker(new MarkerOptions().position(new LatLng(this.mAttachment.lat, this.mAttachment.lon)));
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.place_header, container, false);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    protected void doLoadData() {
        this.currentRequest = new PlacesGetInfo(this.mAttachment.id).setCallback(new SimpleCallback<PlacesGetInfo.Result>(this) { // from class: com.vkontakte.android.fragments.location.GeoPlaceFragment.2
            @Override // com.vkontakte.android.api.Callback
            public void success(PlacesGetInfo.Result result) {
                GeoPlaceFragment.this.currentRequest = null;
                GeoPlaceFragment.this.mPlace = result.place;
                GeoPlaceFragment.this.mUserPhotos = result.userPhotos;
                GeoPlaceFragment.this.mStatusText = result.groupStatus;
                GeoPlaceFragment.this.mPhotoURL = result.groupPhoto;
                GeoPlaceFragment.this.invalidate();
                GeoPlaceFragment.this.dataLoaded();
                GeoPlaceFragment.this.showContent();
            }
        }).exec((Context) getActivity());
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

    @Override // me.grishka.appkit.fragments.LoaderFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        if (this.mMap != null) {
            this.mMap.onDestroy();
        }
        this.mMap = null;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        if (this.currentRequest != null) {
            this.currentRequest.cancel();
            this.currentRequest = null;
        }
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

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    void invalidate() {
        String address;
        int i = 0;
        this.mSubtitle.setText(this.mStatusText);
        this.mSubtitle.setVisibility(TextUtils.isEmpty(this.mStatusText) ? 8 : 0);
        if (this.mPlace != null) {
            address = this.mPlace.address;
        } else {
            address = this.mAttachment != null ? this.mAttachment.address : null;
        }
        this.mInfo.setVisibility(!TextUtils.isEmpty(address) ? 0 : 8);
        this.mInfo.setText(address);
        boolean hasUsers = this.mPlace != null && this.mPlace.checkins > 0;
        View view = this.mUsersWrap;
        if (!hasUsers) {
            i = 8;
        }
        view.setVisibility(i);
        if (hasUsers) {
            int count = Math.min(10, this.mUserPhotos.size());
            this.mUsers.setPadding(V.dp(4.0f));
            this.mUsers.setCount(count);
            this.mUsersCount.setText(String.valueOf(this.mPlace.checkins));
            this.mPhoto.load(this.mPhotoURL);
            this.mUsers.load(this.mUserPhotos);
        }
    }
}
