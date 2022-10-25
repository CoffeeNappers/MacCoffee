.class Lcom/vkontakte/android/fragments/location/CheckInFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "CheckInFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/location/CheckInFragment;->doLoadData(II)V
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
        "Lcom/vkontakte/android/GeoPlace;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/location/CheckInFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 252
    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 272
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 273
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->access$402(Lcom/vkontakte/android/fragments/location/CheckInFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 275
    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/GeoPlace;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 255
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/GeoPlace;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->access$102(Lcom/vkontakte/android/fragments/location/CheckInFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 256
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->access$200(Lcom/vkontakte/android/fragments/location/CheckInFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 257
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->access$300(Lcom/vkontakte/android/fragments/location/CheckInFragment;Ljava/util/List;Z)V

    .line 258
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mQuery:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 259
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mNearLocations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 260
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mNearLocations:Ljava/util/List;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mCurrentLocation:Lcom/vkontakte/android/GeoPlace;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mNearLocations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 267
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->updateList()V

    .line 268
    return-void

    .line 263
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchLocations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 264
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchLocations:Ljava/util/List;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mAddPlace:Lcom/vkontakte/android/GeoPlace;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 265
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchLocations:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 252
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
