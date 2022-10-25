package com.vk.imageloader;

import android.os.Handler;
import android.os.Looper;
import com.vk.imageloader.view.VKImageView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class ImageNetworkFailHandler {
    private static final Handler handler = new Handler(Looper.getMainLooper());
    private static final ArrayList<WeakReference<VKImageView>> views = new ArrayList<>();

    public static void onNetworkFail(VKImageView vkImageView) {
        if (!contains(vkImageView)) {
            views.add(new WeakReference<>(vkImageView));
        }
        removeNulls();
    }

    public static void onNetworkConnected() {
        handler.postDelayed(new Runnable() { // from class: com.vk.imageloader.ImageNetworkFailHandler.1
            @Override // java.lang.Runnable
            public void run() {
                ImageNetworkFailHandler.doRetry();
            }
        }, 1000L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void doRetry() {
        for (int i = 0; i < views.size(); i++) {
            VKImageView wr = views.get(i).get();
            if (wr != null) {
                wr.retryImageRequest();
            }
        }
        views.clear();
    }

    private static boolean contains(VKImageView vkImageView) {
        for (int i = 0; i < views.size(); i++) {
            VKImageView wr = views.get(i).get();
            if (wr == vkImageView) {
                return true;
            }
        }
        return false;
    }

    private static void removeNulls() {
        Iterator<WeakReference<VKImageView>> it = views.iterator();
        while (it.hasNext()) {
            if (it.next().get() == null) {
                it.remove();
            }
        }
    }
}
