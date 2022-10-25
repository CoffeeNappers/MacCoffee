package com.vkontakte.android.api.places;

import com.vkontakte.android.GeoPlace;
import com.vkontakte.android.api.ListAPIRequest;
/* loaded from: classes2.dex */
public class PlacesSearch extends ListAPIRequest<GeoPlace> {
    public PlacesSearch(double lat, double lon, int radius, String query) {
        super("places.search", GeoPlace.class);
        param("latitude", String.valueOf(lat));
        param("longitude", String.valueOf(lon));
        param("radius", radius);
        if (query != null && query.length() > 0) {
            param("q", query);
        }
    }
}
