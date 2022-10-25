package com.vkontakte.android.fragments.feedback;

import android.app.Fragment;
import android.app.NotificationManager;
import android.os.Bundle;
import android.view.View;
import com.vkontakte.android.GCMBroadcastReceiver;
import com.vkontakte.android.R;
import com.vkontakte.android.fragments.VKTabbedFragment;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class FeedbackFragment extends VKTabbedFragment {
    public FeedbackFragment() {
        setTabsAutoLoad(false);
    }

    @Override // com.vkontakte.android.fragments.VKTabbedFragment, me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(R.string.feedback);
        cancelNotifications();
        List<Fragment> tabs = new ArrayList<Fragment>(2) { // from class: com.vkontakte.android.fragments.feedback.FeedbackFragment.1
            {
                add(new NotificationsFragment());
                add(new CommentsPostListFragment());
            }
        };
        List<String> titles = new ArrayList<String>(2) { // from class: com.vkontakte.android.fragments.feedback.FeedbackFragment.2
            {
                add(FeedbackFragment.this.getString(R.string.replies));
                add(FeedbackFragment.this.getString(R.string.comments));
            }
        };
        setTabs(tabs, titles);
    }

    private void cancelNotifications() {
        NotificationManager nm = (NotificationManager) getActivity().getSystemService("notification");
        nm.cancel(GCMBroadcastReceiver.ID_REPLY_NOTIFICATION);
    }

    @Override // com.vkontakte.android.fragments.VKTabbedFragment, me.grishka.appkit.fragments.AppKitFragment
    public boolean hasNavigationDrawer() {
        return true;
    }
}
