package com.vkontakte.android;

import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import com.vk.attachpicker.util.LocationUtils;
import com.vk.core.network.Network;
import com.vk.core.network.NetworkProxy;
import com.vkontakte.android.api.APIException;
import com.vkontakte.android.api.utils.UtilsProxiesPreferences;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.VKAlertBannerFragment;
import com.vkontakte.android.fragments.VKAlertFragment;
import com.vkontakte.android.utils.L;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
/* loaded from: classes.dex */
public class NetworkProxyPreferences implements NetworkProxy.ProxyCallback, Runnable {
    private static final int FAILURE_ATTEMPTS = 2;
    private Disposable currentReq;
    private int failureAttempts = 0;
    private Consumer<UtilsProxiesPreferences.Result> success = new Consumer<UtilsProxiesPreferences.Result>() { // from class: com.vkontakte.android.NetworkProxyPreferences.1
        @Override // io.reactivex.functions.Consumer
        public void accept(@NonNull UtilsProxiesPreferences.Result result) throws Exception {
            NetworkProxyPreferences.this.currentReq = null;
            L.d(NetworkProxyPreferences.class.getSimpleName(), "response=" + result.type);
            switch (result.type) {
                case 1:
                    NetworkProxyPreferences.this.onProxyDisabled();
                    return;
                case 2:
                    NetworkProxyPreferences.this.onProxyEnabled();
                    return;
                case 3:
                case 4:
                    if (result.type == 3) {
                        NetworkProxyPreferences.this.onProxyDisabled();
                    }
                    Context context = AppStateTracker.getCurrentActivity();
                    if (context == null) {
                        context = VKApplication.context;
                    }
                    new VKAlertFragment.Builder().setIcon(R.drawable.emoji).setTitle(result.title).setMessage(result.message).setPositiveButtonTitle(result.button).setUrl(result.url).show(context, VKAlertBannerFragment.class);
                    return;
                default:
                    return;
            }
        }
    };
    private Consumer<Throwable> failure = new Consumer<Throwable>() { // from class: com.vkontakte.android.NetworkProxyPreferences.2
        @Override // io.reactivex.functions.Consumer
        public void accept(@NonNull Throwable throwable) throws Exception {
            String str = null;
            NetworkProxyPreferences.this.currentReq = null;
            if (throwable instanceof APIException) {
                APIException e = (APIException) throwable;
                Object[] objArr = new Object[2];
                objArr[0] = NetworkProxyPreferences.class.getSimpleName();
                StringBuilder append = new StringBuilder().append("error=");
                if (e != null && e.errorResponse != null) {
                    str = e.errorResponse.toString();
                }
                objArr[1] = append.append(str).toString();
                L.d(objArr);
                if (NetworkProxyPreferences.access$104(NetworkProxyPreferences.this) < 2) {
                    NetworkProxyPreferences.this.checkProxies();
                    return;
                }
            }
            NetworkProxyPreferences.this.onProxyDisabled();
        }
    };

    static /* synthetic */ int access$104(NetworkProxyPreferences x0) {
        int i = x0.failureAttempts + 1;
        x0.failureAttempts = i;
        return i;
    }

    @Override // com.vk.core.network.NetworkProxy.ProxyCallback
    public void onProxyHostConnected() {
        checkProxies();
    }

    @Override // com.vk.core.network.NetworkProxy.ProxyCallback
    public void onProxyHostDisconnected() {
        onProxyDisabled();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onProxyEnabled() {
        this.failureAttempts = 0;
        Network.getInstance().enableProxy(true);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onProxyDisabled() {
        this.failureAttempts = 0;
        Network.getInstance().disableProxy(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void checkProxies() {
        if (this.currentReq == null) {
            this.currentReq = new UtilsProxiesPreferences(getUid(), getInfo()).toObservable().subscribe(this.success, this.failure);
        }
    }

    private String getUid() {
        VKAccount account = VKAccountManager.getCurrent();
        return (account == null || !account.isReal()) ? "empty" : Integer.toString(account.getUid());
    }

    private HashMap<String, String> getInfo() {
        Context context = VKApplication.context;
        HashMap<String, String> info = new HashMap<>();
        VKAccount account = VKAccountManager.getCurrent();
        if (account != null && account.isReal()) {
            info.put("country", Integer.toString(account.getCountry()));
        }
        info.put("user_agent", Network.getInstance().getUserAgent().userAgent());
        try {
            Locale current = context.getResources().getConfiguration().locale;
            if (current != null) {
                info.put("locale_country", current.getCountry());
                info.put("locale_display_country", current.getDisplayCountry());
                info.put("locale_display_language", current.getDisplayLanguage());
                info.put("locale_language", current.getLanguage());
            }
            Location location = LocationUtils.getLastKnownLocation();
            if (location != null) {
                info.put("location_latitude", Double.toString(location.getLatitude()));
                info.put("location_longitude", Double.toString(location.getLongitude()));
                Geocoder geo = new Geocoder(context);
                List<Address> addresses = geo.getFromLocation(location.getLatitude(), location.getLongitude(), 1);
                for (Address address : addresses) {
                    info.put("address_country_code", address.getCountryCode());
                    info.put("address_country_name", address.getCountryName());
                }
            }
        } catch (Exception e) {
        }
        return info;
    }

    @Override // java.lang.Runnable
    public void run() {
        Network.getInstance().proxy().verify(this);
    }
}
