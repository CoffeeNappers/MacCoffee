package com.vkontakte.android.data;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.Activity;
import android.app.Fragment;
import android.app.PendingIntent;
import android.app.ProgressDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentSender;
import android.content.ServiceConnection;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;
import com.android.vending.billing.IInAppBillingService;
import com.facebook.internal.AnalyticsEvents;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.APIException;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.models.PaymentType;
import com.vkontakte.android.api.store.StoreBuyProduct;
import com.vkontakte.android.api.store.StorePurchase;
import com.vkontakte.android.data.PurchasesManager.Product;
import com.vkontakte.android.fragments.VotesFragment;
import com.vkontakte.android.functions.F2;
import com.vkontakte.android.navigation.Navigator;
import com.vkontakte.android.utils.L;
import io.reactivex.Observable;
import io.reactivex.functions.Consumer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class PurchasesManager<D extends Product> {
    private static final int API_VERSION = 3;
    private static final int PRICES_PAGE_SIZE = 18;
    private static final int REQUEST_BUY_VOTES = 1002;
    private static final int REQUEST_PAY = 1001;
    private static final String TAG = "PurchasesManager";
    private static final String TYPE_INAPP = "inapp";
    private static final String TYPE_SUBS = "subs";
    private static IInAppBillingService mService;
    private static String sPackage;
    private boolean ignoreValidation;
    private final Activity mActivity;
    private final Fragment mFragment;
    private D mLastPurchase;
    private OnSuccessListener<D> mOnSuccess;
    private static final Object mServiceInitMonitor = new Object();
    private static boolean mServiceInit = false;
    private static ServiceConnection mServiceConn = new ServiceConnection() { // from class: com.vkontakte.android.data.PurchasesManager.1
        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName name) {
            IInAppBillingService unused = PurchasesManager.mService = null;
        }

        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName name, IBinder service) {
            synchronized (PurchasesManager.mServiceInitMonitor) {
                IInAppBillingService unused = PurchasesManager.mService = IInAppBillingService.Stub.asInterface(service);
                boolean unused2 = PurchasesManager.mServiceInit = false;
                PurchasesManager.mServiceInitMonitor.notifyAll();
            }
        }
    };

    /* loaded from: classes2.dex */
    public interface OnSuccessListener<Product> {
        void onSuccess(Product product);
    }

    /* loaded from: classes2.dex */
    public interface Product {
        void afterPurchased(Result result);

        String getDeveloperPayload();

        int getId();

        String getMerchantProductId();

        PaymentType getPaymentType();

        int getPrice();

        String getRefer();

        String getType();

        boolean isFree();
    }

    public static void init(Context context) {
        Intent intent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
        intent.setPackage("com.android.vending");
        List<ResolveInfo> info = context.getPackageManager().queryIntentServices(intent, 0);
        if (info != null && info.size() > 0) {
            mServiceInit = true;
            intent.setComponent(new ComponentName(info.get(0).serviceInfo.packageName, info.get(0).serviceInfo.name));
            context.bindService(intent, mServiceConn, 1);
        }
        sPackage = context.getPackageName();
    }

    private static boolean isPlayStoreInstalled() {
        if (!Global.isAppInstalled(VKApplication.context, "com.android.vending")) {
            return false;
        }
        Intent intent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
        intent.setPackage("com.android.vending");
        return VKApplication.context.getPackageManager().resolveService(intent, 0) != null;
    }

    private static boolean hasGoogleAccount() {
        AccountManager am = AccountManager.get(VKApplication.context);
        Account[] accounts = am.getAccountsByType("com.google");
        return accounts.length > 0;
    }

    public static boolean canUseInApps() {
        return isPlayStoreInstalled() && hasGoogleAccount();
    }

    public static <Product> void getGooglePlayPrices(Map<String, Product> products, F2<Void, Product, String> setter) {
        getGooglePlayPrices(products, setter, TYPE_INAPP);
    }

    public static <Product> void getGooglePlayPricesSubs(Map<String, Product> products, F2<Void, Product, String> setter) {
        getGooglePlayPrices(products, setter, "subs");
    }

    private static <Product> void getGooglePlayPrices(Map<String, Product> products, F2<Void, Product, String> setter, String type) {
        ArrayList<String> ids = new ArrayList<>(new LinkedHashMap(products).keySet());
        int iterations = (ids.size() / 18) + (ids.size() % 18 == 0 ? 0 : 1);
        for (int i = 0; i < iterations; i++) {
            int start = i * 18;
            int end = Math.min((i + 1) * 18, ids.size());
            getGooglePlayPrices(products, new ArrayList(ids.subList(start, end)), setter, type);
        }
    }

    private static <Product> void getGooglePlayPrices(Map<String, Product> products, ArrayList<String> ids, F2<Void, Product, String> setter, String type) {
        Bundle bundle = new Bundle();
        bundle.putStringArrayList("ITEM_ID_LIST", ids);
        IInAppBillingService gps = getGooglePlayService();
        if (gps != null) {
            try {
                if (gps.isBillingSupported(3, getPackage(), type) == 0) {
                    Bundle details = gps.getSkuDetails(3, getPackage(), type, bundle);
                    int responseCode = details.getInt("RESPONSE_CODE");
                    if (responseCode == 0) {
                        ArrayList<String> responseList = details.getStringArrayList("DETAILS_LIST");
                        Iterator<String> it = responseList.iterator();
                        while (it.hasNext()) {
                            String thisResponse = it.next();
                            JSONObject object = new JSONObject(thisResponse);
                            String sku = object.optString("productId");
                            if (sku != null) {
                                setter.f(products.get(sku), object.optString("price"));
                            }
                        }
                    }
                }
            } catch (Exception e) {
                Log.e("VKApplication", "#getGooglePlayPrices(): Error appkit_loading prices from Google Play", e);
            }
        }
    }

    private static IInAppBillingService getGooglePlayService() {
        if (mServiceInit) {
            synchronized (mServiceInitMonitor) {
                while (mServiceInit) {
                    try {
                        mServiceInitMonitor.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return mService;
    }

    public static String getPackage() {
        return sPackage;
    }

    public PurchasesManager(Activity activity) {
        this(activity, null);
    }

    public PurchasesManager(Fragment fragment) {
        this(fragment.getActivity(), fragment);
    }

    private PurchasesManager(Activity activity, @Nullable Fragment fragment) {
        this.ignoreValidation = false;
        this.mActivity = activity;
        this.mFragment = fragment;
    }

    @NonNull
    public PurchasesManager<D> ignoreValidation() {
        this.ignoreValidation = true;
        return this;
    }

    public void purchase(@NonNull D item, @Nullable OnSuccessListener<D> onSuccess) {
        if (item.isFree()) {
            purchaseFreeItem(item, onSuccess);
        } else if (item.getPaymentType() != null) {
            switch (item.getPaymentType()) {
                case Balance:
                    purchaseFromBalance(item, onSuccess);
                    return;
                case Subs:
                    purchaseSubs(item, onSuccess, false);
                    return;
                case Inapp:
                    purchaseInapp(item, onSuccess);
                    return;
                default:
                    return;
            }
        }
    }

    public void restore(@NonNull D item, @Nullable OnSuccessListener<D> onSuccess) {
        if (!item.isFree() && item.getPaymentType() == PaymentType.Subs) {
            purchaseSubs(item, onSuccess, true);
        }
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == -1) {
            if (requestCode == 1001) {
                int responseCode = data.getIntExtra("RESPONSE_CODE", 0);
                String purchaseData = data.getStringExtra("INAPP_PURCHASE_DATA");
                if (responseCode == 6) {
                    Toast.makeText(this.mActivity, (int) R.string.error, 0).show();
                } else if (responseCode == 0) {
                    try {
                        JSONObject jo = new JSONObject(purchaseData);
                        String orderId = jo.optString("orderId");
                        String productId = jo.getString("productId");
                        String token = jo.getString("purchaseToken");
                        int id = this.mLastPurchase.getId();
                        finishPurchase(getGooglePlayService(), id, orderId, productId, token);
                    } catch (Exception e) {
                        com.vkontakte.android.Log.e(TAG, "Error during processing #onActivityResult", e);
                    }
                }
            } else if (requestCode == 1002) {
                purchaseFromBalance(this.mLastPurchase, this.mOnSuccess);
            }
        }
    }

    private void purchaseFreeItem(@NonNull final D product, @Nullable final OnSuccessListener<D> onSuccess) {
        new StorePurchase(product.getId(), null, null, null, product.getType()).setCallback(new SimpleCallback<Result>(this.mActivity) { // from class: com.vkontakte.android.data.PurchasesManager.2
            @Override // com.vkontakte.android.api.Callback
            public void success(Result result) {
                if (!TextUtils.isEmpty(result.message) || !TextUtils.isEmpty(result.error_message)) {
                    new VKAlertDialog.Builder(PurchasesManager.this.mActivity).setTitle(R.string.error).setMessage(!TextUtils.isEmpty(result.message) ? result.message : result.error_message).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
                }
                if (result.success == 1 || result.state == 1) {
                    PurchasesManager.this.mOnSuccess = null;
                    PurchasesManager.this.mLastPurchase = null;
                    product.afterPurchased(result);
                    if (onSuccess != null) {
                        onSuccess.onSuccess(product);
                    }
                }
            }
        }).wrapProgress(this.mActivity).exec((Context) this.mActivity);
    }

    private void purchaseFromBalance(@NonNull final D product, final OnSuccessListener<D> onSuccess) {
        new StoreBuyProduct(product.getId(), product.getType(), product.getRefer()).setCallback(new SimpleCallback<Result>(this.mActivity) { // from class: com.vkontakte.android.data.PurchasesManager.3
            @Override // com.vkontakte.android.api.Callback
            public void success(Result result) {
                if (!TextUtils.isEmpty(result.message) || !TextUtils.isEmpty(result.error_message)) {
                    new VKAlertDialog.Builder(PurchasesManager.this.mActivity).setTitle(R.string.error).setMessage(!TextUtils.isEmpty(result.message) ? result.message : result.error_message).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null).show();
                }
                if (result.success == 1) {
                    PurchasesManager.this.mOnSuccess = null;
                    PurchasesManager.this.mLastPurchase = null;
                    product.afterPurchased(result);
                    if (onSuccess != null) {
                        onSuccess.onSuccess(product);
                    }
                }
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                if (error.getCodeValue() == 504) {
                    PurchasesManager.this.showNotEnoughVotesDialog(product.getPrice());
                } else {
                    super.fail(error);
                }
            }
        }).wrapProgress(this.mActivity).exec((Context) this.mActivity);
    }

    private void purchaseSubs(@NonNull D product, @Nullable OnSuccessListener<D> onSuccess, boolean restoreOnly) {
        try {
            IInAppBillingService service = getGooglePlayService();
            if (service != null && service.isBillingSupported(3, getPackage(), "subs") == 0) {
                PurchasedData purchasedItem = null;
                ArrayList<PurchasedData> purchasedData = new ArrayList<>();
                String continueToken = null;
                do {
                    Bundle bundle = service.getPurchases(3, getPackage(), "subs", continueToken);
                    ArrayList<String> purchaseItemList = bundle.getStringArrayList("INAPP_PURCHASE_ITEM_LIST");
                    ArrayList<String> purchaseDataList = bundle.getStringArrayList("INAPP_PURCHASE_DATA_LIST");
                    ArrayList<String> signatures = bundle.getStringArrayList("INAPP_DATA_SIGNATURE_LIST");
                    if (purchaseItemList != null && purchaseDataList != null && signatures != null) {
                        for (int i = 0; i < purchaseItemList.size(); i++) {
                            try {
                                purchasedData.add(new PurchasedData(purchaseDataList.get(i), signatures.get(i)));
                            } catch (Exception e) {
                                L.e(e, new Object[0]);
                            }
                        }
                    }
                    continueToken = bundle.getString("INAPP_CONTINUATION_TOKEN");
                } while (!TextUtils.isEmpty(continueToken));
                Iterator<PurchasedData> it = purchasedData.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    PurchasedData data = it.next();
                    int id = data.getId();
                    if (id == product.getId()) {
                        purchasedItem = data;
                        break;
                    }
                }
                Bundle buyIntent = service.getBuyIntent(3, getPackage(), product.getMerchantProductId(), "subs", product.getDeveloperPayload());
                int code = buyIntent.getInt("RESPONSE_CODE");
                this.mLastPurchase = product;
                this.mOnSuccess = onSuccess;
                if (purchasedItem != null || code == 7) {
                    processRestoreSubs(service, purchasedItem);
                    return;
                } else if (!restoreOnly) {
                    startIntentSenderForResult(((PendingIntent) buyIntent.getParcelable("BUY_INTENT")).getIntentSender(), 1001, null, 0, 0, 0);
                    return;
                } else {
                    return;
                }
            }
            throw new PayNotAvailableException();
        } catch (IntentSender.SendIntentException e2) {
            e = e2;
            com.vkontakte.android.Log.e(TAG, "Error starting inapp #purchaseInapp", e);
            Toast.makeText(this.mActivity, (int) R.string.error_purchasing, 0).show();
        } catch (RemoteException e3) {
            e = e3;
            com.vkontakte.android.Log.e(TAG, "Error starting inapp #purchaseInapp", e);
            Toast.makeText(this.mActivity, (int) R.string.error_purchasing, 0).show();
        } catch (PayNotAvailableException e4) {
            e = e4;
            com.vkontakte.android.Log.e(TAG, "Error starting inapp #purchaseInapp", e);
            Toast.makeText(this.mActivity, (int) R.string.error_purchasing, 0).show();
        }
    }

    private void purchaseInapp(@NonNull D product, @Nullable OnSuccessListener<D> onSuccess) {
        try {
            IInAppBillingService service = getGooglePlayService();
            if (service.isBillingSupported(3, getPackage(), TYPE_INAPP) == 0) {
                Bundle buyIntent = service.getBuyIntent(3, getPackage(), product.getMerchantProductId(), TYPE_INAPP, product.getDeveloperPayload());
                int code = buyIntent.getInt("RESPONSE_CODE");
                this.mLastPurchase = product;
                this.mOnSuccess = onSuccess;
                if (code == 7) {
                    processRestore(service);
                    return;
                } else {
                    startIntentSenderForResult(((PendingIntent) buyIntent.getParcelable("BUY_INTENT")).getIntentSender(), 1001, null, 0, 0, 0);
                    return;
                }
            }
            throw new PayNotAvailableException();
        } catch (IntentSender.SendIntentException | RemoteException | PayNotAvailableException e) {
            com.vkontakte.android.Log.e(TAG, "Error starting inapp #purchaseInapp", e);
            Toast.makeText(this.mActivity, (int) R.string.error_purchasing, 0).show();
        }
    }

    private void processRestoreSubs(IInAppBillingService service, PurchasedData purchasedData) {
        ProgressDialog progress = new ProgressDialog(this.mActivity);
        progress.setMessage(this.mActivity.getString(R.string.loading));
        progress.setCancelable(false);
        progress.show();
        try {
            consumePurchase(service, purchasedData.getId(), purchasedData.orderId, purchasedData.productId, purchasedData.purchaseToken, progress);
        } catch (Exception e) {
            Toast.makeText(this.mActivity, (int) R.string.error_purchasing, 0).show();
            ViewUtils.dismissDialogSafety(progress);
        }
    }

    private void processRestore(IInAppBillingService service) {
        ProgressDialog progress = new ProgressDialog(this.mActivity);
        progress.setMessage(this.mActivity.getString(R.string.loading));
        progress.setCancelable(false);
        progress.show();
        try {
            Bundle info = service.getPurchases(3, getPackage(), TYPE_INAPP, null);
            ArrayList<String> dataList = info.getStringArrayList("INAPP_PURCHASE_DATA_LIST");
            String data = dataList.remove(0);
            JSONObject jsonObject = new JSONObject(data);
            String dp = jsonObject.getString("developerPayload");
            String token = jsonObject.getString("purchaseToken");
            String orderId = jsonObject.optString("orderId");
            String productId = jsonObject.getString("productId");
            int id = Integer.parseInt(dp.split(",")[2]);
            consumePurchase(service, id, orderId, productId, token, progress);
        } catch (Exception e) {
            com.vkontakte.android.Log.e(TAG, "Error during restore inapp #processRestore", e);
            Toast.makeText(this.mActivity, (int) R.string.error_purchasing, 0).show();
            ViewUtils.dismissDialogSafety(progress);
        }
    }

    private void finishPurchase(IInAppBillingService service, int id, String orderId, String productId, String token) {
        ProgressDialog progress = new ProgressDialog(this.mActivity);
        progress.setMessage(this.mActivity.getString(R.string.completing_purchase));
        progress.setCancelable(false);
        progress.show();
        consumePurchase(service, id, orderId, productId, token, progress);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void consumePurchase(final IInAppBillingService service, final int id, final String orderId, final String productId, final String token, final ProgressDialog progress) {
        Observable<Result> observable = new StorePurchase(id, productId, orderId, token, this.mLastPurchase.getType()).ignoreValidation(this.ignoreValidation).toObservable();
        observable.subscribe(new Consumer<Result>() { // from class: com.vkontakte.android.data.PurchasesManager.4
            @Override // io.reactivex.functions.Consumer
            public void accept(@io.reactivex.annotations.NonNull Result r) throws Exception {
                if (r.state == 0 || (r.state < 0 && r.error_fatal)) {
                    PurchasesManager.this.consumePurchase(service, id, orderId, productId, token, progress);
                } else if (r.state != 1) {
                    Toast.makeText(PurchasesManager.this.mActivity, (int) R.string.error_purchasing, 0).show();
                    ViewUtils.dismissDialogSafety(progress);
                } else {
                    try {
                        service.consumePurchase(3, PurchasesManager.getPackage(), token);
                        PurchasesManager.this.mLastPurchase.afterPurchased(null);
                        if (PurchasesManager.this.mOnSuccess != null) {
                            PurchasesManager.this.mOnSuccess.onSuccess(PurchasesManager.this.mLastPurchase);
                        }
                        PurchasesManager.this.mOnSuccess = null;
                        PurchasesManager.this.mLastPurchase = null;
                    } catch (RemoteException e) {
                        com.vkontakte.android.Log.e(PurchasesManager.TAG, "Error during #consumePurchase", e);
                        Toast.makeText(PurchasesManager.this.mActivity, (int) R.string.error_purchasing, 0).show();
                    }
                    ViewUtils.dismissDialogSafety(progress);
                }
            }
        }, new Consumer<Throwable>() { // from class: com.vkontakte.android.data.PurchasesManager.5
            @Override // io.reactivex.functions.Consumer
            public void accept(@io.reactivex.annotations.NonNull Throwable throwable) throws Exception {
                if (throwable instanceof APIException) {
                    VKAPIRequest.VKErrorResponse err = ((APIException) throwable).errorResponse;
                    if (err != null) {
                        APIUtils.showErrorToast(PurchasesManager.this.mActivity, err.getCode(), err.message);
                    }
                    ViewUtils.dismissDialogSafety(progress);
                    return;
                }
                L.e(throwable, new Object[0]);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showNotEnoughVotesDialog(final int price) {
        new VKAlertDialog.Builder(this.mActivity).setTitle(R.string.error).setMessage(R.string.gifts_error_balance).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.data.PurchasesManager.6
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                Bundle args = new Bundle();
                args.putInt(VotesFragment.Extra.RequiredBalance, price);
                new Navigator(VotesFragment.class, args).forResult(PurchasesManager.this.mActivity, 1002);
            }
        }).show();
    }

    private void startActivityForResult(Intent intent, int requestCode) {
        if (this.mFragment != null) {
            this.mFragment.startActivityForResult(intent, requestCode);
        } else {
            this.mActivity.startActivityForResult(intent, requestCode);
        }
    }

    private void startIntentSenderForResult(IntentSender intent, int requestCode, @Nullable Intent fillInIntent, int flagsMask, int flagsValues, int extraFlags) throws IntentSender.SendIntentException {
        this.mActivity.startIntentSenderForResult(intent, requestCode, fillInIntent, flagsMask, flagsValues, extraFlags);
    }

    /* loaded from: classes2.dex */
    public static class PayNotAvailableException extends Exception {
        private Integer mErrorCode;

        public PayNotAvailableException(Throwable throwable) {
            super(throwable);
        }

        public PayNotAvailableException(int errorCode) {
            this.mErrorCode = Integer.valueOf(errorCode);
        }

        public PayNotAvailableException() {
        }

        public int getCode() {
            if (this.mErrorCode == null) {
                return -1;
            }
            return this.mErrorCode.intValue();
        }

        public boolean hasCode() {
            return this.mErrorCode != null;
        }
    }

    /* loaded from: classes2.dex */
    public static class Result {
        public boolean error_fatal;
        public String error_message;
        public String message;
        public JSONObject product;
        public int state;
        public int success;

        public Result(JSONObject source) {
            boolean z = true;
            this.success = source.optInt("success");
            this.state = source.optInt("state");
            this.message = source.optString("message");
            this.error_message = source.optString(AnalyticsEvents.PARAMETER_SHARE_ERROR_MESSAGE);
            this.error_fatal = source.optInt("error_fatal") != 1 ? false : z;
            this.product = source.optJSONObject("product");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class PurchasedData {
        boolean autoRenewing;
        String developerPayload;
        String orderId;
        String packageName;
        String productId;
        int purchaseState;
        long purchaseTime;
        String purchaseToken;
        String signature;

        PurchasedData(String data, String signature) throws JSONException {
            JSONObject jsonObject = new JSONObject(data);
            this.orderId = jsonObject.optString("orderId");
            this.packageName = jsonObject.optString("packageName");
            this.productId = jsonObject.optString("productId");
            this.purchaseTime = jsonObject.optLong("purchaseTime");
            this.purchaseState = jsonObject.optInt("purchaseState");
            this.developerPayload = jsonObject.optString("developerPayload");
            this.purchaseToken = jsonObject.optString("purchaseToken");
            this.autoRenewing = jsonObject.optBoolean("autoRenewing");
            this.signature = signature;
        }

        int getId() {
            if (this.developerPayload != null && this.developerPayload.matches("[0-9]+,[0-9]+,[0-9A-Za-z_]+")) {
                return Integer.parseInt(this.developerPayload.split(",")[1]);
            }
            if (this.developerPayload != null && this.developerPayload.matches("[0-9]+,1,[0-9]+,[0-9A-Za-z_]+")) {
                return Integer.parseInt(this.developerPayload.split(",")[2]);
            }
            return -1;
        }
    }
}
