.class Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$3;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "VideoAlbumsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->deleteAlbum(Lcom/vkontakte/android/api/VideoAlbum;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

.field final synthetic val$album:Lcom/vkontakte/android/api/VideoAlbum;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;Landroid/content/Context;Lcom/vkontakte/android/api/VideoAlbum;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$3;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$3;->val$album:Lcom/vkontakte/android/api/VideoAlbum;

    iput p4, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$3;->val$position:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$3;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->access$500(Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$3;->val$album:Lcom/vkontakte/android/api/VideoAlbum;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 186
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$3;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->access$600(Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$3;->val$position:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyItemRemoved(I)V

    .line 187
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$3;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->updateList()V

    .line 188
    return-void
.end method
