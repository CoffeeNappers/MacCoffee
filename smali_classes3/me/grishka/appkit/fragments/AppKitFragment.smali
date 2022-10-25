.class public Lme/grishka/appkit/fragments/AppKitFragment;
.super Landroid/app/DialogFragment;
.source "AppKitFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/grishka/appkit/fragments/AppKitFragment$NavigationSpinnerAdapter;
    }
.end annotation


# static fields
.field public static final EXTRA_IS_TAB:Ljava/lang/String; = "__is_tab"


# instance fields
.field private hasOptionsMenu:Z

.field protected isTablet:Z

.field protected navigationSpinner:Landroid/widget/Spinner;

.field protected scrW:I

.field protected spinnerViewResourceId:I

.field private subtitle:Ljava/lang/CharSequence;

.field private subtitleMarquee:Z

.field private title:Ljava/lang/CharSequence;

.field private titleMarquee:Z

.field private toolbar:Landroid/support/v7/widget/Toolbar;

.field private viewCreated:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 39
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->isTablet:Z

    .line 48
    iput-boolean v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->titleMarquee:Z

    iput-boolean v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->subtitleMarquee:Z

    .line 50
    const v0, 0x7f03002c

    iput v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->spinnerViewResourceId:I

    return-void
.end method

.method private invalidateToolbarMenu()V
    .locals 4

    .prologue
    .line 221
    :try_start_0
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/Menu;->clear()V

    .line 222
    iget-boolean v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->hasOptionsMenu:Z

    if-eqz v1, :cond_0

    .line 223
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v1

    new-instance v2, Landroid/view/MenuInflater;

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v1, v2}, Lme/grishka/appkit/fragments/AppKitFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    :cond_0
    :goto_0
    return-void

    .line 225
    :catch_0
    move-exception v0

    .line 226
    .local v0, "e":Ljava/lang/Throwable;
    const-string/jumbo v1, "AppKit"

    const-string/jumbo v2, "error invalidateToolbarMenu"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private updateToolbarMarquee()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x0

    const/high16 v7, 0x41200000    # 10.0f

    const/4 v6, 0x1

    .line 99
    iget-object v4, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    if-nez v4, :cond_1

    .line 136
    :cond_0
    :goto_0
    return-void

    .line 102
    :cond_1
    const/4 v3, 0x0

    .local v3, "title":Landroid/widget/TextView;
    const/4 v2, 0x0

    .line 104
    .local v2, "subtitle":Landroid/widget/TextView;
    :try_start_0
    iget-object v4, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string/jumbo v5, "mTitleTextView"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 105
    .local v1, "fld":Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 106
    iget-object v4, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Landroid/widget/TextView;

    move-object v3, v0

    .line 107
    iget-object v4, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string/jumbo v5, "mSubtitleTextView"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 108
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 109
    iget-object v4, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Landroid/widget/TextView;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .end local v1    # "fld":Ljava/lang/reflect/Field;
    :goto_1
    if-eqz v3, :cond_2

    .line 113
    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setFadingEdgeLength(I)V

    .line 114
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setHorizontalFadingEdgeEnabled(Z)V

    .line 115
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setMarqueeRepeatLimit(I)V

    .line 116
    iget-boolean v4, p0, Lme/grishka/appkit/fragments/AppKitFragment;->titleMarquee:Z

    if-eqz v4, :cond_3

    .line 117
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 118
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setSelected(Z)V

    .line 124
    :cond_2
    :goto_2
    if-eqz v2, :cond_0

    .line 125
    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setFadingEdgeLength(I)V

    .line 126
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setHorizontalFadingEdgeEnabled(Z)V

    .line 127
    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setMarqueeRepeatLimit(I)V

    .line 128
    iget-boolean v4, p0, Lme/grishka/appkit/fragments/AppKitFragment;->subtitleMarquee:Z

    if-eqz v4, :cond_4

    .line 129
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 130
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setSelected(Z)V

    goto :goto_0

    .line 120
    :cond_3
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setSelected(Z)V

    .line 121
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto :goto_2

    .line 132
    :cond_4
    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setSelected(Z)V

    .line 133
    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_0

    .line 110
    :catch_0
    move-exception v4

    goto :goto_1
