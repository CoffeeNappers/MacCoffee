.class Lcom/vk/stories/StoryViewersFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "StoryViewersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoryViewersFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/StoryViewersFragment;


# direct methods
.method constructor <init>(Lcom/vk/stories/StoryViewersFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/StoryViewersFragment;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/vk/stories/StoryViewersFragment$2;->this$0:Lcom/vk/stories/StoryViewersFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 88
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/UserProfile;>;"
    if-eqz p1, :cond_0

    .line 89
    iget-object v0, p0, Lcom/vk/stories/StoryViewersFragment$2;->this$0:Lcom/vk/stories/StoryViewersFragment;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vk/stories/StoryViewersFragment;->access$000(Lcom/vk/stories/StoryViewersFragment;I)V

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/StoryViewersFragment$2;->this$0:Lcom/vk/stories/StoryViewersFragment;

    invoke-virtual {v0, p1}, Lcom/vk/stories/StoryViewersFragment;->onDataLoaded(Lme/grishka/appkit/api/PaginatedList;)V

    .line 92
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 85
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/stories/StoryViewersFragment$2;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
