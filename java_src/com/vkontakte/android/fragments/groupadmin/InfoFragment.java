package com.vkontakte.android.fragments.groupadmin;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.location.Address;
import android.location.Geocoder;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.content.LocalBroadcastManager;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.facebook.GraphRequest;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.execute.FindCityByName;
import com.vkontakte.android.api.groups.GroupsEdit;
import com.vkontakte.android.api.groups.GroupsGetSettings;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.data.GroupsAdmin;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.fragments.location.SelectGeoPointFragment;
import com.vkontakte.android.ui.CompoundRadioGroup;
import com.vkontakte.android.ui.DateTimeChooser;
import com.vkontakte.android.ui.cardview.CardDrawable;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import me.grishka.appkit.fragments.LoaderFragment;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class InfoFragment extends LoaderFragment {
    private static final int PLACE_RESULT = 102;
    private CompoundRadioGroup access;
    private TextView addEndTimeBtn;
    private EditText addrField;
    private ArrayAdapter<Category> categoryAdapter;
    private Spinner categorySelector;
    private EditText descrField;
    private Button endDate;
    private DateTimeChooser endDateChooser;
    private Button endTime;
    private View endTimeWrap;
    private int id;
    private GroupsGetSettings.Result info;
    private GeoAttachment place;
    private TextView placeBtn;
    private boolean placeChanged = false;
    private int placeCityID;
    private int placeCountryID;
    private View removeEndTimeBtn;
    private Button startDate;
    private DateTimeChooser startDateChooser;
    private Button startTime;
    private View subCategoryDivider;
    private ArrayAdapter<Category> subcategoryAdapter;
    private Spinner subcategorySelector;
    private EditText titleField;
    private int type;
    private EditText websiteField;

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        this.id = getArguments().getInt("id");
        setHasOptionsMenu(true);
        setTitle(R.string.group_info);
        setHasOptionsMenu(true);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState != null) {
            this.info = (GroupsGetSettings.Result) savedInstanceState.getParcelable(UserNotification.LAYOUT_NEWSFEED_INFO);
            dataLoaded();
        } else if (!this.loaded) {
            loadData();
        }
    }

    @Override // android.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        if (this.loaded) {
            MenuItem item = menu.add(R.string.save);
            item.setIcon(R.drawable.ic_check_24dp);
            item.setShowAsAction(2);
        }
    }

    @Override // android.app.Fragment
    public boolean onOptionsItemSelected(MenuItem item) {
        save();
        return true;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View v = super.onCreateView(inflater, container, savedInstanceState);
        this.titleField = (EditText) v.findViewById(R.id.group_title);
        this.descrField = (EditText) v.findViewById(R.id.group_descr);
        this.addrField = (EditText) v.findViewById(R.id.group_address);
        this.websiteField = (EditText) v.findViewById(R.id.group_website);
        this.access = (CompoundRadioGroup) v.findViewById(R.id.group_access_radiogroup);
        this.categorySelector = (Spinner) v.findViewById(R.id.group_category);
        this.subcategorySelector = (Spinner) v.findViewById(R.id.group_subcategory);
        this.addEndTimeBtn = (TextView) v.findViewById(R.id.group_add_end_time);
        this.placeBtn = (TextView) v.findViewById(R.id.group_place);
        this.startTime = (Button) v.findViewById(R.id.btn_start_time);
        this.startDate = (Button) v.findViewById(R.id.btn_start_date);
        this.endTime = (Button) v.findViewById(R.id.btn_end_time);
        this.endDate = (Button) v.findViewById(R.id.btn_end_date);
        this.endTimeWrap = v.findViewById(R.id.group_end_time_wrap);
        this.removeEndTimeBtn = v.findViewById(R.id.group_remove_end_time);
        this.subCategoryDivider = v.findViewById(R.id.group_categoty_divider);
        this.startDateChooser = new DateTimeChooser(this.startDate, this.startTime, getActivity());
        this.endDateChooser = new DateTimeChooser(this.endDate, this.endTime, getActivity());
        this.type = getArguments().getInt(ServerKeys.TYPE);
        if (this.type == 2) {
            v.findViewById(R.id.group_access_block).setVisibility(8);
        } else if (this.type == 1) {
            v.findViewById(R.id.access_private).setVisibility(8);
            ((TextView) v.findViewById(R.id.group_access_title)).setText(R.string.group_access_event);
            ((TextView) v.findViewById(R.id.access_open).findViewById(R.id.description)).setText(R.string.group_open_descr_event);
            ((TextView) v.findViewById(R.id.access_closed).findViewById(R.id.description)).setText(R.string.group_closed_descr_event);
        }
        if (this.type != 2) {
            this.subcategorySelector.setVisibility(8);
            v.findViewById(R.id.group_categoty_divider).setVisibility(8);
        }
        if (this.type != 1) {
            v.findViewById(R.id.group_time_block).setVisibility(8);
        }
        ((TextView) v.findViewById(R.id.group_place_title)).setText(this.type == 1 ? R.string.group_event_location : R.string.group_place);
        this.addEndTimeBtn.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.InfoFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v2) {
                int i;
                InfoFragment.this.addEndTimeBtn.setVisibility(8);
                InfoFragment.this.endTimeWrap.setVisibility(0);
                int start = (int) (InfoFragment.this.startDateChooser.getDate().getTimeInMillis() / 1000);
                DateTimeChooser dateTimeChooser = InfoFragment.this.endDateChooser;
                if (InfoFragment.this.info.endTime > start) {
                    i = InfoFragment.this.info.endTime;
                } else {
                    i = start + 7200;
                }
                dateTimeChooser.setDate(i);
            }
        });
        this.removeEndTimeBtn.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.InfoFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v2) {
                InfoFragment.this.addEndTimeBtn.setVisibility(0);
                InfoFragment.this.endTimeWrap.setVisibility(8);
                InfoFragment.this.endDateChooser.setDate(0);
            }
        });
        this.categorySelector.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.vkontakte.android.fragments.groupadmin.InfoFragment.3
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                InfoFragment.this.updateSubCategoryList();
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        this.placeBtn.setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.groupadmin.InfoFragment.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v2) {
                SelectGeoPointFragment.Builder builder = new SelectGeoPointFragment.Builder();
                if (InfoFragment.this.place != null) {
                    builder.place(InfoFragment.this.place.lat, InfoFragment.this.place.lon);
                } else if (InfoFragment.this.info != null && InfoFragment.this.info.place != null) {
                    builder.place(InfoFragment.this.info.place.lat, InfoFragment.this.info.place.lon);
                }
                builder.forResult(InfoFragment.this, 102);
            }
        });
        this.content.setScrollBarStyle(33554432);
        updateConfiguration();
        updateDecorator();
        if (savedInstanceState != null) {
            Bundle fields = savedInstanceState.getBundle(GraphRequest.FIELDS_PARAM);
            this.titleField.setText(fields.getString("title"));
            this.descrField.setText(fields.getString("description"));
            this.addrField.setText(fields.getString("address"));
            this.websiteField.setText(fields.getString("website"));
            if (this.type != 2) {
                this.access.setCheckedId(fields.getInt("access"));
            }
            this.categorySelector.setSelection(fields.getInt(ServerKeys.CATEGORY));
            this.subcategorySelector.setSelection(fields.getInt("public_subcategory"));
            this.startDateChooser.setDate(fields.getInt("event_start_date"));
            this.endDateChooser.setDate(fields.getInt("event_finish_date"));
        }
        return v;
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public View onCreateContentView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return View.inflate(getActivity(), R.layout.group_admin_info, null);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    public void onToolbarNavigationClick() {
        getActivity().finish();
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        updateConfiguration();
        updateDecorator();
    }

    private void updateDecorator() {
        ViewGroup vg = (ViewGroup) ((ViewGroup) this.content).getChildAt(0);
        for (int i = 0; i < vg.getChildCount(); i++) {
            Drawable bg = new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet);
            View c = vg.getChildAt(i);
            c.setBackgroundDrawable(bg);
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) c.getLayoutParams();
            lp.topMargin = V.dp(3.0f);
            lp.bottomMargin = V.dp(2.0f);
        }
        int pad = this.scrW >= 924 ? V.dp(32.0f) : 0;
        vg.setPadding(pad, 0, pad, 0);
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (!getArguments().getBoolean("_split")) {
            getToolbar().setNavigationIcon(R.drawable.ic_ab_back);
        }
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment
    public void doLoadData() {
        this.currentRequest = new GroupsGetSettings(this.id).setCallback(new SimpleCallback<GroupsGetSettings.Result>(this) { // from class: com.vkontakte.android.fragments.groupadmin.InfoFragment.5
            @Override // com.vkontakte.android.api.Callback
            public void success(GroupsGetSettings.Result result) {
                InfoFragment.this.info = result;
                InfoFragment.this.updateInfo();
                InfoFragment.this.dataLoaded();
                InfoFragment.this.invalidateOptionsMenu();
            }
        }).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateInfo() {
        this.titleField.setText(this.info.title);
        this.descrField.setText(this.info.description);
        this.addrField.setText(this.info.address);
        this.websiteField.setText(this.info.website);
        if (this.type == 1 || this.type == 0) {
            switch (this.info.access) {
                case 0:
                    this.access.setCheckedId(R.id.access_open);
                    break;
                case 1:
                    this.access.setCheckedId(R.id.access_closed);
                    break;
                case 2:
                    this.access.setCheckedId(R.id.access_private);
                    break;
            }
        }
        this.categoryAdapter = new ArrayAdapter<>(getActivity(), R.layout.card_spinner_item);
        this.categoryAdapter.setDropDownViewResource(17367049);
        this.categoryAdapter.addAll(this.info.categories);
        this.categorySelector.setAdapter((SpinnerAdapter) this.categoryAdapter);
        this.subcategoryAdapter = new ArrayAdapter<>(getActivity(), R.layout.card_spinner_item);
        this.subcategoryAdapter.setDropDownViewResource(17367049);
        this.subcategorySelector.setAdapter((SpinnerAdapter) this.subcategoryAdapter);
        int i = 0;
        while (true) {
            if (i < this.categoryAdapter.getCount()) {
                if (this.categoryAdapter.getItem(i).id != this.info.subject) {
                    i++;
                } else {
                    this.categorySelector.setSelection(i);
                }
            }
        }
        updateSubCategoryList();
        if (this.type == 1) {
            this.startDateChooser.setDate(this.info.startTime);
            this.endDateChooser.setDate(this.info.endTime);
            if (this.info.endTime > this.info.startTime) {
                this.addEndTimeBtn.setVisibility(8);
                this.endTimeWrap.setVisibility(0);
            } else {
                this.addEndTimeBtn.setVisibility(0);
                this.endTimeWrap.setVisibility(8);
            }
        }
        if (this.info.place != null) {
            this.placeBtn.setCompoundDrawablesWithIntrinsicBounds(getResources().getDrawable(R.drawable.ic_attach_menu_location), (Drawable) null, (Drawable) null, (Drawable) null);
            this.placeBtn.setText(this.info.place.toString());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateSubCategoryList() {
        Category selItem = (Category) this.categorySelector.getSelectedItem();
        if (selItem.subcategories != null) {
            this.subcategorySelector.setVisibility(0);
            this.subCategoryDivider.setVisibility(0);
            this.subcategoryAdapter.clear();
            this.subcategoryAdapter.addAll(selItem.subcategories);
            boolean found = false;
            int i = 0;
            while (true) {
                if (i >= this.subcategoryAdapter.getCount()) {
                    break;
                } else if (this.subcategoryAdapter.getItem(i).id != this.info.subcategory) {
                    i++;
                } else {
                    this.subcategorySelector.setSelection(i);
                    found = true;
                    break;
                }
            }
            if (!found) {
                this.subcategorySelector.setSelection(0);
                return;
            }
            return;
        }
        this.subcategorySelector.setVisibility(8);
        this.subCategoryDivider.setVisibility(8);
        this.subcategoryAdapter.clear();
    }

    @Override // android.app.Fragment
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 102 && resultCode == -1) {
            updateAddress((GeoAttachment) data.getParcelableExtra("point"), data.getStringExtra("country"));
        }
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        if (this.info != null) {
            state.putParcelable(UserNotification.LAYOUT_NEWSFEED_INFO, this.info);
            Bundle fields = new Bundle();
            String newTitle = this.titleField.getText().toString();
            String newDescription = this.descrField.getText().toString();
            String newAddress = this.addrField.getText().toString();
            String newWebsite = this.websiteField.getText().toString();
            int newStartTime = (int) (this.startDateChooser.getDate().getTimeInMillis() / 1000);
            int timeInMillis = (int) (this.startDateChooser.getDate().getTimeInMillis() / 1000);
            fields.putString("title", newTitle);
            fields.putString("description", newDescription);
            fields.putString("address", newAddress);
            fields.putString("website", newWebsite);
            fields.putInt("access", this.access.getCheckedId());
            fields.putInt(ServerKeys.CATEGORY, this.categorySelector.getSelectedItemPosition());
            fields.putInt("public_subcategory", this.subcategorySelector.getSelectedItemPosition());
            fields.putInt("event_start_date", newStartTime);
            fields.putInt("event_finish_date", 0);
            state.putBundle(GraphRequest.FIELDS_PARAM, fields);
            state.putParcelable("place", this.place);
            state.putBoolean("place_changed", this.placeChanged);
        }
    }

    private void updateAddress(final GeoAttachment att, final String country) {
        this.place = att;
        final ProgressDialog progress = new ProgressDialog(getActivity());
        progress.setCancelable(false);
        progress.setMessage(getString(R.string.geo_loading_address));
        progress.show();
        new Thread(new Runnable() { // from class: com.vkontakte.android.fragments.groupadmin.InfoFragment.6
            @Override // java.lang.Runnable
            public void run() {
                String city;
                FindCityByName.Result res;
                try {
                    Geocoder geocoder = new Geocoder(InfoFragment.this.getActivity(), (country.equals("RU") || country.equals("UA") || country.equals("BY")) ? new Locale("ru", "RU") : Locale.US);
                    List<Address> addresses = geocoder.getFromLocation(att.lat, att.lon, 1);
                    if (addresses.size() > 0 && (city = addresses.get(0).getLocality()) != null && (res = (FindCityByName.Result) new FindCityByName(country, city).execSyncWithResult()) != null) {
                        InfoFragment.this.placeCityID = res.cityID;
                        InfoFragment.this.placeCountryID = res.countryID;
                    }
                } catch (Exception x) {
                    Log.w("vk", x);
                }
                if (InfoFragment.this.getActivity() != null) {
                    InfoFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.vkontakte.android.fragments.groupadmin.InfoFragment.6.1
                        @Override // java.lang.Runnable
                        public void run() {
                            InfoFragment.this.placeChanged = true;
                            ViewUtils.dismissDialogSafety(progress);
                            InfoFragment.this.placeBtn.setCompoundDrawablesWithIntrinsicBounds(InfoFragment.this.getResources().getDrawable(R.drawable.ic_attach_menu_location), (Drawable) null, (Drawable) null, (Drawable) null);
                            InfoFragment.this.placeBtn.setText((att.address == null || att.address.length() <= 0) ? att.lat + "," + att.lon : att.address);
                        }
                    });
                }
            }
        }).start();
    }

    private void save() {
        Bundle fields = new Bundle();
        final String newTitle = this.titleField.getText().toString();
        String newDescription = this.descrField.getText().toString();
        String newAddress = this.addrField.getText().toString();
        String newWebsite = this.websiteField.getText().toString();
        int newAccess = 0;
        switch (this.access.getCheckedId()) {
            case R.id.access_open /* 2131755748 */:
                newAccess = 0;
                break;
            case R.id.access_closed /* 2131755749 */:
                newAccess = 1;
                break;
            case R.id.access_private /* 2131755750 */:
                newAccess = 2;
                break;
        }
        int newCategory = ((Category) this.categorySelector.getSelectedItem()).id;
        int newSubCategory = this.subcategoryAdapter.getCount() > 0 ? ((Category) this.subcategorySelector.getSelectedItem()).id : 0;
        int newStartTime = (int) (this.startDateChooser.getDate().getTimeInMillis() / 1000);
        int newEndTime = (int) (this.startDateChooser.getDate().getTimeInMillis() / 1000);
        if (this.addEndTimeBtn.getVisibility() != 8) {
            newEndTime = 0;
        }
        if (!newTitle.equals(this.info.title)) {
            fields.putString("title", newTitle);
        }
        if (!newDescription.equals(this.info.description)) {
            fields.putString("description", newDescription);
        }
        if (!newAddress.equals(this.info.address)) {
            fields.putString("address", newAddress);
        }
        if (!newWebsite.equals(this.info.website)) {
            fields.putString("website", newWebsite);
        }
        if (newAccess != this.info.access) {
            fields.putInt("access", newAccess);
        }
        if (newCategory != this.info.subject) {
            fields.putInt(this.type == 2 ? "public_category" : "subject", newCategory);
        }
        if (newSubCategory != this.info.subcategory) {
            fields.putInt("public_subcategory", newSubCategory);
        }
        if (newStartTime != this.info.startTime) {
            fields.putInt("event_start_date", newStartTime);
        }
        if (newEndTime != this.info.endTime) {
            fields.putInt("event_finish_date", newEndTime);
        }
        if (this.placeChanged) {
            fields.putInt("edit_place", 1);
            fields.putDouble("place_lat", this.place.lat);
            fields.putDouble("place_lon", this.place.lon);
            fields.putString("place_address", this.place.address);
            fields.putInt("place_country_id", this.placeCountryID);
            fields.putInt("place_city_id", this.placeCityID);
        }
        new GroupsEdit(this.id, fields).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.groupadmin.InfoFragment.7
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Intent intent = new Intent(Posts.ACTION_RELOAD_PROFILE);
                intent.putExtra("id", -InfoFragment.this.id);
                InfoFragment.this.getActivity().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                InfoFragment.this.getActivity().finish();
                Intent intent2 = new Intent(GroupsAdmin.ACTION_TITLE_CHANGED);
                intent2.putExtra("title", newTitle);
                LocalBroadcastManager.getInstance(VKApplication.context).sendBroadcast(intent2);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    public void onRefresh() {
    }

    /* loaded from: classes2.dex */
    public static class Category implements Parcelable {
        public static final Parcelable.Creator<Category> CREATOR = new Parcelable.Creator<Category>() { // from class: com.vkontakte.android.fragments.groupadmin.InfoFragment.Category.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public Category mo1050createFromParcel(Parcel source) {
                return new Category(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public Category[] mo1051newArray(int size) {
                return new Category[size];
            }
        };
        public int id;
        public List<Category> subcategories;
        public String title;

        public String toString() {
            return this.title;
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeInt(this.id);
            dest.writeString(this.title);
            dest.writeList(this.subcategories);
        }

        public Category() {
        }

        protected Category(Parcel in) {
            this.id = in.readInt();
            this.title = in.readString();
            this.subcategories = new ArrayList();
            in.readList(this.subcategories, getClass().getClassLoader());
        }
    }
}
