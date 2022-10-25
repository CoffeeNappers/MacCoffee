.class Lcom/vkontakte/android/fragments/location/CheckInFragment$6;
.super Lcom/vkontakte/android/background/AsyncTask;
.source "CheckInFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/location/CheckInFragment;->loadPlace()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/background/AsyncTask",
        "<",
        "Landroid/content/Context;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
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
    .line 491
    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$6;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/background/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 491
    check-cast p1, [Landroid/content/Context;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$6;->doInBackground([Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Landroid/content/Context;)Ljava/lang/String;
    .locals 11
    .param p1, "args"    # [Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 495
    new-instance v1, Landroid/location/Geocoder;

    aget-object v2, p1, v10

    invoke-direct {v1, v2}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    .line 496
    .local v1, "geocoder":Landroid/location/Geocoder;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$6;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    invoke-virtual {v2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$6;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    invoke-virtual {v4}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    const/4 v6, 0x1

    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object v7

    .line 497
    .local v7, "addresses":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/Address;

    .line 498
    .local v0, "address":Landroid/location/Address;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 499
    .local v9, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v0}, Landroid/location/Address;->getThoroughfare()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 500
    invoke-virtual {v0}, Landroid/location/Address;->getThoroughfare()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 502
    :cond_0
    invoke-virtual {v0}, Landroid/location/Address;->getSubThoroughfare()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 503
    invoke-virtual {v0}, Landroid/location/Address;->getSubThoroughfare()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 505
    :cond_1
    invoke-virtual {v0}, Landroid/location/Address;->getFeatureName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Landroid/location/Address;->getFeatureName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Landroid/location/Address;->getSubThoroughfare()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 506
    invoke-virtual {v0}, Landroid/location/Address;->getFeatureName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 508
    :cond_2
    const-string/jumbo v2, ", "

    invoke-static {v2, v9}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v8

    .line 509
    .local v8, "finalResult":Ljava/lang/String;
    if-eqz v8, :cond_3

    const-string/jumbo v2, "null"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 510
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$6;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    const v3, 0x7f08033d

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 512
    :cond_4
    return-object v8
.end method

.method protected onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 524
    invoke-super {p0, p1}, Lcom/vkontakte/android/background/AsyncTask;->onError(Ljava/lang/Throwable;)V

    .line 525
    const-string/jumbo v0, "vk"

    invoke-static {v0, p1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 526
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 491
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$6;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 517
    invoke-super {p0, p1}, Lcom/vkontakte/android/background/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 518
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$6;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iput-object p1, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mAddress:Ljava/lang/String;

    .line 519
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$6;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->updateList()V

    .line 520
    return-void
.end method
