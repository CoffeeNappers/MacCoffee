.class public Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;
.super Ljava/lang/Object;
.source "DownloadTaskBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/DownloadTaskBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Error"
.end annotation


# instance fields
.field final errorResId:I

.field retryIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 493
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 494
    const v0, 0x7f0803bc

    iput v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;->errorResId:I

    .line 495
    return-void
.end method

.method public constructor <init>(Landroid/content/Intent;)V
    .locals 0
    .param p1, "retryIntent"    # Landroid/content/Intent;

    .prologue
    .line 507
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;-><init>()V

    .line 509
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;->retryIntent:Landroid/content/Intent;

    .line 510
    return-void
.end method

.method public constructor <init>(Landroid/content/Intent;Ljava/lang/Exception;)V
    .locals 0
    .param p1, "retryIntent"    # Landroid/content/Intent;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 513
    invoke-direct {p0, p2}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;-><init>(Ljava/lang/Exception;)V

    .line 515
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;->retryIntent:Landroid/content/Intent;

    .line 516
    return-void
.end method

.method public constructor <init>(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 497
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 498
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 499
    .local v0, "message":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "ENOSPC"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 500
    const v1, 0x7f0803bd

    iput v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;->errorResId:I

    .line 504
    :goto_0
    return-void

    .line 502
    :cond_0
    const v1, 0x7f0803bc

    iput v1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$Error;->errorResId:I

    goto :goto_0
.end method
