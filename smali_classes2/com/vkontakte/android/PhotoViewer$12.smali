.class Lcom/vkontakte/android/PhotoViewer$12;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->loadPhotoInfo()V
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
        "Lcom/vkontakte/android/api/photos/PhotosGetInfo$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;

.field final synthetic val$p:Lcom/vkontakte/android/Photo;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer;Lcom/vkontakte/android/Photo;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 715
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$12;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iput-object p2, p0, Lcom/vkontakte/android/PhotoViewer$12;->val$p:Lcom/vkontakte/android/Photo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 732
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$12;->this$0:Lcom/vkontakte/android/PhotoViewer;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/PhotoViewer;->access$1802(Lcom/vkontakte/android/PhotoViewer;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 733
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/photos/PhotosGetInfo$Result;)V
    .locals 2
    .param p1, "r"    # Lcom/vkontakte/android/api/photos/PhotosGetInfo$Result;

    .prologue
    .line 718
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$12;->this$0:Lcom/vkontakte/android/PhotoViewer;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/PhotoViewer;->access$1802(Lcom/vkontakte/android/PhotoViewer;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 720
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$12;->val$p:Lcom/vkontakte/android/Photo;

    iget v1, p1, Lcom/vkontakte/android/api/photos/PhotosGetInfo$Result;->likes:I

    iput v1, v0, Lcom/vkontakte/android/Photo;->nLikes:I

    .line 721
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$12;->val$p:Lcom/vkontakte/android/Photo;

    iget v1, p1, Lcom/vkontakte/android/api/photos/PhotosGetInfo$Result;->comments:I

    iput v1, v0, Lcom/vkontakte/android/Photo;->nComments:I

    .line 722
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$12;->val$p:Lcom/vkontakte/android/Photo;

    iget v1, p1, Lcom/vkontakte/android/api/photos/PhotosGetInfo$Result;->reposts:I

    iput v1, v0, Lcom/vkontakte/android/Photo;->nReposts:I

    .line 723
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$12;->val$p:Lcom/vkontakte/android/Photo;

    iget v1, p1, Lcom/vkontakte/android/api/photos/PhotosGetInfo$Result;->tags:I

    iput v1, v0, Lcom/vkontakte/android/Photo;->nTags:I

    .line 724
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$12;->val$p:Lcom/vkontakte/android/Photo;

    iget-boolean v1, p1, Lcom/vkontakte/android/api/photos/PhotosGetInfo$Result;->liked:Z

    iput-boolean v1, v0, Lcom/vkontakte/android/Photo;->isLiked:Z

    .line 725
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$12;->val$p:Lcom/vkontakte/android/Photo;

    iget-boolean v1, p1, Lcom/vkontakte/android/api/photos/PhotosGetInfo$Result;->canComment:Z

    iput-boolean v1, v0, Lcom/vkontakte/android/Photo;->canComment:Z

    .line 726
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$12;->val$p:Lcom/vkontakte/android/Photo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vkontakte/android/Photo;->infoLoaded:Z

    .line 727
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$12;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$12;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget v1, v1, Lcom/vkontakte/android/PhotoViewer;->curPos:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/PhotoViewer;->onPositionChanged(I)V

    .line 728
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 715
    check-cast p1, Lcom/vkontakte/android/api/photos/PhotosGetInfo$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/PhotoViewer$12;->success(Lcom/vkontakte/android/api/photos/PhotosGetInfo$Result;)V

    return-void
.end method
