.class Lcom/vk/attachpicker/events/NotificationCenter$1;
.super Ljava/lang/Object;
.source "NotificationCenter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(IILjava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/events/NotificationCenter;

.field final synthetic val$arg:Ljava/lang/Object;

.field final synthetic val$eventId:I

.field final synthetic val$eventType:I

.field final synthetic val$listenerContainer:Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/events/NotificationCenter;Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;IILjava/lang/Object;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/events/NotificationCenter;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/vk/attachpicker/events/NotificationCenter$1;->this$0:Lcom/vk/attachpicker/events/NotificationCenter;

    iput-object p2, p0, Lcom/vk/attachpicker/events/NotificationCenter$1;->val$listenerContainer:Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;

    iput p3, p0, Lcom/vk/attachpicker/events/NotificationCenter$1;->val$eventType:I

    iput p4, p0, Lcom/vk/attachpicker/events/NotificationCenter$1;->val$eventId:I

    iput-object p5, p0, Lcom/vk/attachpicker/events/NotificationCenter$1;->val$arg:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/attachpicker/events/NotificationCenter$1;->this$0:Lcom/vk/attachpicker/events/NotificationCenter;

    invoke-static {v0}, Lcom/vk/attachpicker/events/NotificationCenter;->access$100(Lcom/vk/attachpicker/events/NotificationCenter;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 132
    :try_start_0
    iget-object v0, p0, Lcom/vk/attachpicker/events/NotificationCenter$1;->val$listenerContainer:Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;

    invoke-virtual {v0}, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;->isDeleted()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 134
    :try_start_1
    iget-object v0, p0, Lcom/vk/attachpicker/events/NotificationCenter$1;->val$listenerContainer:Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;

    iget-object v0, v0, Lcom/vk/attachpicker/events/NotificationCenter$OnNotificationListenerContainer;->listener:Lcom/vk/attachpicker/events/NotificationListener;

    iget v2, p0, Lcom/vk/attachpicker/events/NotificationCenter$1;->val$eventType:I

    iget v3, p0, Lcom/vk/attachpicker/events/NotificationCenter$1;->val$eventId:I

    iget-object v4, p0, Lcom/vk/attachpicker/events/NotificationCenter$1;->val$arg:Ljava/lang/Object;

    invoke-interface {v0, v2, v3, v4}, Lcom/vk/attachpicker/events/NotificationListener;->onNotification(IILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 139
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v1

    .line 140
    return-void

    .line 139
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 135
    :catch_0
    move-exception v0

    goto :goto_0
.end method
