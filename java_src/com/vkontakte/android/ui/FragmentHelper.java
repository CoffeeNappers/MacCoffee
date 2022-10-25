package com.vkontakte.android.ui;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.Toast;
import com.vk.music.fragment.MusicFragment;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.navigation.NavigationDelegate;
/* loaded from: classes3.dex */
public class FragmentHelper {
    public static final int FRAGMENT_LAYOUT_ID = 2131755051;

    private FragmentHelper() {
    }

    public static Fragment replace(@NonNull Activity activity, @NonNull Class<? extends Fragment> clazz, @Nullable Bundle args, @Nullable NavigationDelegate navigationDelegate) {
        try {
            Fragment fragment = clazz.newInstance();
            fragment.setArguments(args);
            return replace(activity, fragment);
        } catch (Exception x) {
            Log.w("vk", x);
            Toast.makeText(activity, (int) R.string.error, 0).show();
            activity.finish();
            return null;
        }
    }

    public static Fragment replace(@NonNull Activity activity, Fragment fragment) {
        activity.getFragmentManager().beginTransaction().replace(R.id.fragment_wrapper, fragment, "news").commit();
        return fragment;
    }

    public static Fragment findFragment(@NonNull Activity activity) {
        return activity.getFragmentManager().findFragmentById(R.id.fragment_wrapper);
    }

    public static Fragment replaceWithBackStack(@NonNull Activity activity, @NonNull Class<? extends Fragment> clazz, @Nullable Bundle args, @Nullable NavigationDelegate navigationDelegate) {
        try {
            Fragment fragment = clazz.newInstance();
            fragment.setArguments(args);
            activity.getFragmentManager().beginTransaction().replace(R.id.fragment_wrapper, fragment, "news").addToBackStack(fragment.toString()).commit();
            return fragment;
        } catch (Exception x) {
            Log.w("vk", x);
            Toast.makeText(activity, (int) R.string.error, 0).show();
            activity.finish();
            return null;
        }
    }

    public static Class<? extends Fragment> extractFragment(Intent intent) {
        try {
            return (Class) intent.getSerializableExtra("class");
        } catch (ClassCastException e) {
            if ("AudioListFragment".equals(intent.getStringExtra("class"))) {
                return MusicFragment.class;
            }
            throw e;
        }
    }

    public static Bundle extractArgs(Intent intent) {
        return intent.getBundleExtra("args");
    }
}
