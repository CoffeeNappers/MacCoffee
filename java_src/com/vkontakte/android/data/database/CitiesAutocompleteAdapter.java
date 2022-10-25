package com.vkontakte.android.data.database;

import android.graphics.Typeface;
import android.os.Handler;
import android.text.Spannable;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.database.DatabaseGetCities;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class CitiesAutocompleteAdapter extends BaseAdapter implements Filterable {
    private Runnable delaying;
    private VKAPIRequest req;
    private boolean showNone;
    private CitiesFilter filter = new CitiesFilter();
    private int country = 0;
    private String query = null;
    private List<City> hints = new ArrayList();
    private List<City> results = new ArrayList();
    private List<City> cities = this.hints;
    private Handler handler = new Handler();
    private City none = new City();

    public CitiesAutocompleteAdapter() {
        this.none.id = 0;
        this.none.title = VKApplication.context.getResources().getString(R.string.not_specified);
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.cities.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return this.cities.get(position);
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return this.cities.get(position).id;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        CharSequence title;
        View v = convertView;
        if (v == null) {
            v = View.inflate(parent.getContext(), R.layout.city_list_item, null);
        }
        City city = this.cities.get(position);
        if (this.query != null) {
            int pos = city.title.toLowerCase().indexOf(this.query);
            if (pos != -1) {
                Spannable sp = Spannable.Factory.getInstance().newSpannable(city.title);
                sp.setSpan(new ForegroundColorSpan(parent.getResources().getColorStateList(R.color.btn_link).getDefaultColor()), pos, this.query.length() + pos, 0);
                title = sp;
            } else {
                title = city.title;
            }
        } else {
            title = city.title;
        }
        ((TextView) v.findViewById(R.id.city_title)).setText(title);
        ((TextView) v.findViewById(R.id.city_title)).setTypeface(city.important ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
        if (city.region != null && city.area != null && city.region.length() > 0 && city.area.length() > 0) {
            v.findViewById(R.id.city_subtitle).setVisibility(0);
            ((TextView) v.findViewById(R.id.city_subtitle)).setText(city.area + ", " + city.region);
        } else {
            v.findViewById(R.id.city_subtitle).setVisibility(8);
        }
        return v;
    }

    public void setCountry(int c) {
        this.country = c;
        this.hints.clear();
        this.results.clear();
        notifyDataSetChanged();
        this.filter.filter(null);
    }

    public void setShowNone(boolean show) {
        this.showNone = show;
    }

    @Override // android.widget.Filterable
    public Filter getFilter() {
        return this.filter;
    }

    /* loaded from: classes2.dex */
    private class CitiesFilter extends Filter {
        private CitiesFilter() {
        }

        @Override // android.widget.Filter
        protected Filter.FilterResults performFiltering(CharSequence constraint) {
            CitiesAutocompleteAdapter.this.query = ((Object) constraint) + "";
            Filter.FilterResults res = new Filter.FilterResults();
            return res;
        }

        @Override // android.widget.Filter
        protected void publishResults(CharSequence constraint, Filter.FilterResults results) {
            final String query = null;
            if (CitiesAutocompleteAdapter.this.delaying != null) {
                CitiesAutocompleteAdapter.this.handler.removeCallbacks(CitiesAutocompleteAdapter.this.delaying);
                CitiesAutocompleteAdapter.this.delaying = null;
            }
            if (CitiesAutocompleteAdapter.this.req != null) {
                CitiesAutocompleteAdapter.this.req.cancel();
                CitiesAutocompleteAdapter.this.req = null;
            }
            if (constraint != null && constraint.length() > 0) {
                query = constraint.toString();
            }
            CitiesAutocompleteAdapter.this.handler.postDelayed(CitiesAutocompleteAdapter.this.delaying = new Runnable() { // from class: com.vkontakte.android.data.database.CitiesAutocompleteAdapter.CitiesFilter.1
                @Override // java.lang.Runnable
                public void run() {
                    CitiesAutocompleteAdapter.this.delaying = null;
                    CitiesAutocompleteAdapter.this.loadSearch(query);
                }
            }, 500L);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadSearch(final String q) {
        this.query = q != null ? q.toLowerCase() : null;
        if (q == null && this.hints.size() > 0) {
            this.cities = this.hints;
            notifyDataSetChanged();
            return;
        }
        if (q != null) {
            this.cities = this.results;
            this.results.clear();
            notifyDataSetChanged();
        }
        this.req = new DatabaseGetCities(this.country, q).setCallback(new SimpleCallback<VKList<City>>() { // from class: com.vkontakte.android.data.database.CitiesAutocompleteAdapter.1
            @Override // com.vkontakte.android.api.Callback
            public void success(final VKList<City> res) {
                CitiesAutocompleteAdapter.this.handler.post(new Runnable() { // from class: com.vkontakte.android.data.database.CitiesAutocompleteAdapter.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (CitiesAutocompleteAdapter.this.showNone) {
                            res.add(0, CitiesAutocompleteAdapter.this.none);
                        }
                        if (q == null) {
                            CitiesAutocompleteAdapter.this.hints.addAll(res);
                            CitiesAutocompleteAdapter.this.cities = CitiesAutocompleteAdapter.this.hints;
                        } else {
                            CitiesAutocompleteAdapter.this.results.addAll(res);
                            CitiesAutocompleteAdapter.this.cities = CitiesAutocompleteAdapter.this.results;
                        }
                        CitiesAutocompleteAdapter.this.notifyDataSetChanged();
                    }
                });
            }
        }).exec();
    }
}