.end method


# virtual methods
.method protected canGoBack()Z
    .locals 2

    .prologue
    .line 77
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "_can_go_back"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 397
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method protected getSelectedNavigationItem()I
    .locals 1

    .prologue
    .line 368
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    if-nez v0, :cond_0

    .line 369
    const/4 v0, -0x1

    .line 370
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    goto :goto_0
.end method

.method public getToolbar()Landroid/support/v7/widget/Toolbar;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    return-object v0
.end method

.method protected getToolbarContext()Landroid/content/Context;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 334
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [I

    const v4, 0x7f01008c

    aput v4, v3, v5

    invoke-virtual {v2, v3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 335
    .local v0, "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v5, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 336
    .local v1, "themeID":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 337
    if-nez v1, :cond_0

    .line 338
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    .line 340
    :goto_0
    return-object v2

    :cond_0
    new-instance v2, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method protected getToolbarPopupContext()Landroid/content/Context;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 344
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [I

    const v4, 0x7f010089

    aput v4, v3, v5

    invoke-virtual {v2, v3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 345
    .local v0, "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v5, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 346
    .local v1, "themeID":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 347
    if-nez v1, :cond_0

    .line 348
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    .line 350
    :goto_0
    return-object v2

    :cond_0
    new-instance v2, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method public hasNavigationDrawer()Z
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    return v0
.end method

.method public invalidateOptionsMenu()V
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v0, :cond_1

    .line 213
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->invalidateToolbarMenu()V

    .line 217
    :cond_0
    :goto_0
    return-void

    .line 214
    :cond_1
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 215
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    goto :goto_0
.end method

.method public isSubitleMarqueeEnabled(Z)Z
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 95
    iget-boolean v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->subtitleMarquee:Z

    return v0
.end method

.method public isTitleMarqueeEnabled(Z)Z
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 91
    iget-boolean v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->titleMarquee:Z

    return v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 236
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 237
    invoke-static {p1}, Lme/grishka/appkit/utils/V;->setApplicationContext(Landroid/content/Context;)V

    .line 238
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->updateConfiguration()V

    .line 239
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 244
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 245
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->updateConfiguration()V

    .line 246
    return-void
.end method

.method protected onCreateNavigationSpinner(Landroid/view/LayoutInflater;)Landroid/widget/Spinner;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    .line 302
    const v0, 0x7f03002a

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    return-object v0
.end method

.method protected onCreateNavigationSpinnerAdapter()Landroid/widget/ArrayAdapter;
    .locals 2

    .prologue
    .line 287
    new-instance v0, Lme/grishka/appkit/fragments/AppKitFragment$NavigationSpinnerAdapter;

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lme/grishka/appkit/fragments/AppKitFragment$NavigationSpinnerAdapter;-><init>(Lme/grishka/appkit/fragments/AppKitFragment;Landroid/content/Context;)V

    return-object v0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 199
    invoke-super {p0}, Landroid/app/DialogFragment;->onDestroyView()V

    .line 200
    iput-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    .line 201
    iput-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    .line 202
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 61
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 62
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xf

    if-ne v0, v1, :cond_0

    .line 63
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lme/grishka/appkit/fragments/AppKitFragment;->setUserVisibleHint(Z)V

    .line 64
    :cond_0
    return-void
.end method

.method protected onSpinnerItemSelected(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 360
    const/4 v0, 0x0

    return v0
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 71
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 72
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->popBackStack()V

    .line 74
    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 140
    invoke-super {p0, p1, p2}, Landroid/app/DialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 141
    const v1, 0x7f1001b0

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/Toolbar;

    iput-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    .line 142
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "__is_tab"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 143
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iget-object v2, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 144
    iput-object v4, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    .line 146
    :cond_0
    iput-boolean v3, p0, Lme/grishka/appkit/fragments/AppKitFragment;->viewCreated:Z

    .line 147
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v1, :cond_8

    .line 148
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->title:Ljava/lang/CharSequence;

    if-eqz v1, :cond_1

    .line 149
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v2, p0, Lme/grishka/appkit/fragments/AppKitFragment;->title:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 150
    :cond_1
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->subtitle:Ljava/lang/CharSequence;

    if-eqz v1, :cond_2

    .line 151
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v2, p0, Lme/grishka/appkit/fragments/AppKitFragment;->subtitle:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 152
    :cond_2
    iget-boolean v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->hasOptionsMenu:Z

    if-eqz v1, :cond_3

    .line 153
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->invalidateToolbarMenu()V

    .line 154
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    new-instance v2, Lme/grishka/appkit/fragments/AppKitFragment$1;

    invoke-direct {v2, p0}, Lme/grishka/appkit/fragments/AppKitFragment$1;-><init>(Lme/grishka/appkit/fragments/AppKitFragment;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setOnMenuItemClickListener(Landroid/support/v7/widget/Toolbar$OnMenuItemClickListener;)V

    .line 161
    :cond_3
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->canGoBack()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 162
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    const v2, 0x7f02014f

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 165
    :cond_4
    :goto_0
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    new-instance v2, Lme/grishka/appkit/fragments/AppKitFragment$2;

    invoke-direct {v2, p0}, Lme/grishka/appkit/fragments/AppKitFragment$2;-><init>(Lme/grishka/appkit/fragments/AppKitFragment;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 189
    :cond_5
    :goto_1
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->updateToolbarMarquee()V

    .line 191
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 192
    .local v0, "activity":Landroid/app/Activity;
    instance-of v1, v0, Lme/grishka/appkit/fragments/OnFragmentViewCreated;

    if-eqz v1, :cond_6

    .line 193
    check-cast v0, Lme/grishka/appkit/fragments/OnFragmentViewCreated;

    .end local v0    # "activity":Landroid/app/Activity;
    invoke-interface {v0, p0}, Lme/grishka/appkit/fragments/OnFragmentViewCreated;->onFragmentViewCreated(Landroid/app/Fragment;)V

    .line 195
    :cond_6
    return-void

    .line 163
    :cond_7
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->hasNavigationDrawer()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 164
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    const v2, 0x7f020156

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    goto :goto_0

    .line 172
    :cond_8
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->title:Ljava/lang/CharSequence;

    if-eqz v1, :cond_a

    .line 173
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_9

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "_dialog"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 174
    :cond_9
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lme/grishka/appkit/fragments/AppKitFragment;->title:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 176
    :cond_a
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_b

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "_dialog"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 177
    :cond_b
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->title:Ljava/lang/CharSequence;

    if-eqz v1, :cond_d

    .line 178
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ActionBar;->getNavigationMode()I

    move-result v1

    if-eqz v1, :cond_c

    .line 179
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-static {}, Lme/grishka/appkit/utils/StubListAdapter;->getInstance()Lme/grishka/appkit/utils/StubListAdapter;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Landroid/app/ActionBar;->setListNavigationCallbacks(Landroid/widget/SpinnerAdapter;Landroid/app/ActionBar$OnNavigationListener;)V

    .line 180
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 182
    :cond_c
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->setNavigationMode(I)V

    .line 184
    :cond_d
    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->subtitle:Ljava/lang/CharSequence;

    if-eqz v1, :cond_5

    .line 185
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    iget-object v2, p0, Lme/grishka/appkit/fragments/AppKitFragment;->subtitle:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V

    goto/16 :goto_1
.end method

.method public setHasOptionsMenu(Z)V
    .locals 0
    .param p1, "hasMenu"    # Z

    .prologue
    .line 206
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->setHasOptionsMenu(Z)V

    .line 207
    iput-boolean p1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->hasOptionsMenu:Z

    .line 208
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->invalidateOptionsMenu()V

    .line 209
    return-void
.end method

.method protected setSelectedNavigationItem(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 364
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setSelection(I)V

    .line 365
    return-void
.end method

.method protected setSpinnerAdapter(Landroid/widget/SpinnerAdapter;)V
    .locals 6
    .param p1, "adapter"    # Landroid/widget/SpinnerAdapter;

    .prologue
    const/4 v5, 0x0

    .line 306
    if-nez p1, :cond_1

    .line 307
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_0

    .line 308
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->removeView(Landroid/view/View;)V

    .line 309
    iput-object v5, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    .line 331
    :cond_0
    :goto_0
    return-void

    .line 313
    :cond_1
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    if-nez v0, :cond_2

    .line 314
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {p0, v0}, Lme/grishka/appkit/fragments/AppKitFragment;->onCreateNavigationSpinner(Landroid/view/LayoutInflater;)Landroid/widget/Spinner;

    move-result-object v0

    iput-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    .line 315
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    new-instance v1, Lme/grishka/appkit/fragments/AppKitFragment$3;

    invoke-direct {v1, p0}, Lme/grishka/appkit/fragments/AppKitFragment$3;-><init>(Lme/grishka/appkit/fragments/AppKitFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 326
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    new-instance v2, Landroid/support/v7/widget/Toolbar$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x1

    invoke-direct {v2, v3, v4}, Landroid/support/v7/widget/Toolbar$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 327
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 328
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 330
    :cond_2
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    goto :goto_0
.end method

.method protected setSpinnerItems(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 291
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<*>;"
    if-nez p1, :cond_0

    .line 292
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lme/grishka/appkit/fragments/AppKitFragment;->setSpinnerAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 299
    :goto_0
    return-void

    .line 295
    :cond_0
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onCreateNavigationSpinnerAdapter()Landroid/widget/ArrayAdapter;

    move-result-object v0

    .line 296
    .local v0, "adapter":Landroid/widget/ArrayAdapter;
    invoke-virtual {v0, p1}, Landroid/widget/ArrayAdapter;->addAll(Ljava/util/Collection;)V

    .line 297
    const v1, 0x1090009

    invoke-virtual {v0, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 298
    invoke-virtual {p0, v0}, Lme/grishka/appkit/fragments/AppKitFragment;->setSpinnerAdapter(Landroid/widget/SpinnerAdapter;)V

    goto :goto_0
.end method

.method protected setSubtitle(I)V
    .locals 1
    .param p1, "res"    # I

    .prologue
    .line 283
    invoke-virtual {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lme/grishka/appkit/fragments/AppKitFragment;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 284
    return-void
.end method

.method protected setSubtitle(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "subtitle"    # Ljava/lang/CharSequence;

    .prologue
    .line 271
    iput-object p1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->subtitle:Ljava/lang/CharSequence;

    .line 272
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_1

    .line 280
    :cond_0
    :goto_0
    return-void

    .line 274
    :cond_1
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v0, :cond_2

    .line 275
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 276
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->updateToolbarMarquee()V

    goto :goto_0

    .line 277
    :cond_2
    iget-boolean v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->viewCreated:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 278
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public setSubtitleMarqueeEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->subtitleMarquee:Z

    .line 87
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->updateToolbarMarquee()V

    .line 88
    return-void
.end method

.method protected setTitle(I)V
    .locals 1
    .param p1, "res"    # I

    .prologue
    .line 267
    invoke-virtual {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lme/grishka/appkit/fragments/AppKitFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 268
    return-void
.end method

.method protected setTitle(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 254
    iput-object p1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->title:Ljava/lang/CharSequence;

    .line 255
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->navigationSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_1

    .line 264
    :cond_0
    :goto_0
    return-void

    .line 257
    :cond_1
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v0, :cond_2

    .line 258
    iget-object v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 259
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->updateToolbarMarquee()V

    goto :goto_0

    .line 260
    :cond_2
    iget-boolean v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->viewCreated:Z

    if-eqz v0, :cond_0

    .line 261
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "_dialog"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 262
    :cond_3
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public setTitleMarqueeEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 81
    iput-boolean p1, p0, Lme/grishka/appkit/fragments/AppKitFragment;->titleMarquee:Z

    .line 82
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->updateToolbarMarquee()V

    .line 83
    return-void
.end method

.method protected updateConfiguration()V
    .locals 1

    .prologue
    .line 249
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenWidthDp:I

    iput v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->scrW:I

    .line 250
    invoke-virtual {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lme/grishka/appkit/fragments/AppKitFragment;->isTablet:Z

    .line 251
    return-void
.end method
