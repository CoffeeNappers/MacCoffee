package me.grishka.appkit.fragments;

import android.app.Activity;
import android.app.DialogFragment;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.util.Log;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
import java.lang.reflect.Field;
import java.util.List;
import me.grishka.appkit.utils.StubListAdapter;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class AppKitFragment extends DialogFragment {
    public static final String EXTRA_IS_TAB = "__is_tab";
    private boolean hasOptionsMenu;
    protected Spinner navigationSpinner;
    protected int scrW;
    private CharSequence subtitle;
    private CharSequence title;
    private Toolbar toolbar;
    private boolean viewCreated;
    protected boolean isTablet = false;
    private boolean titleMarquee = true;
    private boolean subtitleMarquee = true;
    protected int spinnerViewResourceId = R.layout.appkit_spinner_view;

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        if (Build.VERSION.SDK_INT == 15) {
            setUserVisibleHint(true);
        }
    }

    public boolean hasNavigationDrawer() {
        return false;
    }

    public void onToolbarNavigationClick() {
        if (getFragmentManager().getBackStackEntryCount() > 0) {
            getFragmentManager().popBackStack();
        }
    }

    protected boolean canGoBack() {
        return getArguments() != null && getArguments().getBoolean("_can_go_back");
    }

    public void setTitleMarqueeEnabled(boolean enabled) {
        this.titleMarquee = enabled;
        updateToolbarMarquee();
    }

    public void setSubtitleMarqueeEnabled(boolean enabled) {
        this.subtitleMarquee = enabled;
        updateToolbarMarquee();
    }

    public boolean isTitleMarqueeEnabled(boolean enabled) {
        return this.titleMarquee;
    }

    public boolean isSubitleMarqueeEnabled(boolean enabled) {
        return this.subtitleMarquee;
    }

    private void updateToolbarMarquee() {
        if (this.toolbar != null) {
            TextView title = null;
            TextView subtitle = null;
            try {
                Field fld = this.toolbar.getClass().getDeclaredField("mTitleTextView");
                fld.setAccessible(true);
                title = (TextView) fld.get(this.toolbar);
                Field fld2 = this.toolbar.getClass().getDeclaredField("mSubtitleTextView");
                fld2.setAccessible(true);
                subtitle = (TextView) fld2.get(this.toolbar);
            } catch (Exception e) {
            }
            if (title != null) {
                title.setFadingEdgeLength(V.dp(10.0f));
                title.setHorizontalFadingEdgeEnabled(true);
                title.setMarqueeRepeatLimit(2);
                if (this.titleMarquee) {
                    title.setEllipsize(TextUtils.TruncateAt.MARQUEE);
                    title.setSelected(true);
                } else {
                    title.setSelected(false);
                    title.setEllipsize(TextUtils.TruncateAt.END);
                }
            }
            if (subtitle != null) {
                subtitle.setFadingEdgeLength(V.dp(10.0f));
                subtitle.setHorizontalFadingEdgeEnabled(true);
                subtitle.setMarqueeRepeatLimit(2);
                if (this.subtitleMarquee) {
                    subtitle.setEllipsize(TextUtils.TruncateAt.MARQUEE);
                    subtitle.setSelected(true);
                    return;
                }
                subtitle.setSelected(false);
                subtitle.setEllipsize(TextUtils.TruncateAt.END);
            }
        }
    }

    @Override // android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.toolbar = (Toolbar) view.findViewById(R.id.toolbar);
        if (this.toolbar != null && getArguments() != null && getArguments().getBoolean(EXTRA_IS_TAB)) {
            ((ViewGroup) this.toolbar.getParent()).removeView(this.toolbar);
            this.toolbar = null;
        }
        this.viewCreated = true;
        if (this.toolbar != null) {
            if (this.title != null) {
                this.toolbar.setTitle(this.title);
            }
            if (this.subtitle != null) {
                this.toolbar.setSubtitle(this.subtitle);
            }
            if (this.hasOptionsMenu) {
                invalidateToolbarMenu();
                this.toolbar.setOnMenuItemClickListener(new Toolbar.OnMenuItemClickListener() { // from class: me.grishka.appkit.fragments.AppKitFragment.1
                    @Override // android.support.v7.widget.Toolbar.OnMenuItemClickListener
                    public boolean onMenuItemClick(MenuItem item) {
                        return AppKitFragment.this.onOptionsItemSelected(item);
                    }
                });
            }
            if (canGoBack()) {
                this.toolbar.setNavigationIcon(R.drawable.ic_ab_back);
            } else if (hasNavigationDrawer()) {
                this.toolbar.setNavigationIcon(R.drawable.ic_ab_menu);
            }
            this.toolbar.setNavigationOnClickListener(new View.OnClickListener() { // from class: me.grishka.appkit.fragments.AppKitFragment.2
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    AppKitFragment.this.onToolbarNavigationClick();
                }
            });
        } else {
            if (this.title != null && (getArguments() == null || !getArguments().getBoolean("_dialog"))) {
                getActivity().setTitle(this.title);
            }
            if (getActivity().getActionBar() != null && (getArguments() == null || !getArguments().getBoolean("_dialog"))) {
                if (this.title != null) {
                    if (getActivity().getActionBar().getNavigationMode() != 0) {
                        getActivity().getActionBar().setListNavigationCallbacks(StubListAdapter.getInstance(), null);
                        getActivity().getActionBar().setDisplayShowTitleEnabled(true);
                    }
                    getActivity().getActionBar().setNavigationMode(0);
                }
                if (this.subtitle != null) {
                    getActivity().getActionBar().setSubtitle(this.subtitle);
                }
            }
        }
        updateToolbarMarquee();
        Activity activity = getActivity();
        if (activity instanceof OnFragmentViewCreated) {
            ((OnFragmentViewCreated) activity).onFragmentViewCreated(this);
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.navigationSpinner = null;
        this.toolbar = null;
    }

    @Override // android.app.Fragment
    public void setHasOptionsMenu(boolean hasMenu) {
        super.setHasOptionsMenu(hasMenu);
        this.hasOptionsMenu = hasMenu;
        invalidateOptionsMenu();
    }

    public void invalidateOptionsMenu() {
        if (this.toolbar != null) {
            invalidateToolbarMenu();
        } else if (getActivity() != null) {
            getActivity().invalidateOptionsMenu();
        }
    }

    private void invalidateToolbarMenu() {
        try {
            this.toolbar.getMenu().clear();
            if (this.hasOptionsMenu) {
                onCreateOptionsMenu(this.toolbar.getMenu(), new MenuInflater(getActivity()));
            }
        } catch (Throwable th) {
            Log.e("AppKit", "error invalidateToolbarMenu");
        }
    }

    public Toolbar getToolbar() {
        return this.toolbar;
    }

    @Override // android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        V.setApplicationContext(activity);
        updateConfiguration();
    }

    @Override // android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateConfiguration();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void updateConfiguration() {
        this.scrW = getResources().getConfiguration().screenWidthDp;
        this.isTablet = Screen.isTablet(getActivity());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTitle(CharSequence title) {
        this.title = title;
        if (this.navigationSpinner == null) {
            if (this.toolbar != null) {
                this.toolbar.setTitle(title);
                updateToolbarMarquee();
            } else if (this.viewCreated) {
                if (getArguments() == null || !getArguments().getBoolean("_dialog")) {
                    getActivity().setTitle(title);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTitle(int res) {
        setTitle(getString(res));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSubtitle(CharSequence subtitle) {
        this.subtitle = subtitle;
        if (this.navigationSpinner == null) {
            if (this.toolbar != null) {
                this.toolbar.setSubtitle(subtitle);
                updateToolbarMarquee();
            } else if (this.viewCreated && getActivity().getActionBar() != null) {
                getActivity().getActionBar().setSubtitle(subtitle);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSubtitle(int res) {
        setSubtitle(getString(res));
    }

    /* renamed from: onCreateNavigationSpinnerAdapter */
    protected ArrayAdapter mo1003onCreateNavigationSpinnerAdapter() {
        return new NavigationSpinnerAdapter(getActivity());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSpinnerItems(List<?> items) {
        if (items == null) {
            setSpinnerAdapter(null);
            return;
        }
        ArrayAdapter adapter = mo1003onCreateNavigationSpinnerAdapter();
        adapter.addAll(items);
        adapter.setDropDownViewResource(17367049);
        setSpinnerAdapter(adapter);
    }

    protected Spinner onCreateNavigationSpinner(LayoutInflater inflater) {
        return (Spinner) inflater.inflate(R.layout.appkit_navigation_spinner, (ViewGroup) null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSpinnerAdapter(SpinnerAdapter adapter) {
        if (adapter == null) {
            if (this.navigationSpinner != null) {
                this.toolbar.removeView(this.navigationSpinner);
                this.navigationSpinner = null;
                return;
            }
            return;
        }
        if (this.navigationSpinner == null) {
            this.navigationSpinner = onCreateNavigationSpinner(getActivity().getLayoutInflater());
            this.navigationSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: me.grishka.appkit.fragments.AppKitFragment.3
                @Override // android.widget.AdapterView.OnItemSelectedListener
                public void onItemSelected(AdapterView<?> adapterView, View view, int pos, long id) {
                    AppKitFragment.this.onSpinnerItemSelected(pos);
                }

                @Override // android.widget.AdapterView.OnItemSelectedListener
                public void onNothingSelected(AdapterView<?> adapterView) {
                }
            });
            this.toolbar.addView(this.navigationSpinner, new Toolbar.LayoutParams(-2, -1));
            this.toolbar.setTitle((CharSequence) null);
            this.toolbar.setSubtitle((CharSequence) null);
        }
        this.navigationSpinner.setAdapter(adapter);
    }

    protected Context getToolbarContext() {
        TypedArray ta = getActivity().getTheme().obtainStyledAttributes(new int[]{R.attr.actionBarTheme});
        int themeID = ta.getResourceId(0, 0);
        ta.recycle();
        return themeID == 0 ? getActivity() : new ContextThemeWrapper(getActivity(), themeID);
    }

    protected Context getToolbarPopupContext() {
        TypedArray ta = getActivity().getTheme().obtainStyledAttributes(new int[]{R.attr.actionBarPopupTheme});
        int themeID = ta.getResourceId(0, 0);
        ta.recycle();
        return themeID == 0 ? getActivity() : new ContextThemeWrapper(getActivity(), themeID);
    }

    protected boolean onSpinnerItemSelected(int position) {
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSelectedNavigationItem(int position) {
        this.navigationSpinner.setSelection(position);
    }

    protected int getSelectedNavigationItem() {
        if (this.navigationSpinner == null) {
            return -1;
        }
        return this.navigationSpinner.getSelectedItemPosition();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes3.dex */
    public class NavigationSpinnerAdapter extends ArrayAdapter {
        public NavigationSpinnerAdapter(Context context) {
            super(context, AppKitFragment.this.spinnerViewResourceId, 16908308);
            setDropDownViewResource(17367049);
        }

        @Override // android.widget.ArrayAdapter, android.widget.BaseAdapter, android.widget.SpinnerAdapter
        public View getDropDownView(int position, View convertView, ViewGroup parent) {
            View view = super.getDropDownView(position, convertView, parent);
            if (convertView == null) {
                TypedArray ta = AppKitFragment.this.getActivity().getTheme().obtainStyledAttributes(new int[]{R.attr.colorAccent, 16842800});
                int colorAccent = ta.getColor(0, ViewCompat.MEASURED_STATE_MASK);
                int colorForeground = ta.getColor(1, ViewCompat.MEASURED_STATE_MASK);
                ta.recycle();
                ColorStateList csl = new ColorStateList(new int[][]{new int[]{16842912}, new int[0]}, new int[]{colorAccent, colorForeground});
                ((TextView) view).setTextColor(csl);
            }
            return view;
        }
    }

    @Override // android.app.Fragment
    public Context getContext() {
        return getActivity();
    }
}
