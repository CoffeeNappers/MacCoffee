package com.vkontakte.android.fragments.friends.importer;

import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;
import com.vkontakte.android.VKApplication;
/* loaded from: classes2.dex */
public abstract class BaseImporter {
    private final Drawable mIcon;
    private final CharSequence mSubtitle;
    private final CharSequence mTitle;

    public abstract void action();

    /* JADX INFO: Access modifiers changed from: protected */
    public BaseImporter(@DrawableRes int icon, @StringRes int title, @StringRes int subtitle) {
        this.mIcon = VKApplication.context.getResources().getDrawable(icon);
        this.mTitle = VKApplication.context.getResources().getText(title);
        this.mSubtitle = VKApplication.context.getResources().getText(subtitle);
    }

    public Drawable getIcon() {
        return this.mIcon;
    }

    public CharSequence getTitle() {
        return this.mTitle;
    }

    public CharSequence getSubtitle() {
        return this.mSubtitle;
    }
}
