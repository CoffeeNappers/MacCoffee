.class Lcom/vkontakte/android/fragments/ProfileFragment$11;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->openProfilePhotos()V
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
        "Lcom/vkontakte/android/Photo;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1017
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$11;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 7
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
    .local p1, "photos":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/Photo;>;"
    const/4 v6, 0x0

    .line 1020
    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 1021
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$11;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f080450

    invoke-static {v2, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 1030
    :goto_0
    return-void

    .line 1025
    :cond_0
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$11;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v3

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v4

    invoke-direct {v0, v2, v3, v4}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;II)V

    .line 1026
    .local v0, "callback":Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;
    new-instance v1, Lcom/vkontakte/android/PhotoViewer;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$11;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2, p1, v6, v0}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/util/List;ILcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;)V

    .line 1027
    .local v1, "viewer":Lcom/vkontakte/android/PhotoViewer;
    iput-object v1, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->viewer:Lcom/vkontakte/android/PhotoViewer;

    .line 1028
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$11;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$11;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const v3, 0x7f080743

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$11;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameGen:Ljava/lang/String;

    aput-object v5, v4, v6

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/PhotoViewer;->setTitle(Ljava/lang/String;)V

    .line 1029
    invoke-virtual {v1}, Lcom/vkontakte/android/PhotoViewer;->show()V

    goto :goto_0

    .line 1028
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$11;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const v3, 0x7f080174

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1017
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$11;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
