.class Lcom/vk/core/network/RxFileDownloader$2$1;
.super Ljava/lang/Object;
.source "RxFileDownloader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/core/network/RxFileDownloader$2;->cancel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/network/RxFileDownloader$2;


# direct methods
.method constructor <init>(Lcom/vk/core/network/RxFileDownloader$2;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/core/network/RxFileDownloader$2;

    .prologue
    .line 228
    iput-object p1, p0, Lcom/vk/core/network/RxFileDownloader$2$1;->this$0:Lcom/vk/core/network/RxFileDownloader$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 232
    :try_start_0
    iget-object v0, p0, Lcom/vk/core/network/RxFileDownloader$2$1;->this$0:Lcom/vk/core/network/RxFileDownloader$2;

    iget-object v0, v0, Lcom/vk/core/network/RxFileDownloader$2;->val$response:Lokhttp3/Response;

    invoke-virtual {v0}, Lokhttp3/Response;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    :goto_0
    return-void

    .line 233
    :catch_0
    move-exception v0

    goto :goto_0
.end method
