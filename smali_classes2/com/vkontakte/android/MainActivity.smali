.class public Lcom/vkontakte/android/MainActivity;
.super Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;
.source "MainActivity.java"

# interfaces
.implements Lcom/vkontakte/android/ui/ResulterProvider;


# instance fields
.field private lastUpdatedCounters:J

.field private mResulters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/ActivityResulter;",
            ">;"
        }
    .end annotation
.end field

.field private showNewsOnResume:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 49
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 50
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 51
    .local v1, "info":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 52
    const/4 v2, 0x1

    sput-boolean v2, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected:Z

    .line 53
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/vkontakte/android/NetworkStateReceiver;->updateInfo(Landroid/content/Context;)V

    .line 55
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/MainActivity;->showNewsOnResume:Z

    .line 58
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/MainActivity;->lastUpdatedCounters:J

    return-void
.end method

.method private checkForIntro()V
    .locals 4

    .prologue
    .line 137
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getIntro()I

    move-result v1

    .line 139
    .local v1, "intro":I
    and-int/lit8 v2, v1, 0x1

    if-gtz v2, :cond_0

    and-int/lit8 v2, v1, 0x2

    if-lez v2, :cond_2

    .line 140
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/vkontakte/android/SuggestionsActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 141
    .local v0, "intent":Landroid/content/Intent;
    and-int/lit8 v2, v1, 0x1

    if-nez v2, :cond_1

    .line 142
    const-string/jumbo v2, "groups"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 144
    :cond_1
    const/16 v2, 0x65

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 146
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_2
    return-void
.end method

