.class Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter$1;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->loadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/Photo;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;

    .prologue
    .line 4163
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 4172
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->access$8102(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;Z)Z

    .line 4173
    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/Photo;>;"
    const/4 v0, 0x0

    .line 4166
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;

    invoke-static {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->access$7702(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;Z)Z

    .line 4167
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->access$8000(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->access$7800(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;

    move-result-object v3

    invoke-virtual {v3}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter$1;->this$1:Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->access$7900(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;

    move-result-object v4

    invoke-virtual {v4}, Lme/grishka/appkit/utils/Preloader;->getPreloadedData()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v4

    add-int/2addr v3, v4

    if-le v2, v3, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {v1, p1, v0}, Lme/grishka/appkit/utils/Preloader;->onDataLoaded(Ljava/util/List;Z)V

    .line 4168
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 4163
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
