package com.vkontakte.android.api.database;

import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.database.City;
/* loaded from: classes2.dex */
public class DatabaseGetCities extends ListAPIRequest<City> {
    Callback callback;

    public DatabaseGetCities(int country, String q) {
        super("database.getCities", City.class);
        param("country_id", country);
        if (q != null && q.length() > 0) {
            param("q", q);
            param(ServerKeys.COUNT, 100);
        }
    }
}
