.class final Lcom/vk/imageloader/ImageNetworkFailHandler$1;
.super Ljava/lang/Object;
.source "ImageNetworkFailHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/imageloader/ImageNetworkFailHandler;->onNetworkConnected()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 29
    invoke-static {}, Lcom/vk/imageloader/ImageNetworkFailHandler;->access$000()V

    .line 30
    return-void
.end method
