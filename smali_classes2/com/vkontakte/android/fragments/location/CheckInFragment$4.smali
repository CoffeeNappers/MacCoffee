.class Lcom/vkontakte/android/fragments/location/CheckInFragment$4;
.super Lcom/vkontakte/android/background/AsyncTask;
.source "CheckInFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/location/CheckInFragment;->initMap(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/background/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/location/Location;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/location/CheckInFragment;

    .prologue
    .line 384
    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/background/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/location/Location;
    .locals 1
    .param p1, "args"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 387
    invoke-static {}, Lcom/vk/attachpicker/util/LocationUtils;->getLastKnownLocation()Landroid/location/Location;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 384
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;->doInBackground([Ljava/lang/Void;)Landroid/location/Location;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$onPostExecute$0()V
    .locals 1

    .prologue
    .line 400
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->access$500(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V

    return-void
.end method

.method protected onPostExecute(Landroid/location/Location;)V
    .locals 8
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 392
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 393
    .local v0, "a":Landroid/app/Activity;
    if-eqz v0, :cond_0

    if-nez p1, :cond_1

    .line 394
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->access$600(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V

    .line 418
    :goto_0
    return-void

    .line 398
    :cond_1
    new-instance v1, Lcom/vk/imageloader/view/VKImageView;

    invoke-direct {v1, v0}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 399
    .local v1, "imageMapView":Lcom/vk/imageloader/view/VKImageView;
    new-instance v4, Lcom/vk/attachpicker/widget/MapPlaceholderDrawable;

    invoke-direct {v4}, Lcom/vk/attachpicker/widget/MapPlaceholderDrawable;-><init>()V

    invoke-virtual {v1, v4}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)V

    .line 400
    invoke-static {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$4$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/location/CheckInFragment$4;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/vk/attachpicker/util/Utils;->runOnPreDraw(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 402
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v4}, Lcom/vk/imageloader/view/VKImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 403
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapContainer:Landroid/view/ViewGroup;

    const/4 v5, -0x1

    sget v6, Lcom/vkontakte/android/fragments/location/CheckInFragment;->MAP_HEIGHT:I

    invoke-virtual {v4, v1, v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 405
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 406
    .local v2, "locationString":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "https://maps.googleapis.com/maps/api/staticmap?center="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 407
    .local v3, "urlBuilder":Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 408
    const-string/jumbo v4, "&zoom=16&scale=2&size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    const/16 v4, 0x280

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget v5, Lcom/vkontakte/android/fragments/location/CheckInFragment;->MAP_HEIGHT:I

    mul-int/lit16 v5, v5, 0x280

    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v6

    div-int/2addr v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 410
    const-string/jumbo v4, "&markers=color:blue%7C"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 415
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iput-object p1, v4, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    .line 416
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->loadData()V

    .line 417
    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->loadPlace()V

    goto/16 :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 384
    check-cast p1, Landroid/location/Location;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;->onPostExecute(Landroid/location/Location;)V

    return-void
.end method
