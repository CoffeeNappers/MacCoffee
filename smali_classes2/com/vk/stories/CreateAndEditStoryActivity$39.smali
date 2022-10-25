.class Lcom/vk/stories/CreateAndEditStoryActivity$39;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->openMaskById(Ljava/lang/String;)V
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
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$maskId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 1299
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$39;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$39;->val$maskId:Ljava/lang/String;

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
    .line 1302
    sget-object v0, Lcom/vk/attachpicker/util/LocationUtils;->NO_LOCATION:Landroid/location/Location;

    if-ne p1, v0, :cond_0

    .line 1303
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksGetById;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$39;->val$maskId:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/masks/MasksGetById;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/vkontakte/android/api/masks/MasksGetById;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    .line 1305
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksGetById;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$39;->val$maskId:Ljava/lang/String;

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
    .line 1299
    check-cast p1, Landroid/location/Location;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$39;->apply(Landroid/location/Location;)Lio/reactivex/ObservableSource;

    move-result-object v0

    return-object v0
.end method
