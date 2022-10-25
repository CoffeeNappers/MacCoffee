.class Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "EditAlbumFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->save()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/PhotoAlbum;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 168
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/PhotoAlbum;)V
    .locals 3
    .param p1, "result"    # Lcom/vkontakte/android/api/PhotoAlbum;

    .prologue
    .line 171
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 172
    .local v0, "r":Landroid/content/Intent;
    const-string/jumbo v1, "album"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 173
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 174
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$1;->this$0:Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 175
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 168
    check-cast p1, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$1;->success(Lcom/vkontakte/android/api/PhotoAlbum;)V

    return-void
.end method
