.class Lcom/vkontakte/android/LinkRedirActivity$4;
.super Ljava/lang/Object;
.source "LinkRedirActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/LinkRedirActivity;->onCreate(Landroid/os/Bundle;)V
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
        "Lcom/vkontakte/android/api/photos/PhotosGetAlbums$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/LinkRedirActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/LinkRedirActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/LinkRedirActivity;

    .prologue
    .line 756
    iput-object p1, p0, Lcom/vkontakte/android/LinkRedirActivity$4;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 771
    iget-object v0, p0, Lcom/vkontakte/android/LinkRedirActivity$4;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 772
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/photos/PhotosGetAlbums$Result;)V
    .locals 4
    .param p1, "r"    # Lcom/vkontakte/android/api/photos/PhotosGetAlbums$Result;

    .prologue
    .line 759
    iget-object v1, p1, Lcom/vkontakte/android/api/photos/PhotosGetAlbums$Result;->albums:Ljava/util/ArrayList;

    iget-object v2, p1, Lcom/vkontakte/android/api/photos/PhotosGetAlbums$Result;->system:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 760
    iget-object v1, p1, Lcom/vkontakte/android/api/photos/PhotosGetAlbums$Result;->albums:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/PhotoAlbum;

    .line 761
    .local v0, "a":Lcom/vkontakte/android/api/PhotoAlbum;
    iget v2, v0, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    const/16 v3, -0x2328

    if-ne v2, v3, :cond_0

    .line 762
    new-instance v2, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;

    invoke-direct {v2, v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;-><init>(Lcom/vkontakte/android/api/PhotoAlbum;)V

    iget-object v3, p0, Lcom/vkontakte/android/LinkRedirActivity$4;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 765
    .end local v0    # "a":Lcom/vkontakte/android/api/PhotoAlbum;
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$4;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/LinkRedirActivity;->setResult(I)V

    .line 766
    iget-object v1, p0, Lcom/vkontakte/android/LinkRedirActivity$4;->this$0:Lcom/vkontakte/android/LinkRedirActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/LinkRedirActivity;->finish()V

    .line 767
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 756
    check-cast p1, Lcom/vkontakte/android/api/photos/PhotosGetAlbums$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/LinkRedirActivity$4;->success(Lcom/vkontakte/android/api/photos/PhotosGetAlbums$Result;)V

    return-void
.end method
