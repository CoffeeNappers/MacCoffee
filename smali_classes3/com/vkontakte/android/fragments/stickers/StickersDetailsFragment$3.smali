.class Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$3;
.super Landroid/content/BroadcastReceiver;
.source "StickersDetailsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, -0x1

    .line 105
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    :cond_0
    move v1, v2

    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 119
    :cond_1
    :goto_1
    return-void

    .line 105
    :sswitch_0
    const-string/jumbo v3, "com.vkontakte.android.STICKERS_UPDATED"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v3, "com.vkontakte.android.STICKERS_DOWNLOAD_PROGRESS"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    .line 107
    :pswitch_0
    const-string/jumbo v1, "item"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 108
    .local v0, "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/data/orm/StickerStockItem;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 109
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    iput-object v0, v1, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 110
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->bindData(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    goto :goto_1

    .line 114
    .end local v0    # "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :pswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v1, v1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    const-string/jumbo v3, "id"

    invoke-virtual {p2, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 115
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->bindData(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    goto :goto_1

    .line 105
    nop

    :sswitch_data_0
    .sparse-switch
        0x5ef0541a -> :sswitch_1
        0x6acb8031 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
