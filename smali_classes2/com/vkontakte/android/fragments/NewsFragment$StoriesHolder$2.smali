.class Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$2;
.super Ljava/lang/Object;
.source "NewsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->lambda$onLongClick$1(I)V
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
        "Lcom/vk/stories/model/GetStoriesResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;

.field final synthetic val$currentStoryId:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;I)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;

    .prologue
    .line 1354
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$2;->this$1:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;

    iput p2, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$2;->val$currentStoryId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1363
    const v0, 0x7f0801fb

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 1364
    return-void
.end method

.method public success(Lcom/vk/stories/model/GetStoriesResponse;)V
    .locals 1
    .param p1, "result"    # Lcom/vk/stories/model/GetStoriesResponse;

    .prologue
    .line 1357
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$2;->val$currentStoryId:I

    if-lez v0, :cond_0

    const v0, 0x7f08073e

    :goto_0
    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 1359
    return-void

    .line 1357
    :cond_0
    const v0, 0x7f080173

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1354
    check-cast p1, Lcom/vk/stories/model/GetStoriesResponse;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$2;->success(Lcom/vk/stories/model/GetStoriesResponse;)V

    return-void
.end method
