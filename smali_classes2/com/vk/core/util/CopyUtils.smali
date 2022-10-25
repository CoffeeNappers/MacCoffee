.class public final Lcom/vk/core/util/CopyUtils;
.super Ljava/lang/Object;
.source "CopyUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/util/CopyUtils$CopyListener;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copy(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;Lcom/vk/core/util/CopyUtils$CopyListener;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "from"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "to"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "listener"    # Lcom/vk/core/util/CopyUtils$CopyListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 22
    invoke-static {p0, p2}, Lcom/vk/core/util/IOUtils;->openOut(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    invoke-static {p0, p1, v0, p3}, Lcom/vk/core/util/CopyUtils;->copy(Landroid/content/Context;Landroid/net/Uri;Ljava/io/OutputStream;Lcom/vk/core/util/CopyUtils$CopyListener;)Z

    move-result v0

    return v0
.end method

.method public static copy(Landroid/content/Context;Landroid/net/Uri;Ljava/io/File;Lcom/vk/core/util/CopyUtils$CopyListener;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "from"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "to"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "listener"    # Lcom/vk/core/util/CopyUtils$CopyListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 26
    invoke-static {p2}, Lcom/vk/core/util/IOUtils;->openOut(Ljava/io/File;)Ljava/io/OutputStream;

    move-result-object v0

    invoke-static {p0, p1, v0, p3}, Lcom/vk/core/util/CopyUtils;->copy(Landroid/content/Context;Landroid/net/Uri;Ljava/io/OutputStream;Lcom/vk/core/util/CopyUtils$CopyListener;)Z

    move-result v0

    return v0
.end method

.method public static copy(Landroid/content/Context;Landroid/net/Uri;Ljava/io/OutputStream;Lcom/vk/core/util/CopyUtils$CopyListener;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "from"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "out"    # Ljava/io/OutputStream;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "listener"    # Lcom/vk/core/util/CopyUtils$CopyListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 30
    invoke-static {p0, p1}, Lcom/vk/core/util/IOUtils;->openIn(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lcom/vk/core/util/CopyUtils;->copyInternal(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/vk/core/util/CopyUtils$CopyListener;)Z

    move-result v0

    return v0
.end method

.method public static copy(Ljava/io/File;Ljava/io/File;Lcom/vk/core/util/CopyUtils$CopyListener;)Z
    .locals 2
    .param p0, "from"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "to"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "listener"    # Lcom/vk/core/util/CopyUtils$CopyListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 34
    invoke-static {p0}, Lcom/vk/core/util/IOUtils;->openIn(Ljava/io/File;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {p1}, Lcom/vk/core/util/IOUtils;->openOut(Ljava/io/File;)Ljava/io/OutputStream;

    move-result-object v1

    invoke-static {v0, v1, p2}, Lcom/vk/core/util/CopyUtils;->copyInternal(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/vk/core/util/CopyUtils$CopyListener;)Z

    move-result v0

    return v0
.end method

.method private static copy(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/vk/core/util/CopyUtils$CopyListener;)Z
    .locals 8
    .param p0, "in"    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "out"    # Ljava/io/OutputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "listener"    # Lcom/vk/core/util/CopyUtils$CopyListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v7, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 56
    if-eqz p2, :cond_0

    .line 57
    invoke-interface {p2}, Lcom/vk/core/util/CopyUtils$CopyListener;->onStart()V

    .line 61
    :cond_0
    const/16 v5, 0x2000

    :try_start_0
    new-array v0, v5, [B

    .line 62
    .local v0, "buf":[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "read":I
    if-lez v2, :cond_2

    .line 63
    const/4 v5, 0x0

    invoke-virtual {p1, v0, v5, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 70
    .end local v0    # "buf":[B
    .end local v2    # "read":I
    :catch_0
    move-exception v1

    .line 71
    .local v1, "e":Ljava/io/IOException;
    :try_start_1
    const-string/jumbo v5, "vk"

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    if-eqz p2, :cond_1

    .line 73
    invoke-interface {p2}, Lcom/vk/core/util/CopyUtils$CopyListener;->onError()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    :cond_1
    new-array v5, v7, [Ljava/io/Closeable;

    aput-object p0, v5, v4

    aput-object p1, v5, v3

    invoke-static {v5}, Lcom/vk/core/util/IOUtils;->close([Ljava/io/Closeable;)V

    move v3, v4

    .end local v1    # "e":Ljava/io/IOException;
    :goto_1
    return v3

    .line 65
    .restart local v0    # "buf":[B
    .restart local v2    # "read":I
    :cond_2
    if-eqz p2, :cond_3

    .line 66
    :try_start_2
    invoke-interface {p2}, Lcom/vk/core/util/CopyUtils$CopyListener;->onComplete()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 78
    :cond_3
    new-array v5, v7, [Ljava/io/Closeable;

    aput-object p0, v5, v4

    aput-object p1, v5, v3

    invoke-static {v5}, Lcom/vk/core/util/IOUtils;->close([Ljava/io/Closeable;)V

    goto :goto_1

    .end local v0    # "buf":[B
    .end local v2    # "read":I
    :catchall_0
    move-exception v5

    new-array v6, v7, [Ljava/io/Closeable;

    aput-object p0, v6, v4

    aput-object p1, v6, v3

    invoke-static {v6}, Lcom/vk/core/util/IOUtils;->close([Ljava/io/Closeable;)V

    throw v5
.end method

.method private static copyInternal(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/vk/core/util/CopyUtils$CopyListener;)Z
    .locals 1
    .param p0, "in"    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "out"    # Ljava/io/OutputStream;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "listener"    # Lcom/vk/core/util/CopyUtils$CopyListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 38
    if-eqz p0, :cond_2

    .line 39
    if-eqz p1, :cond_1

    .line 40
    invoke-static {p0, p1, p2}, Lcom/vk/core/util/CopyUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/vk/core/util/CopyUtils$CopyListener;)Z

    move-result v0

    .line 51
    :cond_0
    :goto_0
    return v0

    .line 42
    :cond_1
    if-eqz p2, :cond_0

    .line 43
    invoke-interface {p2}, Lcom/vk/core/util/CopyUtils$CopyListener;->onError()V

    goto :goto_0

    .line 48
    :cond_2
    if-eqz p2, :cond_0

    .line 49
    invoke-interface {p2}, Lcom/vk/core/util/CopyUtils$CopyListener;->onError()V

    goto :goto_0
.end method
