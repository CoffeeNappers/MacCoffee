package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.attachpicker.AttachActivity;
import com.vk.attachpicker.SupportExternalToolbarContainer;
import com.vkontakte.android.ActivityUtils;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.photos.PhotosGetUserPhotos;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.photos.PhotoAlbumListFragment;
import com.vkontakte.android.fragments.photos.PhotoListFragment;
import com.vkontakte.android.fragments.photos.PhotosOfMeFragment;
import com.vkontakte.android.fragments.photos.YearSectionedPhotoListFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.BadgeSpan;
import com.vkontakte.android.ui.Font;
import java.util.ArrayList;
import java.util.Collections;
/* loaded from: classes2.dex */
public class PhotosFragment extends VKTabbedFragment implements SupportExternalToolbarContainer {
    private PhotoListFragment allPhotosFragment;
    private PhotoNewsFragment newsFragment;
    private PhotoAlbumListFragment photosFragment;
    private int uid;
    private PhotoListFragment userPhotosFragment;

    private boolean isInContextOfAttachActivity() {
        return getActivity() instanceof AttachActivity;
    }

    @Override // me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        this.uid = getArguments().getInt(ArgKeys.UID, VKAccountManager.getCurrent().getUid());
        ActivityUtils.setBeamLink(act, "albums" + this.uid);
        if (getArguments().containsKey("title")) {
            setTitle(getArguments().getCharSequence("title"));
        } else {
            setTitle(getString(R.string.photos));
        }
        final ArrayList<Fragment> tabs = new ArrayList<>();
        final ArrayList<CharSequence> titles = new ArrayList<>();
        if (getArguments().getBoolean("show_friends_feed")) {
            this.newsFragment = new PhotoNewsFragment();
            tabs.add(this.newsFragment);
            titles.add(getString(R.string.friends));
        }
        Bundle args = new Bundle();
        PhotoAlbum allPhotos = new PhotoAlbum();
        allPhotos.title = getString(R.string.all_photos);
        allPhotos.id = -9002;
        allPhotos.oid = this.uid;
        this.allPhotosFragment = new YearSectionedPhotoListFragment();
        args.putParcelable(ArgKeys.ALBUM, allPhotos);
        args.putBoolean("no_album_header", true);
        args.putBoolean("autoload", !getArguments().getBoolean("show_friends_feed"));
        args.putBoolean(ArgKeys.SELECT, getArguments().getBoolean(ArgKeys.SELECT));
        this.allPhotosFragment.setArguments(args);
        tabs.add(this.allPhotosFragment);
        titles.add(getString(R.string.all_photos_short));
        Bundle args2 = new Bundle();
        this.photosFragment = new PhotoAlbumListFragment();
        args2.putInt(ArgKeys.UID, this.uid);
        args2.putBoolean("no_title", true);
        args2.putBoolean("need_system", true);
        args2.putBoolean(ArgKeys.SELECT, getArguments().getBoolean(ArgKeys.SELECT));
        this.photosFragment.setArguments(args2);
        tabs.add(this.photosFragment);
        titles.add(getString(R.string.albums));
        if (this.uid == VKAccountManager.getCurrent().getUid() || getArguments().containsKey("can_view_user_photos")) {
            if (this.uid == VKAccountManager.getCurrent().getUid() || getArguments().getBoolean("can_view_user_photos")) {
                PhotoAlbum userPhotos = new PhotoAlbum();
                userPhotos.title = this.uid == VKAccountManager.getCurrent().getUid() ? getString(R.string.user_photos_title_me) : getString(R.string.user_photos_title, new Object[]{getArguments().getString("user_name_ins")});
                userPhotos.id = -9000;
                userPhotos.oid = this.uid;
                Bundle args3 = new Bundle();
                args3.putParcelable(ArgKeys.ALBUM, userPhotos);
                args3.putBoolean("no_album_header", true);
                args3.putBoolean(ArgKeys.SELECT, getArguments().getBoolean(ArgKeys.SELECT));
                this.userPhotosFragment = this.uid == VKAccountManager.getCurrent().getUid() ? new PhotosOfMeFragment() : new PhotoListFragment();
                this.userPhotosFragment.setArguments(args3);
                tabs.add(this.userPhotosFragment);
                if (VKAccountManager.isCurrentUser(this.uid)) {
                    if (LongPollService.getNumPhotosMarks() > 0) {
                        SpannableStringBuilder ssb = new SpannableStringBuilder(getString(R.string.photos_of_me).toUpperCase());
                        ssb.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                        SpannableString ss = new SpannableString(LongPollService.getNumPhotosMarks() + "");
                        ss.setSpan(new BadgeSpan(), 0, ss.length(), 0);
                        ssb.append((CharSequence) ss);
                        titles.add(ssb);
                    } else {
                        titles.add(getString(R.string.photos_of_me).toUpperCase());
                    }
                } else {
                    titles.add(getString(R.string.photos_of_user, new Object[]{getArguments().getString("user_name_ins")}));
                }
            }
        } else if (this.uid > 0) {
            new PhotosGetUserPhotos(this.uid, 0, 0).setCallback(new Callback<VKList<Photo>>() { // from class: com.vkontakte.android.fragments.PhotosFragment.1
                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<Photo> result) {
                    if (result.total() > 0) {
                        Friends.getUsers(Collections.singletonList(Integer.valueOf(PhotosFragment.this.uid)), new Friends.GetUsersCallback() { // from class: com.vkontakte.android.fragments.PhotosFragment.1.1
                            @Override // com.vkontakte.android.data.Friends.GetUsersCallback
                            public void onUsersLoaded(ArrayList<UserProfile> users) {
                                PhotoAlbum userPhotos2 = new PhotoAlbum();
                                userPhotos2.title = PhotosFragment.this.getString(R.string.user_photos_title, new Object[]{users.get(0).firstName});
                                userPhotos2.id = -9000;
                                userPhotos2.oid = PhotosFragment.this.uid;
                                Bundle args4 = new Bundle();
                                args4.putParcelable(ArgKeys.ALBUM, userPhotos2);
                                args4.putBoolean("no_album_header", true);
                                PhotosFragment.this.userPhotosFragment = new PhotoListFragment();
                                PhotosFragment.this.userPhotosFragment.setArguments(args4);
                                tabs.add(PhotosFragment.this.userPhotosFragment);
                                titles.add(PhotosFragment.this.getString(R.string.photos_of_user, new Object[]{users.get(0).firstName}));
                                PhotosFragment.this.setTabs(tabs, titles);
                            }
                        }, 4);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                }
            }).exec((Context) getActivity());
        }
        setTabs(tabs, titles);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.fragments.VKTabbedFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean canGoBack() {
        if (isInContextOfAttachActivity()) {
            return false;
        }
        return super.canGoBack();
    }

