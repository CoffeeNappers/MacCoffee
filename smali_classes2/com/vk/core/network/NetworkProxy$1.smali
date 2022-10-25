.class Lcom/vk/core/network/NetworkProxy$1;
.super Ljava/lang/Object;
.source "NetworkProxy.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/core/network/NetworkProxy;->verify()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/network/NetworkProxy;


# direct methods
.method constructor <init>(Lcom/vk/core/network/NetworkProxy;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/core/network/NetworkProxy;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 150
    const/4 v0, 0x0

    .line 151
    .local v0, "status":Z
    :try_start_0
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    iget-object v2, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    iget-object v3, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-static {v3}, Lcom/vk/core/network/NetworkProxy;->access$100(Lcom/vk/core/network/NetworkProxy;)Z

    move-result v3

    invoke-static {v2, v3}, Lcom/vk/core/network/NetworkProxy;->access$200(Lcom/vk/core/network/NetworkProxy;Z)Lokhttp3/OkHttpClient;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/core/network/NetworkProxy;->access$002(Lcom/vk/core/network/NetworkProxy;Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;

    .line 152
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-static {v1}, Lcom/vk/core/network/NetworkProxy;->access$100(Lcom/vk/core/network/NetworkProxy;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-static {v1}, Lcom/vk/core/network/NetworkProxy;->access$300(Lcom/vk/core/network/NetworkProxy;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-static {v1}, Lcom/vk/core/network/NetworkProxy;->access$400(Lcom/vk/core/network/NetworkProxy;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 153
    :cond_0
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/vk/core/network/NetworkProxy;->access$502(Lcom/vk/core/network/NetworkProxy;Z)Z

    .line 154
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    iget-object v2, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/vk/core/network/NetworkProxy;->access$200(Lcom/vk/core/network/NetworkProxy;Z)Lokhttp3/OkHttpClient;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/core/network/NetworkProxy;->access$002(Lcom/vk/core/network/NetworkProxy;Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;

    .line 155
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-static {v1}, Lcom/vk/core/network/NetworkProxy;->access$600(Lcom/vk/core/network/NetworkProxy;)Z

    move-result v0

    .line 158
    :cond_1
    if-nez v0, :cond_2

    .line 159
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    const-string/jumbo v2, "check: no proxy!"

    invoke-virtual {v1, v2}, Lcom/vk/core/network/NetworkProxy;->log(Ljava/lang/String;)V

    .line 160
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vk/core/network/NetworkProxy;->access$002(Lcom/vk/core/network/NetworkProxy;Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;

    .line 161
    iget-object v1, p0, Lcom/vk/core/network/NetworkProxy$1;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-static {v1}, Lcom/vk/core/network/NetworkProxy;->access$700(Lcom/vk/core/network/NetworkProxy;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    :cond_2
    :goto_0
    return-void

    .line 163
    :catch_0
    move-exception v1

    goto :goto_0
.end method
