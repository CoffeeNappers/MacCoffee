.class Lcom/vk/stories/StoriesFilterListFragment$2;
.super Ljava/lang/Object;
.source "StoriesFilterListFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoriesFilterListFragment;->onActionClick(Lcom/vkontakte/android/UserProfile;)V
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
.field final synthetic this$0:Lcom/vk/stories/StoriesFilterListFragment;

.field final synthetic val$userProfile:Lcom/vkontakte/android/UserProfile;


# direct methods
.method constructor <init>(Lcom/vk/stories/StoriesFilterListFragment;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/StoriesFilterListFragment;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/vk/stories/StoriesFilterListFragment$2;->this$0:Lcom/vk/stories/StoriesFilterListFragment;

    iput-object p2, p0, Lcom/vk/stories/StoriesFilterListFragment$2;->val$userProfile:Lcom/vkontakte/android/UserProfile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 65
    return-void
.end method

.method public success(Lcom/vk/stories/model/GetStoriesResponse;)V
    .locals 2
    .param p1, "result"    # Lcom/vk/stories/model/GetStoriesResponse;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vk/stories/StoriesFilterListFragment$2;->this$0:Lcom/vk/stories/StoriesFilterListFragment;

    iget-object v1, p0, Lcom/vk/stories/StoriesFilterListFragment$2;->val$userProfile:Lcom/vkontakte/android/UserProfile;

    invoke-static {v0, v1}, Lcom/vk/stories/StoriesFilterListFragment;->access$000(Lcom/vk/stories/StoriesFilterListFragment;Lcom/vkontakte/android/UserProfile;)V

    .line 61
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 57
    check-cast p1, Lcom/vk/stories/model/GetStoriesResponse;

    invoke-virtual {p0, p1}, Lcom/vk/stories/StoriesFilterListFragment$2;->success(Lcom/vk/stories/model/GetStoriesResponse;)V

    return-void
.end method
