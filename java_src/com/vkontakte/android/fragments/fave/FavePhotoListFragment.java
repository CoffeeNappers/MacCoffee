package com.vkontakte.android.fragments.fave;

import android.os.Bundle;
import com.vkontakte.android.fragments.photos.PhotoListFragment;
/* loaded from: classes2.dex */
public class FavePhotoListFragment extends PhotoListFragment {
    @Override // me.grishka.appkit.fragments.ContainerFragment, android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle state) {
        super.onActivityCreated(state);
        if (!this.loaded) {
            loadData();
        } else {
            dataLoaded();
        }
    }
}
