.class public Lcom/vk/core/network/NetworkTrustManager$NetworkException;
.super Ljava/lang/Exception;
.source "NetworkTrustManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/network/NetworkTrustManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "NetworkException"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/network/NetworkTrustManager;


# direct methods
.method constructor <init>(Lcom/vk/core/network/NetworkTrustManager;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/core/network/NetworkTrustManager;
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/vk/core/network/NetworkTrustManager$NetworkException;->this$0:Lcom/vk/core/network/NetworkTrustManager;

    .line 25
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 26
    return-void
.end method
