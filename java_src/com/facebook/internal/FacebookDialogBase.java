package com.facebook.internal;

import android.app.Activity;
import android.support.v4.app.Fragment;
import android.util.Log;
import com.facebook.CallbackManager;
import com.facebook.FacebookCallback;
import com.facebook.FacebookDialog;
import com.facebook.FacebookException;
import com.facebook.FacebookSdk;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public abstract class FacebookDialogBase<CONTENT, RESULT> implements FacebookDialog<CONTENT, RESULT> {
    protected static final Object BASE_AUTOMATIC_MODE = new Object();
    private static final String TAG = "FacebookDialog";
    private final Activity activity;
    private final Fragment fragment;
    private List<FacebookDialogBase<CONTENT, RESULT>.ModeHandler> modeHandlers;
    private int requestCode;

    protected abstract AppCall createBaseAppCall();

    protected abstract List<FacebookDialogBase<CONTENT, RESULT>.ModeHandler> getOrderedModeHandlers();

    protected abstract void registerCallbackImpl(CallbackManagerImpl callbackManagerImpl, FacebookCallback<RESULT> facebookCallback);

    /* JADX INFO: Access modifiers changed from: protected */
    public FacebookDialogBase(Activity activity, int requestCode) {
        Validate.notNull(activity, "activity");
        this.activity = activity;
        this.fragment = null;
        this.requestCode = requestCode;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public FacebookDialogBase(Fragment fragment, int requestCode) {
        Validate.notNull(fragment, "fragment");
        this.fragment = fragment;
        this.activity = null;
        this.requestCode = requestCode;
        if (fragment.getActivity() == null) {
            throw new IllegalArgumentException("Cannot use a fragment that is not attached to an activity");
        }
    }

    @Override // com.facebook.FacebookDialog
    public final void registerCallback(CallbackManager callbackManager, FacebookCallback<RESULT> callback) {
        if (!(callbackManager instanceof CallbackManagerImpl)) {
            throw new FacebookException("Unexpected CallbackManager, please use the provided Factory.");
        }
        registerCallbackImpl((CallbackManagerImpl) callbackManager, callback);
    }

    @Override // com.facebook.FacebookDialog
    public final void registerCallback(CallbackManager callbackManager, FacebookCallback<RESULT> callback, int requestCode) {
        setRequestCode(requestCode);
        registerCallback(callbackManager, callback);
    }

    protected void setRequestCode(int requestCode) {
        if (FacebookSdk.isFacebookRequestCode(requestCode)) {
            throw new IllegalArgumentException("Request code " + requestCode + " cannot be within the range reserved by the Facebook SDK.");
        }
        this.requestCode = requestCode;
    }

    public int getRequestCode() {
        return this.requestCode;
    }

    @Override // com.facebook.FacebookDialog
    public boolean canShow(CONTENT content) {
        return canShowImpl(content, BASE_AUTOMATIC_MODE);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean canShowImpl(CONTENT content, Object mode) {
        boolean anyModeAllowed = mode == BASE_AUTOMATIC_MODE;
        for (FacebookDialogBase<CONTENT, RESULT>.ModeHandler handler : cachedModeHandlers()) {
            if (anyModeAllowed || Utility.areObjectsEqual(handler.getMode(), mode)) {
                if (handler.canShow(content)) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // com.facebook.FacebookDialog
    public void show(CONTENT content) {
        showImpl(content, BASE_AUTOMATIC_MODE);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void showImpl(CONTENT content, Object mode) {
        AppCall appCall = createAppCallForMode(content, mode);
        if (appCall != null) {
            if (this.fragment != null) {
                DialogPresenter.present(appCall, this.fragment);
                return;
            } else {
                DialogPresenter.present(appCall, this.activity);
                return;
            }
        }
        Log.e(TAG, "No code path should ever result in a null appCall");
        if (FacebookSdk.isDebugEnabled()) {
            throw new IllegalStateException("No code path should ever result in a null appCall");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Activity getActivityContext() {
        if (this.activity != null) {
            return this.activity;
        }
        if (this.fragment != null) {
            return this.fragment.getActivity();
        }
        return null;
    }

    private AppCall createAppCallForMode(CONTENT content, Object mode) {
        boolean anyModeAllowed = mode == BASE_AUTOMATIC_MODE;
        AppCall appCall = null;
        Iterator<FacebookDialogBase<CONTENT, RESULT>.ModeHandler> it = cachedModeHandlers().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            FacebookDialogBase<CONTENT, RESULT>.ModeHandler handler = it.next();
            if (anyModeAllowed || Utility.areObjectsEqual(handler.getMode(), mode)) {
                if (handler.canShow(content)) {
                    try {
                        appCall = handler.createAppCall(content);
                        break;
                    } catch (FacebookException e) {
                        appCall = createBaseAppCall();
                        DialogPresenter.setupAppCallForValidationError(appCall, e);
                    }
                }
            }
        }
        if (appCall == null) {
            AppCall appCall2 = createBaseAppCall();
            DialogPresenter.setupAppCallForCannotShowError(appCall2);
            return appCall2;
        }
        return appCall;
    }

    private List<FacebookDialogBase<CONTENT, RESULT>.ModeHandler> cachedModeHandlers() {
        if (this.modeHandlers == null) {
            this.modeHandlers = getOrderedModeHandlers();
        }
        return this.modeHandlers;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public abstract class ModeHandler {
        public abstract boolean canShow(CONTENT content);

        public abstract AppCall createAppCall(CONTENT content);

        /* JADX INFO: Access modifiers changed from: protected */
        public ModeHandler() {
        }

        public Object getMode() {
            return FacebookDialogBase.BASE_AUTOMATIC_MODE;
        }
    }
}
