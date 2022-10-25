package com.vkontakte.android.fragments;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.location.Location;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.users.UsersGetNearby;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.SuggestionsFragment;
@Deprecated
/* loaded from: classes.dex */
public class SuggestFriendsNearbyFragment extends SuggestionsFragment {
    private GoogleApiClient locationClient;
    private LocationListener locationListener = new LocationListener() { // from class: com.vkontakte.android.fragments.SuggestFriendsNearbyFragment.1
        @Override // com.google.android.gms.location.LocationListener
        public void onLocationChanged(Location location) {
            SuggestFriendsNearbyFragment.this.onLocationUpdated(location);
        }
    };
    private android.location.LocationListener locationListener2 = new android.location.LocationListener() { // from class: com.vkontakte.android.fragments.SuggestFriendsNearbyFragment.2
        @Override // android.location.LocationListener
        public void onLocationChanged(Location location) {
            SuggestFriendsNearbyFragment.this.onLocationUpdated(location);
        }

        @Override // android.location.LocationListener
        public void onStatusChanged(String provider, int status, Bundle extras) {
        }

        @Override // android.location.LocationListener
        public void onProviderEnabled(String provider) {
        }

        @Override // android.location.LocationListener
        public void onProviderDisabled(String provider) {
        }
    };
    private Location lastLocation = null;

