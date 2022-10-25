package com.vkontakte.android.fragments;

import android.app.DialogFragment;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.Filterable;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.vkontakte.android.Global;
/* loaded from: classes2.dex */
public abstract class DatabaseSearchFragment<T> extends DialogFragment {
    private ListAdapter adapter;
    private Callback<T> callback;

    /* loaded from: classes2.dex */
    public interface Callback<T> {
        void onItemSelected(T t);
    }

    public abstract ListAdapter getAdapter();

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        setStyle(1, 0);
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        if (getDialog() != null) {
            getDialog().getWindow().setSoftInputMode(16);
            getDialog().getWindow().setGravity(49);
        }
        LinearLayout content = new LinearLayout(getActivity());
        content.setOrientation(1);
        EditText filter = new EditText(getActivity());
        filter.setInputType(524289);
        if (getArguments() != null && getArguments().containsKey("hint")) {
            filter.setHint(getArguments().getString("hint"));
        }
        LinearLayout.LayoutParams flp = new LinearLayout.LayoutParams(-1, -2);
        int scale = Global.scale(10.0f);
        flp.rightMargin = scale;
        flp.leftMargin = scale;
        flp.bottomMargin = scale;
        flp.topMargin = scale;
        content.addView(filter, flp);
        ListView list = new ListView(getActivity());
        if (Build.VERSION.SDK_INT < 14) {
            list.setBackgroundColor(-1);
            list.setCacheColorHint(-1);
        }
        content.addView(list);
        this.adapter = getAdapter();
        list.setAdapter(this.adapter);
        filter.addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.fragments.DatabaseSearchFragment.1
            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable ed) {
                ((Filterable) DatabaseSearchFragment.this.adapter).getFilter().filter(ed);
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }
        });
        ((Filterable) this.adapter).getFilter().filter(null);
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.vkontakte.android.fragments.DatabaseSearchFragment.2
            /* JADX WARN: Multi-variable type inference failed */
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int pos, long arg3) {
                Object item = DatabaseSearchFragment.this.adapter.getItem(pos);
                if (DatabaseSearchFragment.this.callback != null) {
                    DatabaseSearchFragment.this.callback.onItemSelected(item);
                }
                DatabaseSearchFragment.this.dismiss();
            }
        });
        return content;
    }

    public void setCallback(Callback<T> c) {
        this.callback = c;
    }
}
