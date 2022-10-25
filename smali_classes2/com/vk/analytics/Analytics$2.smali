.class Lcom/vk/analytics/Analytics$2;
.super Ljava/lang/Object;
.source "Analytics.java"

# interfaces
.implements Lcom/vk/analytics/Analytics$OnValueEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/analytics/Analytics;->setUserData(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/analytics/Analytics;

.field final synthetic val$db:Lcom/vk/analytics/Firebase;


# direct methods
.method constructor <init>(Lcom/vk/analytics/Analytics;Lcom/vk/analytics/Firebase;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/analytics/Analytics;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/vk/analytics/Analytics$2;->this$0:Lcom/vk/analytics/Analytics;

    iput-object p2, p0, Lcom/vk/analytics/Analytics$2;->val$db:Lcom/vk/analytics/Firebase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataChange(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 124
    iget-object v0, p0, Lcom/vk/analytics/Analytics$2;->this$0:Lcom/vk/analytics/Analytics;

    invoke-static {v0}, Lcom/vk/analytics/Analytics;->access$200(Lcom/vk/analytics/Analytics;)V

    .line 125
    iget-object v0, p0, Lcom/vk/analytics/Analytics$2;->val$db:Lcom/vk/analytics/Firebase;

    const-string/jumbo v1, "config_enable_events"

    invoke-virtual {v0, v1}, Lcom/vk/analytics/Firebase;->unsubscribe(Ljava/lang/String;)V

    .line 126
    return-void
.end method