    @Override // com.vkontakte.android.fragments.VKTabbedFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        return !isInContextOfAttachActivity();
    }

    @Override // com.vkontakte.android.fragments.VKTabbedFragment, me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (isInContextOfAttachActivity()) {
            getToolbar().setVisibility(8);
            view.setBackgroundColor(-1);
            this.allPhotosFragment.disableRefresh();
            this.userPhotosFragment.disableRefresh();
            this.photosFragment.disableRefresh();
            TabLayout tabLayout = (TabLayout) view.findViewById(R.id.tabs);
            tabLayout.setBackgroundColor(-1);
            tabLayout.setTabTextColors(Color.parseColor("#B9CDE3"), getResources().getColor(R.color.brand_primary));
            tabLayout.setSelectedTabIndicatorColor(getResources().getColor(R.color.brand_primary));
        }
        if (VKAccountManager.isCurrentUser(this.uid)) {
            TabLayout tl = (TabLayout) getTabView();
            TabLayout.Tab tab = tl.getTabAt(tl.getTabCount() - 1);
            TextView customView = (TextView) View.inflate(tl.getContext(), R.layout.design_layout_tab_text, null);
            customView.setId(16908308);
            TypedArray ta = tl.getContext().obtainStyledAttributes(new int[]{8});
            customView.setTextAppearance(tl.getContext(), ta.getResourceId(0, 2131427792));
            if (Build.VERSION.SDK_INT < 21) {
                customView.setTypeface(Font.Medium.typeface);
            }
            customView.setTextColor(tl.getTabTextColors());
            ta.recycle();
            customView.setAllCaps(false);
            tab.setCustomView(customView);
        }
    }

    @Override // com.vk.attachpicker.SupportExternalToolbarContainer
    public ViewGroup provideToolbar(Context context) {
        return getToolbar();
    }
}
