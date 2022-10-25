.class Lcom/vk/imageloader/OkHttpNetworkFetcher$1$1;
.super Ljava/lang/Object;
.source "OkHttpNetworkFetcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/imageloader/OkHttpNetworkFetcher$1;->onCancellationRequested()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/imageloader/OkHttpNetworkFetcher$1;


# direct methods
.method constructor <init>(Lcom/vk/imageloader/OkHttpNetworkFetcher$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/imageloader/OkHttpNetworkFetcher$1;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$1$1;->this$1:Lcom/vk/imageloader/OkHttpNetworkFetcher$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/vk/imageloader/OkHttpNetworkFetcher$1$1;->this$1:Lcom/vk/imageloader/OkHttpNetworkFetcher$1;

    iget-object v0, v0, Lcom/vk/imageloader/OkHttpNetworkFetcher$1;->val$call:Lokhttp3/Call;

    invoke-interface {v0}, Lokhttp3/Call;->cancel()V

    .line 108
    return-void
.end method
