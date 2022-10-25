.class public final Lcom/vkontakte/android/utils/VKLiveUtils;
.super Ljava/lang/Object;
.source "VKLiveUtils.java"


# static fields
.field private static final VK_LIVE_APP_PACKAGE:Ljava/lang/String; = "com.vk.stream"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createLiveDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
    .locals 5
    .param p0, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 24
    const v2, 0x7f0200c5

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 25
    .local v0, "liveBackground":Landroid/graphics/drawable/Drawable;
    new-instance v1, Lcom/vkontakte/android/ui/drawables/TextDrawable;

    const-string/jumbo v2, "LIVE"

    const/high16 v3, 0x40c00000    # 6.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-direct {v1, p0, v2, v3}, Lcom/vkontakte/android/ui/drawables/TextDrawable;-><init>(Landroid/content/res/Resources;Ljava/lang/CharSequence;I)V

    .line 26
    .local v1, "textDrawable":Lcom/vkontakte/android/ui/drawables/TextDrawable;
    new-instance v2, Landroid/graphics/drawable/LayerDrawable;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/graphics/drawable/Drawable;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v4, 0x1

    aput-object v1, v3, v4

    invoke-direct {v2, v3}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    return-object v2
.end method

.method public static goToTranslation(Landroid/content/Context;II)V
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "videoId"    # I
    .param p2, "ownerId"    # I

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 44
    :try_start_0
    invoke-static {p0}, Lcom/vkontakte/android/utils/VKLiveUtils;->isAppInstalled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 45
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v4, "vklive://live/?command=show_live&videoid=%d&ownerid=%d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 47
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    .line 46
    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 45
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 54
    :goto_0
    return-void

    .line 49
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/utils/VKLiveUtils;->openMarket(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    .local v0, "e":Ljava/lang/Exception;
    new-array v1, v10, [Ljava/lang/Object;

    const-string/jumbo v2, "VK Live Utils"

    aput-object v2, v1, v8

    aput-object v0, v1, v9

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private static isAppInstalled(Landroid/content/Context;)Z
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 72
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const-string/jumbo v3, "com.vk.stream"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    const/4 v1, 0x1

    .line 75
    :goto_0
    return v1

    .line 74
    :catch_0
    move-exception v0

    .line 75
    .local v0, "x":Ljava/lang/Exception;
    goto :goto_0
.end method

.method public static openMarket(Landroid/content/Context;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    :try_start_0
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    const-string/jumbo v4, "market://details?id=com.vk.stream"

    .line 60
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 59
    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 68
    :goto_0
    return-void

    .line 61
    :catch_0
    move-exception v0

    .line 62
    .local v0, "anfe":Landroid/content/ActivityNotFoundException;
    :try_start_1
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    const-string/jumbo v4, "http://play.google.com/store/apps/details?id=com.vk.stream"

    .line 63
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 62
    invoke-virtual {p0, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 65
    .end local v0    # "anfe":Landroid/content/ActivityNotFoundException;
    :catch_1
    move-exception v1

    .line 66
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "VK Live Utils"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v1, v2, v3

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static startStream(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-static {p0}, Lcom/vkontakte/android/utils/VKLiveUtils;->isAppInstalled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 32
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    const-string/jumbo v3, "vklive://live/?command=start_translation"

    .line 33
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 32
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    :goto_0
    return-void

    .line 34
    :catch_0
    move-exception v0

    .line 35
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "VK Live Utils"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_0

    .line 38
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    new-instance v1, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;-><init>()V

    const-class v2, Lcom/vkontakte/android/fragments/VKLiveInstallBannerFragment;

    const v3, 0x7f0b020e

    invoke-virtual {v1, p0, v2, v3}, Lcom/vkontakte/android/fragments/VKAlertFragment$Builder;->show(Landroid/content/Context;Ljava/lang/Class;I)V

    goto :goto_0
.end method
