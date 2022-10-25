package com.vkontakte.android;

import android.app.Fragment;
import android.app.NotificationManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v13.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.PopupMenu;
import android.widget.TextView;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.apps.AppsGetGenres;
import com.vkontakte.android.api.apps.AppsRemove;
import com.vkontakte.android.api.apps.CatalogLoader;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.CatalogInfo;
import com.vkontakte.android.data.GameGenre;
import com.vkontakte.android.data.Games;
import com.vkontakte.android.fragments.GameCardFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.ResulterProvider;
import com.vkontakte.android.ui.widget.PageIndicator;
import com.vkontakte.android.ui.widget.SlidingUpPanelLayout;
import com.vkontakte.android.utils.Utils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class GameCardActivity extends VKActivity implements GameCardFragment.IOnListViewCreated, ViewPager.OnPageChangeListener, SlidingUpPanelLayout.PanelSlideListener, ResulterProvider {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final String KEY_APPLICATIONS = "key_applications";
    private static final String KEY_CATALOG_INFO = "key_catalog_info";
    private static final String KEY_CURRENT_APPLICATION_INDEX = "key_current_application_index";
    private static final String KEY_FROM_NOTIFICATION = "key_from_notification";
    private static final String KEY_TITLE = "key_title";
    private static final int MAX_APPLICATIONS_IN_BUNDLE = 100;
    private static ArrayList<ApiApplication> bufferApiApplications;
    static long lastTime;
    private ArrayList<ApiApplication> apiApplications;
    @Nullable
    private CatalogInfo catalogInfo = null;
    private CatalogLoader catalogLoader;
    private int currentIndex;
    private View headerBlock;
    private List<ActivityResulter> mResulters;
    private View openActionMenu;
    private PageIndicator pageIndicator;
    private TextView pageTitle;
    private SlidingUpPanelLayout slidingLayout;
    private String title;
    private ViewPager viewPager;

    static {
        $assertionsDisabled = !GameCardActivity.class.desiredAssertionStatus();
        bufferApiApplications = null;
        lastTime = 0L;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (this.mResulters != null) {
            for (ActivityResulter resulter : this.mResulters) {
                resulter.onActivityResult(requestCode, resultCode, data);
            }
        }
    }

    @Override // com.vkontakte.android.ui.ResulterProvider
    public void registerActivityResult(ActivityResulter result) {
        if (this.mResulters == null) {
            this.mResulters = new ArrayList();
        }
        this.mResulters.add(result);
    }

    @Override // com.vkontakte.android.ui.ResulterProvider
    public void unregisterActivityResult(ActivityResulter result) {
        if (this.mResulters != null) {
            this.mResulters.remove(result);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (this.apiApplications != null && this.apiApplications.size() < 100) {
            outState.putParcelableArrayList(KEY_APPLICATIONS, this.apiApplications);
        } else {
            outState.putParcelableArrayList(KEY_APPLICATIONS, new ArrayList<>());
        }
        outState.putInt(KEY_CURRENT_APPLICATION_INDEX, this.viewPager.getCurrentItem());
        outState.putParcelable(KEY_CATALOG_INFO, this.catalogInfo);
        outState.putString(KEY_TITLE, this.title);
    }

    private int initValues(Bundle bundle) {
        int index = bundle.getInt(KEY_CURRENT_APPLICATION_INDEX);
        ArrayList<Parcelable> parcelables = bundle.getParcelableArrayList(KEY_APPLICATIONS);
        this.catalogInfo = (CatalogInfo) bundle.getParcelable(KEY_CATALOG_INFO);
        this.title = bundle.getString(KEY_TITLE);
        if ($assertionsDisabled || parcelables != null) {
            if (bufferApiApplications != null && parcelables.isEmpty()) {
                parcelables.addAll(bufferApiApplications);
                bufferApiApplications = null;
            }
            this.apiApplications = new ArrayList<>(parcelables.size());
            int currentIndex = (index < 0 || index >= parcelables.size()) ? 0 : index;
            int countOfHtml5GamesBeforeCurrentIndex = 0;
            for (int i = 0; i < parcelables.size(); i++) {
                ApiApplication a = (ApiApplication) parcelables.get(i);
                if (!a.isHtml5App) {
                    this.apiApplications.add(a);
                } else if (i < currentIndex) {
                    countOfHtml5GamesBeforeCurrentIndex++;
                }
            }
            int currentIndex2 = currentIndex - countOfHtml5GamesBeforeCurrentIndex;
            if (this.catalogInfo != null) {
                if (!TextUtils.isEmpty(this.catalogInfo.title)) {
                    this.pageTitle.setText(this.catalogInfo.title);
                } else if (this.catalogInfo.titleRes > 0) {
                    this.pageTitle.setText(this.catalogInfo.titleRes);
                }
                this.catalogLoader = new CatalogLoader(this.apiApplications, this.catalogInfo, true) { // from class: com.vkontakte.android.GameCardActivity.1
                    @Override // com.vkontakte.android.api.apps.CatalogLoader
                    public void onLoadedNextPage(ArrayList<ApiApplication> allData, boolean canLoadMore) {
                        GameCardActivity.this.apiApplications = allData;
                        GameCardActivity.this.viewPager.mo1110getAdapter().notifyDataSetChanged();
                        GameCardActivity.this.syncGui(GameCardActivity.this.apiApplications);
                    }
                };
            }
            if (!TextUtils.isEmpty(this.title)) {
                this.pageTitle.setText(this.title);
            }
            if (this.apiApplications.size() == 0) {
                this.catalogLoader.forceLoadNextPage();
            }
            this.pageIndicator.setCountOfPages(this.apiApplications.size());
            this.viewPager.setAdapter(new Adapter());
            this.viewPager.setCurrentItem(currentIndex2);
            syncGui(this.apiApplications);
            return currentIndex2;
        }
        throw new AssertionError();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void syncGui(ArrayList<ApiApplication> allData) {
        if (allData == null || allData.size() < 2) {
            this.pageIndicator.setVisibility(8);
            this.pageTitle.setTextSize(1, 20.0f);
            return;
        }
        this.pageIndicator.setVisibility(0);
        this.pageTitle.setTextSize(1, 16.0f);
    }

    private int getActionBarHeight() {
        TypedValue tv = new TypedValue();
        if (getTheme().resolveAttribute(16843499, tv, true)) {
            return TypedValue.complexToDimensionPixelSize(tv.data, getResources().getDisplayMetrics());
        }
        return 0;
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (this.viewPager != null) {
            int item = this.viewPager.getCurrentItem();
            this.viewPager.setAdapter(this.viewPager.mo1110getAdapter());
            this.viewPager.setCurrentItem(item, false);
        }
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setBackgroundDrawableResource(R.drawable.transparent);
        setContentView(R.layout.apps_card_activity);
        this.viewPager = (ViewPager) findViewById(R.id.pager);
        this.slidingLayout = (SlidingUpPanelLayout) findViewById(R.id.closable_sliding_layout);
        this.pageIndicator = (PageIndicator) findViewById(R.id.game_page_indicator);
        this.headerBlock = findViewById(R.id.header_block);
        this.pageTitle = (TextView) findViewById(R.id.page_title);
        this.openActionMenu = findViewById(R.id.open_action_menu);
        this.viewPager.addOnPageChangeListener(this);
        this.viewPager.setOffscreenPageLimit(1);
        this.slidingLayout.setHeaderPadding(getActionBarHeight() + Global.scale(80.0f));
        this.slidingLayout.setPanelSlideListener(this);
        this.slidingLayout.getViewTreeObserver().addOnPreDrawListener(new AnonymousClass2());
        if (savedInstanceState == null) {
            this.currentIndex = initValues(getIntent().getExtras());
        } else {
            this.headerBlock.setAlpha(1.0f);
            this.currentIndex = initValues(savedInstanceState);
        }
        if (this.apiApplications.isEmpty()) {
            finish();
            return;
        }
        if (this.openActionMenu != null && !this.apiApplications.isEmpty()) {
            ApiApplication app = this.apiApplications.get(this.currentIndex);
            this.openActionMenu.setVisibility((app == null || !app.installed) ? 8 : 0);
        }
        if (TextUtils.isEmpty(this.title) && this.catalogInfo != null && TextUtils.isEmpty(this.catalogInfo.title) && this.catalogInfo.hasGenreId()) {
            new AppsGetGenres().setCallback(new SimpleCallback<ArrayList<GameGenre>>() { // from class: com.vkontakte.android.GameCardActivity.3
                @Override // com.vkontakte.android.api.Callback
                public void success(ArrayList<GameGenre> result) {
                    Iterator<GameGenre> it = result.iterator();
                    while (it.hasNext()) {
                        GameGenre gameGenre = it.next();
                        if (gameGenre.id == GameCardActivity.this.catalogInfo.genre_id) {
                            GameCardActivity.this.pageTitle.setText(GameCardActivity.this.title = gameGenre.name);
                        }
                    }
                }
            }).exec((Context) this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.GameCardActivity$2  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass2 implements ViewTreeObserver.OnPreDrawListener {
        AnonymousClass2() {
        }

        @Override // android.view.ViewTreeObserver.OnPreDrawListener
        public boolean onPreDraw() {
            GameCardActivity.this.slidingLayout.getViewTreeObserver().removeOnPreDrawListener(this);
            GameCardActivity.this.slidingLayout.post(GameCardActivity$2$$Lambda$1.lambdaFactory$(this));
            return true;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onPreDraw$0() {
            GameCardActivity.this.slidingLayout.smoothToTop();
        }
    }

    public void finish(View view) {
        onBackPressed();
    }

    public void openActionMenu(View view) {
        ArrayList<String> items = new ArrayList<>();
        items.add(getResources().getString(R.string.remove_app));
        PopupMenu pm = new PopupMenu(this, view);
        for (int i = 0; i < items.size(); i++) {
            pm.getMenu().add(0, i, 0, items.get(i));
        }
        pm.setOnMenuItemClickListener(GameCardActivity$$Lambda$1.lambdaFactory$(this));
        pm.show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$openActionMenu$1(MenuItem item) {
        new VKAlertDialog.Builder(this).setTitle(R.string.confirm).setMessage(R.string.app_remove_confirm).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).setPositiveButton(R.string.yes, GameCardActivity$$Lambda$2.lambdaFactory$(this)).show();
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$null$0(DialogInterface dialog, int which) {
        doRemoveApp();
    }

    private void doRemoveApp() {
        new AppsRemove(this.apiApplications.get(this.currentIndex).id).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.GameCardActivity.4
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                GameCardActivity.this.sendBroadcast(new Intent(Games.ACTION_RELOAD_INSTALLED), "com.vkontakte.android.permission.ACCESS_DATA");
            }
        }).wrapProgress(this).exec((Context) this);
    }

    @Override // android.app.Activity
    public void finish() {
        super.finish();
        overridePendingTransition(0, 0);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onBackPressed() {
        if (this.slidingLayout != null) {
            this.slidingLayout.smoothToBottom();
        } else {
            super.onBackPressed();
        }
    }

    protected String getSource() {
        return getIntent().getBooleanExtra(KEY_FROM_NOTIFICATION, false) ? "push" : "direct";
    }

    public static void openApp(@NonNull Context ctx, @NonNull String visitSource, @NonNull String clickSource, int appId) {
        ApiApplication application = new ApiApplication();
        application.id = appId;
        openApp(ctx, visitSource, clickSource, application);
    }

    public static void openApp(@NonNull Context ctx, @NonNull String visitSource, @NonNull String clickSource, @NonNull ApiApplication app) {
        ArrayList<ApiApplication> apiApplications = new ArrayList<>();
        apiApplications.add(app);
        openApp(ctx, visitSource, clickSource, apiApplications, 0);
    }

    public static void openApp(@NonNull Context ctx, @NonNull String visitSource, @NonNull String clickSource, @NonNull ArrayList<ApiApplication> applications, int currentIndex) {
        CatalogInfo catalogInfo = null;
        Iterator<ApiApplication> it = applications.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            ApiApplication application = it.next();
            if (application.catalogInfo != null) {
                catalogInfo = application.catalogInfo;
                break;
            }
        }
        openApp(ctx, visitSource, clickSource, applications, currentIndex, catalogInfo);
    }

    public static void openApp(@NonNull Context ctx, @NonNull String visitSource, @NonNull String clickSource, @NonNull CatalogInfo catalogInfo) {
        openApp(ctx, visitSource, clickSource, null, 0, catalogInfo);
    }

    private static void openApp(@NonNull Context ctx, @NonNull String visitSource, @NonNull String clickSource, @Nullable ArrayList<ApiApplication> applications, int currentIndex, @Nullable CatalogInfo catalogInfo) {
        if (applications.get(currentIndex).isHtml5App) {
            Games.openHtml5Game(applications.get(currentIndex), null, ctx, visitSource, clickSource);
            return;
        }
        if (applications == null) {
            applications = new ArrayList<>();
        }
        if (catalogInfo != null && catalogInfo.filterType == CatalogInfo.FilterType.installed) {
            Iterator<ApiApplication> it = applications.iterator();
            while (it.hasNext()) {
                ApiApplication application = it.next();
                application.installed = true;
            }
        }
        Intent intent = new Intent(ctx, GameCardActivity.class);
        if (applications.size() < 100) {
            intent.putParcelableArrayListExtra(KEY_APPLICATIONS, applications);
        } else {
            intent.putParcelableArrayListExtra(KEY_APPLICATIONS, new ArrayList<>());
            bufferApiApplications = applications;
        }
        intent.putExtra(KEY_CURRENT_APPLICATION_INDEX, currentIndex);
        intent.putExtra(KEY_CATALOG_INFO, catalogInfo);
        intent.addFlags(65536);
        intent.putExtra(ArgKeys.VISIT_SOURCE, visitSource);
        intent.putExtra(ArgKeys.CLICK_SOURCE, clickSource);
        if (Math.abs(System.currentTimeMillis() - lastTime) > 400) {
            lastTime = System.currentTimeMillis();
            ctx.startActivity(intent);
        }
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        NotificationManager nm = (NotificationManager) getSystemService("notification");
        nm.cancel(GCMBroadcastReceiver.ID_GAME_NOTIFICATION);
    }

    public void updateApiAppItem(ApiApplication apiApplication) {
        int index = this.apiApplications.indexOf(apiApplication);
        if (index >= 0 && index < this.apiApplications.size()) {
            this.apiApplications.set(index, apiApplication);
        }
        if (this.catalogLoader != null) {
            this.catalogLoader.updateApiApplication(apiApplication);
        }
        if (this.viewPager != null && index == this.viewPager.getCurrentItem() && this.openActionMenu != null) {
            this.openActionMenu.setVisibility(apiApplication.installed ? 0 : 8);
        }
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageSelected(int position) {
        this.currentIndex = position;
        if (this.pageIndicator != null) {
            this.pageIndicator.setIndexOfCurrentPage(position, true);
        }
        if (this.catalogLoader != null && position > this.viewPager.mo1110getAdapter().getCount() - 3) {
            this.catalogLoader.forceLoadNextPage();
        }
        if (this.openActionMenu != null) {
            ApiApplication app = this.apiApplications.get(position);
            this.openActionMenu.setVisibility(app.installed ? 0 : 8);
        }
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int state) {
    }

    @Override // com.vkontakte.android.ui.widget.SlidingUpPanelLayout.PanelSlideListener
    public void onPanelSlide(View panel, float slideOffset) {
        if (this.headerBlock != null) {
            this.headerBlock.setAlpha(slideOffset);
        }
    }

    @Override // com.vkontakte.android.ui.widget.SlidingUpPanelLayout.PanelSlideListener
    public void onPanelCollapsed(View panel) {
        finish();
    }

    @Override // com.vkontakte.android.ui.widget.SlidingUpPanelLayout.PanelSlideListener
    public void onPanelExpanded(View panel) {
    }

    @Override // com.vkontakte.android.ui.widget.SlidingUpPanelLayout.PanelSlideListener
    public void onPanelAnchored(View panel) {
    }

    @Override // com.vkontakte.android.ui.widget.SlidingUpPanelLayout.PanelSlideListener
    public void onPanelHidden(View panel) {
    }

    @Override // com.vkontakte.android.fragments.GameCardFragment.IOnListViewCreated
    public void onRecycleViewCreated(UsableRecyclerView listView, int index) {
        if (this.viewPager != null && index == this.viewPager.getCurrentItem()) {
            this.slidingLayout.setTarget(listView);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class Adapter extends FragmentPagerAdapter {
        public Adapter() {
            super(GameCardActivity.this.getFragmentManager());
        }

        @Override // android.support.v13.app.FragmentPagerAdapter
        public Fragment getItem(int position) {
            GameCardFragment fragment = new GameCardFragment();
            Bundle bundle = GameCardActivity.this.getIntent().getExtras();
            String vs = Utils.readString(bundle, ArgKeys.VISIT_SOURCE, "direct");
            String cs = Utils.readString(bundle, ArgKeys.CLICK_SOURCE, "catalog");
            fragment.setArguments(GameCardFragment.createArgs((ApiApplication) GameCardActivity.this.apiApplications.get(position), position, vs, cs));
            fragment.setOnListViewCreated(GameCardActivity.this);
            return fragment;
        }

        @Override // android.support.v13.app.FragmentPagerAdapter, android.support.v4.view.PagerAdapter
        public void setPrimaryItem(ViewGroup container, int position, Object object) {
            super.setPrimaryItem(container, position, object);
            if (object != null) {
                GameCardFragment fragment = (GameCardFragment) object;
                fragment.setOnListViewCreated(GameCardActivity.this);
            }
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return GameCardActivity.this.apiApplications.size();
        }

        @Override // android.support.v4.view.PagerAdapter
        public void notifyDataSetChanged() {
            super.notifyDataSetChanged();
            Runnable runnable = GameCardActivity$Adapter$$Lambda$1.lambdaFactory$(this);
            GameCardActivity.this.runOnUiThread(runnable);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$notifyDataSetChanged$0() {
            GameCardActivity.this.pageIndicator.setCountOfPages(getCount());
        }
    }
}
