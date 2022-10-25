.class Lcom/vkontakte/android/stickers/StickersView$1;
.super Landroid/content/BroadcastReceiver;
.source "StickersView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/StickersView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/StickersView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/StickersView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/StickersView;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickersView$1;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private reload(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 113
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView$1;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/StickersView;->access$100(Lcom/vkontakte/android/stickers/StickersView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/stickers/StickersViewPage;

    .line 114
    .local v0, "page":Lcom/vkontakte/android/stickers/StickersViewPage;
    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/StickersViewPage;->getId()I

    move-result v2

    iget v3, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    if-ne v2, v3, :cond_0

    .line 115
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/stickers/StickersViewPage;->reload(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    .line 119
    .end local v0    # "page":Lcom/vkontakte/android/stickers/StickersViewPage;
    :cond_1
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 81
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    const/4 v2, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 110
    :cond_1
    :goto_1
    return-void

    .line 81
    :sswitch_0
    const-string/jumbo v6, "com.vkontakte.android.STICKERS_RELOADED"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v2, v3

    goto :goto_0

    :sswitch_1
    const-string/jumbo v6, "com.vkontakte.android.STICKERS_DOWNLOAD_PROGRESS"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v2, v4

    goto :goto_0

    :sswitch_2
    const-string/jumbo v6, "com.vkontakte.android.STICKERS_UPDATED"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v6, "com.vkontakte.android.STICKERS_UPDATED_RECENTS"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v2, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v6, "com.vkontakte.android.STICKERS_NUM_NEW_ITEMS"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    .line 83
    :pswitch_0
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView$1;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/StickersView;->access$000(Lcom/vkontakte/android/stickers/StickersView;)V

    goto :goto_1

    .line 87
    :pswitch_1
    const-string/jumbo v2, "id"

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 89
    .local v0, "id":I
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView$1;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/StickersView;->access$100(Lcom/vkontakte/android/stickers/StickersView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/stickers/StickersViewPage;

    .line 90
    .local v1, "page":Lcom/vkontakte/android/stickers/StickersViewPage;
    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/StickersViewPage;->getId()I

    move-result v3

    if-ne v3, v0, :cond_2

    .line 91
    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/StickersViewPage;->reload()V

    goto :goto_1

    .line 98
    .end local v0    # "id":I
    .end local v1    # "page":Lcom/vkontakte/android/stickers/StickersViewPage;
    :pswitch_2
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView$1;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/StickersView;->access$000(Lcom/vkontakte/android/stickers/StickersView;)V

    goto :goto_1

    .line 102
    :pswitch_3
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView$1;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/StickersView;->access$100(Lcom/vkontakte/android/stickers/StickersView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/stickers/StickersViewPage;

    invoke-virtual {v2}, Lcom/vkontakte/android/stickers/StickersViewPage;->reload()V

    goto :goto_1

    .line 106
    :pswitch_4
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView$1;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {}, Lcom/vkontakte/android/stickers/StickersView;->access$200()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/stickers/Stickers;->getNewItems()I

    move-result v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/stickers/StickersView;->access$300(Lcom/vkontakte/android/stickers/StickersView;I)V

    goto/16 :goto_1

    .line 81
    nop

    :sswitch_data_0
    .sparse-switch
        -0x44767262 -> :sswitch_4
        0x42774a -> :sswitch_3
        0x5ef0541a -> :sswitch_1
        0x6acb8031 -> :sswitch_2
        0x7f7fdb22 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
