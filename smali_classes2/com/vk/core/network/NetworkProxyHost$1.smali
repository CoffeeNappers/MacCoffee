.class Lcom/vk/core/network/NetworkProxyHost$1;
.super Ljava/lang/Object;
.source "NetworkProxyHost.java"

# interfaces
.implements Lcom/vk/analytics/Analytics$OnValueEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/network/NetworkProxyHost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/network/NetworkProxyHost;


# direct methods
.method constructor <init>(Lcom/vk/core/network/NetworkProxyHost;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/core/network/NetworkProxyHost;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/vk/core/network/NetworkProxyHost$1;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataChange(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/core/network/NetworkProxyHost$1;->this$0:Lcom/vk/core/network/NetworkProxyHost;

    invoke-virtual {v0}, Lcom/vk/core/network/NetworkProxyHost;->findNewProxy()V

    .line 53
    return-void
.end method