    @Override // com.vkontakte.android.fragments.SuggestionsFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setStyle(1, 0);
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        startUpdatingLocation();
    }

    @Override // android.app.Fragment
    public void onPause() {
        stopUpdatingLocation();
        super.onPause();
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        FrameLayout fl = (FrameLayout) super.onCreateView(inflater, container, savedInstanceState);
        Context themedContext = new ContextThemeWrapper(getActivity(), 16973939);
        View placeholder = inflater.inflate(R.layout.friends_nearby_placeholder, (ViewGroup) null);
        fl.addView(placeholder, new FrameLayout.LayoutParams(-1, Global.scale(214.0f)));
        fl.removeView(this.progress);
        this.list.setEmptyView(placeholder);
        this.list.setDrawSelectorOnTop(true);
        fl.setMinimumHeight(Global.scale(214.0f));
        fl.setBackgroundColor(0);
        ImageView icon = (ImageView) placeholder.findViewById(R.id.nearby_icon);
        icon.setImageDrawable(new LayerDrawable(new Drawable[]{getResources().getDrawable(R.drawable.ic_nearby), new AnimatedGradientMaskDrawable(Global.getResBitmap(getResources(), R.drawable.ic_nearby))}));
        this.list.setSelector(R.drawable.highlight);
        LinearLayout content = new LinearLayout(themedContext);
        content.setOrientation(1);
        content.addView(fl, new LinearLayout.LayoutParams(-1, -2));
        View divider = new View(themedContext);
        TypedArray ta = themedContext.obtainStyledAttributes(new int[]{16843564});
        divider.setBackgroundDrawable(ta.getDrawable(0));
        this.list.setDivider(ta.getDrawable(0));
        this.list.setDividerHeight(Global.scale(1.0f));
        ta.recycle();
        content.addView(divider, new LinearLayout.LayoutParams(-1, Global.scale(1.0f)));
        Button qrBtn = new Button(themedContext, null, 16843567);
        qrBtn.setText(R.string.friends_nearby_qr);
        content.addView(qrBtn);
        qrBtn.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.SuggestFriendsNearbyFragment.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                BarcodeShareFragment fragment = new BarcodeShareFragment();
                SuggestFriendsNearbyFragment.this.getDialog().hide();
                SuggestFriendsNearbyFragment.this.onPause();
                fragment.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: com.vkontakte.android.fragments.SuggestFriendsNearbyFragment.3.1
                    @Override // android.content.DialogInterface.OnDismissListener
                    public void onDismiss(DialogInterface dialog) {
                        if (!SuggestFriendsNearbyFragment.this.isDetached() && SuggestFriendsNearbyFragment.this.getDialog() != null) {
                            SuggestFriendsNearbyFragment.this.getDialog().show();
                            SuggestFriendsNearbyFragment.this.onResume();
                        }
                    }
                });
                fragment.show(SuggestFriendsNearbyFragment.this.getFragmentManager(), "qrcode_dlg");
            }
        });
        return content;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onStart() {
        super.onStart();
        if (getDialog() != null) {
            int minDisplaySize = Math.min(getResources().getDisplayMetrics().widthPixels, getResources().getDisplayMetrics().heightPixels);
            getDialog().getWindow().setLayout(Math.min(minDisplaySize - Global.scale(20.0f), Global.scale(330.0f)), -2);
        }
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment
    protected void loadData() {
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment
    protected void onItemClick(int pos, long id, Object item) {
        new ProfileFragment.Builder((int) id).go(getActivity());
    }

    @Override // com.vkontakte.android.fragments.SuggestionsFragment
    protected String getListTitle() {
        return null;
    }

    private void startUpdatingLocation() {
        if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(getActivity()) == 0) {
            this.locationClient = new GoogleApiClient.Builder(getActivity()).addConnectionCallbacks(new GoogleApiClient.ConnectionCallbacks() { // from class: com.vkontakte.android.fragments.SuggestFriendsNearbyFragment.5
                @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
                public void onConnected(Bundle bundle) {
                    LocationServices.FusedLocationApi.requestLocationUpdates(SuggestFriendsNearbyFragment.this.locationClient, LocationRequest.create().setPriority(100), SuggestFriendsNearbyFragment.this.locationListener);
                }

                @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
                public void onConnectionSuspended(int i) {
                }
            }).addOnConnectionFailedListener(new GoogleApiClient.OnConnectionFailedListener() { // from class: com.vkontakte.android.fragments.SuggestFriendsNearbyFragment.4
                @Override // com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener
                public void onConnectionFailed(ConnectionResult connectionResult) {
                    SuggestFriendsNearbyFragment.this.locationClient = null;
                    SuggestFriendsNearbyFragment.this.startUpdationgLocationOld();
                }
            }).addApi(LocationServices.API).build();
            this.locationClient.connect();
            return;
        }
        startUpdationgLocationOld();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startUpdationgLocationOld() {
        LocationManager mgr = (LocationManager) VKApplication.context.getSystemService(FirebaseAnalytics.Param.LOCATION);
        try {
            mgr.requestLocationUpdates("network", 10000L, 100.0f, this.locationListener2);
        } catch (Exception e) {
        }
        try {
            mgr.requestLocationUpdates("gps", 10000L, 100.0f, this.locationListener2);
        } catch (Exception e2) {
        }
    }

    private void stopUpdatingLocation() {
        this.lastLocation = null;
        if (this.locationClient != null) {
            LocationServices.FusedLocationApi.removeLocationUpdates(this.locationClient, this.locationListener);
            this.locationClient.disconnect();
            this.locationClient = null;
            return;
        }
        LocationManager mgr = (LocationManager) VKApplication.context.getSystemService(FirebaseAnalytics.Param.LOCATION);
        mgr.removeUpdates(this.locationListener2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onLocationUpdated(Location loc) {
        boolean first = this.lastLocation == null;
        this.lastLocation = loc;
        if (first) {
            poll();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void poll() {
        if (this.lastLocation != null && getActivity() != null) {
            new UsersGetNearby(this.lastLocation.getLatitude(), this.lastLocation.getLongitude(), Math.round(this.lastLocation.getAccuracy()), 2, 300).setCallback(new Callback<VKList<UserProfile>>() { // from class: com.vkontakte.android.fragments.SuggestFriendsNearbyFragment.6
                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<UserProfile> _users) {
                    SuggestFriendsNearbyFragment.this.users.clear();
                    SuggestFriendsNearbyFragment.this.users.addAll(_users);
                    SuggestFriendsNearbyFragment.this.updateList();
                    new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.vkontakte.android.fragments.SuggestFriendsNearbyFragment.6.1
                        @Override // java.lang.Runnable
                        public void run() {
                            SuggestFriendsNearbyFragment.this.poll();
                        }
                    }, 2000L);
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.vkontakte.android.fragments.SuggestFriendsNearbyFragment.6.2
                        @Override // java.lang.Runnable
                        public void run() {
                            SuggestFriendsNearbyFragment.this.poll();
                        }
                    }, 5000L);
                }
            }).exec((Context) getActivity());
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.SuggestionsFragment
    public BaseAdapter getAdapter() {
        return new UsersAdapter();
    }

    /* loaded from: classes2.dex */
    protected class UsersAdapter extends SuggestionsFragment.UsersAdapter {
        protected UsersAdapter() {
            super();
        }

        @Override // com.vkontakte.android.fragments.SuggestionsFragment.UsersAdapter, android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            View v = super.getView(position, convertView, parent);
            v.setBackgroundDrawable(null);
            if (v.findViewById(R.id.view1) != null) {
                ((ViewGroup) v).removeView(v.findViewById(R.id.view1));
            }
            v.setPadding(0, 0, 0, 0);
            return v;
        }
    }

    /* loaded from: classes2.dex */
    private class AnimatedGradientMaskDrawable extends Drawable {
        private static final long DURATION = 5000;
        private Bitmap bitmap;
        private Paint colorPaint;
        private long animStartTime = System.currentTimeMillis();
        private Paint maskPaint = new Paint();
        private Paint bmpPaint = new Paint();

        public AnimatedGradientMaskDrawable(Bitmap b) {
            this.bitmap = b;
            this.bmpPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
            this.colorPaint = new Paint();
            this.colorPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
            this.colorPaint.setColor(-15108419);
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            canvas.saveLayer(new RectF(getBounds()), null, 31);
            float time = ((float) ((System.currentTimeMillis() - this.animStartTime) % 5000)) / 5000.0f;
            int alpha = ((double) time) < 0.7d ? 255 : Math.round((1.0f - ((time - 0.7f) / 0.3f)) * 255.0f);
            this.maskPaint.setShader(new RadialGradient(this.bitmap.getWidth() / 2, this.bitmap.getHeight() / 2, Math.max((float) Math.round(this.bitmap.getWidth() * 1.25d * time), 1.0E-5f), new int[]{0, alpha << 24, 0}, new float[]{0.2f, 0.5f, 1.0f}, Shader.TileMode.CLAMP));
            canvas.drawRect(getBounds(), this.maskPaint);
            canvas.drawBitmap(this.bitmap, (Rect) null, copyBounds(), this.bmpPaint);
            canvas.drawRect(getBounds(), this.colorPaint);
            canvas.restore();
            invalidateSelf();
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int alpha) {
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter cf) {
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return 0;
        }

        @Override // android.graphics.drawable.Drawable
        public int getIntrinsicWidth() {
            return this.bitmap.getWidth();
        }

        @Override // android.graphics.drawable.Drawable
        public int getIntrinsicHeight() {
            return this.bitmap.getHeight();
        }
    }
}
