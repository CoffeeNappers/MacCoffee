package com.vkontakte.android.fragments.attachmentspicker;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vk.attachpicker.SupportExternalToolbarContainer;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.photos.PhotoAlbumListFragment;
import com.vkontakte.android.fragments.photos.PhotoListFragment;
import com.vkontakte.android.fragments.photos.PhotosOfMeFragment;
import com.vkontakte.android.fragments.photos.YearSectionedPhotoListFragment;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.ArrayList;
import me.grishka.appkit.fragments.AppKitFragment;
import me.grishka.appkit.fragments.ContainerFragment;
/* loaded from: classes2.dex */
public class PickVKPhotoFragment extends ContainerFragment implements SupportExternalToolbarContainer {
    private static final String INNER_FRAGMENT_TAG = "INNER_PHOTO_FRAGMENT";
    private PhotoAlbumListFragment albumsFragment;
    private PhotoListFragment allPhotosFragment;
    private int currentPos = -1;
    private boolean needRecreateInnerFragment = false;
    private ArrayList<CharSequence> spinnerItemsData;
    private PhotoListFragment userPhotosFragment;

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        Log.v("PickVKPhotoFragment", "onAttach");
        super.onAttach(activity);
        this.spinnerItemsData = new ArrayList<>(3);
        this.spinnerItemsData.add(getString(R.string.all_photos_short));
        this.spinnerItemsData.add(getString(R.string.albums));
        this.spinnerItemsData.add(getString(R.string.photos_of_me));
        this.spinnerViewResourceId = R.layout.spinner_view_light;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment
    protected boolean onSpinnerItemSelected(int pos) {
        if (this.needRecreateInnerFragment || pos != this.currentPos) {
            Fragment f = null;
            switch (pos) {
                case 0:
                    f = getAllPhotosFragment();
                    break;
                case 1:
                    f = getAlbumsFragment();
                    break;
                case 2:
                    f = getUserPhotosFragment();
                    break;
            }
            if (f != null) {
                FragmentManager fm = getInnerFragmentManager();
                FragmentTransaction fragmentTransaction = fm.beginTransaction();
                fragmentTransaction.replace(R.id.appkit_content, f, INNER_FRAGMENT_TAG);
                fragmentTransaction.commit();
            }
            this.currentPos = pos;
            this.needRecreateInnerFragment = false;
        }
        return true;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        Fragment f = getInnerFragmentManager().findFragmentByTag(INNER_FRAGMENT_TAG);
        if (f != null && !getActivity().isFinishing()) {
            getInnerFragmentManager().beginTransaction().remove(f).commitAllowingStateLoss();
        }
        this.needRecreateInnerFragment = true;
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        Log.v("PickVKPhotoFragment", "onCreateView");
        View content = inflater.inflate(R.layout.appkit_toolbar_fragment, (ViewGroup) null);
        content.setBackgroundColor(-1);
        return content;
    }

    @Override // me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        getToolbar().setVisibility(8);
        setSpinnerItems(this.spinnerItemsData);
        if (this.currentPos >= 0) {
            setSelectedNavigationItem(this.currentPos);
        } else {
            onSpinnerItemSelected(0);
        }
    }

    @Override // com.vk.attachpicker.SupportExternalToolbarContainer
    public ViewGroup provideToolbar(Context context) {
        return getToolbar();
    }

    public PhotoListFragment getAllPhotosFragment() {
        if (this.allPhotosFragment == null) {
            Bundle args = new Bundle();
            PhotoAlbum allPhotos = new PhotoAlbum();
            allPhotos.title = getString(R.string.all_photos);
            allPhotos.id = -9002;
            allPhotos.oid = VKAccountManager.getCurrent().getUid();
            this.allPhotosFragment = new YearSectionedPhotoListFragment();
            args.putParcelable(ArgKeys.ALBUM, allPhotos);
            args.putBoolean("no_album_header", true);
            args.putBoolean(ArgKeys.SELECT, true);
            args.putBoolean("autoload", true);
            args.putBoolean(AppKitFragment.EXTRA_IS_TAB, true);
            this.allPhotosFragment.setArguments(args);
            this.allPhotosFragment.disableRefresh();
        }
        return this.allPhotosFragment;
    }

    public Fragment getAlbumsFragment() {
        if (this.albumsFragment == null) {
            Bundle args = new Bundle();
            this.albumsFragment = new PhotoAlbumListFragment();
            args.putInt(ArgKeys.UID, VKAccountManager.getCurrent().getUid());
            args.putBoolean("no_title", true);
            args.putBoolean("need_system", true);
            args.putBoolean(ArgKeys.SELECT, true);
            args.putBoolean(AppKitFragment.EXTRA_IS_TAB, true);
            this.albumsFragment.setArguments(args);
            this.albumsFragment.disableRefresh();
            this.albumsFragment.loadData();
        }
        return this.albumsFragment;
    }

    public PhotoListFragment getUserPhotosFragment() {
        if (this.userPhotosFragment == null) {
            PhotoAlbum userPhotos = new PhotoAlbum();
            userPhotos.title = getString(R.string.user_photos_title_me);
            userPhotos.id = -9000;
            userPhotos.oid = VKAccountManager.getCurrent().getUid();
            Bundle args = new Bundle();
            args.putParcelable(ArgKeys.ALBUM, userPhotos);
            args.putBoolean("no_album_header", true);
            args.putBoolean(ArgKeys.SELECT, true);
            args.putBoolean(AppKitFragment.EXTRA_IS_TAB, true);
            this.userPhotosFragment = new PhotosOfMeFragment();
            this.userPhotosFragment.setArguments(args);
            this.userPhotosFragment.disableRefresh();
            this.userPhotosFragment.loadData();
        }
        return this.userPhotosFragment;
    }
}
