.class Lcom/vkontakte/android/LongPollService$7;
.super Ljava/lang/Object;
.source "LongPollService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LongPollService;->processTyping(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LongPollService;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LongPollService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LongPollService;

    .prologue
    .line 882
    iput-object p1, p0, Lcom/vkontakte/android/LongPollService$7;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 886
    :try_start_0
    iget-object v9, p0, Lcom/vkontakte/android/LongPollService$7;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-static {v9}, Lcom/vkontakte/android/LongPollService;->access$400(Lcom/vkontakte/android/LongPollService;)Ljava/util/concurrent/Semaphore;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 890
    :goto_0
    iget-object v9, p0, Lcom/vkontakte/android/LongPollService$7;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-static {v9}, Lcom/vkontakte/android/LongPollService;->access$500(Lcom/vkontakte/android/LongPollService;)Ljava/util/HashMap;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 891
    .local v1, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    :cond_0
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 892
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 893
    .local v2, "k":J
    iget-object v9, p0, Lcom/vkontakte/android/LongPollService$7;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-static {v9}, Lcom/vkontakte/android/LongPollService;->access$500(Lcom/vkontakte/android/LongPollService;)Ljava/util/HashMap;

    move-result-object v9

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 894
    .local v6, "time":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long/2addr v10, v6

    const-wide/16 v12, 0x1b58

    cmp-long v9, v10, v12

    if-lez v9, :cond_0

    .line 895
    long-to-int v4, v2

    .line 896
    .local v4, "peerID":I
    const/16 v9, 0x20

    shr-long v10, v2, v9

    long-to-int v5, v10

    .line 897
    .local v5, "userID":I
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v9, "com.vkontakte.android.TYPING"

    invoke-direct {v0, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 898
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v9, "uid"

    invoke-virtual {v0, v9, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 899
    const-string/jumbo v9, "user"

    invoke-virtual {v0, v9, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 900
    const-string/jumbo v9, "stop"

    const/4 v10, 0x1

    invoke-virtual {v0, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 901
    iget-object v9, p0, Lcom/vkontakte/android/LongPollService$7;->this$0:Lcom/vkontakte/android/LongPollService;

    const-string/jumbo v10, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v9, v0, v10}, Lcom/vkontakte/android/LongPollService;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 902
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 887
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    .end local v2    # "k":J
    .end local v4    # "peerID":I
    .end local v5    # "userID":I
    .end local v6    # "time":J
    :catch_0
    move-exception v8

    .line 888
    .local v8, "x":Ljava/lang/Exception;
    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v8, v9}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 905
    .end local v8    # "x":Ljava/lang/Exception;
    .restart local v1    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Long;>;"
    :cond_1
    iget-object v9, p0, Lcom/vkontakte/android/LongPollService$7;->this$0:Lcom/vkontakte/android/LongPollService;

    invoke-static {v9}, Lcom/vkontakte/android/LongPollService;->access$400(Lcom/vkontakte/android/LongPollService;)Ljava/util/concurrent/Semaphore;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/Semaphore;->release()V

    .line 906
    return-void
.end method
