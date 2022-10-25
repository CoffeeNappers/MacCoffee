package com.vkontakte.android.fragments.search;

import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.ActionMode;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.Relation;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.friends.FriendsAdd;
import com.vkontakte.android.api.users.UsersSearch;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.database.City;
import com.vkontakte.android.data.database.Country;
import com.vkontakte.android.fragments.BackListener;
import com.vkontakte.android.fragments.CitySelectFragment;
import com.vkontakte.android.fragments.DatabaseSearchFragment;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.fragments.base.SegmenterFragment;
import com.vkontakte.android.fragments.friends.SearchIndexer;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.functions.VoidFBool;
import com.vkontakte.android.functions.VoidFloat;
import com.vkontakte.android.ui.adapters.RelationAdapter;
import com.vkontakte.android.ui.holder.UserHolder;
import com.vkontakte.android.ui.layout.ExpandableBarLayout;
import com.vkontakte.android.ui.util.SearchSegmenter;
import com.vkontakte.android.ui.util.Segmenter;
import com.vkontakte.android.utils.VoiceUtils;
import me.grishka.appkit.api.ErrorResponse;
import me.grishka.appkit.api.PaginatedList;
/* loaded from: classes3.dex */
public class ExtendedSearchFragment extends SegmenterFragment<UsersSearch.SearchProfile> implements BackListener, VoidF1<UserProfile> {
    static final int AGE_DIFF = 13;
    static final int MAX_AGE = 80;
    static final int MIN_AGE = 14;
    static final int PAGE_SIZE = 50;
    int mAgeFrom;
    Spinner mAgeFromSpinner;
    int mAgeTo;
    Spinner mAgeToSpinner;
    boolean mChanged;
    TextView mCityButton;
    int mCityId;
    ImageView mClear;
    int mCountryId;
    ExpandableBarLayout mExpandView;
    String mPresetQuery;
    TextView mQueryField;
    int mRelation;
    View mSearchIcon;
    boolean mSearchMode;
    int mSex;
    final Callbacks mCallbacks = new Callbacks();
    final SearchSegmenter<UsersSearch.SearchProfile> mSearchSegmenter = new SearchSegmenter(this.mCallbacks, this.mCallbacks, 50).setGlobalTitle(VKApplication.context.getString(R.string.search_global));
    final SearchSegmenter<UsersSearch.SearchProfile> mRecommendations = new SearchSegmenter(this.mCallbacks, this.mCallbacks, 50).setLoadingListener(this.mCallbacks).setGlobalTitle(VKApplication.context.getString(R.string.recommendations));

