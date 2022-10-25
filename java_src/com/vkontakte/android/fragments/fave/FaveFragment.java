package com.vkontakte.android.fragments.fave;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.view.View;
import com.vkontakte.android.R;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.fragments.VKTabbedFragment;
import com.vkontakte.android.fragments.market.MarketFragment;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes2.dex */
public class FaveFragment extends VKTabbedFragment {
    private FaveLinkListFragment links;
    private MarketFragment market;
    private FavePhotoListFragment photos;
    private FavePostListFragment posts;
    private FaveUserListFragment users;
    private FaveVideoListFragment videos;

    public FaveFragment() {
        setTabsAutoLoad(false);
    }

    @Override // me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.fave_title);
    }

    @Override // com.vkontakte.android.fragments.VKTabbedFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        return true;
    }

    @Override // com.vkontakte.android.fragments.VKTabbedFragment, me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        List<String> titles = Arrays.asList(getResources().getStringArray(R.array.fave_tabs));
        Bundle b1 = new Bundle();
        b1.putString("emptyText", getString(R.string.no_users));
        Bundle b2 = new Bundle();
        b2.putString("emptyText", getString(R.string.no_links));
        this.users = new FaveUserListFragment();
        this.videos = new FaveVideoListFragment();
        this.market = new MarketFragment();
        Bundle bundle = new Bundle();
        bundle.putBoolean("isFaveMode", true);
        this.market.setArguments(bundle);
        this.posts = new FavePostListFragment();
        Bundle pargs = new Bundle();
        pargs.putBoolean("no_autoload", true);
        this.posts.setArguments(pargs);
        this.photos = new FavePhotoListFragment();
        Bundle args = new Bundle();
        PhotoAlbum a = new PhotoAlbum();
        a.id = -9001;
        a.title = getString(R.string.fave_title);
        a.numPhotos = 9000;
        args.putParcelable(ArgKeys.ALBUM, a);
        args.putBoolean("no_album_header", true);
        this.photos.setArguments(args);
        this.links = new FaveLinkListFragment();
        Bundle args2 = new Bundle();
        args2.putBoolean("no_autoload", false);
        this.links.setArguments(args2);
        List<Fragment> tabs = new ArrayList<Fragment>(5) { // from class: com.vkontakte.android.fragments.fave.FaveFragment.1
            {
                add(FaveFragment.this.users);
                add(FaveFragment.this.posts);
                add(FaveFragment.this.links);
                add(FaveFragment.this.photos);
                add(FaveFragment.this.videos);
                add(FaveFragment.this.market);
            }
        };
        setTabs(tabs, titles);
    }
}
