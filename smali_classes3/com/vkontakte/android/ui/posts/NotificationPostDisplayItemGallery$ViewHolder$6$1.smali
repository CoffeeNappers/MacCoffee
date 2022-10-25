.class Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6$1;
.super Ljava/lang/Object;
.source "NotificationPostDisplayItemGallery.java"

# interfaces
.implements Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;->onResolved(Ljava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;

    .prologue
    .line 481
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6$1;->this$1:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoaded(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V
    .locals 2
    .param p1, "mediaStoreEntry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 484
    if-eqz p1, :cond_0

    .line 485
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6$1;->this$1:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->access$000(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/adapters/PhotoSmallPickerAdapter;->addItem(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    .line 486
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6$1;->this$1:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->access$200(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)Lcom/vk/attachpicker/SelectionContext;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/SelectionContext;->addSelection(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)I

    .line 487
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6$1;->this$1:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->access$300(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    .line 489
    :cond_0
    return-void
.end method
