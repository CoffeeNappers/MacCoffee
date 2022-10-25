package android.support.v7.view;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.support.annotation.RestrictTo;
import android.support.v4.internal.view.SupportMenu;
import android.support.v4.view.ActionProvider;
import android.support.v4.view.MenuItemCompat;
import android.support.v7.appcompat.R;
import android.support.v7.view.menu.MenuItemImpl;
import android.support.v7.view.menu.MenuItemWrapperICS;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Xml;
import android.view.InflateException;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import org.xmlpull.v1.XmlPullParserException;
@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.dex */
public class SupportMenuInflater extends MenuInflater {
    static final String LOG_TAG = "SupportMenuInflater";
    static final int NO_ID = 0;
    private static final String XML_GROUP = "group";
    private static final String XML_ITEM = "item";
    private static final String XML_MENU = "menu";
    final Object[] mActionProviderConstructorArguments;
    final Object[] mActionViewConstructorArguments;
    Context mContext;
    private Object mRealOwner;
    static final Class<?>[] ACTION_VIEW_CONSTRUCTOR_SIGNATURE = {Context.class};
    static final Class<?>[] ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE = ACTION_VIEW_CONSTRUCTOR_SIGNATURE;

    public SupportMenuInflater(Context context) {
        super(context);
        this.mContext = context;
        this.mActionViewConstructorArguments = new Object[]{context};
        this.mActionProviderConstructorArguments = this.mActionViewConstructorArguments;
    }

