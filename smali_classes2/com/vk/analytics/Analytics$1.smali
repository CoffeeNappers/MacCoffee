.class Lcom/vk/analytics/Analytics$1;
.super Ljava/lang/Object;
.source "Analytics.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/analytics/Analytics;->init(Landroid/content/Context;Ljava/lang/Runnable;)Lcom/vk/analytics/Analytics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/analytics/Analytics;

.field final synthetic val$complete:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/vk/analytics/Analytics;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/analytics/Analytics;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/vk/analytics/Analytics$1;->this$0:Lcom/vk/analytics/Analytics;

    iput-object p2, p0, Lcom/vk/analytics/Analytics$1;->val$complete:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/vk/analytics/Analytics$1;->this$0:Lcom/vk/analytics/Analytics;

    invoke-static {v0}, Lcom/vk/analytics/Analytics;->access$000(Lcom/vk/analytics/Analytics;)Lcom/vk/analytics/Firebase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/analytics/Firebase;->isEnableEvents()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/vk/analytics/Analytics$1;->this$0:Lcom/vk/analytics/Analytics;

    invoke-static {v0}, Lcom/vk/analytics/Analytics;->access$100(Lcom/vk/analytics/Analytics;)V

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/vk/analytics/Analytics$1;->val$complete:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    .line 91
    iget-object v0, p0, Lcom/vk/analytics/Analytics$1;->val$complete:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 93
    :cond_1
    return-void
.end method
