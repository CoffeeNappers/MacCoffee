.class Lcom/vk/core/logging/Logcat$1;
.super Ljava/lang/Object;
.source "Logcat.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/logging/Logcat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/logging/Logcat;


# direct methods
.method constructor <init>(Lcom/vk/core/logging/Logcat;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/core/logging/Logcat;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/vk/core/logging/Logcat$1;->this$0:Lcom/vk/core/logging/Logcat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vk/core/logging/Logcat$1;->this$0:Lcom/vk/core/logging/Logcat;

    invoke-static {v0}, Lcom/vk/core/logging/Logcat;->access$000(Lcom/vk/core/logging/Logcat;)V

    .line 40
    return-void
.end method
