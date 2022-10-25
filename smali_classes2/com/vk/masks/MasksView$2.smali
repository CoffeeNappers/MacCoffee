.class Lcom/vk/masks/MasksView$2;
.super Ljava/lang/Object;
.source "MasksView.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksView;->loadNext(ILcom/vk/lists/PaginateHelper;)Lio/reactivex/Observable;
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
.field final synthetic this$0:Lcom/vk/masks/MasksView;

.field final synthetic val$helper:Lcom/vk/lists/PaginateHelper;

.field final synthetic val$offset:I


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksView;Lcom/vk/lists/PaginateHelper;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksView;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/vk/masks/MasksView$2;->this$0:Lcom/vk/masks/MasksView;

    iput-object p2, p0, Lcom/vk/masks/MasksView$2;->val$helper:Lcom/vk/lists/PaginateHelper;

    iput p3, p0, Lcom/vk/masks/MasksView$2;->val$offset:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Landroid/location/Location;)Lio/reactivex/ObservableSource;
    .locals 8
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
    .line 113
    sget-object v0, Lcom/vk/attachpicker/util/LocationUtils;->NO_LOCATION:Landroid/location/Location;

    if-ne p1, v0, :cond_0

    .line 114
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksGet;

    iget-object v1, p0, Lcom/vk/masks/MasksView$2;->this$0:Lcom/vk/masks/MasksView;

    invoke-static {v1}, Lcom/vk/masks/MasksView;->access$100(Lcom/vk/masks/MasksView;)I

    move-result v1

    iget-object v2, p0, Lcom/vk/masks/MasksView$2;->val$helper:Lcom/vk/lists/PaginateHelper;

    invoke-virtual {v2}, Lcom/vk/lists/PaginateHelper;->getPageSize()I

    move-result v2

    iget v3, p0, Lcom/vk/masks/MasksView$2;->val$offset:I

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/masks/MasksGet;-><init>(III)V

    .line 115
    invoke-virtual {v0}, Lcom/vkontakte/android/api/masks/MasksGet;->toObservable()Lio/reactivex/Observable;

    move-result-object v0

    .line 119
    :goto_0
    return-object v0

    .line 117
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/masks/MasksGet;

    iget-object v1, p0, Lcom/vk/masks/MasksView$2;->this$0:Lcom/vk/masks/MasksView;

    invoke-static {v1}, Lcom/vk/masks/MasksView;->access$100(Lcom/vk/masks/MasksView;)I

    move-result v1

    iget-object v2, p0, Lcom/vk/masks/MasksView$2;->val$helper:Lcom/vk/lists/PaginateHelper;

    invoke-virtual {v2}, Lcom/vk/lists/PaginateHelper;->getPageSize()I

    move-result v2

    iget v3, p0, Lcom/vk/masks/MasksView$2;->val$offset:I

    .line 118
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/api/masks/MasksGet;-><init>(IIIDD)V

    .line 119
    invoke-virtual {v0}, Lcom/vkontakte/android/api/masks/MasksGet;->toObservable()Lio/reactivex/Observable;

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
    .line 110
    check-cast p1, Landroid/location/Location;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksView$2;->apply(Landroid/location/Location;)Lio/reactivex/ObservableSource;

    move-result-object v0

    return-object v0
.end method
