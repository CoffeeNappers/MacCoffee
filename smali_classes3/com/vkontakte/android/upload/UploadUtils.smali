.class public Lcom/vkontakte/android/upload/UploadUtils;
.super Ljava/lang/Object;
.source "UploadUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;,
        Lcom/vkontakte/android/upload/UploadUtils$BasePathResolver;,
        Lcom/vkontakte/android/upload/UploadUtils$Resolver;,
        Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;
    }
.end annotation


# static fields
.field public static final UNKNOWN:Ljava/lang/String; = "unknown"

.field private static handler:Landroid/os/Handler;

.field private static resolver:Lcom/vkontakte/android/upload/UploadUtils$Resolver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vkontakte/android/upload/UploadUtils;->handler:Landroid/os/Handler;

    .line 35
    invoke-static {}, Lcom/vkontakte/android/upload/UploadUtils;->createPathResolver()Lcom/vkontakte/android/upload/UploadUtils$Resolver;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/upload/UploadUtils;->resolver:Lcom/vkontakte/android/upload/UploadUtils$Resolver;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createPathResolver()Lcom/vkontakte/android/upload/UploadUtils$Resolver;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 40
    new-instance v0, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;

    invoke-direct {v0, v2}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;-><init>(Lcom/vkontakte/android/upload/UploadUtils$1;)V

    .line 42
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/vkontakte/android/upload/UploadUtils$BasePathResolver;

    invoke-direct {v0, v2}, Lcom/vkontakte/android/upload/UploadUtils$BasePathResolver;-><init>(Lcom/vkontakte/android/upload/UploadUtils$1;)V

    goto :goto_0
.end method

.method private static createTempFile(Landroid/net/Uri;)Ljava/io/File;
    .locals 4
    .param p0, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 98
    invoke-static {p0}, Lcom/vkontakte/android/upload/UploadUtils;->resolveName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 99
    .local v1, "fileName":Ljava/lang/String;
    const-string/jumbo v3, "unknown"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 100
    invoke-static {p0}, Lcom/vkontakte/android/upload/UploadUtils;->resolveExtension(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/FileUtils;->getTempUploadFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 107
    :goto_0
    return-object v3

    .line 102
    :cond_0
    const-string/jumbo v3, "\\."

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 103
    .local v2, "parts":[Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v0, v2, v3

    .line 104
    .local v0, "ext":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_2

    .line 105
    :cond_1
    invoke-static {p0}, Lcom/vkontakte/android/upload/UploadUtils;->resolveExtension(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 107
    :cond_2
    const/4 v3, 0x0

    aget-object v3, v2, v3

    invoke-static {v3, v0}, Lcom/vk/core/util/FileUtils;->getTempUploadFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    goto :goto_0
.end method

.method public static doCopyFromRestrictedProviderAsync(Ljava/util/ArrayList;Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;Landroid/content/Context;)V
    .locals 2
    .param p0    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "copiesListener"    # Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "uris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    invoke-virtual {p1}, Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;->onStart()V

    .line 76
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p0, p2, p1}, Lcom/vkontakte/android/upload/UploadUtils$$Lambda$1;->lambdaFactory$(Ljava/util/ArrayList;Landroid/content/Context;Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 93
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 94
    return-void
.end method

.method static synthetic lambda$doCopyFromRestrictedProviderAsync$2(Ljava/util/ArrayList;Landroid/content/Context;Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;)V
    .locals 7
    .param p0, "uris"    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "copiesListener"    # Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 77
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .local v2, "newUris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    :try_start_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/Uri;

    .line 80
    .local v3, "uri":Landroid/net/Uri;
    invoke-static {v3}, Lcom/vkontakte/android/upload/UploadUtils;->createTempFile(Landroid/net/Uri;)Ljava/io/File;

    move-result-object v1

    .line 81
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    move-result v5

    if-nez v5, :cond_3

    .line 82
    :cond_2
    new-instance v4, Ljava/lang/RuntimeException;

    const-string/jumbo v5, "Cannot create temp file"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v0

    .line 90
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v4, "vk"

    const-string/jumbo v5, "Error copying files from a restricted provider"

    invoke-static {v4, v5, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 91
    sget-object v4, Lcom/vkontakte/android/upload/UploadUtils;->handler:Landroid/os/Handler;

    invoke-static {p2, v0}, Lcom/vkontakte/android/upload/UploadUtils$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;Ljava/lang/Exception;)Ljava/lang/Runnable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 93
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 84
    .restart local v1    # "file":Ljava/io/File;
    .restart local v3    # "uri":Landroid/net/Uri;
    :cond_3
    const/4 v5, 0x0

    :try_start_1
    invoke-static {p1, v3, v1, v5}, Lcom/vk/core/util/CopyUtils;->copy(Landroid/content/Context;Landroid/net/Uri;Ljava/io/File;Lcom/vk/core/util/CopyUtils$CopyListener;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 85
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "file://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 88
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "uri":Landroid/net/Uri;
    :cond_4
    sget-object v4, Lcom/vkontakte/android/upload/UploadUtils;->handler:Landroid/os/Handler;

    invoke-static {p2, v2}, Lcom/vkontakte/android/upload/UploadUtils$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method static synthetic lambda$null$0(Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;Ljava/util/ArrayList;)V
    .locals 0
    .param p0, "copiesListener"    # Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "newUris"    # Ljava/util/ArrayList;

    .prologue
    .line 88
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;->onComplete(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic lambda$null$1(Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;Ljava/lang/Exception;)V
    .locals 0
    .param p0, "copiesListener"    # Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 91
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;->onError(Ljava/lang/Exception;)V

    return-void
.end method

.method public static resolveExtension(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 69
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/MimeTypeMap;->getExtensionFromMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static resolveName(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p0, "uri"    # Landroid/net/Uri;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 64
    sget-object v0, Lcom/vkontakte/android/upload/UploadUtils;->resolver:Lcom/vkontakte/android/upload/UploadUtils$Resolver;

    invoke-interface {v0, p0}, Lcom/vkontakte/android/upload/UploadUtils$Resolver;->resolveName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static resolvePath(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p0, "uri"    # Landroid/net/Uri;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 59
    sget-object v0, Lcom/vkontakte/android/upload/UploadUtils;->resolver:Lcom/vkontakte/android/upload/UploadUtils$Resolver;

    invoke-interface {v0, p0}, Lcom/vkontakte/android/upload/UploadUtils$Resolver;->resolvePath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
