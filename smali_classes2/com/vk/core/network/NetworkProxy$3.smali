.class Lcom/vk/core/network/NetworkProxy$3;
.super Ljava/lang/Object;
.source "NetworkProxy.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/core/network/NetworkProxy;->notifyOnProxyHostConnected()V
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
    .line 413
    iput-object p1, p0, Lcom/vk/core/network/NetworkProxy$3;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 416
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy$3;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-static {v0}, Lcom/vk/core/network/NetworkProxy;->access$800(Lcom/vk/core/network/NetworkProxy;)Lcom/vk/core/network/NetworkProxy$ProxyCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 417
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy$3;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-static {v0}, Lcom/vk/core/network/NetworkProxy;->access$800(Lcom/vk/core/network/NetworkProxy;)Lcom/vk/core/network/NetworkProxy$ProxyCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/core/network/NetworkProxy$ProxyCallback;->onProxyHostConnected()V

    .line 419
    :cond_0
    return-void
.end method
