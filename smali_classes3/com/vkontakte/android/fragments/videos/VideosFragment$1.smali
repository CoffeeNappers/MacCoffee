.class Lcom/vkontakte/android/fragments/videos/VideosFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "VideosFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/videos/VideosFragment;->doLoadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/video/VideoGetTabs$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/VideosFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/videos/VideosFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/video/VideoGetTabs$Result;)V
    .locals 9
    .param p1, "result"    # Lcom/vkontakte/android/api/video/VideoGetTabs$Result;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 86
    iget v1, p1, Lcom/vkontakte/android/api/video/VideoGetTabs$Result;->uploadedCount:I

    if-lez v1, :cond_4

    .line 87
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-boolean v3, v3, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSelectMode:Z

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;->newInstance(IZ)Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$002(Lcom/vkontakte/android/fragments/videos/VideosFragment;Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;)Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    .line 88
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getTabsCount()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$000(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    const v5, 0x7f080752

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->addTab(ILandroid/app/Fragment;Ljava/lang/CharSequence;)V

    .line 94
    :cond_0
    :goto_0
    iget v1, p1, Lcom/vkontakte/android/api/video/VideoGetTabs$Result;->userVideosCount:I

    if-lez v1, :cond_6

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    if-lez v1, :cond_6

    .line 95
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-boolean v3, v3, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSelectMode:Z

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;->newInstance(IZ)Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$102(Lcom/vkontakte/android/fragments/videos/VideosFragment;Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;)Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    .line 96
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    const v2, 0x7f080770

    .line 97
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "title":Ljava/lang/String;
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getTabsCount()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$100(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->addTab(ILandroid/app/Fragment;Ljava/lang/CharSequence;)V

    .line 105
    .end local v0    # "title":Ljava/lang/String;
    :cond_1
    :goto_2
    iget v1, p1, Lcom/vkontakte/android/api/video/VideoGetTabs$Result;->albumsCount:I

    if-gtz v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    if-gez v1, :cond_7

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    neg-int v1, v1

    .line 106
    invoke-static {v1}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v1

    if-lt v1, v8, :cond_7

    .line 108
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-boolean v3, v3, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSelectMode:Z

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->newInstance(IZ)Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$202(Lcom/vkontakte/android/fragments/videos/VideosFragment;Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;)Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    .line 109
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getTabsCount()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$200(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    const v5, 0x7f080753

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->addTab(ILandroid/app/Fragment;Ljava/lang/CharSequence;)V

    .line 115
    :cond_3
    :goto_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$300(Lcom/vkontakte/android/fragments/videos/VideosFragment;)V

    .line 116
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->dataLoaded()V

    .line 117
    return-void

    .line 89
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$000(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 90
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$000(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->removeTab(Landroid/app/Fragment;)V

    .line 91
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v1, v7}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$002(Lcom/vkontakte/android/fragments/videos/VideosFragment;Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;)Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    goto/16 :goto_0

    .line 97
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    const v2, 0x7f080771

    new-array v3, v8, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    .line 98
    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "username_ins"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 100
    :cond_6
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$100(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 101
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$100(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->removeTab(Landroid/app/Fragment;)V

    .line 102
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v1, v7}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$102(Lcom/vkontakte/android/fragments/videos/VideosFragment;Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;)Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    goto/16 :goto_2

    .line 110
    :cond_7
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$200(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 111
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$200(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->removeTab(Landroid/app/Fragment;)V

    .line 112
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v1, v7}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->access$202(Lcom/vkontakte/android/fragments/videos/VideosFragment;Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;)Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    goto :goto_3
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 83
    check-cast p1, Lcom/vkontakte/android/api/video/VideoGetTabs$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;->success(Lcom/vkontakte/android/api/video/VideoGetTabs$Result;)V

    return-void
.end method
