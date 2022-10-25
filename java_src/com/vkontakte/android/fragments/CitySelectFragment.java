package com.vkontakte.android.fragments;

import android.widget.ListAdapter;
import com.vkontakte.android.data.database.CitiesAutocompleteAdapter;
import com.vkontakte.android.data.database.City;
import com.vkontakte.android.fragments.DatabaseSearchFragment;
/* loaded from: classes2.dex */
public class CitySelectFragment extends DatabaseSearchFragment<City> {

    /* loaded from: classes2.dex */
    public interface CityCallback extends DatabaseSearchFragment.Callback<City> {
    }

    @Override // com.vkontakte.android.fragments.DatabaseSearchFragment
    public ListAdapter getAdapter() {
        CitiesAutocompleteAdapter adapter = new CitiesAutocompleteAdapter();
        adapter.setCountry(getArguments().getInt("country"));
        adapter.setShowNone(getArguments().getBoolean("show_none"));
        return adapter;
    }
}
