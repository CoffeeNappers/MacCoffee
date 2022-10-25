.class Lcom/vk/core/network/NetworkProxy$2;
.super Ljava/lang/Object;
.source "NetworkProxy.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/core/network/NetworkProxy;->findNewProxy()V
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
    .line 354
    iput-object p1, p0, Lcom/vk/core/network/NetworkProxy$2;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 357
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxy$2;->this$0:Lcom/vk/core/network/NetworkProxy;

    invoke-static {v0}, Lcom/vk/core/network/NetworkProxy;->access$600(Lcom/vk/core/network/NetworkProxy;)Z

    .line 358
    return-void
.end method
