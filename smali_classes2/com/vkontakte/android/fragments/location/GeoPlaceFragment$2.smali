.class Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "GeoPlaceFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->doLoadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/places/PlacesGetInfo$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;->this$0:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/places/PlacesGetInfo$Result;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/places/PlacesGetInfo$Result;

    .prologue
    .line 241
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;->this$0:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->access$002(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 242
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;->this$0:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/places/PlacesGetInfo$Result;->place:Lcom/vkontakte/android/GeoPlace;

    iput-object v1, v0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPlace:Lcom/vkontakte/android/GeoPlace;

    .line 243
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;->this$0:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/places/PlacesGetInfo$Result;->userPhotos:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mUserPhotos:Ljava/util/List;

    .line 244
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;->this$0:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/places/PlacesGetInfo$Result;->groupStatus:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mStatusText:Ljava/lang/String;

    .line 245
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;->this$0:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/places/PlacesGetInfo$Result;->groupPhoto:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->mPhotoURL:Ljava/lang/String;

    .line 247
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;->this$0:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->invalidate()V

    .line 248
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;->this$0:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->dataLoaded()V

    .line 249
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;->this$0:Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;->access$100(Lcom/vkontakte/android/fragments/location/GeoPlaceFragment;)V

    .line 251
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 238
    check-cast p1, Lcom/vkontakte/android/api/places/PlacesGetInfo$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/location/GeoPlaceFragment$2;->success(Lcom/vkontakte/android/api/places/PlacesGetInfo$Result;)V

    return-void
.end method
