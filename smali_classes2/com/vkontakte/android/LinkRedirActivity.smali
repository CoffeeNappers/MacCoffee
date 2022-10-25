.class public Lcom/vkontakte/android/LinkRedirActivity;
.super Landroid/app/Activity;
.source "LinkRedirActivity.java"

# interfaces
.implements Lcom/vkontakte/android/ui/ResulterProvider;


# static fields
.field private static final NOT_DOMAINS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private forceInternal:Z

.field private logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

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

.field private otherApp:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 140
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "/settings"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "/edit"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/LinkRedirActivity;->NOT_DOMAINS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 116
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 123
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/LinkRedirActivity;->forceInternal:Z

    .line 125
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/LinkRedirActivity;
    .param p1, "x1"    # Landroid/net/Uri;

    .prologue
    .line 116
    invoke-direct {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity;->openBrowser(Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/LinkRedirActivity;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/LinkRedirActivity;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 116
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/LinkRedirActivity;->openChat(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/LinkRedirActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/LinkRedirActivity;
    .param p1, "x1"    # I

    .prologue
    .line 116
    invoke-direct {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity;->showErrorMessage(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/LinkRedirActivity;Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/LinkRedirActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 116
    invoke-direct {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/LinkRedirActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/LinkRedirActivity;

    .prologue
    .line 116
    invoke-direct {p0}, Lcom/vkontakte/android/LinkRedirActivity;->showError()V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/LinkRedirActivity;IILjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/LinkRedirActivity;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Z
    .param p5, "x5"    # Ljava/lang/String;
    .param p6, "x6"    # Ljava/lang/String;
    .param p7, "x7"    # Ljava/lang/String;
    .param p8, "x8"    # I

    .prologue
    .line 116
    invoke-direct/range {p0 .. p8}, Lcom/vkontakte/android/LinkRedirActivity;->openApplication(IILjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public static addCustomTabsExtras(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 15
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v14, 0x1

    const/4 v13, 0x0

    .line 1544
    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v9}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v9

    const-string/jumbo v10, "useChromeCustomTabs"

    invoke-interface {v9, v10, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 1545
    new-instance v5, Ljava/util/Random;

    invoke-direct {v5}, Ljava/util/Random;-><init>()V

    .line 1546
    .local v5, "rand":Ljava/util/Random;
    const/16 v9, 0xa

    invoke-virtual {v5, v9}, Ljava/util/Random;->nextInt(I)I

    move-result v9

    add-int/lit8 v9, v9, 0xa

    new-array v6, v9, [C

    .line 1547
    .local v6, "randomDomain":[C
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v9, v6

    if-ge v3, v9, :cond_0

    .line 1548
    const/16 v9, 0x1a

    invoke-virtual {v5, v9}, Ljava/util/Random;->nextInt(I)I

    move-result v9

    add-int/lit8 v9, v9, 0x61

    int-to-char v9, v9

    aput-char v9, v6, v3

    .line 1547
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1550
    :cond_0
    new-instance v9, Landroid/content/Intent;

    const-string/jumbo v10, "android.intent.action.VIEW"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "http://"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v6}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, "/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    sget-object v10, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v1

    .line 1551
    .local v1, "defBrowser":Landroid/content/ComponentName;
    invoke-virtual {p0}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    .line 1552
    .local v2, "destination":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, ".vk.com"

    invoke-virtual {v9, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "vk.com"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1553
    :cond_1
    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "/away"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1554
    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v9

    const-string/jumbo v10, "to"

    invoke-virtual {v9, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_2

    .line 1555
    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v9

    const-string/jumbo v10, "to"

    invoke-virtual {v9, v10}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1558
    :cond_2
    new-instance v9, Landroid/content/Intent;

    const-string/jumbo v10, "android.intent.action.VIEW"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    sget-object v10, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v8

    .line 1559
    .local v8, "target":Landroid/content/ComponentName;
    if-eqz v8, :cond_4

    invoke-virtual {v8, v1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 1577
    .end local v1    # "defBrowser":Landroid/content/ComponentName;
    .end local v2    # "destination":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v5    # "rand":Ljava/util/Random;
    .end local v6    # "randomDomain":[C
    .end local v8    # "target":Landroid/content/ComponentName;
    :cond_3
    :goto_1
    return-object p0

    .line 1563
    .restart local v1    # "defBrowser":Landroid/content/ComponentName;
    .restart local v2    # "destination":Ljava/lang/String;
    .restart local v3    # "i":I
    .restart local v5    # "rand":Ljava/util/Random;
    .restart local v6    # "randomDomain":[C
    .restart local v8    # "target":Landroid/content/ComponentName;
    :cond_4
    const-string/jumbo v10, "android.support.customtabs.extra.SESSION"

    const/4 v9, 0x0

    check-cast v9, Landroid/os/Parcelable;

    invoke-virtual {p0, v10, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1564
    const-string/jumbo v9, "android.support.customtabs.extra.TOOLBAR_COLOR"

    sget-object v10, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0f0018

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getColor(I)I

    move-result v10

    invoke-virtual {p0, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1565
    const-string/jumbo v9, "android.support.customtabs.extra.TITLE_VISIBILITY"

    invoke-virtual {p0, v9, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1567
    new-instance v7, Landroid/content/Intent;

    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v10, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v7, v9, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1568
    .local v7, "share":Landroid/content/Intent;
    const-string/jumbo v9, "android.intent.action.SEND"

    invoke-virtual {v7, v9}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1570
    sget-object v9, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f020021

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    check-cast v4, Landroid/graphics/drawable/BitmapDrawable;

    .line 1571
    .local v4, "icon":Landroid/graphics/drawable/BitmapDrawable;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1572
    .local v0, "btnBundle":Landroid/os/Bundle;
    const-string/jumbo v9, "android.support.customtabs.customaction.ICON"

    invoke-virtual {v4}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v10

    invoke-virtual {v0, v9, v10}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1573
    const-string/jumbo v9, "android.support.customtabs.customaction.PENDING_INTENT"

    sget-object v10, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v10, v13, v7, v13}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v10

    invoke-virtual {v0, v9, v10}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1574
    const-string/jumbo v9, "android.support.customtabs.customaction.DESCRIPTION"

    sget-object v10, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v11, 0x7f0806fd

    invoke-virtual {v10, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v9, v10}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1575
    const-string/jumbo v9, "android.support.customtabs.extra.ACTION_BUTTON_BUNDLE"

    invoke-virtual {p0, v9, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    goto :goto_1
.end method

.method public static createIntentForNotification(Landroid/content/Context;)Landroid/content/Intent;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 119
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "lastUserId"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method private getParams(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "sourceUri"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 1857
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 1858
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private getResolveInfoVkQwe()Landroid/content/pm/ResolveInfo;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 1539
    invoke-virtual {p0}, Lcom/vkontakte/android/LinkRedirActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    const-string/jumbo v4, "http://vk.qwe"

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v1, v2, v5}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 1540
    .local v0, "resolveInfo":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_1
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    goto :goto_0
.end method

.method private isNoBrowser()Z
    .locals 3

    .prologue
    .line 1862
    invoke-virtual {p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "no_browser"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private isNotVKAuthority(Landroid/net/Uri;)Z
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1879
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    .line 1880
    .local v0, "authority":Ljava/lang/String;
    const-string/jumbo v1, "new.vk.com"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "vk.com"

    .line 1881
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "m.vk.com"

    .line 1882
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "vkontakte.ru"

    .line 1883
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isVKContent(Landroid/net/Uri;)Z
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1875
    const-string/jumbo v0, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isVKHost(Landroid/net/Uri;)Z
    .locals 5
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 128
    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v2, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v2, :pswitch_data_0

    move v0, v1

    .line 136
    :pswitch_0
    return v0

    .line 128
    :sswitch_0
    const-string/jumbo v4, "vkontakte.ru"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v2, v1

    goto :goto_0

    :sswitch_1
    const-string/jumbo v4, "vk.com"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v2, v0

    goto :goto_0

    :sswitch_2
    const-string/jumbo v4, "new.vk.com"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v4, "m.vk.com"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v4, "vk.me"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :sswitch_data_0
    .sparse-switch
        -0x746b2897 -> :sswitch_3
        -0x30a9e938 -> :sswitch_1
        0x6b03371 -> :sswitch_4
        0x10eefed6 -> :sswitch_2
        0x43254d56 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private isVKLink(Landroid/net/Uri;)Z
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1871
    const-string/jumbo v0, "vklink"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isVKScheme(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1866
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 1867
    .local v0, "scheme":Ljava/lang/String;
    const-string/jumbo v1, "vkontakte"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "vk"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private makeAwayUri(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1887
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1894
    .end local p1    # "uri":Landroid/net/Uri;
    :goto_0
    return-object p1

    .line 1891
    .restart local p1    # "uri":Landroid/net/Uri;
    :cond_0
    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    const-string/jumbo v2, "https"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string/jumbo v2, "m.vk.com"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string/jumbo v2, "/away"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string/jumbo v2, "to"

    .line 1892
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string/jumbo v2, "utf"

    const-string/jumbo v3, "1"

    .line 1893
    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 1894
    .local v0, "builder":Landroid/net/Uri$Builder;
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    goto :goto_0
.end method

.method private openApplication(IILjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 11
    .param p1, "appId"    # I
    .param p2, "ownerId"    # I
    .param p3, "sourceUri"    # Ljava/lang/String;
    .param p4, "isHtml5App"    # Z
    .param p5, "title"    # Ljava/lang/String;
    .param p6, "origUrl"    # Ljava/lang/String;
    .param p7, "viewUrl"    # Ljava/lang/String;
    .param p8, "orientation"    # I

    .prologue
    .line 1811
    const-string/jumbo v1, "#"

    invoke-direct {p0, p3, v1}, Lcom/vkontakte/android/LinkRedirActivity;->getParams(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1812
    .local v9, "hashParams":Ljava/lang/String;
    const-string/jumbo v1, "?"

    invoke-direct {p0, p3, v1}, Lcom/vkontakte/android/LinkRedirActivity;->getParams(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1814
    .local v10, "queryParams":Ljava/lang/String;
    if-eqz v10, :cond_3

    .line 1815
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p7

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v1, "?"

    move-object/from16 v0, p7

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, "&"

    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p7

    .line 1816
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p6

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v1, "?"

    move-object/from16 v0, p6

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string/jumbo v1, "&"

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p6

    :cond_0
    :goto_2
    move-object v1, p0

    move-object/from16 v2, p7

    move-object/from16 v3, p6

    move-object/from16 v4, p5

    move v5, p2

    move v6, p1

    move v7, p4

    move/from16 v8, p8

    .line 1821
    invoke-static/range {v1 .. v8}, Lcom/vkontakte/android/LinkRedirActivity;->openLink(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZI)V

    .line 1822
    return-void

    .line 1815
    :cond_1
    const-string/jumbo v1, "?"

    goto :goto_0

    .line 1816
    :cond_2
    const-string/jumbo v1, "?"

    goto :goto_1

    .line 1817
    :cond_3
    if-eqz v9, :cond_0

    .line 1818
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p7

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v1, "#"

    move-object/from16 v0, p7

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string/jumbo v1, "&"

    :goto_3
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p7

    .line 1819
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p6

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v1, "#"

    move-object/from16 v0, p6

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string/jumbo v1, "&"

    :goto_4
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p6

    goto :goto_2

    .line 1818
    :cond_4
    const-string/jumbo v1, "#"

    goto :goto_3

    .line 1819
    :cond_5
    const-string/jumbo v1, "#"

    goto :goto_4
.end method

.method private openAudioPage(IILjava/lang/String;)V
    .locals 1
    .param p1, "uid"    # I
    .param p2, "albumId"    # I
    .param p3, "accessKey"    # Ljava/lang/String;

    .prologue
    .line 1690
    if-ltz p2, :cond_0

    .line 1691
    new-instance v0, Lcom/vk/music/fragment/PlaylistFragment$Builder;

    invoke-direct {v0, p1, p2}, Lcom/vk/music/fragment/PlaylistFragment$Builder;-><init>(II)V

    invoke-virtual {v0, p3}, Lcom/vk/music/fragment/PlaylistFragment$Builder;->accessKey(Ljava/lang/String;)Lcom/vk/music/fragment/PlaylistFragment$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vk/music/fragment/PlaylistFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1695
    :goto_0
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1696
    invoke-virtual {p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1697
    return-void

    .line 1693
    :cond_0
    new-instance v0, Lcom/vk/music/fragment/MusicFragment$Builder;

    invoke-direct {v0}, Lcom/vk/music/fragment/MusicFragment$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lcom/vk/music/fragment/MusicFragment$Builder;->ownerId(I)Lcom/vk/music/fragment/MusicFragment$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vk/music/fragment/MusicFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method

.method private openBrowser(Landroid/net/Uri;)V
    .locals 12
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 1434
    invoke-direct {p0}, Lcom/vkontakte/android/LinkRedirActivity;->isNoBrowser()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1493
    :cond_0
    :goto_0
    return-void

    .line 1437
    :cond_1
    iget-boolean v6, p0, Lcom/vkontakte/android/LinkRedirActivity;->forceInternal:Z

    if-eqz v6, :cond_3

    .line 1438
    new-instance v2, Landroid/content/Intent;

    const-class v6, Lcom/vkontakte/android/ValidationActivity;

    invoke-direct {v2, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1439
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v6, "url"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1440
    invoke-virtual {p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string/jumbo v7, "device_token"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1441
    const-string/jumbo v6, "device_token"

    invoke-virtual {p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v7

    const-string/jumbo v8, "device_token"

    invoke-virtual {v7, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1443
    :cond_2
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1446
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_3
    new-array v6, v11, [Ljava/lang/Object;

    const-string/jumbo v7, "vk"

    aput-object v7, v6, v9

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "unrecognized link: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v6}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 1447
    invoke-static {p1}, Lcom/vkontakte/android/LinkRedirActivity;->isVKScheme(Landroid/net/Uri;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1448
    const-string/jumbo v6, "m.vk.com"

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1449
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v6

    const-string/jumbo v7, "http"

    invoke-virtual {v6, v7}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 1454
    :cond_4
    move-object v3, p1

    .line 1455
    .local v3, "orig":Landroid/net/Uri;
    invoke-direct {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity;->isNotVKAuthority(Landroid/net/Uri;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1456
    invoke-direct {p0, v3}, Lcom/vkontakte/android/LinkRedirActivity;->makeAwayUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p1

    .line 1461
    :goto_1
    const/4 v5, 0x0

    .line 1462
    .local v5, "unsupportedLink":Z
    iget-boolean v6, p0, Lcom/vkontakte/android/LinkRedirActivity;->otherApp:Z

    if-eqz v6, :cond_6

    const-string/jumbo v6, "new.vk.com"

    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    const-string/jumbo v6, "vk.com"

    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    const-string/jumbo v6, "m.vk.com"

    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    const-string/jumbo v6, "vkontakte.ru"

    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 1463
    :cond_5
    const/4 v5, 0x1

    .line 1465
    :cond_6
    invoke-virtual {p0}, Lcom/vkontakte/android/LinkRedirActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    new-instance v7, Landroid/content/Intent;

    const-string/jumbo v8, "android.intent.action.VIEW"

    invoke-direct {v7, v8, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v6, v7, v9}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v4

    .line 1466
    .local v4, "resolveInfo":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v4, :cond_a

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-gt v6, v11, :cond_a

    .line 1467
    const/4 v0, 0x0

    .line 1468
    .local v0, "foundSelf":Z
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.VIEW"

    invoke-direct {v2, v6, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1469
    .restart local v2    # "intent":Landroid/content/Intent;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    .line 1470
    .local v1, "info":Landroid/content/pm/ResolveInfo;
    const-string/jumbo v7, "com.vkontakte.android"

    iget-object v8, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v8, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    .line 1471
    iget-object v6, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v7, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1472
    invoke-static {v2}, Lcom/vkontakte/android/LinkRedirActivity;->addCustomTabsExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 1473
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1458
    .end local v0    # "foundSelf":Z
    .end local v1    # "info":Landroid/content/pm/ResolveInfo;
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v4    # "resolveInfo":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v5    # "unsupportedLink":Z
    :cond_7
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v6

    const-string/jumbo v7, "https"

    invoke-virtual {v6, v7}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    goto/16 :goto_1

    .line 1476
    .restart local v0    # "foundSelf":Z
    .restart local v1    # "info":Landroid/content/pm/ResolveInfo;
    .restart local v2    # "intent":Landroid/content/Intent;
    .restart local v4    # "resolveInfo":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .restart local v5    # "unsupportedLink":Z
    :cond_8
    const/4 v0, 0x1

    .line 1478
    goto :goto_2

    .line 1479
    .end local v1    # "info":Landroid/content/pm/ResolveInfo;
    :cond_9
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-ne v6, v10, :cond_a

    if-eqz v0, :cond_a

    .line 1480
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity;->tryToOpenInBrowser(Landroid/net/Uri;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1481
    invoke-direct {p0}, Lcom/vkontakte/android/LinkRedirActivity;->showError()V

    goto/16 :goto_0

    .line 1486
    .end local v0    # "foundSelf":Z
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_a
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.VIEW"

    invoke-direct {v2, v6, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1487
    .restart local v2    # "intent":Landroid/content/Intent;
    if-eqz v5, :cond_b

    .line 1488
    invoke-direct {p0}, Lcom/vkontakte/android/LinkRedirActivity;->getResolveInfoVkQwe()Landroid/content/pm/ResolveInfo;

    move-result-object v1

    .line 1489
    .restart local v1    # "info":Landroid/content/pm/ResolveInfo;
    new-instance v6, Landroid/content/ComponentName;

    iget-object v7, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v8, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v8, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v6, v7, v8}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1491
    .end local v1    # "info":Landroid/content/pm/ResolveInfo;
    :cond_b
    invoke-static {v2}, Lcom/vkontakte/android/LinkRedirActivity;->addCustomTabsExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 1492
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0
.end method

.method private openChat(ILjava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "uid"    # I
    .param p2, "ref"    # Ljava/lang/String;
    .param p3, "refSource"    # Ljava/lang/String;

    .prologue
    const v1, 0x77359400

    .line 1607
    new-instance v2, Landroid/app/ProgressDialog;

    invoke-direct {v2, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 1608
    .local v2, "progress":Landroid/app/ProgressDialog;
    const v0, 0x7f08033d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/LinkRedirActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1609
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 1610
    invoke-virtual {v2}, Landroid/app/ProgressDialog;->show()V

    .line 1611
    if-ge p1, v1, :cond_0

    .line 1612
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1613
    .local v6, "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1614
    new-instance v0, Lcom/vkontakte/android/LinkRedirActivity$14;

    invoke-direct {v0, p0, p2, p3, v2}, Lcom/vkontakte/android/LinkRedirActivity$14;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V

    invoke-static {v6, v0}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 1651
    .end local v6    # "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :goto_0
    return-void

    .line 1635
    :cond_0
    sub-int v7, p1, v1

    new-instance v0, Lcom/vkontakte/android/LinkRedirActivity$15;

    move-object v1, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/LinkRedirActivity$15;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/app/ProgressDialog;ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {v7, v0}, Lcom/vkontakte/android/data/Messages;->getChatUsers(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    goto :goto_0
.end method

.method public static openLink(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZI)V
    .locals 9
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "link"    # Ljava/lang/String;
    .param p2, "copyLink"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "screenTitle"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "ownerId"    # I
    .param p5, "appId"    # I
    .param p6, "isHtml5App"    # Z
    .param p7, "orientation"    # I

    .prologue
    .line 144
    if-eqz p6, :cond_0

    .line 147
    const/4 v1, 0x0

    const-string/jumbo v7, "direct"

    const-string/jumbo v8, "activity"

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p5

    move/from16 v6, p7

    invoke-static/range {v0 .. v8}, Lcom/vkontakte/android/data/Games;->openHtml5Game(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 160
    :goto_0
    return-void

    .line 150
    :cond_0
    new-instance v0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;-><init>(Ljava/lang/String;)V

    .line 151
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->setUrlToCopy(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    move-result-object v0

    .line 152
    invoke-virtual {v0, p3}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->setScreenTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    move-result-object v1

    if-eqz p5, :cond_1

    const/4 v0, 0x1

    .line 153
    :goto_1
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->setAppReport(Z)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    move-result-object v0

    .line 154
    invoke-virtual {v0, p4}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->setOwnerId(I)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    move-result-object v0

    .line 155
    invoke-virtual {v0, p5}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->setAppId(I)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    move-result-object v0

    const v1, 0x7f0b00b7

    .line 156
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->setTheme(I)Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    move-result-object v0

    .line 157
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->openInternally()Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    move-result-object v0

    .line 158
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 152
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private openPlainText(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 1825
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/SendActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1826
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1827
    const-string/jumbo v1, "_internal"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1828
    const-string/jumbo v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1829
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V

    .line 1830
    invoke-virtual {p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1831
    return-void
.end method

.method private openPromoFeed(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1508
    new-instance v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists;

    invoke-direct {v0}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists;-><init>()V

    new-instance v1, Lcom/vkontakte/android/LinkRedirActivity$13;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$13;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Ljava/lang/String;)V

    .line 1509
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGetPromotionLists;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1535
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1536
    return-void
.end method

.method private openView(Landroid/net/Uri;)V
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1835
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity;->makeAwayUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-static {v1}, Lcom/vkontakte/android/LinkRedirActivity;->addCustomTabsExtras(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1840
    :goto_0
    return-void

    .line 1836
    :catch_0
    move-exception v0

    .line 1837
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    .line 1838
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static parseInt(Ljava/lang/String;)I
    .locals 2
    .param p0, "param"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 1679
    if-nez p0, :cond_0

    .line 1685
    :goto_0
    return v1

    .line 1683
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    goto :goto_0

    .line 1684
    :catch_0
    move-exception v0

    .line 1685
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private resolveScreenName(Ljava/lang/String;Landroid/net/Uri;I)V
    .locals 4
    .param p1, "scrName"    # Ljava/lang/String;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "ownerId"    # I

    .prologue
    .line 1700
    new-instance v1, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v2, "execute.resolveScreenName"

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "screen_name"

    .line 1701
    invoke-virtual {v1, v2, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "owner_id"

    .line 1702
    invoke-virtual {v1, v2, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    const-string/jumbo v2, "func_v"

    const/4 v3, 0x3

    .line 1703
    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/LinkRedirActivity$16;

    invoke-direct {v2, p0, p2, p3}, Lcom/vkontakte/android/LinkRedirActivity$16;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;I)V

    .line 1704
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1756
    .local v0, "request":Lcom/vkontakte/android/api/VKAPIRequest;
    invoke-virtual {p0}, Lcom/vkontakte/android/LinkRedirActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1757
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1759
    :cond_0
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1760
    return-void
.end method

.method private safeParseInt(Ljava/lang/String;)I
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1582
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1585
    :goto_0
    return v0

    .line 1583
    :catch_0
    move-exception v0

    .line 1585
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private showError()V
    .locals 1

    .prologue
    .line 1843
    const v0, 0x7f0801f9

    invoke-direct {p0, v0}, Lcom/vkontakte/android/LinkRedirActivity;->showErrorMessage(I)V

    .line 1844
    return-void
.end method

.method private showErrorMessage(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 1847
    new-instance v0, Lcom/vkontakte/android/LinkRedirActivity$17;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$17;-><init>(Lcom/vkontakte/android/LinkRedirActivity;I)V

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/LinkRedirActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1854
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 1655
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 1656
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity;->mResulters:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 1657
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity;->mResulters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ActivityResulter;

    .line 1658
    .local v0, "resulter":Lcom/vkontakte/android/ui/ActivityResulter;
    invoke-interface {v0, p1, p2, p3}, Lcom/vkontakte/android/ui/ActivityResulter;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 1661
    .end local v0    # "resulter":Lcom/vkontakte/android/ui/ActivityResulter;
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 70
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 163
    const-string/jumbo v5, "LinkRedir"

    const-string/jumbo v6, "OnCreate!"

    invoke-static {v5, v6}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 166
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/activities/LogoutReceiver;->register(Landroid/app/Activity;)Lcom/vkontakte/android/activities/LogoutReceiver;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/vkontakte/android/LinkRedirActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 167
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    if-nez v5, :cond_1

    .line 168
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 1431
    :cond_0
    :goto_0
    return-void

    .line 171
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string/jumbo v6, "lastUserId"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    invoke-virtual {v5, v6, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    if-eq v5, v6, :cond_2

    .line 172
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 173
    new-instance v30, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const-class v6, Lcom/vkontakte/android/MainActivity;

    move-object/from16 v0, v30

    invoke-direct {v0, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 174
    .local v30, "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 177
    .end local v30    # "intent":Landroid/content/Intent;
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v5

    if-eqz v5, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v5

    const-string/jumbo v6, "android.intent.category.NOTIFICATION_PREFERENCES"

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 178
    const-class v5, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;

    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 179
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto :goto_0

    .line 183
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v23

    .line 184
    .local v23, "data":Landroid/net/Uri;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v5

    if-nez v5, :cond_4

    .line 185
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->showError()V

    .line 186
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto :goto_0

    .line 191
    :cond_4
    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v62

    .line 193
    .local v62, "url":Ljava/lang/String;
    const-string/jumbo v5, "android.intent.action.SEND"

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 194
    move-object/from16 v0, p0

    move-object/from16 v1, v62

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->openPlainText(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 198
    :cond_5
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->isVKContent(Landroid/net/Uri;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 200
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string/jumbo v9, "data1"

    aput-object v9, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v22

    .line 201
    .local v22, "cursor":Landroid/database/Cursor;
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->moveToFirst()Z

    .line 202
    const-string/jumbo v5, "data1"

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v60

    .line 203
    .local v60, "uid":I
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v21

    .line 204
    .local v21, "ctype":Ljava/lang/String;
    const-string/jumbo v5, "vnd.android.cursor.item/vnd.com.vkontakte.android.profile"

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 205
    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    move/from16 v0, v60

    invoke-direct {v5, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 206
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 210
    .end local v21    # "ctype":Ljava/lang/String;
    .end local v22    # "cursor":Landroid/database/Cursor;
    .end local v60    # "uid":I
    :catch_0
    move-exception v66

    .line 211
    .local v66, "x":Ljava/lang/Exception;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 207
    .end local v66    # "x":Ljava/lang/Exception;
    .restart local v21    # "ctype":Ljava/lang/String;
    .restart local v22    # "cursor":Landroid/database/Cursor;
    .restart local v60    # "uid":I
    :cond_6
    :try_start_1
    const-string/jumbo v5, "vnd.android.cursor.item/vnd.com.vkontakte.android.sendmsg"

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 208
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v60

    invoke-direct {v0, v1, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->openChat(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 214
    .end local v21    # "ctype":Ljava/lang/String;
    .end local v22    # "cursor":Landroid/database/Cursor;
    .end local v60    # "uid":I
    :cond_7
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->isVKLink(Landroid/net/Uri;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 215
    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "\\?"

    const/4 v8, 0x2

    invoke-virtual {v5, v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    aget-object v62, v5, v6

    .line 216
    const-string/jumbo v5, "internal"

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/vkontakte/android/LinkRedirActivity;->forceInternal:Z

    .line 217
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/vkontakte/android/LinkRedirActivity;->forceInternal:Z

    if-eqz v5, :cond_15

    .line 218
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string/jumbo v6, "token"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v62

    invoke-static {v5, v0}, Lcom/vkontakte/android/utils/XSRFTokenUtil;->verifyToken(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_15

    .line 219
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 223
    :cond_8
    invoke-static/range {v23 .. v23}, Lcom/vkontakte/android/LinkRedirActivity;->isVKScheme(Landroid/net/Uri;)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 224
    const-string/jumbo v5, "profile"

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 225
    new-instance v6, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v5

    const/4 v8, 0x0

    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v5

    invoke-direct {v6, v5}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    move-object/from16 v0, p0

    invoke-virtual {v6, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 226
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 228
    :cond_9
    const-string/jumbo v5, "search"

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 229
    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v25

    .line 230
    .local v25, "dt":Ljava/lang/String;
    const-string/jumbo v5, "/"

    const/4 v6, 0x4

    move-object/from16 v0, v25

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    aget-object v46, v5, v6

    .line 231
    .local v46, "q":Ljava/lang/String;
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 232
    .local v17, "args":Landroid/os/Bundle;
    const-string/jumbo v5, "q"

    move-object/from16 v0, v17

    move-object/from16 v1, v46

    invoke-virtual {v0, v5, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    const-class v5, Lcom/vkontakte/android/fragments/NewsSearchFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 234
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 236
    .end local v17    # "args":Landroid/os/Bundle;
    .end local v25    # "dt":Ljava/lang/String;
    .end local v46    # "q":Ljava/lang/String;
    :cond_a
    const-string/jumbo v5, "chat"

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 237
    const-string/jumbo v5, "peer"

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v60

    .line 238
    .restart local v60    # "uid":I
    new-instance v18, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    const-string/jumbo v5, "title"

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v18

    move/from16 v1, v60

    invoke-direct {v0, v1, v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    .line 239
    .local v18, "builder":Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    const v5, 0x77359400

    move/from16 v0, v60

    if-ge v0, v5, :cond_b

    .line 240
    const-string/jumbo v5, "photo"

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setPhoto(Ljava/lang/CharSequence;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    .line 242
    :cond_b
    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v30

    .line 243
    .restart local v30    # "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v5

    if-eqz v5, :cond_c

    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->isInBackground()Z

    move-result v5

    if-nez v5, :cond_c

    .line 244
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v5

    move-object/from16 v0, v30

    invoke-virtual {v5, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 248
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 246
    :cond_c
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 250
    .end local v18    # "builder":Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .end local v30    # "intent":Landroid/content/Intent;
    .end local v60    # "uid":I
    :cond_d
    const-string/jumbo v5, "reply"

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 251
    const-string/jumbo v51, ""

    .line 252
    .local v51, "s":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-static {v5}, Landroid/support/v4/app/RemoteInput;->getResultsFromIntent(Landroid/content/Intent;)Landroid/os/Bundle;

    move-result-object v66

    .line 253
    .local v66, "x":Landroid/os/Bundle;
    const-string/jumbo v5, "hash"

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 254
    .local v29, "hash":Ljava/lang/String;
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    const-string/jumbo v6, "msg_reply_hash"

    const-string/jumbo v8, ""

    invoke-interface {v5, v6, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v50

    .line 255
    .local v50, "rhash":Ljava/lang/String;
    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 257
    const-string/jumbo v5, "peer"

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v40

    .line 258
    .local v40, "peer":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "voice_reply"

    move-object/from16 v0, v66

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v54

    .line 260
    .local v54, "text":Ljava/lang/String;
    if-eqz v40, :cond_e

    .line 261
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const/4 v6, 0x0

    const/4 v8, 0x0

    move/from16 v0, v40

    move-object/from16 v1, v54

    invoke-static {v0, v1, v5, v6, v8}, Lcom/vkontakte/android/data/Messages;->send(ILjava/lang/String;Ljava/util/List;Ljava/util/List;I)Lcom/vkontakte/android/Message;

    .line 264
    .end local v40    # "peer":I
    .end local v54    # "text":Ljava/lang/String;
    :cond_e
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 266
    .end local v29    # "hash":Ljava/lang/String;
    .end local v50    # "rhash":Ljava/lang/String;
    .end local v51    # "s":Ljava/lang/String;
    .end local v66    # "x":Landroid/os/Bundle;
    :cond_f
    const-string/jumbo v5, "app"

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    .line 267
    const-string/jumbo v5, "pkg"

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 268
    .local v4, "pkg":Ljava/lang/String;
    const-string/jumbo v5, "id"

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v7

    .line 269
    .local v7, "id":I
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v8, "push"

    const-string/jumbo v9, "push"

    move-object/from16 v6, p0

    invoke-static/range {v4 .. v9}, Lcom/vkontakte/android/data/Games;->openInstallableGame(Ljava/lang/String;Landroid/os/Bundle;Landroid/app/Activity;ILjava/lang/String;Ljava/lang/String;)V

    .line 270
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 272
    .end local v4    # "pkg":Ljava/lang/String;
    .end local v7    # "id":I
    :cond_10
    const-string/jumbo v5, "new_post"

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 273
    new-instance v18, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct/range {v18 .. v18}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    .line 274
    .local v18, "builder":Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->uid(I)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 275
    const-string/jumbo v5, "text"

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachText(Ljava/lang/String;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 276
    const-string/jumbo v5, "camera"

    const-string/jumbo v6, "attach"

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachCamera(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 277
    const/4 v5, 0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->send(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 278
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->go(Landroid/content/Context;)Z

    .line 279
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 281
    .end local v18    # "builder":Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    :cond_11
    const-string/jumbo v5, "new_story"

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_12

    .line 282
    new-instance v30, Landroid/content/Intent;

    const-class v5, Lcom/vk/stories/CreateAndEditStoryActivity;

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 283
    .restart local v30    # "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V

    .line 284
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 287
    .end local v30    # "intent":Landroid/content/Intent;
    :cond_12
    const-string/jumbo v5, "settings"

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    .line 288
    const-string/jumbo v5, "general"

    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 289
    const-class v5, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 293
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 291
    :cond_13
    const-class v5, Lcom/vkontakte/android/fragments/SettingsListFragment;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_2

    .line 297
    :cond_14
    const/4 v5, 0x1

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/vkontakte/android/LinkRedirActivity;->otherApp:Z

    .line 299
    :cond_15
    const-string/jumbo v5, "http://"

    move-object/from16 v0, v62

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_16

    const-string/jumbo v5, "https://"

    move-object/from16 v0, v62

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_16

    const-string/jumbo v5, "vkontakte://"

    move-object/from16 v0, v62

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_16

    const-string/jumbo v5, "vk://"

    move-object/from16 v0, v62

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_16

    .line 300
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "http://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v62

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v62

    .line 303
    :cond_16
    invoke-static/range {v62 .. v62}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v61

    .line 305
    .local v61, "uri":Landroid/net/Uri;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string/jumbo v6, "force_browser"

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 306
    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->openBrowser(Landroid/net/Uri;)V

    .line 307
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 311
    :cond_17
    const-string/jumbo v5, "/share.php"

    invoke-virtual/range {v61 .. v61}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_18

    const-string/jumbo v5, "url"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_18

    .line 312
    const-string/jumbo v5, "url"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->openPlainText(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 317
    :cond_18
    const-string/jumbo v5, "android.intent.action.VIEW"

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    const-string/jumbo v5, "_fm"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_19

    .line 318
    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->openBrowser(Landroid/net/Uri;)V

    .line 319
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 323
    :cond_19
    const-string/jumbo v5, "vk.me"

    invoke-virtual/range {v61 .. v61}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 324
    invoke-virtual/range {v61 .. v61}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v38

    .line 325
    .local v38, "path":Ljava/lang/String;
    const-string/jumbo v5, "ref"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v48

    .line 326
    .local v48, "ref":Ljava/lang/String;
    const-string/jumbo v5, "ref_source"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v49

    .line 327
    .local v49, "refSource":Ljava/lang/String;
    const-string/jumbo v5, "^/id[0-9]+$"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1a

    .line 328
    const-string/jumbo v5, "/id([-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 329
    .local v45, "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 330
    .local v32, "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 331
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v60

    .line 332
    .restart local v60    # "uid":I
    move-object/from16 v0, p0

    move/from16 v1, v60

    move-object/from16 v2, v48

    move-object/from16 v3, v49

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/LinkRedirActivity;->openChat(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 333
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v60    # "uid":I
    :cond_1a
    const-string/jumbo v5, "^/(club|public|event)[0-9]+$"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 334
    const-string/jumbo v5, "/(?:club|public|event)([-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 335
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 336
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 337
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v5

    neg-int v0, v5

    move/from16 v60, v0

    .line 338
    .restart local v60    # "uid":I
    move-object/from16 v0, p0

    move/from16 v1, v60

    move-object/from16 v2, v48

    move-object/from16 v3, v49

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/LinkRedirActivity;->openChat(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 339
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v60    # "uid":I
    :cond_1b
    const-string/jumbo v5, "/[A-Za-z0-9\\._]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1c

    sget-object v5, Lcom/vkontakte/android/LinkRedirActivity;->NOT_DOMAINS:Ljava/util/List;

    move-object/from16 v0, v38

    invoke-interface {v5, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1c

    .line 340
    const-string/jumbo v5, "/([A-Za-z0-9\\._]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 341
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 342
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 343
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v52

    .line 345
    .local v52, "scrName":Ljava/lang/String;
    new-instance v5, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v6, "execute.resolveScreenName"

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "screen_name"

    .line 346
    move-object/from16 v0, v52

    invoke-virtual {v5, v6, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    new-instance v6, Lcom/vkontakte/android/LinkRedirActivity$1;

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    move-object/from16 v2, v48

    move-object/from16 v3, v49

    invoke-direct {v6, v0, v1, v2, v3}, Lcom/vkontakte/android/LinkRedirActivity$1;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 374
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 377
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v52    # "scrName":Ljava/lang/String;
    :cond_1c
    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->openBrowser(Landroid/net/Uri;)V

    .line 378
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 383
    .end local v38    # "path":Ljava/lang/String;
    .end local v48    # "ref":Ljava/lang/String;
    .end local v49    # "refSource":Ljava/lang/String;
    :cond_1d
    invoke-static/range {v61 .. v61}, Lcom/vkontakte/android/LinkRedirActivity;->isVKHost(Landroid/net/Uri;)Z

    move-result v5

    if-nez v5, :cond_1e

    invoke-static/range {v61 .. v61}, Lcom/vkontakte/android/LinkRedirActivity;->isVKScheme(Landroid/net/Uri;)Z

    move-result v5

    if-eqz v5, :cond_90

    .line 384
    :cond_1e
    invoke-virtual/range {v61 .. v61}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v38

    .line 386
    .restart local v38    # "path":Ljava/lang/String;
    const/16 v35, 0x0

    .line 387
    .local v35, "notDomain":Z
    const-string/jumbo v5, "z"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    .line 388
    .local v39, "pathQuery":Ljava/lang/String;
    invoke-static/range {v39 .. v39}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1f

    .line 389
    const-string/jumbo v5, "w"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    .line 391
    :cond_1f
    invoke-static/range {v39 .. v39}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_20

    .line 392
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\\/"

    move-object/from16 v0, v39

    invoke-virtual {v0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    aget-object v6, v6, v8

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    .line 393
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v61 .. v61}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "://vk.com"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v38

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v62

    .line 394
    const/16 v35, 0x1

    .line 397
    :cond_20
    const-string/jumbo v5, "/away"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_21

    const-string/jumbo v5, "/away.php"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_22

    .line 398
    :cond_21
    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->openBrowser(Landroid/net/Uri;)V

    .line 399
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 403
    :cond_22
    const-string/jumbo v5, "/apps"

    move-object/from16 v0, v38

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2b

    .line 404
    const-string/jumbo v5, "/app"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual/range {v38 .. v38}, Ljava/lang/String;->length()I

    move-result v6

    move-object/from16 v0, v38

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/LinkRedirActivity;->parseInt(Ljava/lang/String;)I

    move-result v16

    .line 405
    .local v16, "appId":I
    if-eqz v16, :cond_23

    .line 406
    :goto_3
    if-eqz v16, :cond_24

    .line 408
    :goto_4
    const-string/jumbo v5, "type"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/LinkRedirActivity;->parseInt(Ljava/lang/String;)I

    move-result v28

    .line 409
    .local v28, "genreId":I
    if-eqz v28, :cond_25

    .line 411
    :goto_5
    const-string/jumbo v5, "from_notification"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_26

    const/16 v31, 0x1

    .line 412
    .local v31, "isFromPush":Z
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string/jumbo v6, "from_notification"

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    or-int v31, v31, v5

    .line 413
    if-eqz v31, :cond_27

    const-string/jumbo v65, "push"

    .line 414
    .local v65, "vs":Ljava/lang/String;
    :goto_7
    if-eqz v28, :cond_28

    .line 415
    new-instance v27, Lcom/vkontakte/android/data/GameGenre;

    const/4 v5, 0x0

    move-object/from16 v0, v27

    move/from16 v1, v28

    invoke-direct {v0, v1, v5}, Lcom/vkontakte/android/data/GameGenre;-><init>(ILjava/lang/String;)V

    .line 416
    .local v27, "gameGenre":Lcom/vkontakte/android/data/GameGenre;
    new-instance v20, Lcom/vkontakte/android/data/CatalogInfo;

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/vkontakte/android/data/CatalogInfo;-><init>(Lcom/vkontakte/android/data/GameGenre;)V

    .line 417
    .local v20, "catalogInfo":Lcom/vkontakte/android/data/CatalogInfo;
    const-string/jumbo v5, "push"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    move-object/from16 v2, v20

    invoke-static {v0, v1, v5, v2}, Lcom/vkontakte/android/GameCardActivity;->openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/data/CatalogInfo;)V

    .line 424
    .end local v20    # "catalogInfo":Lcom/vkontakte/android/data/CatalogInfo;
    .end local v27    # "gameGenre":Lcom/vkontakte/android/data/GameGenre;
    :goto_8
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 425
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 405
    .end local v28    # "genreId":I
    .end local v31    # "isFromPush":Z
    .end local v65    # "vs":Ljava/lang/String;
    :cond_23
    const-string/jumbo v5, "game_id"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/LinkRedirActivity;->parseInt(Ljava/lang/String;)I

    move-result v16

    goto :goto_3

    .line 406
    :cond_24
    const-string/jumbo v5, "games_id"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/LinkRedirActivity;->parseInt(Ljava/lang/String;)I

    move-result v16

    goto :goto_4

    .line 409
    .restart local v28    # "genreId":I
    :cond_25
    const-string/jumbo v5, "genre_id"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/LinkRedirActivity;->parseInt(Ljava/lang/String;)I

    move-result v28

    goto :goto_5

    .line 411
    :cond_26
    const/16 v31, 0x0

    goto :goto_6

    .line 413
    .restart local v31    # "isFromPush":Z
    :cond_27
    const-string/jumbo v65, "direct"

    goto :goto_7

    .line 418
    .restart local v65    # "vs":Ljava/lang/String;
    :cond_28
    if-eqz v16, :cond_29

    .line 419
    const-string/jumbo v5, "push"

    move-object/from16 v0, p0

    move-object/from16 v1, v65

    move/from16 v2, v16

    invoke-static {v0, v1, v5, v2}, Lcom/vkontakte/android/GameCardActivity;->openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_8

    .line 421
    :cond_29
    const-class v6, Lcom/vkontakte/android/fragments/GamesFragment;

    if-eqz v31, :cond_2a

    const-string/jumbo v5, "push"

    :goto_9
    invoke-static {v5}, Lcom/vkontakte/android/fragments/GamesFragment;->createArgs(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-static {v6, v5, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_8

    :cond_2a
    const-string/jumbo v5, "direct"

    goto :goto_9

    .line 429
    .end local v16    # "appId":I
    .end local v28    # "genreId":I
    .end local v31    # "isFromPush":Z
    .end local v65    # "vs":Ljava/lang/String;
    :cond_2b
    const-string/jumbo v5, "/settings"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2d

    .line 430
    const-string/jumbo v5, "account"

    const-string/jumbo v6, "act"

    move-object/from16 v0, v61

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2d

    .line 432
    new-instance v19, Landroid/os/Bundle;

    invoke-direct/range {v19 .. v19}, Landroid/os/Bundle;-><init>()V

    .line 433
    .local v19, "bundle":Landroid/os/Bundle;
    const-string/jumbo v5, "highlight"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v59

    .line 434
    .local v59, "toBeHighlighted":Ljava/lang/String;
    if-eqz v59, :cond_2c

    .line 435
    const-string/jumbo v5, "pref_to_highlight"

    move-object/from16 v0, v19

    move-object/from16 v1, v59

    invoke-virtual {v0, v5, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 438
    :cond_2c
    const-class v5, Lcom/vkontakte/android/fragments/SettingsAccountFragment;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 439
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 440
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 446
    .end local v19    # "bundle":Landroid/os/Bundle;
    .end local v59    # "toBeHighlighted":Ljava/lang/String;
    :cond_2d
    const-string/jumbo v5, "/friends"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_30

    .line 447
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 448
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "requests"

    const-string/jumbo v6, "section"

    move-object/from16 v0, v61

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 449
    const-string/jumbo v5, "menu_clear_all"

    const/4 v6, 0x1

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 450
    const-class v5, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 451
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 452
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 455
    :cond_2e
    const-string/jumbo v5, "id"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2f

    .line 456
    const-string/jumbo v5, "id"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v7

    .line 457
    .restart local v7    # "id":I
    if-lez v7, :cond_2f

    .line 458
    const-string/jumbo v5, "uid"

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v7}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 461
    .end local v7    # "id":I
    :cond_2f
    const-class v5, Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 462
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 463
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 467
    .end local v17    # "args":Landroid/os/Bundle;
    :cond_30
    const-string/jumbo v5, "/stickers/settings"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_31

    .line 468
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->start(Landroid/app/Activity;)V

    .line 469
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 470
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 474
    :cond_31
    const-string/jumbo v5, "/groups"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_35

    .line 475
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 476
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "id"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_32

    .line 477
    const-string/jumbo v5, "id"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v7

    .line 478
    .restart local v7    # "id":I
    if-lez v7, :cond_32

    .line 479
    const-string/jumbo v5, "uid"

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v7}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 482
    .end local v7    # "id":I
    :cond_32
    const-string/jumbo v5, "events"

    const-string/jumbo v6, "tab"

    move-object/from16 v0, v61

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 483
    const-string/jumbo v5, "tab"

    const/4 v6, 0x1

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 485
    :cond_33
    const-string/jumbo v5, "admin"

    const-string/jumbo v6, "tab"

    move-object/from16 v0, v61

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_34

    .line 486
    const-string/jumbo v5, "admin_only"

    const/4 v6, 0x1

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 488
    :cond_34
    const-class v5, Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 489
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 490
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 493
    .end local v17    # "args":Landroid/os/Bundle;
    :cond_35
    const-string/jumbo v5, "/search"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_41

    .line 497
    invoke-virtual/range {v23 .. v23}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "c\\[([a-z]+)\\]="

    const-string/jumbo v8, "c_$1="

    invoke-virtual {v5, v6, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v26

    .line 498
    .local v26, "fixedUri":Landroid/net/Uri;
    const-string/jumbo v5, "people"

    const-string/jumbo v6, "c_section"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_37

    .line 499
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 500
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "c_q"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_36

    .line 501
    const-string/jumbo v5, "q"

    const-string/jumbo v6, "c_q"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 503
    :cond_36
    const-class v5, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 504
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 505
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 507
    .end local v17    # "args":Landroid/os/Bundle;
    :cond_37
    const-string/jumbo v5, "communities"

    const-string/jumbo v6, "section"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_38

    const-string/jumbo v5, "communities"

    const-string/jumbo v6, "c_section"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_39

    .line 508
    :cond_38
    const-class v5, Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 509
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 510
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 512
    :cond_39
    const-string/jumbo v5, "statuses"

    const-string/jumbo v6, "section"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3a

    const-string/jumbo v5, "statuses"

    const-string/jumbo v6, "c_section"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3c

    .line 514
    :cond_3a
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 515
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "c_q"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3b

    .line 516
    const-string/jumbo v5, "q"

    const-string/jumbo v6, "c_q"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    :cond_3b
    const-class v5, Lcom/vkontakte/android/fragments/NewsSearchFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 519
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 520
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 522
    .end local v17    # "args":Landroid/os/Bundle;
    :cond_3c
    const-string/jumbo v5, "audio"

    const-string/jumbo v6, "section"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3d

    const-string/jumbo v5, "audio"

    const-string/jumbo v6, "c_section"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3f

    .line 524
    :cond_3d
    new-instance v18, Lcom/vk/music/fragment/SearchFragment$Builder;

    invoke-direct/range {v18 .. v18}, Lcom/vk/music/fragment/SearchFragment$Builder;-><init>()V

    .line 525
    .local v18, "builder":Lcom/vk/music/fragment/SearchFragment$Builder;
    const-string/jumbo v5, "c_q"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3e

    .line 526
    const/4 v5, 0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/vk/music/fragment/SearchFragment$Builder;->openResults(Z)Lcom/vk/music/fragment/SearchFragment$Builder;

    .line 527
    const-string/jumbo v5, "c_q"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/vk/music/fragment/SearchFragment$Builder;->query(Ljava/lang/String;)Lcom/vk/music/fragment/SearchFragment$Builder;

    .line 529
    :cond_3e
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/SearchFragment$Builder;->go(Landroid/content/Context;)Z

    .line 530
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 531
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 533
    .end local v18    # "builder":Lcom/vk/music/fragment/SearchFragment$Builder;
    :cond_3f
    const-string/jumbo v5, "video"

    const-string/jumbo v6, "section"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_40

    const-string/jumbo v5, "video"

    const-string/jumbo v6, "c_section"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_41

    .line 534
    :cond_40
    const-class v5, Lcom/vkontakte/android/fragments/videos/VideosFragment;

    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 535
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 536
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 540
    .end local v26    # "fixedUri":Landroid/net/Uri;
    :cond_41
    const-string/jumbo v5, "/fave"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_46

    .line 541
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 542
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "likes_posts"

    const-string/jumbo v6, "section"

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_42

    .line 543
    const-string/jumbo v5, "tab"

    const/4 v6, 0x3

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 545
    :cond_42
    const-string/jumbo v5, "likes_photo"

    const-string/jumbo v6, "section"

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_43

    .line 546
    const-string/jumbo v5, "tab"

    const/4 v6, 0x1

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 548
    :cond_43
    const-string/jumbo v5, "likes_video"

    const-string/jumbo v6, "section"

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_44

    .line 549
    const-string/jumbo v5, "tab"

    const/4 v6, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 551
    :cond_44
    const-string/jumbo v5, "links"

    const-string/jumbo v6, "section"

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_45

    .line 552
    const-string/jumbo v5, "tab"

    const/4 v6, 0x4

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 554
    :cond_45
    const-class v5, Lcom/vkontakte/android/fragments/fave/FaveFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 555
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 556
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 559
    .end local v17    # "args":Landroid/os/Bundle;
    :cond_46
    const-string/jumbo v5, "/mail"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_47

    .line 560
    const-class v5, Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 561
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 565
    :cond_47
    const-string/jumbo v5, "/feed"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_50

    .line 566
    const-string/jumbo v5, "section"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v53

    .line 567
    .local v53, "section":Ljava/lang/String;
    const-string/jumbo v5, "notifications"

    move-object/from16 v0, v53

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_48

    .line 568
    const-class v5, Lcom/vkontakte/android/fragments/feedback/FeedbackFragment;

    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 597
    :goto_a
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 598
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 569
    :cond_48
    const-string/jumbo v5, "search"

    move-object/from16 v0, v53

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4a

    .line 570
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 571
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "q"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_49

    .line 572
    const-string/jumbo v5, "q"

    const-string/jumbo v6, "q"

    move-object/from16 v0, v61

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 574
    :cond_49
    const-class v5, Lcom/vkontakte/android/fragments/NewsSearchFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_a

    .line 575
    .end local v17    # "args":Landroid/os/Bundle;
    :cond_4a
    const-string/jumbo v5, "recommended"

    move-object/from16 v0, v53

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4b

    .line 576
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 577
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "list_id"

    const/4 v6, -0x1

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 578
    const-class v5, Lcom/vkontakte/android/fragments/NewsFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_a

    .line 579
    .end local v17    # "args":Landroid/os/Bundle;
    :cond_4b
    const-string/jumbo v5, "friends"

    move-object/from16 v0, v53

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4c

    .line 580
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 581
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "list_id"

    const/4 v6, -0x2

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 582
    const-class v5, Lcom/vkontakte/android/fragments/NewsFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_a

    .line 583
    .end local v17    # "args":Landroid/os/Bundle;
    :cond_4c
    const-string/jumbo v5, "groups"

    move-object/from16 v0, v53

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4d

    .line 584
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 585
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "list_id"

    const/4 v6, -0x3

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 586
    const-class v5, Lcom/vkontakte/android/fragments/NewsFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_a

    .line 587
    .end local v17    # "args":Landroid/os/Bundle;
    :cond_4d
    const-string/jumbo v5, "list"

    move-object/from16 v0, v53

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4e

    .line 588
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 589
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "list_id"

    const-string/jumbo v6, "list"

    move-object/from16 v0, v61

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v6

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 590
    const-class v5, Lcom/vkontakte/android/fragments/NewsFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_a

    .line 591
    .end local v17    # "args":Landroid/os/Bundle;
    :cond_4e
    if-eqz v53, :cond_4f

    invoke-virtual/range {v53 .. v53}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_4f

    .line 592
    move-object/from16 v0, p0

    move-object/from16 v1, v53

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->openPromoFeed(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 595
    :cond_4f
    const-class v5, Lcom/vkontakte/android/fragments/NewsFragment;

    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_a

    .line 600
    .end local v53    # "section":Ljava/lang/String;
    :cond_50
    const-string/jumbo v5, "/feed/[a-zA-Z0-_9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_51

    .line 601
    const-string/jumbo v5, "/feed/([a-zA-Z0-_9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 602
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 603
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_51

    .line 604
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->openPromoFeed(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 609
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_51
    const-string/jumbo v5, "/support"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_53

    .line 610
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v5

    if-eqz v5, :cond_52

    .line 611
    new-instance v5, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getSupportUrl()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;-><init>(Ljava/lang/String;)V

    .line 612
    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->openInternally()Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 614
    :cond_52
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 615
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 619
    :cond_53
    const-string/jumbo v5, "/stickers/[a-zA-Z0-_9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_54

    .line 620
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 621
    const-string/jumbo v5, "/stickers/([a-zA-Z0-_9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 622
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 623
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 624
    new-instance v5, Lcom/vkontakte/android/api/store/GetStockItemByName;

    const/4 v6, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/store/GetStockItemByName;-><init>(Ljava/lang/String;)V

    new-instance v6, Lcom/vkontakte/android/LinkRedirActivity$2;

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v6, v0, v1}, Lcom/vkontakte/android/LinkRedirActivity$2;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/store/GetStockItemByName;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 637
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 642
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_54
    const-string/jumbo v5, "/stickers"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_55

    .line 643
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 644
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreFragment;->start(Landroid/app/Activity;)V

    .line 645
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 649
    :cond_55
    const-string/jumbo v5, "settings"

    invoke-virtual/range {v61 .. v61}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_57

    .line 650
    const-string/jumbo v5, "/general"

    move-object/from16 v0, v38

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_56

    .line 651
    const-class v5, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 655
    :goto_b
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 653
    :cond_56
    const-class v5, Lcom/vkontakte/android/fragments/SettingsListFragment;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_b

    .line 659
    :cond_57
    const-string/jumbo v5, "/settings"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_58

    const-string/jumbo v5, "music_subscription"

    const-string/jumbo v6, "act"

    move-object/from16 v0, v61

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_58

    .line 660
    new-instance v5, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Builder;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Builder;-><init>(I)V

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Builder;->go(Landroid/content/Context;)Z

    .line 661
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 662
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 666
    :cond_58
    const-string/jumbo v5, "^/ru/.+$"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_59

    .line 667
    const-string/jumbo v5, "/ru/(.+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 668
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v34

    .line 669
    .local v34, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual/range {v34 .. v34}, Ljava/util/regex/Matcher;->find()Z

    .line 670
    new-instance v5, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    invoke-direct {v5}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;-><init>()V

    const/4 v6, 0x1

    move-object/from16 v0, v34

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 671
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 672
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 676
    .end local v34    # "matcher":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_59
    const-string/jumbo v5, "^/[a-zA-Z0-9\\._]+/[^/]+$"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5a

    .line 677
    const-string/jumbo v5, "/([a-zA-Z0-9\\._]+)/(.+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 678
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v34

    .line 679
    .restart local v34    # "matcher":Ljava/util/regex/Matcher;
    invoke-virtual/range {v34 .. v34}, Ljava/util/regex/Matcher;->find()Z

    .line 680
    const/4 v5, 0x1

    move-object/from16 v0, v34

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v24

    .line 681
    .local v24, "domain":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "#"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x2

    move-object/from16 v0, v34

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    .line 682
    .local v47, "query":Ljava/lang/String;
    const-string/jumbo v5, "dev"

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5a

    .line 683
    new-instance v5, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v6, "execute.resolveScreenName"

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "screen_name"

    .line 684
    move-object/from16 v0, v24

    invoke-virtual {v5, v6, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    new-instance v6, Lcom/vkontakte/android/LinkRedirActivity$3;

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    move-object/from16 v2, v47

    move-object/from16 v3, v24

    invoke-direct {v6, v0, v1, v2, v3}, Lcom/vkontakte/android/LinkRedirActivity$3;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    .line 685
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 715
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 720
    .end local v24    # "domain":Ljava/lang/String;
    .end local v34    # "matcher":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v47    # "query":Ljava/lang/String;
    :cond_5a
    const-string/jumbo v5, "q"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_5b

    const-string/jumbo v5, "/wall[-0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5b

    .line 721
    const-string/jumbo v5, "/wall([-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 722
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 723
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 724
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v60

    .line 725
    .restart local v60    # "uid":I
    const-string/jumbo v5, "q"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v47

    .line 726
    .restart local v47    # "query":Ljava/lang/String;
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 727
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "q"

    move-object/from16 v0, v17

    move-object/from16 v1, v47

    invoke-virtual {v0, v5, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 728
    const-string/jumbo v5, "owner"

    move-object/from16 v0, v17

    move/from16 v1, v60

    invoke-virtual {v0, v5, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 729
    const-class v5, Lcom/vkontakte/android/fragments/NewsSearchFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 730
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 731
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 735
    .end local v17    # "args":Landroid/os/Bundle;
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v47    # "query":Ljava/lang/String;
    .end local v60    # "uid":I
    :cond_5b
    const-string/jumbo v5, "/app[-0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_5c

    const-string/jumbo v5, "/app[-0-9]+_[-0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5e

    .line 736
    :cond_5c
    const-string/jumbo v5, "/app[-0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5d

    .line 737
    const-string/jumbo v5, "/(app[-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    move-object/from16 v0, v38

    invoke-virtual {v5, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 738
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 739
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v0, v5, v1, v6}, Lcom/vkontakte/android/LinkRedirActivity;->resolveScreenName(Ljava/lang/String;Landroid/net/Uri;I)V

    goto/16 :goto_0

    .line 741
    .end local v32    # "m":Ljava/util/regex/Matcher;
    :cond_5d
    const-string/jumbo v5, "/(app[-0-9]+)_([-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    move-object/from16 v0, v38

    invoke-virtual {v5, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 742
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 743
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/LinkRedirActivity;->parseInt(Ljava/lang/String;)I

    move-result v6

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v0, v5, v1, v6}, Lcom/vkontakte/android/LinkRedirActivity;->resolveScreenName(Ljava/lang/String;Landroid/net/Uri;I)V

    goto/16 :goto_0

    .line 749
    .end local v32    # "m":Ljava/util/regex/Matcher;
    :cond_5e
    const-string/jumbo v5, "/tag[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5f

    .line 750
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 751
    const-string/jumbo v5, "/tag([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 752
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 753
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 754
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v60

    .line 755
    .restart local v60    # "uid":I
    new-instance v5, Lcom/vkontakte/android/api/photos/PhotosGetAlbums;

    const/4 v6, 0x1

    move/from16 v0, v60

    invoke-direct {v5, v0, v6}, Lcom/vkontakte/android/api/photos/PhotosGetAlbums;-><init>(IZ)V

    new-instance v6, Lcom/vkontakte/android/LinkRedirActivity$4;

    move-object/from16 v0, p0

    invoke-direct {v6, v0}, Lcom/vkontakte/android/LinkRedirActivity$4;-><init>(Lcom/vkontakte/android/LinkRedirActivity;)V

    .line 756
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/photos/PhotosGetAlbums;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 774
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 775
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 779
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v60    # "uid":I
    :cond_5f
    const-string/jumbo v5, "/(photos|albums)[-0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_60

    .line 780
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 781
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 782
    const-string/jumbo v5, "/(?:photos|albums)([-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 783
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 784
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 785
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v60

    .line 786
    .restart local v60    # "uid":I
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 787
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "uid"

    move-object/from16 v0, v17

    move/from16 v1, v60

    invoke-virtual {v0, v5, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 788
    const-string/jumbo v5, "title"

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v8, 0x7f0800c7

    invoke-virtual {v6, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 789
    const-class v5, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 793
    .end local v17    # "args":Landroid/os/Bundle;
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v60    # "uid":I
    :cond_60
    const-string/jumbo v5, "/(videos)[-0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_61

    .line 794
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 795
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 796
    const-string/jumbo v5, "/(?:videos)([-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 797
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 798
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 799
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v60

    .line 800
    .restart local v60    # "uid":I
    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    .line 801
    .restart local v17    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "uid"

    move-object/from16 v0, v17

    move/from16 v1, v60

    invoke-virtual {v0, v5, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 802
    const-class v5, Lcom/vkontakte/android/fragments/videos/VideosFragment;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 806
    .end local v17    # "args":Landroid/os/Bundle;
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v60    # "uid":I
    :cond_61
    const-string/jumbo v5, "/(id|wall)[-0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_62

    .line 807
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 808
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 809
    const-string/jumbo v5, "/(?:id|wall)([-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 810
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 811
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 812
    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    const/4 v6, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 816
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_62
    const-string/jumbo v5, "/write[-0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_63

    .line 817
    const-string/jumbo v5, "/write([-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 818
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 819
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 820
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v60

    .line 821
    .restart local v60    # "uid":I
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v60

    invoke-direct {v0, v1, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->openChat(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 825
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v60    # "uid":I
    :cond_63
    const-string/jumbo v5, "/im"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_67

    .line 826
    const-string/jumbo v5, "sel"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v51

    .line 827
    .restart local v51    # "s":Ljava/lang/String;
    const/16 v60, 0x0

    .line 829
    .restart local v60    # "uid":I
    const/4 v12, 0x0

    .line 830
    .local v12, "addValue":I
    :try_start_2
    const-string/jumbo v5, "c"

    move-object/from16 v0, v51

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_64

    .line 831
    const/4 v5, 0x1

    move-object/from16 v0, v51

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v51

    .line 832
    const v12, 0x77359400

    .line 834
    :cond_64
    invoke-static/range {v51 .. v51}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-result v5

    if-eqz v5, :cond_65

    .line 835
    :goto_c
    add-int v60, v60, v12

    .line 839
    :goto_d
    if-nez v60, :cond_66

    .line 840
    const-class v5, Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 841
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 834
    :cond_65
    :try_start_3
    invoke-static/range {v51 .. v51}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    move-result v60

    goto :goto_c

    .line 843
    :cond_66
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v60

    invoke-direct {v0, v1, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->openChat(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 848
    .end local v12    # "addValue":I
    .end local v51    # "s":Ljava/lang/String;
    .end local v60    # "uid":I
    :cond_67
    const-string/jumbo v5, "/docs[-0-9]*"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_68

    .line 849
    const-string/jumbo v5, "/docs([-0-9]*)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 850
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 851
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 852
    new-instance v5, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;

    invoke-direct {v5}, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;-><init>()V

    const/4 v6, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;->setOwnerId(I)Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;->go(Landroid/content/Context;)Z

    .line 853
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 854
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 858
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_68
    const-string/jumbo v5, "/(club|event|public)[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_69

    .line 859
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 860
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 861
    const-string/jumbo v5, "/(?:club|event|public)([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 862
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 863
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 864
    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    const/4 v6, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v6

    neg-int v6, v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 868
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_69
    const-string/jumbo v5, "/board[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6a

    .line 869
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 870
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 871
    const-string/jumbo v5, "/board([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 872
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 873
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 874
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v60

    .line 876
    .restart local v60    # "uid":I
    new-instance v5, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$Builder;

    move/from16 v0, v60

    invoke-direct {v5, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$Builder;-><init>(I)V

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 880
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v60    # "uid":I
    :cond_6a
    const-string/jumbo v5, "/album[-0-9]+_[-0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6e

    .line 881
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 882
    const-string/jumbo v5, "/album([-0-9]+)_([-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 883
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 884
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 885
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v36

    .line 886
    .local v36, "oid":I
    const/4 v5, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v10

    .line 887
    .local v10, "_aid":I
    const-string/jumbo v5, "0"

    const/4 v6, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6c

    .line 888
    const/4 v10, -0x6

    .line 894
    :cond_6b
    :goto_e
    move v13, v10

    .line 895
    .local v13, "aid":I
    new-instance v5, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v6, "execute.getPhotoAlbum"

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "owner_id"

    .line 896
    move/from16 v0, v36

    invoke-virtual {v5, v6, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    const-string/jumbo v6, "album_id"

    .line 897
    invoke-virtual {v5, v6, v13}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    new-instance v6, Lcom/vkontakte/android/LinkRedirActivity$5;

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v6, v0, v13, v1}, Lcom/vkontakte/android/LinkRedirActivity$5;-><init>(Lcom/vkontakte/android/LinkRedirActivity;ILandroid/net/Uri;)V

    .line 898
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 929
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 930
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 889
    .end local v13    # "aid":I
    :cond_6c
    const-string/jumbo v5, "00"

    const/4 v6, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6d

    .line 890
    const/4 v10, -0x7

    goto :goto_e

    .line 891
    :cond_6d
    const-string/jumbo v5, "000"

    const/4 v6, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6b

    .line 892
    const/16 v10, -0xf

    goto :goto_e

    .line 934
    .end local v10    # "_aid":I
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v36    # "oid":I
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_6e
    const-string/jumbo v5, "/pages"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6f

    const-string/jumbo v5, "oid"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_6f

    const-string/jumbo v5, "p"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_6f

    .line 935
    const-string/jumbo v5, "oid"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v36

    .line 936
    .restart local v36    # "oid":I
    const-string/jumbo v5, "p"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x5f

    const/16 v8, 0x20

    invoke-virtual {v5, v6, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v58

    .line 937
    .local v58, "title":Ljava/lang/String;
    new-instance v5, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    invoke-direct {v5}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;-><init>()V

    move-object/from16 v0, v58

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v5

    move/from16 v0, v36

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setOid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 938
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 939
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 943
    .end local v36    # "oid":I
    .end local v58    # "title":Ljava/lang/String;
    :cond_6f
    const-string/jumbo v5, "/video[-0-9]+_[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_70

    .line 944
    const-string/jumbo v5, "/video([-0-9]+)_([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 945
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 946
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 947
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v36

    .line 948
    .restart local v36    # "oid":I
    const/4 v5, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v63

    .line 949
    .local v63, "vid":I
    const-string/jumbo v5, "t"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/TimeUtils;->getVideoTimestampMs(Ljava/lang/String;)J

    move-result-wide v56

    .line 951
    .local v56, "timestamp":J
    new-instance v64, Lcom/vkontakte/android/api/video/VideoGetById;

    const/4 v5, 0x0

    move-object/from16 v0, v64

    move/from16 v1, v36

    move/from16 v2, v63

    invoke-direct {v0, v1, v2, v5}, Lcom/vkontakte/android/api/video/VideoGetById;-><init>(IILjava/lang/String;)V

    .line 952
    .local v64, "video":Lcom/vkontakte/android/api/video/VideoGetById;
    move-object/from16 v0, v64

    move-wide/from16 v1, v56

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/video/VideoGetById;->setSeekTo(J)V

    .line 953
    new-instance v5, Lcom/vkontakte/android/LinkRedirActivity$6;

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v5, v0, v1}, Lcom/vkontakte/android/LinkRedirActivity$6;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    move-object/from16 v0, v64

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/api/video/VideoGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 976
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 977
    invoke-virtual {v5}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 982
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v36    # "oid":I
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v56    # "timestamp":J
    .end local v63    # "vid":I
    .end local v64    # "video":Lcom/vkontakte/android/api/video/VideoGetById;
    :cond_70
    const-string/jumbo v5, "/topic[-0-9]+_[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_71

    .line 983
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 984
    const-string/jumbo v5, "/topic([-0-9]+)_([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 985
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 986
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 987
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v5

    neg-int v0, v5

    move/from16 v36, v0

    .line 988
    .restart local v36    # "oid":I
    const/4 v5, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v55

    .line 989
    .local v55, "tid":I
    new-instance v5, Lcom/vkontakte/android/api/board/BoardGetTopics;

    move/from16 v0, v36

    move/from16 v1, v55

    invoke-direct {v5, v0, v1}, Lcom/vkontakte/android/api/board/BoardGetTopics;-><init>(II)V

    new-instance v6, Lcom/vkontakte/android/LinkRedirActivity$7;

    move-object/from16 v0, p0

    move/from16 v1, v55

    move/from16 v2, v36

    move-object/from16 v3, v61

    invoke-direct {v6, v0, v1, v2, v3}, Lcom/vkontakte/android/LinkRedirActivity$7;-><init>(Lcom/vkontakte/android/LinkRedirActivity;IILandroid/net/Uri;)V

    .line 990
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/board/BoardGetTopics;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 1006
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 1007
    invoke-virtual {v5}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 1011
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v36    # "oid":I
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v55    # "tid":I
    :cond_71
    const-string/jumbo v5, "/page[-0-9]+_[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_72

    .line 1012
    const-string/jumbo v5, "/page([-0-9]+)_([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1013
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1014
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 1015
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v36

    .line 1016
    .restart local v36    # "oid":I
    const/4 v5, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v41

    .line 1017
    .local v41, "pid":I
    new-instance v5, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    invoke-direct {v5}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;-><init>()V

    move/from16 v0, v36

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setOid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v5

    move/from16 v0, v41

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setPid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1018
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1019
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1022
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v36    # "oid":I
    .end local v41    # "pid":I
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_72
    const-string/jumbo v5, "/note[-0-9]+_[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_73

    .line 1023
    const-string/jumbo v5, "/note([-0-9]+)_([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1024
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1025
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 1026
    new-instance v5, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    invoke-direct {v5}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;-><init>()V

    const/4 v6, 0x1

    .line 1027
    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setOid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v5

    const/4 v6, 0x2

    .line 1028
    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setNid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1029
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1030
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1034
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_73
    const-string/jumbo v5, "/photo[-_0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_74

    .line 1036
    :try_start_4
    const-class v5, Landroid/app/Activity;

    const-string/jumbo v6, "overridePendingTransition"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    sget-object v69, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v69, v8, v9

    const/4 v9, 0x1

    sget-object v69, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v69, v8, v9

    invoke-virtual {v5, v6, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 1037
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v6, v8

    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v6, v8

    move-object/from16 v0, p0

    invoke-virtual {v5, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 1040
    :goto_f
    const-string/jumbo v5, "/photo([-_0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1041
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1042
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 1043
    new-instance v5, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v6, "photos.getById"

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "photos"

    const/4 v8, 0x1

    .line 1044
    move-object/from16 v0, v32

    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v6, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    const-string/jumbo v6, "extended"

    const/4 v8, 0x1

    .line 1045
    invoke-virtual {v5, v6, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    const-string/jumbo v6, "photo_sizes"

    const/4 v8, 0x1

    .line 1046
    invoke-virtual {v5, v6, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    new-instance v6, Lcom/vkontakte/android/LinkRedirActivity$8;

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v6, v0, v1}, Lcom/vkontakte/android/LinkRedirActivity$8;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    .line 1047
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 1108
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 1112
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_74
    const-string/jumbo v5, "/wall[-0-9]+_[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_75

    .line 1113
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 1114
    const-string/jumbo v5, "wall([-0-9]+_[0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1115
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1116
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 1117
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v42

    .line 1118
    .local v42, "post":Ljava/lang/String;
    new-instance v5, Lcom/vkontakte/android/api/wall/WallGetById;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v42, v6, v8

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/wall/WallGetById;-><init>([Ljava/lang/String;)V

    new-instance v6, Lcom/vkontakte/android/LinkRedirActivity$9;

    move-object/from16 v0, p0

    move-object/from16 v1, p0

    move-object/from16 v2, v61

    invoke-direct {v6, v0, v1, v2}, Lcom/vkontakte/android/LinkRedirActivity$9;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/content/Context;Landroid/net/Uri;)V

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/wall/WallGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 1143
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 1147
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v42    # "post":Ljava/lang/String;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_75
    const-string/jumbo v5, "/story[-0-9]+_[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_77

    .line 1148
    const-string/jumbo v5, "story([-0-9]+_[0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1149
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1150
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 1151
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v42

    .line 1153
    .restart local v42    # "post":Ljava/lang/String;
    const-string/jumbo v5, "access_key"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1154
    .local v11, "accessKey":Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_76

    .line 1155
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v42

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    .line 1158
    :cond_76
    new-instance v30, Landroid/content/Intent;

    const-class v5, Lcom/vk/stories/StoryViewActivity;

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1159
    .restart local v30    # "intent":Landroid/content/Intent;
    const-string/jumbo v5, "open_story"

    move-object/from16 v0, v30

    move-object/from16 v1, v42

    invoke-virtual {v0, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1160
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V

    .line 1162
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1163
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1167
    .end local v11    # "accessKey":Ljava/lang/String;
    .end local v30    # "intent":Landroid/content/Intent;
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v42    # "post":Ljava/lang/String;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_77
    const-string/jumbo v5, "/mask[-0-9]+_[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_79

    .line 1168
    const-string/jumbo v5, "mask([-0-9]+_[0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1169
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1170
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 1171
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v33

    .line 1173
    .local v33, "mask":Ljava/lang/String;
    const-string/jumbo v5, "access_key"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 1174
    .restart local v11    # "accessKey":Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_78

    .line 1175
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v33

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    .line 1178
    :cond_78
    new-instance v30, Landroid/content/Intent;

    const-class v5, Lcom/vk/stories/CreateAndEditStoryActivity;

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1179
    .restart local v30    # "intent":Landroid/content/Intent;
    const-string/jumbo v5, "open_mask"

    move-object/from16 v0, v30

    move-object/from16 v1, v33

    invoke-virtual {v0, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1180
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V

    .line 1182
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1183
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1188
    .end local v11    # "accessKey":Ljava/lang/String;
    .end local v30    # "intent":Landroid/content/Intent;
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v33    # "mask":Ljava/lang/String;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_79
    const-string/jumbo v5, "/audio"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7b

    .line 1189
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 1190
    new-instance v18, Lcom/vk/music/fragment/MusicFragment$Builder;

    invoke-direct/range {v18 .. v18}, Lcom/vk/music/fragment/MusicFragment$Builder;-><init>()V

    .line 1191
    .local v18, "builder":Lcom/vk/music/fragment/MusicFragment$Builder;
    const-string/jumbo v5, "section"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v53

    .line 1192
    .restart local v53    # "section":Ljava/lang/String;
    const-string/jumbo v5, "recoms"

    move-object/from16 v0, v53

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7a

    .line 1193
    invoke-virtual/range {v18 .. v18}, Lcom/vk/music/fragment/MusicFragment$Builder;->sectionRecommended()Lcom/vk/music/fragment/MusicFragment$Builder;

    .line 1195
    :cond_7a
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/MusicFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1196
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1197
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1200
    .end local v18    # "builder":Lcom/vk/music/fragment/MusicFragment$Builder;
    .end local v53    # "section":Ljava/lang/String;
    :cond_7b
    const-string/jumbo v5, "/audio_playlist[-0-9]+_[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7d

    .line 1201
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 1202
    const-string/jumbo v5, "/audio_playlist([-0-9]+)_([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1203
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1204
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 1205
    const/4 v11, 0x0

    .line 1206
    .restart local v11    # "accessKey":Ljava/lang/String;
    const-string/jumbo v5, "z"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v67

    .line 1207
    .local v67, "z":Ljava/lang/String;
    if-eqz v67, :cond_7c

    .line 1208
    const-string/jumbo v5, "/"

    move-object/from16 v0, v67

    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v68

    .line 1209
    .local v68, "zz":[Ljava/lang/String;
    move-object/from16 v0, v68

    array-length v5, v0

    const/4 v6, 0x1

    if-le v5, v6, :cond_7c

    .line 1210
    const/4 v5, 0x1

    aget-object v11, v68, v5

    .line 1214
    .end local v68    # "zz":[Ljava/lang/String;
    :cond_7c
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6, v11}, Lcom/vkontakte/android/LinkRedirActivity;->openAudioPage(IILjava/lang/String;)V

    .line 1215
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1216
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1219
    .end local v11    # "accessKey":Ljava/lang/String;
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v67    # "z":Ljava/lang/String;
    :cond_7d
    const-string/jumbo v5, "/audio_playlist[-0-9]+_[0-9]+_[0-9a-zA-Z]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7e

    .line 1220
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 1221
    const-string/jumbo v5, "/audio_playlist([-0-9]+)_([0-9]+)_([0-9a-zA-Z]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1222
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1223
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 1224
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    const/4 v8, 0x3

    move-object/from16 v0, v32

    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6, v8}, Lcom/vkontakte/android/LinkRedirActivity;->openAudioPage(IILjava/lang/String;)V

    .line 1225
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1226
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1229
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_7e
    const-string/jumbo v5, "/audios[-0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_81

    .line 1230
    const-string/jumbo v5, "album_id"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1232
    .local v14, "albumId":Ljava/lang/String;
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 1233
    const-string/jumbo v5, "audios([-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1234
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1235
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 1237
    const-string/jumbo v5, "section"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v53

    .line 1238
    .restart local v53    # "section":Ljava/lang/String;
    const-string/jumbo v5, "playlists"

    move-object/from16 v0, v53

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7f

    .line 1239
    new-instance v5, Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    invoke-direct {v5}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;-><init>()V

    const/4 v6, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->ownerId(I)Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1240
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1241
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1243
    :cond_7f
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_80

    const/4 v5, -0x1

    :goto_10
    const/4 v8, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v6, v5, v8}, Lcom/vkontakte/android/LinkRedirActivity;->openAudioPage(IILjava/lang/String;)V

    goto/16 :goto_0

    :cond_80
    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    goto :goto_10

    .line 1247
    .end local v14    # "albumId":Ljava/lang/String;
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    .end local v53    # "section":Ljava/lang/String;
    :cond_81
    const-string/jumbo v5, "/audio[-0-9]+_[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_82

    .line 1248
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 1249
    const-string/jumbo v5, "audio([-0-9]+_[0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1250
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v62

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1251
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 1252
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v42

    .line 1253
    .restart local v42    # "post":Ljava/lang/String;
    new-instance v5, Lcom/vkontakte/android/api/audio/AudioGetById;

    invoke-static/range {v42 .. v42}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/audio/AudioGetById;-><init>(Ljava/util/List;)V

    new-instance v6, Lcom/vkontakte/android/LinkRedirActivity$10;

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v6, v0, v1}, Lcom/vkontakte/android/LinkRedirActivity$10;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/audio/AudioGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 1273
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 1278
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v42    # "post":Ljava/lang/String;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_82
    const-string/jumbo v5, "/gifts"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_83

    .line 1279
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 1280
    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v5}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->start(Landroid/app/Activity;Lcom/vkontakte/android/UserProfile;)V

    .line 1281
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1282
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1286
    :cond_83
    const-string/jumbo v5, "/product[0-9]+_[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_84

    const-string/jumbo v5, "/product-[0-9]+_[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_87

    .line 1287
    :cond_84
    const/16 v37, 0x0

    .line 1288
    .local v37, "ownerId":I
    const/16 v43, 0x0

    .line 1289
    .local v43, "productId":I
    const-string/jumbo v5, "/product([0-9]+)_([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    move-object/from16 v0, v38

    invoke-virtual {v5, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1290
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_85

    .line 1291
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v37

    .line 1292
    const/4 v5, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v43

    .line 1294
    :cond_85
    const-string/jumbo v5, "/product(-[0-9]+)_([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    move-object/from16 v0, v38

    invoke-virtual {v5, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1295
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_86

    .line 1296
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v37

    .line 1297
    const/4 v5, 0x2

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v43

    .line 1299
    :cond_86
    if-eqz v37, :cond_87

    if-eqz v43, :cond_87

    .line 1300
    new-instance v5, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;

    sget-object v6, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;->link:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    move/from16 v0, v37

    move/from16 v1, v43

    invoke-direct {v5, v6, v0, v1}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;-><init>(Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;II)V

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1301
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1302
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1307
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v37    # "ownerId":I
    .end local v43    # "productId":I
    :cond_87
    const-string/jumbo v5, "/market[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_88

    const-string/jumbo v5, "/market[-0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8c

    .line 1308
    :cond_88
    const-string/jumbo v5, "section"

    move-object/from16 v0, v61

    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v53

    .line 1309
    .restart local v53    # "section":Ljava/lang/String;
    const-string/jumbo v5, "/market([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    move-object/from16 v0, v38

    invoke-virtual {v5, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1310
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    const/16 v37, 0x0

    .line 1311
    .restart local v37    # "ownerId":I
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_89

    .line 1312
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v37

    .line 1314
    :cond_89
    const-string/jumbo v5, "/market([-0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    move-object/from16 v0, v38

    invoke-virtual {v5, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1315
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_8a

    .line 1316
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v37

    .line 1318
    :cond_8a
    if-eqz v37, :cond_8c

    .line 1319
    new-instance v18, Lcom/vkontakte/android/fragments/market/MarketFragment$Builder;

    move-object/from16 v0, v18

    move/from16 v1, v37

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/market/MarketFragment$Builder;-><init>(I)V

    .line 1320
    .local v18, "builder":Lcom/vkontakte/android/fragments/market/MarketFragment$Builder;
    invoke-static/range {v53 .. v53}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_8b

    const-string/jumbo v5, "album_"

    move-object/from16 v0, v53

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8b

    .line 1321
    const-string/jumbo v5, "album_"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    move-object/from16 v0, v53

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    .line 1322
    .local v15, "albumIdStr":Ljava/lang/String;
    invoke-static {v15}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_8b

    .line 1323
    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/market/MarketFragment$Builder;->setAlbum(I)Lcom/vkontakte/android/fragments/market/MarketFragment$Builder;

    .line 1326
    .end local v15    # "albumIdStr":Ljava/lang/String;
    :cond_8b
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/market/MarketFragment$Builder;->go(Landroid/content/Context;)Z

    .line 1327
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1328
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1333
    .end local v18    # "builder":Lcom/vkontakte/android/fragments/market/MarketFragment$Builder;
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v37    # "ownerId":I
    .end local v53    # "section":Ljava/lang/String;
    :cond_8c
    const-string/jumbo v5, "/gifts[0-9]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8e

    .line 1334
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Lcom/vkontakte/android/LinkRedirActivity;->overridePendingTransition(II)V

    .line 1335
    const-string/jumbo v5, "/gifts([0-9]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1336
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1337
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1338
    const-string/jumbo v5, "send"

    const-string/jumbo v6, "act"

    move-object/from16 v0, v61

    invoke-virtual {v0, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8d

    .line 1339
    new-instance v44, Landroid/app/ProgressDialog;

    move-object/from16 v0, v44

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 1340
    .local v44, "progress":Landroid/app/ProgressDialog;
    const v5, 0x7f08033d

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v44

    invoke-virtual {v0, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1341
    const/4 v5, 0x0

    move-object/from16 v0, v44

    invoke-virtual {v0, v5}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 1342
    invoke-virtual/range {v44 .. v44}, Landroid/app/ProgressDialog;->show()V

    .line 1343
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Integer;

    const/4 v6, 0x0

    const/4 v8, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/vkontakte/android/LinkRedirActivity;->safeParseInt(Ljava/lang/String;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v6

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    new-instance v6, Lcom/vkontakte/android/LinkRedirActivity$11;

    move-object/from16 v0, p0

    move-object/from16 v1, v44

    invoke-direct {v6, v0, v1}, Lcom/vkontakte/android/LinkRedirActivity$11;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/app/ProgressDialog;)V

    invoke-static {v5, v6}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    goto/16 :goto_0

    .line 1362
    .end local v44    # "progress":Landroid/app/ProgressDialog;
    :cond_8d
    new-instance v5, Lcom/vkontakte/android/api/gifts/GiftsResolveLink;

    const/4 v6, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/gifts/GiftsResolveLink;-><init>(Ljava/lang/String;)V

    new-instance v6, Lcom/vkontakte/android/LinkRedirActivity$12;

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v6, v0, v1}, Lcom/vkontakte/android/LinkRedirActivity$12;-><init>(Lcom/vkontakte/android/LinkRedirActivity;Landroid/net/Uri;)V

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/gifts/GiftsResolveLink;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 1396
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 1402
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_8e
    const-string/jumbo v5, "/calendar"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8f

    if-eqz v35, :cond_8f

    .line 1403
    const-class v5, Lcom/vkontakte/android/fragments/gifts/BirthdaysFragment;

    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    move-object/from16 v0, p0

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 1404
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1405
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1409
    :cond_8f
    const-string/jumbo v5, "/[A-Za-z0-9\\._]+"

    move-object/from16 v0, v38

    invoke-virtual {v0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_90

    if-nez v35, :cond_90

    sget-object v5, Lcom/vkontakte/android/LinkRedirActivity;->NOT_DOMAINS:Ljava/util/List;

    move-object/from16 v0, v38

    invoke-interface {v5, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_90

    .line 1411
    :try_start_5
    const-class v5, Landroid/app/Activity;

    const-string/jumbo v6, "overridePendingTransition"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    sget-object v69, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v69, v8, v9

    const/4 v9, 0x1

    sget-object v69, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v69, v8, v9

    invoke-virtual {v5, v6, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v6, v8

    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v6, v8

    move-object/from16 v0, p0

    invoke-virtual {v5, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 1414
    :goto_11
    const-string/jumbo v5, "/([A-Za-z0-9\\._]+)"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v45

    .line 1415
    .restart local v45    # "ptn":Ljava/util/regex/Pattern;
    move-object/from16 v0, v45

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v32

    .line 1416
    .restart local v32    # "m":Ljava/util/regex/Matcher;
    invoke-virtual/range {v32 .. v32}, Ljava/util/regex/Matcher;->find()Z

    .line 1417
    const/4 v5, 0x1

    move-object/from16 v0, v32

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v0, v5, v1, v6}, Lcom/vkontakte/android/LinkRedirActivity;->resolveScreenName(Ljava/lang/String;Landroid/net/Uri;I)V

    goto/16 :goto_0

    .line 1422
    .end local v32    # "m":Ljava/util/regex/Matcher;
    .end local v35    # "notDomain":Z
    .end local v38    # "path":Ljava/lang/String;
    .end local v39    # "pathQuery":Ljava/lang/String;
    .end local v45    # "ptn":Ljava/util/regex/Pattern;
    :cond_90
    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->isNotVKAuthority(Landroid/net/Uri;)Z

    move-result v5

    if-eqz v5, :cond_92

    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->isNoBrowser()Z

    move-result v5

    if-nez v5, :cond_92

    .line 1423
    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->openView(Landroid/net/Uri;)V

    .line 1427
    :goto_12
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->isNoBrowser()Z

    move-result v5

    if-nez v5, :cond_91

    .line 1428
    const/4 v5, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 1430
    :cond_91
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    goto/16 :goto_0

    .line 1425
    :cond_92
    move-object/from16 v0, p0

    move-object/from16 v1, v61

    invoke-direct {v0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->openBrowser(Landroid/net/Uri;)V

    goto :goto_12

    .line 1412
    .restart local v35    # "notDomain":Z
    .restart local v38    # "path":Ljava/lang/String;
    .restart local v39    # "pathQuery":Ljava/lang/String;
    :catch_1
    move-exception v5

    goto :goto_11

    .line 1038
    :catch_2
    move-exception v5

    goto/16 :goto_f

    .line 836
    .restart local v12    # "addValue":I
    .restart local v51    # "s":Ljava/lang/String;
    .restart local v60    # "uid":I
    :catch_3
    move-exception v5

    goto/16 :goto_d
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 1590
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/LogoutReceiver;->unregister()V

    .line 1591
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 1592
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 1602
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 1603
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->onActivityPaused()V

    .line 1604
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 1596
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 1597
    invoke-static {p0}, Lcom/vkontakte/android/AppStateTracker;->onActivityResumed(Landroid/app/Activity;)V

    .line 1598
    return-void
.end method

.method public registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/ui/ActivityResulter;

    .prologue
    .line 1665
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity;->mResulters:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1666
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity;->mResulters:Ljava/util/List;

    .line 1668
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity;->mResulters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1669
    return-void
.end method

.method public tryToOpenInBrowser(Landroid/net/Uri;)Z
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1496
    invoke-direct {p0}, Lcom/vkontakte/android/LinkRedirActivity;->getResolveInfoVkQwe()Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 1497
    .local v0, "info":Landroid/content/pm/ResolveInfo;
    if-eqz v0, :cond_0

    .line 1498
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1499
    .local v1, "intent":Landroid/content/Intent;
    new-instance v2, Landroid/content/ComponentName;

    iget-object v3, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v4, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1500
    invoke-static {v1}, Lcom/vkontakte/android/LinkRedirActivity;->addCustomTabsExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 1501
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/LinkRedirActivity;->startActivity(Landroid/content/Intent;)V

    .line 1502
    const/4 v2, 0x1

    .line 1504
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/ui/ActivityResulter;

    .prologue
    .line 1673
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity;->mResulters:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 1674
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity;->mResulters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1676
    :cond_0
    return-void
.end method
