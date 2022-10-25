.class public Lcom/vkontakte/android/api/SimpleListCallback;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "SimpleListCallback.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<TS;>;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lme/grishka/appkit/fragments/BaseRecyclerFragment",
            "<TS;>;)V"
        }
    .end annotation

    .prologue
    .line 13
    .local p0, "this":Lcom/vkontakte/android/api/SimpleListCallback;, "Lcom/vkontakte/android/api/SimpleListCallback<TS;>;"
    .local p1, "fragment":Lme/grishka/appkit/fragments/BaseRecyclerFragment;, "Lme/grishka/appkit/fragments/BaseRecyclerFragment<TS;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    .line 14
    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<TS;>;)V"
        }
    .end annotation

    .prologue
    .line 18
    .local p0, "this":Lcom/vkontakte/android/api/SimpleListCallback;, "Lcom/vkontakte/android/api/SimpleListCallback<TS;>;"
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<TS;>;"
    iget-object v0, p0, Lcom/vkontakte/android/api/SimpleListCallback;->fragment:Landroid/app/Fragment;

    check-cast v0, Lme/grishka/appkit/fragments/BaseRecyclerFragment;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/fragments/BaseRecyclerFragment;->onDataLoaded(Lme/grishka/appkit/api/PaginatedList;)V

    .line 19
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 10
    .local p0, "this":Lcom/vkontakte/android/api/SimpleListCallback;, "Lcom/vkontakte/android/api/SimpleListCallback<TS;>;"
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/SimpleListCallback;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
