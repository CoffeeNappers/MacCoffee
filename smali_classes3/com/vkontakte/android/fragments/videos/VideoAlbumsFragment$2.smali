.class Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "VideoAlbumsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/api/VideoAlbum;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

.field final synthetic val$count:I

.field final synthetic val$offset:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;Landroid/app/Fragment;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    iput p3, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$2;->val$offset:I

    iput p4, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$2;->val$count:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/VideoAlbum;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 121
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/api/VideoAlbum;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$2;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    iget v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$2;->val$offset:I

    iget v2, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$2;->val$count:I

    add-int/2addr v0, v2

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v2

    if-ge v0, v2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, p1, v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->access$300(Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;Ljava/util/List;Z)V

    .line 122
    return-void

    .line 121
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 118
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$2;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