.method static synthetic lambda$showAbout$0(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "arg0"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 151
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020159

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 152
    .local v0, "bmp":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 153
    return-object v0
.end method

.method private setTextViewMarquee(Landroid/widget/TextView;)V
    .locals 2
    .param p1, "t"    # Landroid/widget/TextView;

    .prologue
    const/4 v1, 0x1

    .line 251
    if-nez p1, :cond_0

    .line 259
    :goto_0
    return-void

    .line 254
    :cond_0
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 255
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 256
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setHorizontalFadingEdgeEnabled(Z)V

    .line 257
    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setFadingEdgeLength(I)V

    .line 258
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMarqueeRepeatLimit(I)V

    goto :goto_0
.end method

.method public static showAbout(Landroid/content/Context;)V
    .locals 14
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/16 v13, 0x15

    const/4 v4, 0x2

    const/4 v12, 0x0

    .line 150
    :try_start_0
    invoke-static {p0}, Lcom/vkontakte/android/MainActivity$$Lambda$1;->lambdaFactory$(Landroid/content/Context;)Landroid/text/Html$ImageGetter;

    move-result-object v2

    .line 156
    .local v2, "igetter":Landroid/text/Html$ImageGetter;
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 157
    .local v1, "dlg":Landroid/app/AlertDialog$Builder;
    sget-object v5, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const/16 v6, 0xa

    if-le v5, v6, :cond_1

    .line 158
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/content/Context;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    const/4 v7, 0x1

    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v8, v13, :cond_0

    const/4 v4, 0x4

    :cond_0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "dlg":Landroid/app/AlertDialog$Builder;
    check-cast v1, Landroid/app/AlertDialog$Builder;

    .line 160
    .restart local v1    # "dlg":Landroid/app/AlertDialog$Builder;
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080357

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 161
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "<br/><img src=\'1\'/><br/>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f08009e

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v9

    iget-object v9, v9, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v9

    iget v9, v9, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v2, v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;Landroid/text/Html$ImageGetter;Landroid/text/Html$TagHandler;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 162
    const-string/jumbo v4, "OK"

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 163
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    .line 164
    .local v0, "d":Landroid/app/AlertDialog;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v4, v13, :cond_2

    .line 165
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    const v5, 0x7f0203d2

    invoke-virtual {v4, v5}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 167
    :cond_2
    const v4, 0x102000b

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const v5, -0x602404

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setLinkTextColor(I)V

    .line 168
    const v4, 0x102000b

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const v5, -0x7f602404

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 169
    const v4, 0x102000b

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 170
    const v4, 0x102000b

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 171
    const v4, 0x102000b

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v5, Lcom/vkontakte/android/MainActivity$2;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/MainActivity$2;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 187
    .end local v0    # "d":Landroid/app/AlertDialog;
    .end local v1    # "dlg":Landroid/app/AlertDialog$Builder;
    .end local v2    # "igetter":Landroid/text/Html$ImageGetter;
    :goto_0
    return-void

    .line 184
    :catch_0
    move-exception v3

    .line 185
    .local v3, "x":Ljava/lang/Exception;
    new-array v4, v12, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method protected isTopLevel()Z
    .locals 1

    .prologue
    .line 263
    const/4 v0, 0x1

    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x1

    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 200
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 201
    const/16 v1, 0x64

    if-ne p1, v1, :cond_1

    .line 202
    if-ne p2, v4, :cond_3

    .line 204
    new-array v1, v5, [Ljava/lang/Object;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 206
    invoke-static {p0}, Lcom/vkontakte/android/NetworkStateReceiver;->updateInfo(Landroid/content/Context;)V

    .line 207
    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->updateUserInfo()V

    .line 209
    invoke-static {}, Lcom/vkontakte/android/C2DM;->checkForUpdate()V

    .line 211
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/vkontakte/android/LongPollService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 212
    iput-boolean v5, p0, Lcom/vkontakte/android/MainActivity;->showNewsOnResume:Z

    .line 213
    invoke-static {v3}, Lcom/vkontakte/android/data/Friends;->reload(Z)V

    .line 214
    invoke-static {v3}, Lcom/vkontakte/android/data/Groups;->reload(Z)V

    .line 215
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/Stickers;->reload()V

    .line 216
    sget-object v1, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    if-eqz v1, :cond_0

    .line 217
    sget-object v1, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->updateCounters()V

    .line 219
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/MainActivity;->checkForIntro()V

    .line 224
    :cond_1
    :goto_0
    const/16 v1, 0x65

    if-ne p1, v1, :cond_2

    if-eq p2, v4, :cond_2

    .line 225
    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->finish()V

    .line 228
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/MainActivity;->mResulters:Ljava/util/List;

    if-eqz v1, :cond_4

    .line 229
    iget-object v1, p0, Lcom/vkontakte/android/MainActivity;->mResulters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ActivityResulter;

    .line 230
    .local v0, "resulter":Lcom/vkontakte/android/ui/ActivityResulter;
    invoke-interface {v0, p1, p2, p3}, Lcom/vkontakte/android/ui/ActivityResulter;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_1

    .line 221
    .end local v0    # "resulter":Lcom/vkontakte/android/ui/ActivityResulter;
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->finish()V

    goto :goto_0

    .line 233
    :cond_4
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    const v6, 0x7f10002b

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 63
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->onCreate(Landroid/os/Bundle;)V

    .line 65
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v5

    if-nez p1, :cond_0

    move v3, v4

    :cond_0
    invoke-virtual {v5, v3}, Lcom/vk/analytics/Analytics;->enableCheckForUpdates(Z)V

    .line 67
    new-instance v0, Lcom/vkontakte/android/ui/FitSystemWindowsFragmentWrapperFrameLayout;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/FitSystemWindowsFragmentWrapperFrameLayout;-><init>(Landroid/content/Context;)V

    .line 68
    .local v0, "contentView":Landroid/widget/FrameLayout;
    invoke-virtual {v0, v6}, Landroid/widget/FrameLayout;->setId(I)V

    .line 69
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x15

    if-lt v3, v5, :cond_1

    .line 70
    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->setFitsSystemWindows(Z)V

    .line 73
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->getNavigationDelegate()Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->setContentView(Landroid/view/View;)V

    .line 75
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 77
    invoke-static {}, Lcom/vkontakte/android/ShortcutManagerWrapper;->getInstance()Lcom/vkontakte/android/ShortcutManagerWrapper;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/vkontakte/android/ShortcutManagerWrapper;->ensureShortcuts(Landroid/content/Context;)V

    .line 79
    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v4, "class"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 80
    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v4, "class"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Ljava/lang/Class;

    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "args"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->getNavigationDelegate()Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v5

    invoke-static {p0, v3, v4, v5}, Lcom/vkontakte/android/ui/FragmentHelper;->replace(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;Lcom/vkontakte/android/ui/navigation/NavigationDelegate;)Landroid/app/Fragment;

    .line 95
    :cond_2
    :goto_0
    :try_start_0
    new-instance v2, Landroid/webkit/WebView;

    invoke-direct {v2, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 96
    .local v2, "webView":Landroid/webkit/WebView;
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    .line 97
    invoke-static {}, Landroid/webkit/CookieSyncManager;->getInstance()Landroid/webkit/CookieSyncManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/webkit/CookieSyncManager;->sync()V

    .line 98
    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 99
    new-instance v3, Lcom/vkontakte/android/MainActivity$1;

    invoke-direct {v3, p0, v2}, Lcom/vkontakte/android/MainActivity$1;-><init>(Lcom/vkontakte/android/MainActivity;Landroid/webkit/WebView;)V

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 110
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v3

    const-string/jumbo v4, "https://m.vk.com/counters.php"

    invoke-virtual {v3, v2, v4}, Lcom/vk/core/network/NetworkProxy;->loadUrl(Landroid/webkit/WebView;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .end local v2    # "webView":Landroid/webkit/WebView;
    :goto_1
    invoke-direct {p0}, Lcom/vkontakte/android/MainActivity;->checkForIntro()V

    .line 114
    :goto_2
    return-void

    .line 82
    :cond_3
    if-nez p1, :cond_2

    .line 84
    new-instance v1, Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/NewsFragment;-><init>()V

    .line 85
    .local v1, "fragment":Lcom/vkontakte/android/fragments/NewsFragment;
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 86
    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v3

    const-string/jumbo v4, "news"

    invoke-virtual {v3, v6, v1, v4}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commit()I

    goto :goto_0

    .line 90
    .end local v1    # "fragment":Lcom/vkontakte/android/fragments/NewsFragment;
    :cond_4
    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/vkontakte/android/AuthActivity;

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v4, 0x64

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_2

    .line 111
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method public onResume()V
    .locals 6

    .prologue
    .line 118
    invoke-super {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateActivity;->onResume()V

    .line 119
    invoke-static {}, Lcom/vkontakte/android/VKApplication;->isDeployApplication()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    if-eqz v1, :cond_0

    .line 120
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/vk/analytics/Analytics;->registerCrashReporter(Landroid/app/Activity;)V

    .line 122
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/MainActivity;->showNewsOnResume:Z

    if-eqz v1, :cond_1

    .line 123
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/MainActivity;->showNewsOnResume:Z

    .line 124
    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/NewsFragment;-><init>()V

    .line 125
    .local v0, "fragment":Lcom/vkontakte/android/fragments/NewsFragment;
    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    const v2, 0x7f10002b

    const-string/jumbo v3, "news"

    invoke-virtual {v1, v2, v0, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 128
    .end local v0    # "fragment":Lcom/vkontakte/android/fragments/NewsFragment;
    :cond_1
    sget-object v1, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    if-eqz v1, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vkontakte/android/MainActivity;->lastUpdatedCounters:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x2710

    cmp-long v1, v2, v4

    if-lez v1, :cond_2

    .line 129
    sget-object v1, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->updateCounters()V

    .line 130
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/vkontakte/android/MainActivity;->lastUpdatedCounters:J

    .line 132
    :cond_2
    invoke-static {p0}, Lcom/vkontakte/android/NetworkStateReceiver;->getNotifications(Landroid/content/Context;)V

    .line 133
    invoke-static {p0}, Lcom/vkontakte/android/NetworkStateReceiver;->getAppNotifications(Landroid/content/Context;)V

    .line 134
    return-void
.end method

.method public registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/ui/ActivityResulter;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/MainActivity;->mResulters:Ljava/util/List;

    if-nez v0, :cond_0

    .line 238
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/MainActivity;->mResulters:Ljava/util/List;

    .line 240
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/MainActivity;->mResulters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    return-void
.end method

.method public restartAfterLogout()V
    .locals 3

    .prologue
    .line 190
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_0

    .line 191
    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->finishAffinity()V

    .line 193
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/activities/LogoutReceiver;->sendLogout()V

    .line 194
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/MainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 195
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 196
    return-void
.end method

.method public unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/ui/ActivityResulter;

    .prologue
    .line 245
    iget-object v0, p0, Lcom/vkontakte/android/MainActivity;->mResulters:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 246
    iget-object v0, p0, Lcom/vkontakte/android/MainActivity;->mResulters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 248
    :cond_0
    return-void
.end method
