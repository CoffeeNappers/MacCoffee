package com.vkontakte.android;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.IdRes;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.view.ActionMode;
import android.support.v7.widget.Toolbar;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import com.my.tracker.MyTracker;
import com.vk.core.util.Screen;
import com.vkontakte.android.activities.LogoutReceiver;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.SearchViewWrapper;
import com.vkontakte.android.utils.L;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import java.lang.reflect.Field;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class VKActivity extends AppCompatActivity {
    protected boolean isTablet;
    private boolean isResumedImpl = false;
    private int actionModeStatusBarColor = 0;
    private LogoutReceiver logoutReceiver = null;
    private final CompositeDisposable compositeDisposable = new CompositeDisposable();

    static {
        if (VKAccountManager.getCurrent().isReal()) {
            VKApplication.context.startService(new Intent(VKApplication.context, LongPollService.class));
            Friends.reload(false);
            Groups.reload(false);
        }
    }

    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        this.isTablet = Screen.isTablet(this);
        C2DM.checkForUpdate();
        if (!isTaskRoot() && getActionBar() != null) {
            getActionBar().setDisplayHomeAsUpEnabled(true);
        }
        if (Global.isBuggyMeizu() && getActionBar() != null) {
            getActionBar().setIcon(new ColorDrawable(0));
            getActionBar().setDisplayShowHomeEnabled(true);
        }
        this.logoutReceiver = LogoutReceiver.register(this);
    }

    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        this.isTablet = Screen.isTablet(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        this.compositeDisposable.dispose();
        this.logoutReceiver.unregister();
        Fragment f = getFragmentManager().findFragmentById(R.id.fragment_wrapper);
        if (f != null) {
            VKApplication.refWatcher.watch(f);
        }
        super.onDestroy();
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == 16908332) {
            onBackPressed();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        super.onPause();
        this.isResumedImpl = false;
        AppStateTracker.onActivityPaused();
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        this.isResumedImpl = true;
        AppStateTracker.onActivityResumed(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onStart() {
        super.onStart();
        MyTracker.onStartActivity(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onStop() {
        super.onStop();
        MyTracker.onStopActivity(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isResumedImpl() {
        return this.isResumedImpl;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 20000 && resultCode == -1) {
            String text = null;
            ArrayList<String> results = data.getStringArrayListExtra("android.speech.extra.RESULTS");
            if (results.size() > 0) {
                String text2 = results.get(0);
                text = text2;
            }
            View searchView = findViewById(R.id.search_input);
            if (text != null && searchView != null) {
                SearchViewWrapper wrapper = (SearchViewWrapper) searchView.getTag();
                wrapper.setTextAndSubmit(text);
            }
        }
    }

    @Override // android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityHoneycomb, android.app.Activity, android.view.LayoutInflater.Factory2
    @Nullable
    public View onCreateView(View parent, String name, Context context, AttributeSet attrs) {
        View view = super.onCreateView(name, context, attrs);
        if (Build.VERSION.SDK_INT >= 21) {
            return view;
        }
        if (view == null) {
            try {
                view = getDelegate().createView(parent, name, context, attrs);
                if (view == null && "TextView".equals(name)) {
                    view = getLayoutInflater().createView(name, "android.widget.", attrs);
                }
            } catch (ClassNotFoundException e) {
                return null;
            }
        }
        if (view instanceof TextView) {
            if (parent != null && parent.getClass().getName().endsWith("TabLayout$TabView")) {
                final TextView text = (TextView) view;
                text.addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.VKActivity.1
                    @Override // android.text.TextWatcher
                    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                    }

                    @Override // android.text.TextWatcher
                    public void onTextChanged(CharSequence s, int start, int before, int count) {
                    }

                    @Override // android.text.TextWatcher
                    public void afterTextChanged(Editable s) {
                        text.setTypeface(Font.Medium.typeface);
                    }
                });
                return view;
            }
            TypedArray t = obtainStyledAttributes(attrs, new int[]{16842804, R.attr.fontFamily, 16843692});
            int i = 0;
            while (true) {
                if (i >= t.length()) {
                    break;
                }
                if (i == 0) {
                    int[] a = {R.attr.fontFamily, 16843692};
                    TypedArray ta = obtainStyledAttributes(t.getResourceId(i, 0), a);
                    int j = 0;
                    while (true) {
                        if (j >= ta.length()) {
                            break;
                        }
                        String s = ta.getString(j);
                        if (!"sans-serif-medium".equals(s)) {
                            j++;
                        } else {
                            ((TextView) view).setTypeface(Font.Medium.typeface);
                            break;
                        }
                    }
                    ta.recycle();
                } else if ("sans-serif-medium".equals(t.getString(i))) {
                    ((TextView) view).setTypeface(Font.Medium.typeface);
                    break;
                }
                i++;
            }
        }
        if (view instanceof Toolbar) {
            final Toolbar toolbar = (Toolbar) view;
            view.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.VKActivity.2
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    toolbar.getViewTreeObserver().removeOnPreDrawListener(this);
                    try {
                        Field f = toolbar.getClass().getDeclaredField("mTitleTextView");
                        f.setAccessible(true);
                        TextView view2 = (TextView) f.get(toolbar);
                        if (view2 != null) {
                            view2.setTypeface(Font.Medium.typeface);
                        }
                    } catch (IllegalAccessException e2) {
                    } catch (NoSuchFieldException e3) {
                    }
                    return true;
                }
            });
        }
        return view;
    }

    @Override // android.support.v7.app.AppCompatActivity, android.support.v7.app.AppCompatCallback
    public void onSupportActionModeStarted(ActionMode mode) {
        super.onSupportActionModeStarted(mode);
        ViewUtils.fixActionModeCallback(this, mode);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onActionModeStarted(android.view.ActionMode mode) {
        super.onActionModeStarted(mode);
        if (Build.VERSION.SDK_INT >= 21) {
            this.actionModeStatusBarColor = getWindow().getStatusBarColor();
            getWindow().setStatusBarColor(-12886137);
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onActionModeFinished(android.view.ActionMode mode) {
        super.onActionModeFinished(mode);
        if (Build.VERSION.SDK_INT >= 21) {
            getWindow().setStatusBarColor(this.actionModeStatusBarColor);
        }
    }

    @Override // android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        try {
            super.onBackPressed();
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    public <T extends View> T $(@IdRes int id) {
        return (T) findViewById(id);
    }

    public Disposable registerDisposable(Disposable disposable) {
        this.compositeDisposable.add(disposable);
        return disposable;
    }
}
