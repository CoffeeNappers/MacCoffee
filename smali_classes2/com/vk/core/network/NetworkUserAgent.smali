.class public Lcom/vk/core/network/NetworkUserAgent;
.super Ljava/lang/Object;
.source "NetworkUserAgent.java"


# instance fields
.field private userAgent:Ljava/lang/String;

.field private userAgentAd:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-string/jumbo v0, "VKAndroidApp"

    iput-object v0, p0, Lcom/vk/core/network/NetworkUserAgent;->userAgent:Ljava/lang/String;

    .line 15
    const-string/jumbo v0, "VKAndroidApp"

    iput-object v0, p0, Lcom/vk/core/network/NetworkUserAgent;->userAgentAd:Ljava/lang/String;

    return-void
.end method

.method public static toHumanReadableAscii(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x7f

    const/16 v6, 0x1f

    .line 44
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .local v4, "length":I
    :goto_0
    if-ge v2, v4, :cond_3

    .line 45
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    .line 46
    .local v1, "c":I
    if-le v1, v6, :cond_0

    if-ge v1, v7, :cond_0

    .line 44
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v2, v5

    goto :goto_0

    .line 48
    :cond_0
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 49
    .local v0, "buffer":Lokio/Buffer;
    const/4 v5, 0x0

    invoke-virtual {v0, p0, v5, v2}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    .line 50
    move v3, v2

    .local v3, "j":I
    :goto_1
    if-ge v3, v4, :cond_2

    .line 51
    invoke-virtual {p0, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    .line 52
    if-le v1, v6, :cond_1

    if-ge v1, v7, :cond_1

    move v5, v1

    :goto_2
    invoke-virtual {v0, v5}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    .line 50
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v3, v5

    goto :goto_1

    .line 52
    :cond_1
    const/16 v5, 0x3f

    goto :goto_2

    .line 54
    :cond_2
    invoke-virtual {v0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    .line 56
    .end local v0    # "buffer":Lokio/Buffer;
    .end local v1    # "c":I
    .end local v3    # "j":I
    .end local p0    # "s":Ljava/lang/String;
    :cond_3
    return-object p0
.end method


# virtual methods
.method public init(Landroid/content/Context;)V
    .locals 13
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 18
    const-string/jumbo v1, ""

    .line 19
    .local v1, "appVersion":Ljava/lang/String;
    const/4 v0, 0x0

    .line 21
    .local v0, "appBuild":I
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 22
    .local v2, "pkgInfo":Landroid/content/pm/PackageInfo;
    iget-object v1, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 23
    iget v0, v2, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .end local v2    # "pkgInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v4, "VKAndroidApp/%s-%d (Android %s; SDK %d; %s; %s %s; %s)"

    const/16 v5, 0x8

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v8

    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v9

    sget-object v6, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    aput-object v6, v5, v10

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v11

    sget-object v6, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    aput-object v6, v5, v12

    const/4 v6, 0x5

    sget-object v7, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x6

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const-string/jumbo v7, "user.language"

    .line 29
    invoke-static {v7}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    .line 27
    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 26
    invoke-static {v3}, Lcom/vk/core/network/NetworkUserAgent;->toHumanReadableAscii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/core/network/NetworkUserAgent;->userAgent:Ljava/lang/String;

    .line 31
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v4, "VKApp/%s (Linux; U; Android %s; %s Build/%s)"

    new-array v5, v12, [Ljava/lang/Object;

    aput-object v1, v5, v8

    sget-object v6, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    aput-object v6, v5, v9

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    aput-object v6, v5, v10

    sget-object v6, Landroid/os/Build;->ID:Ljava/lang/String;

    aput-object v6, v5, v11

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/network/NetworkUserAgent;->toHumanReadableAscii(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/core/network/NetworkUserAgent;->userAgentAd:Ljava/lang/String;

    .line 33
    return-void

    .line 24
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public userAgent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vk/core/network/NetworkUserAgent;->userAgent:Ljava/lang/String;

    return-object v0
.end method

.method public userAgentAd()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vk/core/network/NetworkUserAgent;->userAgentAd:Ljava/lang/String;

    return-object v0
.end method
