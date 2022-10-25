.class Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "NewsFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/NewsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StoriesHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vk/stories/model/StoriesContainer;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;"
    }
.end annotation


# instance fields
.field private final adapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/support/v7/widget/RecyclerView;Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;)V
    .locals 2
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p2, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p3, "adapter"    # Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;

    .prologue
    .line 1285
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    .line 1286
    new-instance v0, Lcom/vk/stories/view/StoryCirclePreview;

    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/stories/view/StoryCirclePreview;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 1287
    iput-object p3, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->adapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;

    .line 1288
    return-void
.end method

.method static synthetic access$4200(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;)Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;

    .prologue
    .line 1281
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->adapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;

    return-object v0
.end method


# virtual methods
.method synthetic lambda$onLongClick$0(Lcom/vk/stories/model/StoriesContainer;)V
    .locals 2
    .param p1, "sc"    # Lcom/vk/stories/model/StoriesContainer;

    .prologue
    .line 1353
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method synthetic lambda$onLongClick$1(I)V
    .locals 2
    .param p1, "currentStoryId"    # I

    .prologue
    .line 1354
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$2;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$2;-><init>(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;I)V

    invoke-static {p1, v0, v1}, Lcom/vk/stories/StoriesController;->banUser(ILandroid/content/Context;Lcom/vkontakte/android/api/Callback;)V

    return-void
.end method

.method public onBind(Lcom/vk/stories/model/StoriesContainer;)V
    .locals 1
    .param p1, "item"    # Lcom/vk/stories/model/StoriesContainer;

    .prologue
    .line 1292
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vk/stories/view/StoryCirclePreview;

    invoke-virtual {v0, p1}, Lcom/vk/stories/view/StoryCirclePreview;->setStory(Lcom/vk/stories/model/StoriesContainer;)V

    .line 1293
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1281
    check-cast p1, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->onBind(Lcom/vk/stories/model/StoriesContainer;)V

    return-void
.end method

.method public onClick()V
    .locals 9

    .prologue
    .line 1297
    iget-object v6, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->itemView:Landroid/view/View;

    check-cast v6, Lcom/vk/stories/view/StoryCirclePreview;

    invoke-virtual {v6}, Lcom/vk/stories/view/StoryCirclePreview;->getStory()Lcom/vk/stories/model/StoriesContainer;

    move-result-object v1

    .line 1298
    .local v1, "container":Lcom/vk/stories/model/StoriesContainer;
    if-nez v1, :cond_1

    .line 1344
    :cond_0
    :goto_0
    return-void

    .line 1301
    :cond_1
    iget-object v6, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1302
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 1306
    iget-object v6, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->itemView:Landroid/view/View;

    check-cast v6, Lcom/vk/stories/view/StoryCirclePreview;

    invoke-virtual {v6}, Lcom/vk/stories/view/StoryCirclePreview;->getStory()Lcom/vk/stories/model/StoriesContainer;

    move-result-object v3

    .line 1307
    .local v3, "sc":Lcom/vk/stories/model/StoriesContainer;
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/vk/stories/model/StoriesContainer;->myStory()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {v3}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v6

    if-nez v6, :cond_3

    .line 1308
    :cond_2
    new-instance v2, Landroid/content/Intent;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    const-class v7, Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {v2, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1309
    .local v2, "intent":Landroid/content/Intent;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v6, v2}, Lcom/vkontakte/android/fragments/NewsFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1312
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_3
    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->hasNewStories()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1313
    iget-object v6, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4000(Lcom/vkontakte/android/fragments/NewsFragment;)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->access$4100(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;)Lcom/vk/stories/model/GetStoriesResponse;

    move-result-object v6

    iget-object v6, v6, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-static {v6}, Lcom/vk/stories/util/StoriesUtil;->filterStoriesWithNewContent(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v4

    .line 1317
    .local v4, "storiesContainers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    :goto_1
    if-eqz v4, :cond_0

    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v6

    invoke-static {v4, v6}, Lcom/vk/stories/util/StoriesUtil;->findStoryByAuthorId(Ljava/util/ArrayList;I)Lcom/vk/stories/model/StoriesContainer;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 1320
    new-instance v5, Lcom/vk/stories/StoryViewDialog;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v7

    new-instance v8, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$1;

    invoke-direct {v8, p0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$1;-><init>(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;)V

    invoke-direct {v5, v6, v4, v7, v8}, Lcom/vk/stories/StoryViewDialog;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;ILcom/vk/stories/StoryViewDialog$AnimationDataProvider;)V

    .line 1342
    .local v5, "storyViewDialog":Lcom/vk/stories/StoryViewDialog;
    invoke-virtual {v5}, Lcom/vk/stories/StoryViewDialog;->show()V

    goto :goto_0

    .line 1315
    .end local v4    # "storiesContainers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    .end local v5    # "storyViewDialog":Lcom/vk/stories/StoryViewDialog;
    :cond_4
    iget-object v6, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4000(Lcom/vkontakte/android/fragments/NewsFragment;)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->access$4100(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;)Lcom/vk/stories/model/GetStoriesResponse;

    move-result-object v6

    iget-object v6, v6, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-static {v6}, Lcom/vk/stories/util/StoriesUtil;->filterStories(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v4

    .restart local v4    # "storiesContainers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    goto :goto_1
.end method

.method public onLongClick()Z
    .locals 5

    .prologue
    .line 1348
    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->itemView:Landroid/view/View;

    check-cast v3, Lcom/vk/stories/view/StoryCirclePreview;

    invoke-virtual {v3}, Lcom/vk/stories/view/StoryCirclePreview;->getStory()Lcom/vk/stories/model/StoriesContainer;

    move-result-object v2

    .line 1349
    .local v2, "sc":Lcom/vk/stories/model/StoriesContainer;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->myStory()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->isPromo()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1350
    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v1

    .line 1352
    .local v1, "currentStoryId":I
    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/core/util/AlertDialogs;->buildListActionDialog(Landroid/content/Context;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;

    move-result-object v0

    .line 1353
    .local v0, "builder":Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;
    invoke-virtual {v2}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v3

    if-lez v3, :cond_0

    const v3, 0x7f080487

    :goto_0
    invoke-static {p0, v2}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;Lcom/vk/stories/model/StoriesContainer;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->action(ILjava/lang/Runnable;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;

    .line 1354
    const v3, 0x7f080308

    invoke-static {p0, v1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;I)Ljava/lang/Runnable;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->action(ILjava/lang/Runnable;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;

    .line 1366
    invoke-virtual {v0}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->show()Landroid/support/v7/app/AlertDialog;

    .line 1367
    const/4 v3, 0x1

    .line 1369
    .end local v0    # "builder":Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;
    .end local v1    # "currentStoryId":I
    :goto_1
    return v3

    .line 1353
    .restart local v0    # "builder":Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;
    .restart local v1    # "currentStoryId":I
    :cond_0
    const v3, 0x7f080480

    goto :goto_0

    .line 1369
    .end local v0    # "builder":Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;
    .end local v1    # "currentStoryId":I
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method
