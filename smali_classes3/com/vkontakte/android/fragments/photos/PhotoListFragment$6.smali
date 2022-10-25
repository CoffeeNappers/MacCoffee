.class Lcom/vkontakte/android/fragments/photos/PhotoListFragment$6;
.super Lcom/vkontakte/android/api/SimpleListCallback;
.source "PhotoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleListCallback",
        "<",
        "Lcom/vkontakte/android/Photo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 356
    .local p2, "fragment":Lme/grishka/appkit/fragments/BaseRecyclerFragment;, "Lme/grishka/appkit/fragments/BaseRecyclerFragment<Lcom/vkontakte/android/Photo;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$6;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleListCallback;-><init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 359
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/Photo;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleListCallback;->success(Lcom/vkontakte/android/data/VKList;)V

    .line 360
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$6;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    .line 361
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 356
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$6;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