    public ExtendedSearchFragment() {
        setLayout(R.layout.browse_users_fragment);
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment, me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        if (!this.loaded) {
            loadData();
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRefreshEnabled(false);
        if (getArguments() != null && getArguments().containsKey("q")) {
            this.mPresetQuery = getArguments().getString("q");
        }
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.mRecommendations.attach(this.list);
        this.mSearchSegmenter.attach(this.list);
        setupSearchBar();
        setupExtendedParams(view.findViewById(R.id.search_extended));
        this.mSearchIcon = view.findViewById(R.id.search_icon);
        this.mExpandView = (ExpandableBarLayout) view.findViewById(R.id.expandable);
        this.mExpandView.setProgressListener(this.mCallbacks);
        this.mExpandView.setOpenListener(this.mCallbacks);
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        String voiceResult = VoiceUtils.getVoiceResult(reqCode, resCode, data);
        if (voiceResult != null) {
            this.mQueryField.setText(voiceResult);
        }
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected Segmenter getSegmenter() {
        return this.mSearchMode ? this.mSearchSegmenter : this.mRecommendations;
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected SegmenterFragment<UsersSearch.SearchProfile>.GridAdapter<UsersSearch.SearchProfile, ?> createAdapter() {
        return new SegmenterFragment<UsersSearch.SearchProfile>.GridAdapter<UsersSearch.SearchProfile, UserHolder<UsersSearch.SearchProfile>>() { // from class: com.vkontakte.android.fragments.search.ExtendedSearchFragment.1
            @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
            /* renamed from: createViewHolder  reason: collision with other method in class */
            public UserHolder<UsersSearch.SearchProfile> mo1074createViewHolder(ViewGroup parent) {
                return new Holder(parent).onClick(ExtendedSearchFragment.this);
            }

            @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
            public int getImagesCountForItem(int position) {
                return 1;
            }

            @Override // com.vkontakte.android.fragments.base.SegmenterFragment.GridAdapter
            public String getImageUrl(int position, int image) {
                return ((UserProfile) ExtendedSearchFragment.this.getSegmenter().getItem(position)).photo;
            }
        };
    }

    @Override // com.vkontakte.android.fragments.base.SegmenterFragment
    protected int getColumnsCount() {
        return this.isTablet ? 2 : 1;
    }

    @Override // com.vkontakte.android.fragments.BackListener
    public boolean onBackPressed() {
        if (this.mExpandView.isOpened()) {
            this.mExpandView.closePanel();
            return true;
        }
        return false;
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        this.mRecommendations.search("");
    }

    @Override // com.vkontakte.android.functions.VoidF1
    public void f(UserProfile profile) {
        new ProfileFragment.Builder(profile.uid).go(getActivity());
    }

    void setupSearchBar() {
        View searchView = getActivity().getLayoutInflater().inflate(R.layout.extended_search_bar, (ViewGroup) getToolbar(), false);
        ImageView voice = (ImageView) searchView.findViewById(R.id.voice);
        this.mClear = (ImageView) searchView.findViewById(R.id.clear);
        this.mQueryField = (TextView) searchView.findViewById(R.id.query);
        this.mClear.setOnClickListener(this.mCallbacks);
        voice.setOnClickListener(this.mCallbacks);
        this.mQueryField.addTextChangedListener(this.mCallbacks);
        this.mQueryField.setOnEditorActionListener(this.mCallbacks);
        this.mQueryField.setText(this.mPresetQuery);
        if (Build.VERSION.SDK_INT < 23) {
            this.mQueryField.setCustomSelectionActionModeCallback(new ActionMode.Callback() { // from class: com.vkontakte.android.fragments.search.ExtendedSearchFragment.2
                @Override // android.view.ActionMode.Callback
                public boolean onCreateActionMode(ActionMode mode, Menu menu) {
                    return false;
                }

                @Override // android.view.ActionMode.Callback
                public boolean onPrepareActionMode(ActionMode mode, Menu menu) {
                    return false;
                }

                @Override // android.view.ActionMode.Callback
                public boolean onActionItemClicked(ActionMode mode, MenuItem item) {
                    return false;
                }

                @Override // android.view.ActionMode.Callback
                public void onDestroyActionMode(ActionMode mode) {
                }
            });
        }
        if (!VoiceUtils.voiceSearchAvailable()) {
            voice.setVisibility(8);
        }
        getToolbar().addView(searchView);
    }

    void updateFilter() {
        updateFilter(this.mQueryField.getText().toString());
    }

    void updateFilter(String query) {
        if (!TextUtils.isEmpty(query) || this.mCountryId != 0 || this.mCityId != 0 || this.mSex != 0 || this.mAgeFrom != 0 || this.mAgeTo != 0 || this.mRelation != 0) {
            if (!this.mSearchMode) {
                this.mSearchMode = true;
                updateDecorator();
                updateList();
            }
            this.mSearchSegmenter.clear();
            this.mSearchSegmenter.search(query);
        } else if (this.mSearchMode) {
            this.mSearchMode = false;
            updateDecorator();
            updateList();
        }
    }

    void setupExtendedParams(View root) {
        setupRegionParams(root);
        setupGenderParams(root);
        setupAgeParams(root);
        setupRelationParams(root);
    }

    void setupRelationParams(View root) {
        RelationAdapter relationAdapter = new RelationAdapter(true, getActivity(), 17367048, Relation.values());
        relationAdapter.setDropDownViewResource(17367049);
        Spinner relationSpinner = (Spinner) root.findViewById(R.id.relation_spinner);
        relationSpinner.setAdapter((SpinnerAdapter) relationAdapter);
        relationSpinner.setOnItemSelectedListener(this.mCallbacks);
    }

    void setupAgeParams(View root) {
        ArrayAdapter<String> ageAdapterFrom = new ArrayAdapter<>(getActivity(), 17367048);
        ageAdapterFrom.setDropDownViewResource(17367049);
        ageAdapterFrom.add(getResources().getString(R.string.from));
        ArrayAdapter<String> ageAdapterTo = new ArrayAdapter<>(getActivity(), 17367048);
        ageAdapterTo.setDropDownViewResource(17367049);
        ageAdapterTo.add(getResources().getString(R.string.to));
        for (int i = 14; i <= 80; i++) {
            ageAdapterFrom.add(getString(R.string.age_from, new Object[]{Integer.valueOf(i)}));
            ageAdapterTo.add(getString(R.string.age_to, new Object[]{Integer.valueOf(i)}));
        }
        this.mAgeFromSpinner = (Spinner) root.findViewById(R.id.age_from);
        this.mAgeToSpinner = (Spinner) root.findViewById(R.id.age_to);
        this.mAgeFromSpinner.setAdapter((SpinnerAdapter) ageAdapterFrom);
        this.mAgeToSpinner.setAdapter((SpinnerAdapter) ageAdapterTo);
        this.mAgeFromSpinner.setOnItemSelectedListener(this.mCallbacks);
        this.mAgeToSpinner.setOnItemSelectedListener(this.mCallbacks);
    }

    void setupGenderParams(View root) {
        ((CompoundButton) root.findViewById(R.id.gender_any)).setOnCheckedChangeListener(this.mCallbacks);
        ((CompoundButton) root.findViewById(R.id.gender_male)).setOnCheckedChangeListener(this.mCallbacks);
        ((CompoundButton) root.findViewById(R.id.gender_female)).setOnCheckedChangeListener(this.mCallbacks);
    }

    void setupRegionParams(View root) {
        Spinner countrySpinner = (Spinner) root.findViewById(R.id.country_spinner);
        this.mCityButton = (TextView) root.findViewById(R.id.city_btn);
        this.mCityButton.setOnClickListener(this.mCallbacks);
        ArrayAdapter<Country> countryAdapter = new ArrayAdapter<Country>(getActivity(), 17367048, Country.getCountries(true, true, getString(R.string.edit_choose_country))) { // from class: com.vkontakte.android.fragments.search.ExtendedSearchFragment.3
            @Override // android.widget.ArrayAdapter, android.widget.Adapter
            public long getItemId(int pos) {
                return getItem(pos).id;
            }

            @Override // android.widget.ArrayAdapter, android.widget.BaseAdapter, android.widget.SpinnerAdapter
            public View getDropDownView(int position, View convertView, ViewGroup parent) {
                View v = super.getDropDownView(position, convertView, parent);
                if (v instanceof TextView) {
                    ((TextView) v).setTypeface(getItem(position).important ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
                }
                return v;
            }
        };
        countryAdapter.setDropDownViewResource(17367049);
        countrySpinner.setAdapter((SpinnerAdapter) countryAdapter);
        countrySpinner.setOnItemSelectedListener(this.mCallbacks);
    }

    void selectCity() {
        CitySelectFragment fragment = new CitySelectFragment();
        Bundle args = new Bundle();
        args.putString("hint", getString(R.string.edit_choose_city));
        args.putInt("country", this.mCountryId);
        args.putBoolean("show_none", this.mCityId > 0);
        fragment.setArguments(args);
        fragment.setCallback(this.mCallbacks);
        fragment.show(getFragmentManager(), "city");
    }

    void addFriend(final UsersSearch.SearchProfile user, final int position) {
        FriendsAdd.createFriendsAddAndSendAllStats(user.uid, null).wrapProgress(getActivity()).setCallback(new SimpleCallback<Integer>(this) { // from class: com.vkontakte.android.fragments.search.ExtendedSearchFragment.4
            @Override // com.vkontakte.android.api.Callback
            public void success(Integer result) {
                VKApplication.context.sendBroadcast(new Intent(Friends.ACTION_FRIEND_LIST_CHANGED), "com.vkontakte.android.permission.ACCESS_DATA");
                (ExtendedSearchFragment.this.mSearchMode ? ExtendedSearchFragment.this.mSearchSegmenter : ExtendedSearchFragment.this.mRecommendations).remove(user);
                ExtendedSearchFragment.this.data.remove(user);
                ExtendedSearchFragment.this.mo1066getAdapter().notifyItemRemoved(position);
            }
        }).exec((Context) getActivity());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class Holder extends UserHolder<UsersSearch.SearchProfile> {
        private final TextView mInfo;

        protected Holder(ViewGroup parent) {
            super(parent, R.layout.user_search_item, true, false, true);
            this.mInfo = (TextView) $(R.id.info);
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder, com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(UsersSearch.SearchProfile user) {
            int i = 8;
            super.onBind((Holder) user);
            this.mSubtitle.setVisibility(TextUtils.isEmpty(user.university) ? 8 : 0);
            this.mSubtitle.setText(user.university);
            if (this.mInfo != null) {
                TextView textView = this.mInfo;
                if (!TextUtils.isEmpty(user.commonCountStr)) {
                    i = 0;
                }
                textView.setVisibility(i);
                this.mInfo.setText(user.commonCountStr);
            }
        }

        @Override // com.vkontakte.android.ui.holder.UserHolder, android.view.View.OnClickListener
        public void onClick(View view) {
            super.onClick(view);
            if (view == this.mActionButton) {
                ExtendedSearchFragment.this.addFriend((UsersSearch.SearchProfile) getItem(), getAdapterPosition());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class Callbacks extends SearchIndexer.SimpleProvider<UsersSearch.SearchProfile> implements View.OnClickListener, TextWatcher, TextView.OnEditorActionListener, SearchSegmenter.Generator<UsersSearch.SearchProfile>, VoidFloat, VoidFBool, SearchSegmenter.LoadingListener<UsersSearch.SearchProfile>, CompoundButton.OnCheckedChangeListener, DatabaseSearchFragment.Callback<City>, AdapterView.OnItemSelectedListener {
        private Callbacks() {
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.clear /* 2131755669 */:
                    ExtendedSearchFragment.this.mQueryField.setText((CharSequence) null);
                    return;
                case R.id.voice /* 2131755670 */:
                    VoiceUtils.startVoiceRecognizer(ExtendedSearchFragment.this);
                    return;
                case R.id.city_btn /* 2131756319 */:
                    ExtendedSearchFragment.this.selectCity();
                    return;
                default:
                    return;
            }
        }

        @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
        public char[] getIndexChar(UsersSearch.SearchProfile from) {
            return null;
        }

        @Override // com.vkontakte.android.fragments.friends.SearchIndexer.Provider
        public boolean matches(String query, UsersSearch.SearchProfile item) {
            return false;
        }

        @Override // android.widget.TextView.OnEditorActionListener
        public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
            InputMethodManager imm = (InputMethodManager) ExtendedSearchFragment.this.getActivity().getSystemService("input_method");
            imm.hideSoftInputFromWindow(v.getWindowToken(), 0);
            return true;
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
            ExtendedSearchFragment.this.mClear.setVisibility(!TextUtils.isEmpty(s) ? 0 : 8);
            ExtendedSearchFragment.this.updateFilter(s.toString());
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
        }

        @Override // com.vkontakte.android.ui.util.SearchSegmenter.Generator
        public VKAPIRequest<? extends PaginatedList<? extends UsersSearch.SearchProfile>> getSearchRequest(String query, int offset, int count) {
            Bundle args = new Bundle();
            args.putInt("city", ExtendedSearchFragment.this.mCityId);
            args.putInt("country", ExtendedSearchFragment.this.mCountryId);
            args.putInt("sex", ExtendedSearchFragment.this.mSex);
            args.putInt("status", ExtendedSearchFragment.this.mRelation);
            args.putInt("age_from", ExtendedSearchFragment.this.mAgeFrom);
            args.putInt("age_to", ExtendedSearchFragment.this.mAgeTo);
            return new UsersSearch(query, args, offset, count);
        }

        @Override // com.vkontakte.android.functions.VoidFBool
        public void f(boolean opened) {
            if (ExtendedSearchFragment.this.mChanged && !opened) {
                ExtendedSearchFragment.this.mChanged = false;
                ExtendedSearchFragment.this.updateFilter();
            }
        }

        @Override // com.vkontakte.android.functions.VoidFloat
        public void f(float percent) {
            ExtendedSearchFragment.this.mSearchIcon.setRotation(180.0f * percent);
        }

        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            if (isChecked) {
                int newGender = ExtendedSearchFragment.this.mSex;
                switch (buttonView.getId()) {
                    case R.id.gender_any /* 2131756320 */:
                        newGender = 0;
                        break;
                    case R.id.gender_male /* 2131756321 */:
                        newGender = 2;
                        break;
                    case R.id.gender_female /* 2131756322 */:
                        newGender = 1;
                        break;
                }
                if (newGender != ExtendedSearchFragment.this.mSex) {
                    ExtendedSearchFragment.this.mSex = newGender;
                    ExtendedSearchFragment.this.mChanged = true;
                }
            }
        }

        @Override // com.vkontakte.android.fragments.DatabaseSearchFragment.Callback
        public void onItemSelected(City item) {
            if (item.id != ExtendedSearchFragment.this.mCityId) {
                ExtendedSearchFragment.this.mCityId = item.id;
                ExtendedSearchFragment.this.mChanged = true;
                if (ExtendedSearchFragment.this.mCityId > 0) {
                    ExtendedSearchFragment.this.mCityButton.setText(item.title);
                } else {
                    ExtendedSearchFragment.this.mCityButton.setText(R.string.edit_choose_city);
                }
            }
        }

        @Override // android.widget.AdapterView.OnItemSelectedListener
        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
            boolean z = false;
            switch (parent.getId()) {
                case R.id.country_spinner /* 2131756318 */:
                    if (ExtendedSearchFragment.this.mCountryId != id) {
                        ExtendedSearchFragment.this.mCountryId = (int) id;
                        ExtendedSearchFragment.this.mCityId = 0;
                        ExtendedSearchFragment.this.mCityButton.setText(R.string.edit_choose_city);
                        TextView textView = ExtendedSearchFragment.this.mCityButton;
                        if (ExtendedSearchFragment.this.mCountryId > 0) {
                            z = true;
                        }
                        textView.setEnabled(z);
                        ExtendedSearchFragment.this.mChanged = true;
                        return;
                    }
                    return;
                case R.id.city_btn /* 2131756319 */:
                case R.id.gender_any /* 2131756320 */:
                case R.id.gender_male /* 2131756321 */:
                case R.id.gender_female /* 2131756322 */:
                default:
                    return;
                case R.id.age_from /* 2131756323 */:
                    int age = position > 0 ? position + 13 : 0;
                    if (ExtendedSearchFragment.this.mAgeFrom != age) {
                        ExtendedSearchFragment.this.mAgeFrom = age;
                        ExtendedSearchFragment.this.mChanged = true;
                        if (ExtendedSearchFragment.this.mAgeTo < ExtendedSearchFragment.this.mAgeFrom && ExtendedSearchFragment.this.mAgeTo > 0) {
                            ExtendedSearchFragment.this.mAgeToSpinner.setSelection(ExtendedSearchFragment.this.mAgeFrom - 13);
                            return;
                        }
                        return;
                    }
                    return;
                case R.id.age_to /* 2131756324 */:
                    int age2 = position > 0 ? position + 13 : 0;
                    if (ExtendedSearchFragment.this.mAgeTo != age2) {
                        ExtendedSearchFragment.this.mAgeTo = age2;
                        ExtendedSearchFragment.this.mChanged = true;
                        if (ExtendedSearchFragment.this.mAgeFrom > ExtendedSearchFragment.this.mAgeTo && ExtendedSearchFragment.this.mAgeTo > 0) {
                            ExtendedSearchFragment.this.mAgeFromSpinner.setSelection(ExtendedSearchFragment.this.mAgeTo - 13);
                            return;
                        }
                        return;
                    }
                    return;
                case R.id.relation_spinner /* 2131756325 */:
                    Relation relation = Relation.getRelationsById(id);
                    if (ExtendedSearchFragment.this.mRelation != relation.id) {
                        ExtendedSearchFragment.this.mRelation = relation.id;
                        ExtendedSearchFragment.this.mChanged = true;
                        return;
                    }
                    return;
            }
        }

        @Override // android.widget.AdapterView.OnItemSelectedListener
        public void onNothingSelected(AdapterView<?> parent) {
        }

        @Override // com.vkontakte.android.ui.util.SearchSegmenter.LoadingListener
        public void onError(ErrorResponse error, String query, int offset, int count) {
            if (offset == 0) {
                ExtendedSearchFragment.this.loaded = false;
                ExtendedSearchFragment.this.onError(error);
            }
        }

        @Override // com.vkontakte.android.ui.util.SearchSegmenter.LoadingListener
        public void onSuccess(PaginatedList<? extends UsersSearch.SearchProfile> result, String query, int offset, int count) {
            if (offset == 0) {
                ExtendedSearchFragment.this.loaded = true;
                ExtendedSearchFragment.this.showContent();
                ExtendedSearchFragment.this.updateList();
            }
        }
    }
}
