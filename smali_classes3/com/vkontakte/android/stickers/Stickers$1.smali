.class Lcom/vkontakte/android/stickers/Stickers$1;
.super Ljava/lang/Thread;
.source "Stickers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/stickers/Stickers;->initCache()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/Stickers;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/Stickers;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/Stickers;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/vkontakte/android/stickers/Stickers$1;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 102
    iget-object v4, p0, Lcom/vkontakte/android/stickers/Stickers$1;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-static {v4}, Lcom/vkontakte/android/stickers/Stickers;->access$000(Lcom/vkontakte/android/stickers/Stickers;)Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5

    .line 103
    :try_start_0
    new-instance v0, Lcom/vkontakte/android/stickers/Stickers$Data;

    const/4 v4, 0x0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/stickers/Stickers$Data;-><init>(Lcom/vkontakte/android/stickers/Stickers$1;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    .local v0, "data":Lcom/vkontakte/android/stickers/Stickers$Data;
    :try_start_1
    iget-object v4, p0, Lcom/vkontakte/android/stickers/Stickers$1;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-static {v4}, Lcom/vkontakte/android/stickers/Stickers;->access$200(Lcom/vkontakte/android/stickers/Stickers;)Lcom/vkontakte/android/orm/EntityManager;

    move-result-object v4

    const-class v6, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v4, v6}, Lcom/vkontakte/android/orm/EntityManager;->createQuery(Ljava/lang/Class;)Lcom/vkontakte/android/orm/Query;

    move-result-object v4

    const-string/jumbo v6, "user_order"

    sget-object v7, Lcom/vkontakte/android/orm/Order;->ASC:Lcom/vkontakte/android/orm/Order;

    invoke-virtual {v4, v6, v7}, Lcom/vkontakte/android/orm/Query;->orderBy(Ljava/lang/String;Lcom/vkontakte/android/orm/Order;)Lcom/vkontakte/android/orm/Query;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/orm/Query;->load()Ljava/util/List;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v3

    .line 112
    .local v3, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    :goto_0
    if-eqz v3, :cond_0

    .line 113
    :try_start_2
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 114
    .local v2, "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/stickers/Stickers$Data;->add(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    goto :goto_1

    .line 122
    .end local v0    # "data":Lcom/vkontakte/android/stickers/Stickers$Data;
    .end local v2    # "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    .end local v3    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 108
    .restart local v0    # "data":Lcom/vkontakte/android/stickers/Stickers$Data;
    :catch_0
    move-exception v1

    .line 109
    .local v1, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    .restart local v3    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    goto :goto_0

    .line 118
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    :try_start_3
    iget-object v4, p0, Lcom/vkontakte/android/stickers/Stickers$1;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-static {v4}, Lcom/vkontakte/android/stickers/Stickers;->access$300(Lcom/vkontakte/android/stickers/Stickers;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string/jumbo v6, "base_url"

    const-string/jumbo v7, ""

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/stickers/Stickers$Data;->fillRecents(Ljava/lang/String;)V

    .line 119
    iget-object v4, p0, Lcom/vkontakte/android/stickers/Stickers$1;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-static {v4, v0}, Lcom/vkontakte/android/stickers/Stickers;->access$402(Lcom/vkontakte/android/stickers/Stickers;Lcom/vkontakte/android/stickers/Stickers$Data;)Lcom/vkontakte/android/stickers/Stickers$Data;

    .line 120
    iget-object v4, p0, Lcom/vkontakte/android/stickers/Stickers$1;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-static {}, Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;->createInstance()Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/vkontakte/android/stickers/Stickers;->access$502(Lcom/vkontakte/android/stickers/Stickers;Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;)Lcom/vkontakte/android/stickers/StickersAutoSuggestDictionary;

    .line 121
    iget-object v4, p0, Lcom/vkontakte/android/stickers/Stickers$1;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-virtual {v4}, Lcom/vkontakte/android/stickers/Stickers;->reload()V

    .line 122
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 123
    iget-object v4, p0, Lcom/vkontakte/android/stickers/Stickers$1;->this$0:Lcom/vkontakte/android/stickers/Stickers;

    invoke-static {v4}, Lcom/vkontakte/android/stickers/Stickers;->access$600(Lcom/vkontakte/android/stickers/Stickers;)V

    .line 124
    return-void
.end method
