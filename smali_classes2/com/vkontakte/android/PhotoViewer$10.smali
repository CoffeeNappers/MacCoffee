.class Lcom/vkontakte/android/PhotoViewer$10;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->onPositionChanged(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;

.field final synthetic val$curPhoto:Lcom/vkontakte/android/Photo;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer;Lcom/vkontakte/android/Photo;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 608
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$10;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iput-object p2, p0, Lcom/vkontakte/android/PhotoViewer$10;->val$curPhoto:Lcom/vkontakte/android/Photo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const/4 v2, 0x1

    const/4 v11, 0x0

    .line 611
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$10;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iget-boolean v1, v1, Lcom/vkontakte/android/Photo;->loadingAddress:Z

    if-eqz v1, :cond_0

    .line 655
    :goto_0
    return-void

    .line 614
    :cond_0
    const-string/jumbo v9, ""

    .local v9, "title":Ljava/lang/String;
    const-string/jumbo v7, ""

    .line 615
    .local v7, "address":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$10;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iput-boolean v2, v1, Lcom/vkontakte/android/Photo;->loadingAddress:Z

    .line 617
    :try_start_0
    new-instance v1, Landroid/location/Geocoder;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$10;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v2}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$10;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iget-wide v2, v2, Lcom/vkontakte/android/Photo;->lat:D

    iget-object v4, p0, Lcom/vkontakte/android/PhotoViewer$10;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iget-wide v4, v4, Lcom/vkontakte/android/Photo;->lon:D

    const/4 v6, 0x1

    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object v8

    .line 618
    .local v8, "addrs":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 619
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/Address;

    .line 620
    .local v0, "addr":Landroid/location/Address;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 621
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/location/Address;->getAddressLine(I)Ljava/lang/String;

    move-result-object v7

    .line 622
    invoke-virtual {v0}, Landroid/location/Address;->getPostalCode()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 623
    invoke-virtual {v0}, Landroid/location/Address;->getPostalCode()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v9, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 624
    invoke-virtual {v0}, Landroid/location/Address;->getPostalCode()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v7, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ",,"

    const-string/jumbo v3, ","

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 628
    :cond_1
    invoke-virtual {v0}, Landroid/location/Address;->getCountryName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {v0}, Landroid/location/Address;->getCountryName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 629
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/location/Address;->getCountryName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 631
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$10;->val$curPhoto:Lcom/vkontakte/android/Photo;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/Photo;->geoAddress:Ljava/lang/String;

    .line 632
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$10;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v1}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/PhotoViewer$10$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/PhotoViewer$10$1;-><init>(Lcom/vkontakte/android/PhotoViewer$10;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 654
    .end local v0    # "addr":Landroid/location/Address;
    .end local v8    # "addrs":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$10;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iput-boolean v11, v1, Lcom/vkontakte/android/Photo;->loadingAddress:Z

    goto/16 :goto_0

    .line 642
    :catch_0
    move-exception v10

    .line 643
    .local v10, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    invoke-static {v1, v10}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 644
    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$10;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v1}, Lcom/vkontakte/android/PhotoViewer;->access$1500(Lcom/vkontakte/android/PhotoViewer;)Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/PhotoViewer$10$2;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/PhotoViewer$10$2;-><init>(Lcom/vkontakte/android/PhotoViewer$10;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1
.end method
