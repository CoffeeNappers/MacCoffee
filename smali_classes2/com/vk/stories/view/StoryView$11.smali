.class Lcom/vk/stories/view/StoryView$11;
.super Ljava/lang/Object;
.source "StoryView.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/StoryView;->lambda$deleteStory$18(Lcom/vk/stories/model/StoryEntry;I)V
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

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$idx:I


# direct methods
.method constructor <init>(Lcom/vk/stories/view/StoryView;ILandroid/app/Dialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 631
    iput-object p1, p0, Lcom/vk/stories/view/StoryView$11;->this$0:Lcom/vk/stories/view/StoryView;

    iput p2, p0, Lcom/vk/stories/view/StoryView$11;->val$idx:I

    iput-object p3, p0, Lcom/vk/stories/view/StoryView$11;->val$dialog:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 640
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$11;->val$dialog:Landroid/app/Dialog;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/LoadingDialog;->dismissLoadingDialog(Landroid/app/Dialog;)V

    .line 641
    return-void
.end method

.method public success(Lcom/vk/stories/model/GetStoriesResponse;)V
    .locals 2
    .param p1, "result"    # Lcom/vk/stories/model/GetStoriesResponse;

    .prologue
    .line 634
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$11;->this$0:Lcom/vk/stories/view/StoryView;

    iget v1, p0, Lcom/vk/stories/view/StoryView$11;->val$idx:I

    invoke-static {v0, v1}, Lcom/vk/stories/view/StoryView;->access$2000(Lcom/vk/stories/view/StoryView;I)V

    .line 635
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$11;->val$dialog:Landroid/app/Dialog;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/LoadingDialog;->dismissLoadingDialog(Landroid/app/Dialog;)V

    .line 636
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 631
    check-cast p1, Lcom/vk/stories/model/GetStoriesResponse;

    invoke-virtual {p0, p1}, Lcom/vk/stories/view/StoryView$11;->success(Lcom/vk/stories/model/GetStoriesResponse;)V

    return-void
.end method
