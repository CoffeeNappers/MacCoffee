.class Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$8;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PhotoAlbumListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->doDelete(Lcom/vkontakte/android/api/PhotoAlbum;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

.field final synthetic val$a:Lcom/vkontakte/android/api/PhotoAlbum;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;Landroid/content/Context;Lcom/vkontakte/android/api/PhotoAlbum;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 351
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$8;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$8;->val$a:Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 354
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$8;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$1500(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$8;->val$a:Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 355
    .local v0, "idx":I
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$8;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$1600(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 356
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$8;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$200(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$PhotoAlbumsAdapter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$PhotoAlbumsAdapter;->notifyItemRemoved(I)V

    .line 357
    return-void
.end method
