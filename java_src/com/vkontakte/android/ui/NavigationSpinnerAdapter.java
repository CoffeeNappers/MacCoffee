package com.vkontakte.android.ui;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class NavigationSpinnerAdapter<T> extends ArrayAdapter<T> {
    private Activity activity;

    public NavigationSpinnerAdapter(Activity act) {
        super(act.getActionBar().getThemedContext(), R.layout.nav_spinner_item);
        this.activity = act;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int pos, View view, ViewGroup group) {
        return super.getView(this.activity.getActionBar().getSelectedNavigationIndex(), view, group);
    }
}
