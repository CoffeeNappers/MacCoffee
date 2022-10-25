.class Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback$1;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->loadMore()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/Photo;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;

    .prologue
    .line 4504
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 4515
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->access$8902(Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;Z)Z

    .line 4516
    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 3
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
    .line 4507
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/Photo;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->access$8700(Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;)I

    move-result v1

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->access$8702(Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;I)I

    .line 4508
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->access$8802(Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;I)I

    .line 4509
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->access$8902(Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;Z)Z

    .line 4510
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->viewer:Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/PhotoViewer;->appendPhotos(Ljava/util/List;)V

    .line 4511
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 4504
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
