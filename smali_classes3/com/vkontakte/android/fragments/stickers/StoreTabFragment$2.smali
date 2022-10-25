.class Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;
.super Landroid/content/BroadcastReceiver;
.source "StoreTabFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v7, 0x0

    .line 63
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    const/4 v6, -0x1

    invoke-virtual {v8}, Ljava/lang/String;->hashCode()I

    move-result v9

    sparse-switch v9, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v6, :pswitch_data_0

    .line 103
    :cond_1
    :goto_1
    return-void

    .line 63
    :sswitch_0
    const-string/jumbo v9, "com.vkontakte.android.STICKERS_UPDATED"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    move v6, v7

    goto :goto_0

    :sswitch_1
    const-string/jumbo v9, "com.vkontakte.android.STICKERS_DOWNLOAD_PROGRESS"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v9, "com.vkontakte.android.STICKERS_RELOADED"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    const/4 v6, 0x2

    goto :goto_0

    .line 65
    :pswitch_0
    const-string/jumbo v6, "item"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 66
    .local v5, "updatedItem":Lcom/vkontakte/android/data/orm/StickerStockItem;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$100(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    move-result-object v6

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$100(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    move-result-object v6

    iget-object v6, v6, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->stickers:Ljava/util/List;

    if-eqz v6, :cond_1

    .line 67
    iget-object v6, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$100(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    move-result-object v6

    iget-object v6, v6, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->stickers:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v2

    .line 68
    .local v2, "index":I
    if-ltz v2, :cond_1

    .line 69
    iget-object v6, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$100(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    move-result-object v6

    iget-object v6, v6, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->stickers:Ljava/util/List;

    invoke-interface {v6, v2, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 70
    iget-object v6, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getView()Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 71
    iget-object v6, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView;

    .line 72
    .local v3, "list":Landroid/support/v7/widget/RecyclerView;
    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 73
    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    goto :goto_1

    .line 81
    .end local v2    # "index":I
    .end local v3    # "list":Landroid/support/v7/widget/RecyclerView;
    .end local v5    # "updatedItem":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :pswitch_1
    const-string/jumbo v6, "id"

    invoke-virtual {p2, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 82
    .local v1, "id":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v6, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$100(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    move-result-object v6

    iget-object v6, v6, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->stickers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v0, v6, :cond_1

    .line 83
    iget-object v6, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$100(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    move-result-object v6

    iget-object v6, v6, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->stickers:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v6, v6, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    if-ne v1, v6, :cond_2

    .line 84
    iget-object v6, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getView()Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 85
    iget-object v6, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getView()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView;

    .line 86
    .restart local v3    # "list":Landroid/support/v7/widget/RecyclerView;
    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 87
    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    goto/16 :goto_1

    .line 82
    .end local v3    # "list":Landroid/support/v7/widget/RecyclerView;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 96
    .end local v0    # "i":I
    .end local v1    # "id":I
    :pswitch_2
    iget-object v6, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getTargetFragment()Landroid/app/Fragment;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/fragments/stickers/StickerStoreFragment;

    .line 97
    .local v4, "parent":Lcom/vkontakte/android/fragments/stickers/StickerStoreFragment;
    iget-boolean v6, v4, Lcom/vkontakte/android/fragments/stickers/StickerStoreFragment;->loaded:Z

    if-eqz v6, :cond_1

    .line 98
    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/stickers/StickerStoreFragment;->loadData()V

    goto/16 :goto_1

    .line 63
    nop

    :sswitch_data_0
    .sparse-switch
        0x5ef0541a -> :sswitch_1
        0x6acb8031 -> :sswitch_0
        0x7f7fdb22 -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
