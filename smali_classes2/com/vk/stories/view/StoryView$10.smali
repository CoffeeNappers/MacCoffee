.class Lcom/vk/stories/view/StoryView$10;
.super Ljava/lang/Object;
.source "StoryView.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/StoryView;->lambda$null$11(I)V
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
.field final synthetic this$0:Lcom/vk/stories/view/StoryView;

.field final synthetic val$currentStoryId:I


# direct methods
.method constructor <init>(Lcom/vk/stories/view/StoryView;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 522
    iput-object p1, p0, Lcom/vk/stories/view/StoryView$10;->this$0:Lcom/vk/stories/view/StoryView;

    iput p2, p0, Lcom/vk/stories/view/StoryView$10;->val$currentStoryId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 531
    const v0, 0x7f0801fb

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 532
    return-void
.end method

.method public success(Lcom/vk/stories/model/GetStoriesResponse;)V
    .locals 1
    .param p1, "result"    # Lcom/vk/stories/model/GetStoriesResponse;

    .prologue
    .line 525
    iget v0, p0, Lcom/vk/stories/view/StoryView$10;->val$currentStoryId:I

    if-lez v0, :cond_0

    const v0, 0x7f08073e

    :goto_0
    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 527
    return-void

    .line 525
    :cond_0
    const v0, 0x7f080173

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 522
    check-cast p1, Lcom/vk/stories/model/GetStoriesResponse;

    invoke-virtual {p0, p1}, Lcom/vk/stories/view/StoryView$10;->success(Lcom/vk/stories/model/GetStoriesResponse;)V

    return-void
.end method
