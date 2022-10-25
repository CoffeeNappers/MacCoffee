.class Lcom/vk/masks/MasksController$3;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksController;->checkMaskForUpdates(Lcom/vk/masks/model/Mask;)Lio/reactivex/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Function",
        "<",
        "Landroid/location/Location;",
        "Lio/reactivex/ObservableSource",
        "<+",
        "Lcom/vkontakte/android/api/masks/MasksResponse;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksController;

.field final synthetic val$mask:Lcom/vk/masks/model/Mask;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController;Lcom/vk/masks/model/Mask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/vk/masks/MasksController$3;->this$0:Lcom/vk/masks/MasksController;

    iput-object p2, p0, Lcom/vk/masks/MasksController$3;->val$mask:Lcom/vk/masks/model/Mask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Landroid/location/Location;)Lio/reactivex/ObservableSource;
    .locals 6
    .param p1, "location"    # Landroid/location/Location;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/location/Location;",
            ")",
            "Lio/reactivex/ObservableSource",
            "<+",
            "Lcom/vkontakte/android/api/masks/MasksResponse;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 102
    sget-object v0, Lcom/vk/attachpicker/util/LocationUtils;->NO_LOCATION:Landroid/location/Location;

    if-ne p1, v0, :cond_0

    .line 103
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksGetById;

    iget-object v1, p0, Lcom/vk/masks/MasksController$3;->val$mask:Lcom/vk/masks/model/Mask;

    invoke-virtual {v1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/masks/MasksGetById;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/vkontakte/android/api/masks/MasksGetById;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    .line 105
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksGetById;

    iget-object v1, p0, Lcom/vk/masks/MasksController$3;->val$mask:Lcom/vk/masks/model/Mask;

    invoke-virtual {v1}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/masks/MasksGetById;-><init>(Ljava/lang/String;DD)V

    invoke-virtual {v0}, Lcom/vkontakte/android/api/masks/MasksGetById;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 99
    check-cast p1, Landroid/location/Location;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$3;->apply(Landroid/location/Location;)Lio/reactivex/ObservableSource;

    move-result-object v0

    return-object v0
.end method
