package com.vkontakte.android;

import android.annotation.TargetApi;
import android.content.ComponentName;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Bundle;
import android.service.chooser.ChooserTarget;
import android.service.chooser.ChooserTargetService;
import android.support.annotation.NonNull;
import com.vk.core.util.RxUtil;
import com.vk.imageloader.ImageLoaderUtils;
import com.vk.imageloader.VKImageLoader;
import com.vkontakte.android.cache.Cache;
import java.util.ArrayList;
import java.util.List;
@TargetApi(23)
/* loaded from: classes2.dex */
public final class VkChooserTargetService extends ChooserTargetService {
    public static final int MAX_TARGETS = 4;

    @Override // android.service.chooser.ChooserTargetService
    public List<ChooserTarget> onGetChooserTargets(ComponentName targetActivityName, IntentFilter matchedFilter) {
        List<ChooserTarget> targets = new ArrayList<>();
        ComponentName componentName = new ComponentName(getPackageName(), SendActivity.class.getCanonicalName());
        List<DialogEntry> dialogs = Cache.getDialogs(0, 4);
        for (DialogEntry dialog : dialogs) {
            targets.add(new ChooserTarget(createTargetTitle(dialog), createTargetIcon(dialog), 1.0f, componentName, createTargetExtras(dialog)));
        }
        return targets;
    }

    @NonNull
    private CharSequence createTargetTitle(@NonNull DialogEntry dialog) {
        return dialog.profile.fullName;
    }

    @NonNull
    private Icon createTargetIcon(@NonNull DialogEntry dialog) {
        return Icon.createWithBitmap(ImageLoaderUtils.makeCircleBitmap((Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getBitmap(Uri.parse(dialog.profile.photo)))));
    }

    @NonNull
    private Bundle createTargetExtras(@NonNull DialogEntry dialog) {
        Bundle extras = new Bundle();
        extras.putInt(SendActivity.EXTRA_RECIPIENT_UID, dialog.profile.uid);
        extras.putString(SendActivity.EXTRA_RECIPIENT_FULL_NAME, dialog.profile.fullName);
        extras.putString(SendActivity.EXTRA_RECIPIENT_PHOTO, dialog.profile.photo);
        return extras;
    }
}
