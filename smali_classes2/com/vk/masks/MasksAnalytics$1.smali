.class Lcom/vk/masks/MasksAnalytics$1;
.super Ljava/lang/Object;
.source "MasksAnalytics.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksAnalytics;->flush()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksAnalytics;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksAnalytics;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksAnalytics;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/vk/masks/MasksAnalytics$1;->this$0:Lcom/vk/masks/MasksAnalytics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 76
    iget-object v3, p0, Lcom/vk/masks/MasksAnalytics$1;->this$0:Lcom/vk/masks/MasksAnalytics;

    invoke-static {v3}, Lcom/vk/masks/MasksAnalytics;->access$000(Lcom/vk/masks/MasksAnalytics;)Ljava/util/LinkedList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    if-nez v3, :cond_0

    .line 93
    :goto_0
    return-void

    .line 80
    :cond_0
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 81
    .local v2, "statJson":Lorg/json/JSONArray;
    iget-object v3, p0, Lcom/vk/masks/MasksAnalytics$1;->this$0:Lcom/vk/masks/MasksAnalytics;

    invoke-static {v3}, Lcom/vk/masks/MasksAnalytics;->access$000(Lcom/vk/masks/MasksAnalytics;)Ljava/util/LinkedList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/masks/MasksAnalytics$Event;

    .line 83
    .local v0, "e":Lcom/vk/masks/MasksAnalytics$Event;
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 84
    .local v1, "jo":Lorg/json/JSONObject;
    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksAnalytics$Event;->toJson(Lorg/json/JSONObject;)V

    .line 85
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 86
    .end local v1    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v4

    goto :goto_1

    .line 91
    .end local v0    # "e":Lcom/vk/masks/MasksAnalytics$Event;
    :cond_1
    const-string/jumbo v3, "tmp"

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    new-instance v3, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v4, "stats.trackEvents"

    invoke-direct {v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "events"

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method