    @Override // android.view.MenuInflater
    public void inflate(int menuRes, Menu menu) {
        if (!(menu instanceof SupportMenu)) {
            super.inflate(menuRes, menu);
            return;
        }
        XmlResourceParser parser = null;
        try {
            try {
                parser = this.mContext.getResources().getLayout(menuRes);
                AttributeSet attrs = Xml.asAttributeSet(parser);
                parseMenu(parser, attrs, menu);
            } catch (IOException e) {
                throw new InflateException("Error inflating menu XML", e);
            } catch (XmlPullParserException e2) {
                throw new InflateException("Error inflating menu XML", e2);
            }
        } finally {
            if (parser != null) {
                parser.close();
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0022, code lost:
        switch(r0) {
            case 1: goto L55;
            case 2: goto L10;
            case 3: goto L27;
            default: goto L59;
        };
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x0025, code lost:
        r0 = r11.next();
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x004c, code lost:
        if (r1 != false) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x004e, code lost:
        r5 = r11.getName();
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0059, code lost:
        if (r5.equals(android.support.v7.view.SupportMenuInflater.XML_GROUP) == false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x005b, code lost:
        r2.readGroup(r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0066, code lost:
        if (r5.equals("item") == false) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0068, code lost:
        r2.readItem(r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0073, code lost:
        if (r5.equals(android.support.v7.view.SupportMenuInflater.XML_MENU) == false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0075, code lost:
        r4 = r2.addSubMenuItem();
        parseMenu(r11, r12, r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x007d, code lost:
        r1 = true;
        r6 = r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0080, code lost:
        r5 = r11.getName();
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0084, code lost:
        if (r1 == false) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x008a, code lost:
        if (r5.equals(r6) == false) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x008c, code lost:
        r1 = false;
        r6 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0096, code lost:
        if (r5.equals(android.support.v7.view.SupportMenuInflater.XML_GROUP) == false) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0098, code lost:
        r2.resetGroup();
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00a3, code lost:
        if (r5.equals("item") == false) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00a9, code lost:
        if (r2.hasAddedItem() != false) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00ad, code lost:
        if (r2.itemActionProvider == null) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00b5, code lost:
        if (r2.itemActionProvider.hasSubMenu() == false) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00b7, code lost:
        r2.addSubMenuItem();
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00bc, code lost:
        r2.addItem();
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00c8, code lost:
        if (r5.equals(android.support.v7.view.SupportMenuInflater.XML_MENU) == false) goto L54;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00ca, code lost:
        r3 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00d5, code lost:
        throw new java.lang.RuntimeException("Unexpected end of document");
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00d6, code lost:
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x001f, code lost:
        r3 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x0020, code lost:
        if (r3 != false) goto L60;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void parseMenu(org.xmlpull.v1.XmlPullParser r11, android.util.AttributeSet r12, android.view.Menu r13) throws org.xmlpull.v1.XmlPullParserException, java.io.IOException {
        /*
            r10 = this;
            android.support.v7.view.SupportMenuInflater$MenuState r2 = new android.support.v7.view.SupportMenuInflater$MenuState
            r2.<init>(r13)
            int r0 = r11.getEventType()
            r1 = 0
            r6 = 0
        Lb:
            r7 = 2
            if (r0 != r7) goto L44
            java.lang.String r5 = r11.getName()
            java.lang.String r7 = "menu"
            boolean r7 = r5.equals(r7)
            if (r7 == 0) goto L2a
            int r0 = r11.next()
        L1f:
            r3 = 0
        L20:
            if (r3 != 0) goto Ld6
            switch(r0) {
                case 1: goto Lcd;
                case 2: goto L4c;
                case 3: goto L80;
                default: goto L25;
            }
        L25:
            int r0 = r11.next()
            goto L20
        L2a:
            java.lang.RuntimeException r7 = new java.lang.RuntimeException
            java.lang.StringBuilder r8 = new java.lang.StringBuilder
            r8.<init>()
            java.lang.String r9 = "Expecting menu, got "
            java.lang.StringBuilder r8 = r8.append(r9)
            java.lang.StringBuilder r8 = r8.append(r5)
            java.lang.String r8 = r8.toString()
            r7.<init>(r8)
            throw r7
        L44:
            int r0 = r11.next()
            r7 = 1
            if (r0 != r7) goto Lb
            goto L1f
        L4c:
            if (r1 != 0) goto L25
            java.lang.String r5 = r11.getName()
            java.lang.String r7 = "group"
            boolean r7 = r5.equals(r7)
            if (r7 == 0) goto L5f
            r2.readGroup(r12)
            goto L25
        L5f:
            java.lang.String r7 = "item"
            boolean r7 = r5.equals(r7)
            if (r7 == 0) goto L6c
            r2.readItem(r12)
            goto L25
        L6c:
            java.lang.String r7 = "menu"
            boolean r7 = r5.equals(r7)
            if (r7 == 0) goto L7d
            android.view.SubMenu r4 = r2.addSubMenuItem()
            r10.parseMenu(r11, r12, r4)
            goto L25
        L7d:
            r1 = 1
            r6 = r5
            goto L25
        L80:
            java.lang.String r5 = r11.getName()
            if (r1 == 0) goto L8f
            boolean r7 = r5.equals(r6)
            if (r7 == 0) goto L8f
            r1 = 0
            r6 = 0
            goto L25
        L8f:
            java.lang.String r7 = "group"
            boolean r7 = r5.equals(r7)
            if (r7 == 0) goto L9c
            r2.resetGroup()
            goto L25
        L9c:
            java.lang.String r7 = "item"
            boolean r7 = r5.equals(r7)
            if (r7 == 0) goto Lc1
            boolean r7 = r2.hasAddedItem()
            if (r7 != 0) goto L25
            android.support.v4.view.ActionProvider r7 = r2.itemActionProvider
            if (r7 == 0) goto Lbc
            android.support.v4.view.ActionProvider r7 = r2.itemActionProvider
            boolean r7 = r7.hasSubMenu()
            if (r7 == 0) goto Lbc
            r2.addSubMenuItem()
            goto L25
        Lbc:
            r2.addItem()
            goto L25
        Lc1:
            java.lang.String r7 = "menu"
            boolean r7 = r5.equals(r7)
            if (r7 == 0) goto L25
            r3 = 1
            goto L25
        Lcd:
            java.lang.RuntimeException r7 = new java.lang.RuntimeException
            java.lang.String r8 = "Unexpected end of document"
            r7.<init>(r8)
            throw r7
        Ld6:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.view.SupportMenuInflater.parseMenu(org.xmlpull.v1.XmlPullParser, android.util.AttributeSet, android.view.Menu):void");
    }

    Object getRealOwner() {
        if (this.mRealOwner == null) {
            this.mRealOwner = findRealOwner(this.mContext);
        }
        return this.mRealOwner;
    }

    private Object findRealOwner(Object owner) {
        if (!(owner instanceof Activity) && (owner instanceof ContextWrapper)) {
            return findRealOwner(((ContextWrapper) owner).getBaseContext());
        }
        return owner;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class InflatedOnMenuItemClickListener implements MenuItem.OnMenuItemClickListener {
        private static final Class<?>[] PARAM_TYPES = {MenuItem.class};
        private Method mMethod;
        private Object mRealOwner;

        public InflatedOnMenuItemClickListener(Object realOwner, String methodName) {
            this.mRealOwner = realOwner;
            Class<?> c = realOwner.getClass();
            try {
                this.mMethod = c.getMethod(methodName, PARAM_TYPES);
            } catch (Exception e) {
                InflateException ex = new InflateException("Couldn't resolve menu item onClick handler " + methodName + " in class " + c.getName());
                ex.initCause(e);
                throw ex;
            }
        }

        @Override // android.view.MenuItem.OnMenuItemClickListener
        public boolean onMenuItemClick(MenuItem item) {
            try {
                if (this.mMethod.getReturnType() == Boolean.TYPE) {
                    return ((Boolean) this.mMethod.invoke(this.mRealOwner, item)).booleanValue();
                }
                this.mMethod.invoke(this.mRealOwner, item);
                return true;
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class MenuState {
        private static final int defaultGroupId = 0;
        private static final int defaultItemCategory = 0;
        private static final int defaultItemCheckable = 0;
        private static final boolean defaultItemChecked = false;
        private static final boolean defaultItemEnabled = true;
        private static final int defaultItemId = 0;
        private static final int defaultItemOrder = 0;
        private static final boolean defaultItemVisible = true;
        private int groupCategory;
        private int groupCheckable;
        private boolean groupEnabled;
        private int groupId;
        private int groupOrder;
        private boolean groupVisible;
        ActionProvider itemActionProvider;
        private String itemActionProviderClassName;
        private String itemActionViewClassName;
        private int itemActionViewLayout;
        private boolean itemAdded;
        private char itemAlphabeticShortcut;
        private int itemCategoryOrder;
        private int itemCheckable;
        private boolean itemChecked;
        private boolean itemEnabled;
        private int itemIconResId;
        private int itemId;
        private String itemListenerMethodName;
        private char itemNumericShortcut;
        private int itemShowAsAction;
        private CharSequence itemTitle;
        private CharSequence itemTitleCondensed;
        private boolean itemVisible;
        private Menu menu;

        public MenuState(Menu menu) {
            this.menu = menu;
            resetGroup();
        }

        public void resetGroup() {
            this.groupId = 0;
            this.groupCategory = 0;
            this.groupOrder = 0;
            this.groupCheckable = 0;
            this.groupVisible = true;
            this.groupEnabled = true;
        }

        public void readGroup(AttributeSet attrs) {
            TypedArray a = SupportMenuInflater.this.mContext.obtainStyledAttributes(attrs, R.styleable.MenuGroup);
            this.groupId = a.getResourceId(R.styleable.MenuGroup_android_id, 0);
            this.groupCategory = a.getInt(R.styleable.MenuGroup_android_menuCategory, 0);
            this.groupOrder = a.getInt(R.styleable.MenuGroup_android_orderInCategory, 0);
            this.groupCheckable = a.getInt(R.styleable.MenuGroup_android_checkableBehavior, 0);
            this.groupVisible = a.getBoolean(R.styleable.MenuGroup_android_visible, true);
            this.groupEnabled = a.getBoolean(R.styleable.MenuGroup_android_enabled, true);
            a.recycle();
        }

        public void readItem(AttributeSet attrs) {
            TypedArray a = SupportMenuInflater.this.mContext.obtainStyledAttributes(attrs, R.styleable.MenuItem);
            this.itemId = a.getResourceId(R.styleable.MenuItem_android_id, 0);
            int category = a.getInt(R.styleable.MenuItem_android_menuCategory, this.groupCategory);
            int order = a.getInt(R.styleable.MenuItem_android_orderInCategory, this.groupOrder);
            this.itemCategoryOrder = ((-65536) & category) | (65535 & order);
            this.itemTitle = a.getText(R.styleable.MenuItem_android_title);
            this.itemTitleCondensed = a.getText(R.styleable.MenuItem_android_titleCondensed);
            this.itemIconResId = a.getResourceId(R.styleable.MenuItem_android_icon, 0);
            this.itemAlphabeticShortcut = getShortcut(a.getString(R.styleable.MenuItem_android_alphabeticShortcut));
            this.itemNumericShortcut = getShortcut(a.getString(R.styleable.MenuItem_android_numericShortcut));
            if (a.hasValue(R.styleable.MenuItem_android_checkable)) {
                this.itemCheckable = a.getBoolean(R.styleable.MenuItem_android_checkable, false) ? 1 : 0;
            } else {
                this.itemCheckable = this.groupCheckable;
            }
            this.itemChecked = a.getBoolean(R.styleable.MenuItem_android_checked, false);
            this.itemVisible = a.getBoolean(R.styleable.MenuItem_android_visible, this.groupVisible);
            this.itemEnabled = a.getBoolean(R.styleable.MenuItem_android_enabled, this.groupEnabled);
            this.itemShowAsAction = a.getInt(R.styleable.MenuItem_showAsAction, -1);
            this.itemListenerMethodName = a.getString(R.styleable.MenuItem_android_onClick);
            this.itemActionViewLayout = a.getResourceId(R.styleable.MenuItem_actionLayout, 0);
            this.itemActionViewClassName = a.getString(R.styleable.MenuItem_actionViewClass);
            this.itemActionProviderClassName = a.getString(R.styleable.MenuItem_actionProviderClass);
            boolean hasActionProvider = this.itemActionProviderClassName != null;
            if (hasActionProvider && this.itemActionViewLayout == 0 && this.itemActionViewClassName == null) {
                this.itemActionProvider = (ActionProvider) newInstance(this.itemActionProviderClassName, SupportMenuInflater.ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE, SupportMenuInflater.this.mActionProviderConstructorArguments);
            } else {
                if (hasActionProvider) {
                    Log.w(SupportMenuInflater.LOG_TAG, "Ignoring attribute 'actionProviderClass'. Action view already specified.");
                }
                this.itemActionProvider = null;
            }
            a.recycle();
            this.itemAdded = false;
        }

        private char getShortcut(String shortcutString) {
            if (shortcutString == null) {
                return (char) 0;
            }
            return shortcutString.charAt(0);
        }

        private void setItem(MenuItem item) {
            item.setChecked(this.itemChecked).setVisible(this.itemVisible).setEnabled(this.itemEnabled).setCheckable(this.itemCheckable >= 1).setTitleCondensed(this.itemTitleCondensed).setIcon(this.itemIconResId).setAlphabeticShortcut(this.itemAlphabeticShortcut).setNumericShortcut(this.itemNumericShortcut);
            if (this.itemShowAsAction >= 0) {
                MenuItemCompat.setShowAsAction(item, this.itemShowAsAction);
            }
            if (this.itemListenerMethodName != null) {
                if (SupportMenuInflater.this.mContext.isRestricted()) {
                    throw new IllegalStateException("The android:onClick attribute cannot be used within a restricted context");
                }
                item.setOnMenuItemClickListener(new InflatedOnMenuItemClickListener(SupportMenuInflater.this.getRealOwner(), this.itemListenerMethodName));
            }
            if (item instanceof MenuItemImpl) {
                MenuItemImpl menuItemImpl = (MenuItemImpl) item;
            }
            if (this.itemCheckable >= 2) {
                if (item instanceof MenuItemImpl) {
                    ((MenuItemImpl) item).setExclusiveCheckable(true);
                } else if (item instanceof MenuItemWrapperICS) {
                    ((MenuItemWrapperICS) item).setExclusiveCheckable(true);
                }
            }
            boolean actionViewSpecified = false;
            if (this.itemActionViewClassName != null) {
                View actionView = (View) newInstance(this.itemActionViewClassName, SupportMenuInflater.ACTION_VIEW_CONSTRUCTOR_SIGNATURE, SupportMenuInflater.this.mActionViewConstructorArguments);
                MenuItemCompat.setActionView(item, actionView);
                actionViewSpecified = true;
            }
            if (this.itemActionViewLayout > 0) {
                if (!actionViewSpecified) {
                    MenuItemCompat.setActionView(item, this.itemActionViewLayout);
                } else {
                    Log.w(SupportMenuInflater.LOG_TAG, "Ignoring attribute 'itemActionViewLayout'. Action view already specified.");
                }
            }
            if (this.itemActionProvider != null) {
                MenuItemCompat.setActionProvider(item, this.itemActionProvider);
            }
        }

        public void addItem() {
            this.itemAdded = true;
            setItem(this.menu.add(this.groupId, this.itemId, this.itemCategoryOrder, this.itemTitle));
        }

        public SubMenu addSubMenuItem() {
            this.itemAdded = true;
            SubMenu subMenu = this.menu.addSubMenu(this.groupId, this.itemId, this.itemCategoryOrder, this.itemTitle);
            setItem(subMenu.getItem());
            return subMenu;
        }

        public boolean hasAddedItem() {
            return this.itemAdded;
        }

        private <T> T newInstance(String className, Class<?>[] constructorSignature, Object[] arguments) {
            try {
                Class<?> clazz = SupportMenuInflater.this.mContext.getClassLoader().loadClass(className);
                Constructor<?> constructor = clazz.getConstructor(constructorSignature);
                constructor.setAccessible(true);
                return (T) constructor.newInstance(arguments);
            } catch (Exception e) {
                Log.w(SupportMenuInflater.LOG_TAG, "Cannot instantiate class: " + className, e);
                return null;
            }
        }
    }
}
