.class public Lcom/vkontakte/android/VKActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "VKActivity.java"


# instance fields
.field private actionModeStatusBarColor:I

.field private final compositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

.field private isResumedImpl:Z

.field protected isTablet:Z

.field private logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 51
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v3, Lcom/vkontakte/android/LongPollService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 53
    invoke-static {v4}, Lcom/vkontakte/android/data/Friends;->reload(Z)V

    .line 54
    invoke-static {v4}, Lcom/vkontakte/android/data/Groups;->reload(Z)V

    .line 56
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 43
    iput-boolean v0, p0, Lcom/vkontakte/android/VKActivity;->isResumedImpl:Z

    .line 44
    iput v0, p0, Lcom/vkontakte/android/VKActivity;->actionModeStatusBarColor:I

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/VKActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 46
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/VKActivity;->compositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    return-void
.end method


# virtual methods
.method public $(I)Landroid/view/View;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 261
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/VKActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected isResumedImpl()Z
    .locals 1

    .prologue
    .line 125
    iget-boolean v0, p0, Lcom/vkontakte/android/VKActivity;->isResumedImpl:Z

    return v0
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .locals 2
    .param p1, "mode"    # Landroid/view/ActionMode;

    .prologue
    .line 244
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onActionModeFinished(Landroid/view/ActionMode;)V

    .line 245
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 246
    invoke-virtual {p0}, Lcom/vkontakte/android/VKActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/VKActivity;->actionModeStatusBarColor:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 248
    :cond_0
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 2
    .param p1, "mode"    # Landroid/view/ActionMode;

    .prologue
    .line 235
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 236
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 237
    invoke-virtual {p0}, Lcom/vkontakte/android/VKActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getStatusBarColor()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/VKActivity;->actionModeStatusBarColor:I

    .line 238
    invoke-virtual {p0}, Lcom/vkontakte/android/VKActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, -0xc4a079

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 240
    :cond_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 130
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 131
    const/16 v4, 0x4e20

    if-ne p1, v4, :cond_1

    const/4 v4, -0x1

    if-ne p2, v4, :cond_1

    .line 132
    const/4 v2, 0x0

    .line 133
    .local v2, "text":Ljava/lang/String;
    const-string/jumbo v4, "android.speech.extra.RESULTS"

    invoke-virtual {p3, v4}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 134
    .local v0, "results":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 135
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "text":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 137
    .restart local v2    # "text":Ljava/lang/String;
    :cond_0
    const v4, 0x7f1003e5

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/VKActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 138
    .local v1, "searchView":Landroid/view/View;
    if-eqz v2, :cond_1

    if-eqz v1, :cond_1

    .line 139
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 140
    .local v3, "wrapper":Lcom/vkontakte/android/ui/SearchViewWrapper;
    invoke-virtual {v3, v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setTextAndSubmit(Ljava/lang/String;)V

    .line 143
    .end local v0    # "results":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v1    # "searchView":Landroid/view/View;
    .end local v2    # "text":Ljava/lang/String;
    .end local v3    # "wrapper":Lcom/vkontakte/android/ui/SearchViewWrapper;
    :cond_1
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 254
    :try_start_0
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onBackPressed()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 258
    :goto_0
    return-void

    .line 255
    :catch_0
    move-exception v0

    .line 256
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 79
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 80
    invoke-static {p0}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/VKActivity;->isTablet:Z

    .line 81
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 59
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 61
    invoke-static {p0}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/VKActivity;->isTablet:Z

    .line 63
    invoke-static {}, Lcom/vkontakte/android/C2DM;->checkForUpdate()V

    .line 65
    invoke-virtual {p0}, Lcom/vkontakte/android/VKActivity;->isTaskRoot()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/VKActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 66
    invoke-virtual {p0}, Lcom/vkontakte/android/VKActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 69
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/Global;->isBuggyMeizu()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/VKActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 70
    invoke-virtual {p0}, Lcom/vkontakte/android/VKActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 71
    invoke-virtual {p0}, Lcom/vkontakte/android/VKActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 74
    :cond_1
    invoke-static {p0}, Lcom/vkontakte/android/activities/LogoutReceiver;->register(Landroid/app/Activity;)Lcom/vkontakte/android/activities/LogoutReceiver;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/VKActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 75
    return-void
.end method

.method public onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 16
    .param p1, "parent"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "attrs"    # Landroid/util/AttributeSet;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 148
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-super {v0, v1, v2, v3}, Landroid/support/v7/app/AppCompatActivity;->onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v13

    .line 149
    .local v13, "view":Landroid/view/View;
    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x15

    if-lt v14, v15, :cond_0

    move-object v14, v13

    .line 224
    :goto_0
    return-object v14

    .line 152
    :cond_0
    if-nez v13, :cond_1

    .line 154
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/VKActivity;->getDelegate()Landroid/support/v7/app/AppCompatDelegate;

    move-result-object v14

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v14, v0, v1, v2, v3}, Landroid/support/v7/app/AppCompatDelegate;->createView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v13

    .line 155
    if-nez v13, :cond_1

    const-string/jumbo v14, "TextView"

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 156
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/VKActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v14

    const-string/jumbo v15, "android.widget."

    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-virtual {v14, v0, v15, v1}, Landroid/view/LayoutInflater;->createView(Ljava/lang/String;Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v13

    .line 162
    :cond_1
    instance-of v14, v13, Landroid/widget/TextView;

    if-eqz v14, :cond_7

    .line 163
    if-eqz p1, :cond_2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "TabLayout$TabView"

    invoke-virtual {v14, v15}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2

    move-object v11, v13

    .line 164
    check-cast v11, Landroid/widget/TextView;

    .line 165
    .local v11, "text":Landroid/widget/TextView;
    new-instance v14, Lcom/vkontakte/android/VKActivity$1;

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v11}, Lcom/vkontakte/android/VKActivity$1;-><init>(Lcom/vkontakte/android/VKActivity;Landroid/widget/TextView;)V

    invoke-virtual {v11, v14}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    move-object v14, v13

    .line 181
    goto :goto_0

    .line 158
    .end local v11    # "text":Landroid/widget/TextView;
    :catch_0
    move-exception v5

    .line 159
    .local v5, "e":Ljava/lang/ClassNotFoundException;
    const/4 v14, 0x0

    goto :goto_0

    .line 183
    .end local v5    # "e":Ljava/lang/ClassNotFoundException;
    :cond_2
    const/4 v14, 0x3

    new-array v14, v14, [I

    fill-array-data v14, :array_0

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1, v14}, Lcom/vkontakte/android/VKActivity;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v9

    .line 184
    .local v9, "t":Landroid/content/res/TypedArray;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual {v9}, Landroid/content/res/TypedArray;->length()I

    move-result v14

    if-ge v6, v14, :cond_7

    .line 185
    if-nez v6, :cond_6

    .line 186
    const/4 v14, 0x2

    new-array v4, v14, [I

    fill-array-data v4, :array_1

    .line 187
    .local v4, "a":[I
    const/4 v14, 0x0

    invoke-virtual {v9, v6, v14}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v4}, Lcom/vkontakte/android/VKActivity;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v10

    .line 188
    .local v10, "ta":Landroid/content/res/TypedArray;
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_2
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->length()I

    move-result v14

    if-ge v7, v14, :cond_3

    .line 189
    invoke-virtual {v10, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 190
    .local v8, "s":Ljava/lang/String;
    const-string/jumbo v14, "sans-serif-medium"

    invoke-virtual {v14, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_5

    move-object v14, v13

    .line 191
    check-cast v14, Landroid/widget/TextView;

    sget-object v15, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v15, v15, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 195
    .end local v8    # "s":Ljava/lang/String;
    :cond_3
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->recycle()V

    .line 184
    .end local v4    # "a":[I
    .end local v7    # "j":I
    .end local v10    # "ta":Landroid/content/res/TypedArray;
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 188
    .restart local v4    # "a":[I
    .restart local v7    # "j":I
    .restart local v8    # "s":Ljava/lang/String;
    .restart local v10    # "ta":Landroid/content/res/TypedArray;
    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 197
    .end local v4    # "a":[I
    .end local v7    # "j":I
    .end local v8    # "s":Ljava/lang/String;
    .end local v10    # "ta":Landroid/content/res/TypedArray;
    :cond_6
    const-string/jumbo v14, "sans-serif-medium"

    invoke-virtual {v9, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4

    move-object v14, v13

    .line 198
    check-cast v14, Landroid/widget/TextView;

    sget-object v15, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v15, v15, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 204
    .end local v6    # "i":I
    .end local v9    # "t":Landroid/content/res/TypedArray;
    :cond_7
    instance-of v14, v13, Landroid/support/v7/widget/Toolbar;

    if-eqz v14, :cond_8

    move-object v12, v13

    .line 205
    check-cast v12, Landroid/support/v7/widget/Toolbar;

    .line 206
    .local v12, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {v13}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v14

    new-instance v15, Lcom/vkontakte/android/VKActivity$2;

    move-object/from16 v0, p0

    invoke-direct {v15, v0, v12}, Lcom/vkontakte/android/VKActivity$2;-><init>(Lcom/vkontakte/android/VKActivity;Landroid/support/v7/widget/Toolbar;)V

    invoke-virtual {v14, v15}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .end local v12    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :cond_8
    move-object v14, v13

    .line 224
    goto/16 :goto_0

    .line 183
    nop

    :array_0
    .array-data 4
        0x1010034
        0x7f01000a
        0x10103ac
    .end array-data

    .line 186
    :array_1
    .array-data 4
        0x7f01000a
        0x10103ac
    .end array-data
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 85
    iget-object v1, p0, Lcom/vkontakte/android/VKActivity;->compositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v1}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 86
    iget-object v1, p0, Lcom/vkontakte/android/VKActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    invoke-virtual {v1}, Lcom/vkontakte/android/activities/LogoutReceiver;->unregister()V

    .line 87
    invoke-virtual {p0}, Lcom/vkontakte/android/VKActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const v2, 0x7f10002b

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    .line 88
    .local v0, "f":Landroid/app/Fragment;
    if-eqz v0, :cond_0

    .line 89
    sget-object v1, Lcom/vkontakte/android/VKApplication;->refWatcher:Lcom/squareup/leakcanary/RefWatcher;

    invoke-virtual {v1, v0}, Lcom/squareup/leakcanary/RefWatcher;->watch(Ljava/lang/Object;)V

    .line 91
    :cond_0
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onDestroy()V

    .line 92
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 95
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 96
    invoke-virtual {p0}, Lcom/vkontakte/android/VKActivity;->onBackPressed()V

    .line 97
    const/4 v0, 0x1

    .line 99
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 103
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 104
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/VKActivity;->isResumedImpl:Z

    .line 105
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->onActivityPaused()V

    .line 106
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 109
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/VKActivity;->isResumedImpl:Z

    .line 111
    invoke-static {p0}, Lcom/vkontakte/android/AppStateTracker;->onActivityResumed(Landroid/app/Activity;)V

    .line 112
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 115
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onStart()V

    .line 116
    invoke-static {p0}, Lcom/my/tracker/MyTracker;->onStartActivity(Landroid/app/Activity;)V

    .line 117
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 120
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onStop()V

    .line 121
    invoke-static {p0}, Lcom/my/tracker/MyTracker;->onStopActivity(Landroid/app/Activity;)V

    .line 122
    return-void
.end method

.method public onSupportActionModeStarted(Landroid/support/v7/view/ActionMode;)V
    .locals 0
    .param p1, "mode"    # Landroid/support/v7/view/ActionMode;

    .prologue
    .line 229
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onSupportActionModeStarted(Landroid/support/v7/view/ActionMode;)V

    .line 230
    invoke-static {p0, p1}, Lcom/vkontakte/android/ViewUtils;->fixActionModeCallback(Landroid/support/v7/app/AppCompatActivity;Landroid/support/v7/view/ActionMode;)V

    .line 231
    return-void
.end method

.method public registerDisposable(Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 1
    .param p1, "disposable"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 265
    iget-object v0, p0, Lcom/vkontakte/android/VKActivity;->compositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 266
    return-object p1
.end method
