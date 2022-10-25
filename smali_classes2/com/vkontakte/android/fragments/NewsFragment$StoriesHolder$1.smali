.class Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$1;
.super Ljava/lang/Object;
.source "NewsFragment.java"

# interfaces
.implements Lcom/vk/stories/StoryViewDialog$AnimationDataProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->onClick()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;

    .prologue
    .line 1320
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$1;->this$1:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAnimationTargetView(I)Landroid/view/View;
    .locals 5
    .param p1, "uid"    # I

    .prologue
    const/4 v3, 0x0

    .line 1323
    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$1;->this$1:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->getParent()Landroid/view/ViewGroup;

    move-result-object v1

    .line 1324
    .local v1, "parent":Landroid/view/ViewGroup;
    if-eqz v1, :cond_0

    .line 1325
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v0, v4, :cond_0

    .line 1326
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/stories/view/StoryCirclePreview;

    .line 1327
    .local v2, "preview":Lcom/vk/stories/view/StoryCirclePreview;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/vk/stories/view/StoryCirclePreview;->getStory()Lcom/vk/stories/model/StoriesContainer;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v2}, Lcom/vk/stories/view/StoryCirclePreview;->getStory()Lcom/vk/stories/model/StoriesContainer;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v4

    if-ne v4, p1, :cond_1

    .line 1328
    invoke-virtual {v2}, Lcom/vk/stories/view/StoryCirclePreview;->getStoryImageView()Lcom/vk/stories/view/StoryCircleImageView;

    move-result-object v3

    .line 1333
    .end local v0    # "i":I
    .end local v2    # "preview":Lcom/vk/stories/view/StoryCirclePreview;
    :cond_0
    return-object v3

    .line 1325
    .restart local v0    # "i":I
    .restart local v2    # "preview":Lcom/vk/stories/view/StoryCirclePreview;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public scrollStoriesListToAuthorId(I)V
    .locals 1
    .param p1, "uid"    # I

    .prologue
    .line 1339
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder$1;->this$1:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->access$4200(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;)Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->scrollStoriesListToAuthorId(I)V

    .line 1340
    return-void
.end method
