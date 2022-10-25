package android.support.v7.view.menu;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.v4.internal.view.SupportSubMenu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
/* JADX INFO: Access modifiers changed from: package-private */
@RequiresApi(14)
@TargetApi(14)
@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.dex */
public class SubMenuWrapperICS extends MenuWrapperICS implements SubMenu {
    /* JADX INFO: Access modifiers changed from: package-private */
    public SubMenuWrapperICS(Context context, SupportSubMenu subMenu) {
        super(context, subMenu);
    }

    @Override // android.support.v7.view.menu.BaseWrapper
    /* renamed from: getWrappedObject */
    public SupportSubMenu mo134getWrappedObject() {
        return (SupportSubMenu) this.mWrappedObject;
    }

    @Override // android.view.SubMenu
    public SubMenu setHeaderTitle(int titleRes) {
        mo134getWrappedObject().setHeaderTitle(titleRes);
        return this;
    }

    @Override // android.view.SubMenu
    public SubMenu setHeaderTitle(CharSequence title) {
        mo134getWrappedObject().setHeaderTitle(title);
        return this;
    }

    @Override // android.view.SubMenu
    public SubMenu setHeaderIcon(int iconRes) {
        mo134getWrappedObject().setHeaderIcon(iconRes);
        return this;
    }

    @Override // android.view.SubMenu
    public SubMenu setHeaderIcon(Drawable icon) {
        mo134getWrappedObject().setHeaderIcon(icon);
        return this;
    }

    @Override // android.view.SubMenu
    public SubMenu setHeaderView(View view) {
        mo134getWrappedObject().setHeaderView(view);
        return this;
    }

    @Override // android.view.SubMenu
    public void clearHeader() {
        mo134getWrappedObject().clearHeader();
    }

    @Override // android.view.SubMenu
    public SubMenu setIcon(int iconRes) {
        mo134getWrappedObject().setIcon(iconRes);
        return this;
    }

    @Override // android.view.SubMenu
    public SubMenu setIcon(Drawable icon) {
        mo134getWrappedObject().setIcon(icon);
        return this;
    }

    @Override // android.view.SubMenu
    public MenuItem getItem() {
        return getMenuItemWrapper(mo134getWrappedObject().getItem());
    }
}
