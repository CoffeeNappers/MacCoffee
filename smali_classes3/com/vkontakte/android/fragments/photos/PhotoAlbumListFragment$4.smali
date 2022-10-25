.class Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$4;
.super Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
.source "PhotoAlbumListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

.field final synthetic val$glm:Landroid/support/v7/widget/GridLayoutManager;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;Landroid/support/v7/widget/GridLayoutManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    .prologue
    .line 233
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$4;->val$glm:Landroid/support/v7/widget/GridLayoutManager;

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$800(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$4;->val$glm:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager;->getSpanCount()I

    move-result v0

    .line 242
    :goto_0
    return v0

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$900(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/PhotoAlbum;

    iget v0, v0, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_1

    .line 240
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$4;->val$glm:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager;->getSpanCount()I

    move-result v0

    goto :goto_0

    .line 242
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method
