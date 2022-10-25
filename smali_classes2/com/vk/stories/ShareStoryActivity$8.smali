.class Lcom/vk/stories/ShareStoryActivity$8;
.super Ljava/lang/Object;
.source "ShareStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/ShareStoryActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/ShareStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/ShareStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 186
    iput-object p1, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v4, -0x1

    .line 189
    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/ShareStoryActivity;->access$500(Lcom/vk/stories/ShareStoryActivity;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/ShareStoryActivity;->access$800(Lcom/vk/stories/ShareStoryActivity;)Ljava/util/HashSet;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashSet;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 191
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 192
    .local v1, "usersIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/ShareStoryActivity;->access$800(Lcom/vk/stories/ShareStoryActivity;)Ljava/util/HashSet;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 193
    .local v0, "up":Lcom/vkontakte/android/UserProfile;
    iget v3, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 197
    .end local v0    # "up":Lcom/vkontakte/android/UserProfile;
    :cond_1
    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/ShareStoryActivity;->access$900(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/model/StoryUploadParams;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/ShareStoryActivity;->access$500(Lcom/vk/stories/ShareStoryActivity;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vk/stories/model/StoryUploadParams;->setAddToNews(Z)Lcom/vk/stories/model/StoryUploadParams;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/vk/stories/model/StoryUploadParams;->setUserIds(Ljava/util/ArrayList;)Lcom/vk/stories/model/StoryUploadParams;

    .line 199
    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/ShareStoryActivity;->access$1000(Lcom/vk/stories/ShareStoryActivity;)Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 200
    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/ShareStoryActivity;->access$1000(Lcom/vk/stories/ShareStoryActivity;)Ljava/io/File;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/ShareStoryActivity;->access$900(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/model/StoryUploadParams;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vk/stories/StoriesController;->startStoryUpload(Ljava/io/File;Lcom/vk/stories/model/StoryUploadParams;)V

    .line 201
    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-virtual {v2, v4}, Lcom/vk/stories/ShareStoryActivity;->setResult(I)V

    .line 202
    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-virtual {v2}, Lcom/vk/stories/ShareStoryActivity;->finish()V

    .line 209
    .end local v1    # "usersIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_2
    :goto_1
    return-void

    .line 203
    .restart local v1    # "usersIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_3
    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/ShareStoryActivity;->access$1100(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 204
    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/ShareStoryActivity;->access$1100(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/ShareStoryActivity;->access$900(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/model/StoryUploadParams;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vk/stories/StoriesController;->startStoryUpload(Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;Lcom/vk/stories/model/StoryUploadParams;)V

    .line 205
    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-virtual {v2, v4}, Lcom/vk/stories/ShareStoryActivity;->setResult(I)V

    .line 206
    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$8;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-virtual {v2}, Lcom/vk/stories/ShareStoryActivity;->finish()V

    goto :goto_1
.end method
