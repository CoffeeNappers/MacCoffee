.class public Lcom/vk/stories/StoryViewersFragment;
.super Lcom/vkontakte/android/fragments/AbsUserListFragment;
.source "StoryViewersFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/StoryViewersFragment$Builder;
    }
.end annotation


# static fields
.field private static final ARGS_STORY_OWNER_ID:Ljava/lang/String; = "owner_id"

.field private static final ARGS_STORY_VIEWS_COUNT:Ljava/lang/String; = "views_count"


# instance fields
.field private ownerId:I

.field private storyId:I

.field private viewersCount:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vk/stories/StoryViewersFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/StoryViewersFragment;
    .param p1, "x1"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/vk/stories/StoryViewersFragment;->setTitleCount(I)V

    return-void
.end method

.method private setTitleCount(I)V
    .locals 5
    .param p1, "count"    # I

    .prologue
    .line 100
    const/16 v1, 0x3e8

    if-le p1, v1, :cond_0

    .line 101
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lcom/vk/stories/util/StoriesUtil;->getCounterText(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/stories/StoryViewersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0061

    const/16 v4, 0xa

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 105
    .local v0, "title":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v0}, Lcom/vk/stories/StoryViewersFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 109
    .end local v0    # "title":Ljava/lang/String;
    :goto_1
    return-void

    .line 103
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lcom/vk/stories/util/StoriesUtil;->getCounterText(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/stories/StoryViewersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0061

    invoke-virtual {v2, v3, p1}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .restart local v0    # "title":Ljava/lang/String;
    goto :goto_0

    .line 106
    .end local v0    # "title":Ljava/lang/String;
    :catch_0
    move-exception v1

    goto :goto_1
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 3
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 84
    new-instance v0, Lcom/vkontakte/android/api/stories/StoriesGetViewers;

    iget v1, p0, Lcom/vk/stories/StoryViewersFragment;->ownerId:I

    iget v2, p0, Lcom/vk/stories/StoryViewersFragment;->storyId:I

    invoke-direct {v0, v1, v2, p1, p2}, Lcom/vkontakte/android/api/stories/StoriesGetViewers;-><init>(IIII)V

    new-instance v1, Lcom/vk/stories/StoryViewersFragment$2;

    invoke-direct {v1, p0}, Lcom/vk/stories/StoryViewersFragment$2;-><init>(Lcom/vk/stories/StoryViewersFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/stories/StoriesGetViewers;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 94
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/StoryViewersFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 95
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 54
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->onAttach(Landroid/app/Activity;)V

    .line 55
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 56
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/StoryViewersFragment;->ownerId:I

    .line 57
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/StoryViewersFragment;->storyId:I

    .line 58
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "views_count"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/StoryViewersFragment;->viewersCount:I

    .line 60
    :cond_0
    iget v0, p0, Lcom/vk/stories/StoryViewersFragment;->viewersCount:I

    invoke-direct {p0, v0}, Lcom/vk/stories/StoryViewersFragment;->setTitleCount(I)V

    .line 61
    const v0, 0x7f0806d0

    invoke-virtual {p0, v0}, Lcom/vk/stories/StoryViewersFragment;->setEmptyText(I)V

    .line 62
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 66
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 67
    invoke-virtual {p0}, Lcom/vk/stories/StoryViewersFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    .line 68
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    if-eqz v0, :cond_0

    .line 69
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/vk/stories/StoryViewersFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vk/stories/StoryViewersFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020150

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 70
    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0f00ba

    invoke-static {v2, v3}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v2

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 71
    new-instance v1, Lcom/vk/stories/StoryViewersFragment$1;

    invoke-direct {v1, p0}, Lcom/vk/stories/StoryViewersFragment$1;-><init>(Lcom/vk/stories/StoryViewersFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    :cond_0
    return-void
.end method
