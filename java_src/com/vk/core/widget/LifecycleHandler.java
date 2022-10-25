package com.vk.core.widget;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.SparseArray;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class LifecycleHandler extends Fragment implements Application.ActivityLifecycleCallbacks {
    private static final String FRAGMENT_TAG = "LifecycleHandler";
    private static final String KEY_ACTIVITY_REQUEST_CODES = "LifecycleHandler.activityRequests";
    private static final String KEY_PENDING_PERMISSION_REQUESTS = "LifecycleHandler.pendingPermissionRequests";
    private static final String KEY_PERMISSION_REQUEST_CODES = "LifecycleHandler.permissionRequests";
    private Activity activity;
    private boolean attached;
    private boolean destroyed;
    private boolean hasRegisteredCallbacks;
    private LifecycleListener lifecycleListener;
    private SparseArray<String> permissionRequestMap = new SparseArray<>();
    private SparseArray<String> activityRequestMap = new SparseArray<>();
    private ArrayList<PendingPermissionRequest> pendingPermissionRequests = new ArrayList<>();

    public LifecycleHandler() {
        setRetainInstance(true);
        setHasOptionsMenu(true);
    }

    @Nullable
    private static LifecycleHandler findInActivity(@NonNull Activity activity) {
        LifecycleHandler lifecycleHandler = (LifecycleHandler) activity.getFragmentManager().findFragmentByTag(FRAGMENT_TAG);
        if (lifecycleHandler != null) {
            lifecycleHandler.registerActivityListener(activity);
        }
        return lifecycleHandler;
    }

    @NonNull
    public static LifecycleHandler install(@NonNull Activity activity) {
        LifecycleHandler lifecycleHandler = findInActivity(activity);
        if (lifecycleHandler == null) {
            lifecycleHandler = new LifecycleHandler();
            activity.getFragmentManager().beginTransaction().add(lifecycleHandler, FRAGMENT_TAG).commit();
        }
        lifecycleHandler.registerActivityListener(activity);
        return lifecycleHandler;
    }

    @Nullable
    public Activity getLifecycleActivity() {
        return this.activity;
    }

    public LifecycleListener getLifecycleListener() {
        return this.lifecycleListener;
    }

    public void setLifecycleListener(LifecycleListener lifecycleListener) {
        this.lifecycleListener = lifecycleListener;
    }

    private void registerActivityListener(@NonNull Activity activity) {
        this.activity = activity;
        if (!this.hasRegisteredCallbacks) {
            this.hasRegisteredCallbacks = true;
            activity.getApplication().registerActivityLifecycleCallbacks(this);
        }
    }

    @Override // android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState != null) {
            StringSparseArrayParceler permissionParcel = (StringSparseArrayParceler) savedInstanceState.getParcelable(KEY_PERMISSION_REQUEST_CODES);
            this.permissionRequestMap = permissionParcel != null ? permissionParcel.getStringSparseArray() : new SparseArray<>();
            StringSparseArrayParceler activityParcel = (StringSparseArrayParceler) savedInstanceState.getParcelable(KEY_ACTIVITY_REQUEST_CODES);
            this.activityRequestMap = activityParcel != null ? activityParcel.getStringSparseArray() : new SparseArray<>();
            ArrayList<PendingPermissionRequest> pendingRequests = savedInstanceState.getParcelableArrayList(KEY_PENDING_PERMISSION_REQUESTS);
            if (pendingRequests == null) {
                pendingRequests = new ArrayList<>();
            }
            this.pendingPermissionRequests = pendingRequests;
        }
    }

    @Override // android.app.Fragment
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putParcelable(KEY_PERMISSION_REQUEST_CODES, new StringSparseArrayParceler(this.permissionRequestMap));
        outState.putParcelable(KEY_ACTIVITY_REQUEST_CODES, new StringSparseArrayParceler(this.activityRequestMap));
        outState.putParcelableArrayList(KEY_PENDING_PERMISSION_REQUESTS, this.pendingPermissionRequests);
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        if (this.activity != null) {
            this.activity.getApplication().unregisterActivityLifecycleCallbacks(this);
            destroyRouters();
            this.activity = null;
        }
    }

    @Override // android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.destroyed = false;
        setAttached();
    }

    @Override // android.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        this.destroyed = false;
        setAttached();
    }

    @Override // android.app.Fragment
    public void onDetach() {
        super.onDetach();
        this.attached = false;
        destroyRouters();
    }

    private void setAttached() {
        if (!this.attached) {
            this.attached = true;
            for (int i = this.pendingPermissionRequests.size() - 1; i >= 0; i--) {
                PendingPermissionRequest request = this.pendingPermissionRequests.remove(i);
                requestPermissions(request.instanceId, request.permissions, request.requestCode);
            }
        }
    }

    private void destroyRouters() {
        if (!this.destroyed) {
            this.destroyed = true;
            if (this.activity != null && this.lifecycleListener != null) {
                this.lifecycleListener.onActivityDestroyed(this.activity);
            }
        }
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        String instanceId = this.activityRequestMap.get(requestCode);
        if (instanceId != null && this.lifecycleListener != null) {
            this.lifecycleListener.onActivityResult(instanceId, requestCode, resultCode, data);
        }
    }

    @Override // android.app.Fragment
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        String instanceId = this.permissionRequestMap.get(requestCode);
        if (instanceId != null && this.lifecycleListener != null) {
            this.lifecycleListener.onRequestPermissionsResult(instanceId, requestCode, permissions, grantResults);
        }
    }

    @Override // android.app.Fragment
    public boolean shouldShowRequestPermissionRationale(@NonNull String permission) {
        Boolean handled;
        return (this.lifecycleListener == null || (handled = this.lifecycleListener.handleRequestedPermission(permission)) == null) ? super.shouldShowRequestPermissionRationale(permission) : handled.booleanValue();
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        super.onCreateOptionsMenu(menu, inflater);
        if (this.lifecycleListener != null) {
            this.lifecycleListener.onCreateOptionsMenu(menu, inflater);
        }
    }

    @Override // android.app.Fragment
    public void onPrepareOptionsMenu(Menu menu) {
        super.onPrepareOptionsMenu(menu);
        if (this.lifecycleListener != null) {
            this.lifecycleListener.onPrepareOptionsMenu(menu);
        }
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        if (this.lifecycleListener == null || !this.lifecycleListener.onOptionsItemSelected(item)) {
            return super.onOptionsItemSelected(item);
        }
        return true;
    }

    public void registerForActivityResult(@NonNull String instanceId, int requestCode) {
        this.activityRequestMap.put(requestCode, instanceId);
    }

    public void unregisterForActivityResults(@NonNull String instanceId) {
        for (int i = this.activityRequestMap.size() - 1; i >= 0; i--) {
            if (instanceId.equals(this.activityRequestMap.get(this.activityRequestMap.keyAt(i)))) {
                this.activityRequestMap.removeAt(i);
            }
        }
    }

    public void startActivityForResult(@NonNull String instanceId, @NonNull Intent intent, int requestCode) {
        registerForActivityResult(instanceId, requestCode);
        startActivityForResult(intent, requestCode);
    }

    public void startActivityForResult(@NonNull String instanceId, @NonNull Intent intent, int requestCode, @Nullable Bundle options) {
        registerForActivityResult(instanceId, requestCode);
        startActivityForResult(intent, requestCode, options);
    }

    @TargetApi(23)
    public void requestPermissions(@NonNull String instanceId, @NonNull String[] permissions, int requestCode) {
        if (this.attached) {
            this.permissionRequestMap.put(requestCode, instanceId);
            requestPermissions(permissions, requestCode);
            return;
        }
        this.pendingPermissionRequests.add(new PendingPermissionRequest(instanceId, permissions, requestCode));
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        if (this.activity == null && findInActivity(activity) == this) {
            this.activity = activity;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
        if (this.activity == activity && this.lifecycleListener != null) {
            this.lifecycleListener.onActivityStarted(activity);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(Activity activity) {
        if (this.activity == activity && this.lifecycleListener != null) {
            this.lifecycleListener.onActivityResumed(activity);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
        if (this.activity == activity && this.lifecycleListener != null) {
            this.lifecycleListener.onActivityPaused(activity);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
        if (this.activity == activity && this.lifecycleListener != null) {
            this.lifecycleListener.onActivityStopped(activity);
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(Activity activity) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class PendingPermissionRequest implements Parcelable {
        public static final Parcelable.Creator<PendingPermissionRequest> CREATOR = new Parcelable.Creator<PendingPermissionRequest>() { // from class: com.vk.core.widget.LifecycleHandler.PendingPermissionRequest.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public PendingPermissionRequest mo474createFromParcel(Parcel in) {
                return new PendingPermissionRequest(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public PendingPermissionRequest[] mo475newArray(int size) {
                return new PendingPermissionRequest[size];
            }
        };
        final String instanceId;
        final String[] permissions;
        final int requestCode;

        PendingPermissionRequest(@NonNull String instanceId, @NonNull String[] permissions, int requestCode) {
            this.instanceId = instanceId;
            this.permissions = permissions;
            this.requestCode = requestCode;
        }

        private PendingPermissionRequest(Parcel in) {
            this.instanceId = in.readString();
            this.permissions = in.createStringArray();
            this.requestCode = in.readInt();
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            out.writeString(this.instanceId);
            out.writeStringArray(this.permissions);
            out.writeInt(this.requestCode);
        }
    }
}
