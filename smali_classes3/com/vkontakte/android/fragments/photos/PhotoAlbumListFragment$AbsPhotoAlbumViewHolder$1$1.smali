.class Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1$1;
.super Ljava/lang/Object;
.source "PhotoAlbumListFragment.java"

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;)V
    .locals 0
    .param p1, "this$2"    # Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;

    .prologue
    .line 465
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1$1;->this$2:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 468
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 479
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 470
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1$1;->this$2:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;

    iget-object v1, v0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1$1;->this$2:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->access$2500(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-static {v1, v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$2600(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;Lcom/vkontakte/android/api/PhotoAlbum;)V

    goto :goto_0

    .line 473
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1$1;->this$2:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;

    iget-object v1, v0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1$1;->this$2:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->access$2700(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->deleteAlbum(Lcom/vkontakte/android/api/PhotoAlbum;)V

    goto :goto_0

    .line 476
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1$1;->this$2:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;

    iget-object v1, v0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1$1;->this$2:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->access$2800(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-static {v1, v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$2900(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;Lcom/vkontakte/android/api/PhotoAlbum;)V

    goto :goto_0

    .line 468
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
