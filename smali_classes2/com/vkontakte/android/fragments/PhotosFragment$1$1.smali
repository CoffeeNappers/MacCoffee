.class Lcom/vkontakte/android/fragments/PhotosFragment$1$1;
.super Ljava/lang/Object;
.source "PhotosFragment.java"

# interfaces
.implements Lcom/vkontakte/android/data/Friends$GetUsersCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PhotosFragment$1;->success(Lcom/vkontakte/android/data/VKList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PhotosFragment$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/PhotosFragment$1;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 140
    new-instance v1, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-direct {v1}, Lcom/vkontakte/android/api/PhotoAlbum;-><init>()V

    .line 141
    .local v1, "userPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    iget-object v3, v2, Lcom/vkontakte/android/fragments/PhotosFragment$1;->this$0:Lcom/vkontakte/android/fragments/PhotosFragment;

    const v4, 0x7f080741

    new-array v5, v6, [Ljava/lang/Object;

    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    aput-object v2, v5, v7

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    .line 142
    const/16 v2, -0x2328

    iput v2, v1, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    .line 143
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/PhotosFragment$1;->this$0:Lcom/vkontakte/android/fragments/PhotosFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PhotosFragment;->access$000(Lcom/vkontakte/android/fragments/PhotosFragment;)I

    move-result v2

    iput v2, v1, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    .line 144
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 145
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "album"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 146
    const-string/jumbo v2, "no_album_header"

    invoke-virtual {v0, v2, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 147
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/PhotosFragment$1;->this$0:Lcom/vkontakte/android/fragments/PhotosFragment;

    new-instance v3, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {v3}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;-><init>()V

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/PhotosFragment;->access$102(Lcom/vkontakte/android/fragments/PhotosFragment;Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .line 148
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/PhotosFragment$1;->this$0:Lcom/vkontakte/android/fragments/PhotosFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PhotosFragment;->access$100(Lcom/vkontakte/android/fragments/PhotosFragment;)Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 149
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/PhotosFragment$1;->val$tabs:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/PhotosFragment$1;->this$0:Lcom/vkontakte/android/fragments/PhotosFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PhotosFragment;->access$100(Lcom/vkontakte/android/fragments/PhotosFragment;)Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    iget-object v3, v2, Lcom/vkontakte/android/fragments/PhotosFragment$1;->val$titles:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    iget-object v4, v2, Lcom/vkontakte/android/fragments/PhotosFragment$1;->this$0:Lcom/vkontakte/android/fragments/PhotosFragment;

    const v5, 0x7f0804b2

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    aput-object v2, v6, v7

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/PhotosFragment$1;->this$0:Lcom/vkontakte/android/fragments/PhotosFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/PhotosFragment$1;->val$tabs:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PhotosFragment$1$1;->this$1:Lcom/vkontakte/android/fragments/PhotosFragment$1;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/PhotosFragment$1;->val$titles:Ljava/util/ArrayList;

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/fragments/PhotosFragment;->setTabs(Ljava/util/List;Ljava/util/List;)V

    .line 152
    return-void
.end method
